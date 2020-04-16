package com.xzq.online_exam.controller;

import com.xzq.online_exam.service.SubjectInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.domain.SubjectInfo;
import com.xzq.online_exam.service.*;
import com.xzq.online_exam.utils.Msg;
import com.xzq.online_exam.utils.SubjectImportUtil;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sun.util.calendar.Gregorian;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class SubjectInfoController {
    @Autowired 
	private SubjectInfoService subjectInfoService;

    @Autowired
    private CourseInfoService courseInfoService;

    @Autowired
    private GradeInfoService gradeInfoService;

    @Autowired
    ExamPaperInfoService examPaperInfoService;
    @Autowired
    private ExamSubjectMiddleInfoService examSubjectMiddleInfoService;

    @RequestMapping(value = "/dispatcherUpload")
    @ResponseBody
    public Msg dispatcherUpload(HttpServletRequest request,
                                @RequestParam("division")Integer division,
                                @RequestParam("courseId") Integer courseId,
                                @RequestParam("gradeId") Integer gradeId,
                                @RequestParam("examPaperId") Integer examPaperId,
                                @RequestParam("importOption") String importOption,
                                @RequestParam("examPaperEasy") Integer examPaperEasy,
                                @RequestParam("examPaperName") String examPaperName,
                                @RequestParam("examPaperTime") Integer examPaperTime,
                                @RequestParam("inputfile") MultipartFile excel){

        String savePath="";
        try {


            String fileName=excel.getOriginalFilename();
            String rootPath=request.getSession().getServletContext().getRealPath("/")+"upload/";
            File dir=new File(rootPath);
            if(!dir.isDirectory()){
                dir.mkdir();
            }
            System.out.println(rootPath+"/"+fileName);
            try {
                File upload=new File(rootPath+fileName);
                excel.transferTo(upload);
            } catch (Exception e) {
                e.printStackTrace();
            }
            savePath=rootPath+"/"+fileName;
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<SubjectInfo> subjectInfos = SubjectImportUtil.parseSubjectExcel(savePath, courseId, gradeId, division);

        for(SubjectInfo subjectInfo:subjectInfos){
            System.out.println(subjectInfo);
        }
        /**
         * 只添加试题
         */
        if("0".equals(importOption)){
            importSubejctOnly(subjectInfos);
        }
        else if("1".equals(importOption)){
            dispatcherExamPaperAndSubject(subjectInfos,examPaperId);
        }else{
            ExamPaperInfo examPaperInfo=new ExamPaperInfo();
            examPaperInfo.setExamPaperName(examPaperName);
            examPaperInfo.setExamPaperEasy(examPaperEasy);
            examPaperInfo.setExamPaperTime(examPaperTime);
            GradeInfo gradeInfo=new GradeInfo(gradeId);
            examPaperInfo.setGrade(gradeInfo);
            examPaperInfo.setDivision(division);
            examPaperInfoService.addExamPaper(examPaperInfo);
            dispatcherExamPaperAndSubject(subjectInfos,examPaperInfo.getExamPaperId());
        }
        return Msg.success().add("mess","导入试题成功！！");
    }

    /**
     * 将文件中的试题添加到指定试卷
     * @param subjects
     * @param examPaperId
     */
    private void dispatcherExamPaperAndSubject(List<SubjectInfo> subjects, Integer examPaperId) {
        List<Integer> subjectIds = new ArrayList<Integer>();
        //试题总量统计
        int count = 0;
        //试题总分统计
        int score = 0;

        /** 添加试题 */
        for (SubjectInfo subjectInfo : subjects) {
            subjectInfoService.addSubject(subjectInfo);
            //System.out.println(subjectInfo);
            examSubjectMiddleInfoService.addESMByOne(examPaperId,subjectInfo.getSubjectId());
        }

    }

    /**
     * 只将试题导入
     * @param subjectInfos
     */
    public void importSubejctOnly(List<SubjectInfo> subjectInfos){

        if(subjectInfos!=null && subjectInfos.size()>0){
            for(SubjectInfo subjectInfo:subjectInfos){
                subjectInfoService.addSubject(subjectInfo);
            }
        }
    }

    /**
     * 保存上传的excel文件
     * @param file
     * @param rootPath
     * @return
     * @throws Exception
     */
    private String saveUploadFile(MultipartFile file,String rootPath){
        String fileName=file.getOriginalFilename();
        System.out.println(rootPath+"/"+fileName);
        try {
            File upload=new File(rootPath+"/"+fileName);
            file.transferTo(upload);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rootPath+"/"+fileName;
    }

    /**
     * 导入试题
     * @return
     */
    @RequestMapping(value = "/importSubject")
    @ResponseBody
    public Msg importSubject(){
        //获取所有课程
        List<CourseInfo> allCoursesWithGradeName = courseInfoService.getAllCoursesWithGradeName(null);
        List<GradeInfo> allGrades = gradeInfoService.getAllGrades();
        List<ExamPaperInfo> allExamPapers = examPaperInfoService.getAllExamPapers();
        return Msg.success().add("courses",allCoursesWithGradeName)
                .add("grades",allGrades).add("examPapers",allExamPapers);
    }

    /**
     * 添加试题
     * @param subjectInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/addSubject",method = RequestMethod.POST)
    @ResponseBody
    public Msg addSubject(@Valid SubjectInfo subjectInfo, BindingResult result){
        System.out.println(subjectInfo);
        if(result.hasErrors() && subjectInfo!=null){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            subjectInfoService.addSubject(subjectInfo);
            return Msg.success();
        }

    }

    /**
     * 更新试题
     * @param subjectInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/updateSubject",method = RequestMethod.POST)
    @ResponseBody
    public Msg updateSubject(@Valid SubjectInfo subjectInfo, BindingResult result){
        System.out.println(subjectInfo);
        if(result.hasErrors() && subjectInfo!=null){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            subjectInfoService.updateSubject(subjectInfo);
            return Msg.success();
        }

    }

    /**
     * 删除试题，包括批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "deleteSubject")
    public Msg deleteCourseById(@RequestParam("ids") String ids){
        System.out.println(ids);
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] split=ids.split("-");

            for(String s:split){
                //System.out.println(s);
                del_ids.add(Integer.parseInt(s));
            }
            subjectInfoService.deleteBatch(del_ids);
        }else{
            Integer id=Integer.parseInt(ids);
            subjectInfoService.deleteSubjectById(id);
        }
        return Msg.success();
    }


    /**\
     * 跳转到admin/importSubject.jsp页面
     * @return
     */
    @RequestMapping(value = "/initImport")
    public ModelAndView importSubjects(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/importSubject");
        return modelAndView;
    }


    /**
     * 获取试题信息通过Id
     * @return
     */
    @RequestMapping("/subject/{subjectId}")
    public Msg getSubjectById(@PathVariable("subjectId")Integer subjectId){
        SubjectInfo subject = subjectInfoService.getSubjectWithId(subjectId);
        return null;
    }

    @RequestMapping(value = "/getSubjectsByKeyIds")
    @ResponseBody
    public Msg getSubjectsByKeyIds(@RequestParam("ids")String ids,HttpServletRequest request){
        ModelAndView modelAndView=new ModelAndView();
//        System.out.println(ids);
        String[] KeyIds = ids.split(",");
//        System.out.println(KeyIds.toString());
        List<SubjectInfo> totalSubjects = new ArrayList<>();
        for(String keyId: KeyIds){
//            System.out.println(keyId);
            if(!subjectInfoService.checkKeyId(Integer.valueOf(keyId))){
//                System.out.println(keyId);
                List<SubjectInfo> subjects = subjectInfoService.getSubjectsByKeyId(Integer.valueOf(keyId));
                for(SubjectInfo each : subjects){
                    System.out.println(each);
                    totalSubjects.add(each);
                }
//                System.out.println(subjects.toString());
            }

        }
        HttpSession session = request.getSession();
        Gson gson = new Gson();
//        System.out.println(totalSubjects.toString());
        session.setAttribute("subjects", gson.toJson(totalSubjects));
//        System.out.println(totalSubjects.toString());
//        modelAndView.addObject("recommendSubjects", totalSubjects);
//        modelAndView.setViewName("/admin/showRecommendSubjects");
        return Msg.success().add("subjects",totalSubjects);
    }

    /**
     * 获取所有页面的分页信息
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllSubjects",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCoursesInfoWithGrade(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        System.out.println(pn);
        PageHelper.startPage(pn,10);
        List<SubjectInfo> allSubjects = subjectInfoService.getAllSubjects();
        PageInfo pageInfo=new PageInfo(allSubjects);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**\
     * 跳转到admin/subjects.jsp页面
     * @return
     */
    @RequestMapping(value = "/subjects")
    public ModelAndView getSubjects(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/subjects");
        return modelAndView;
    }

    @RequestMapping("/getWrongRecord")
    public String getWrong(){
        return "/reception/wrongRecord";
    }
}
