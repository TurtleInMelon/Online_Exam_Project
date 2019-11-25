package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.charts.StudentCount;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.service.ClassInfoService;
import com.xzq.online_exam.service.GradeInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ClassInfoController {

    @Autowired
    private ClassInfoService classInfoService;

    @Autowired
    private GradeInfoService gradeInfoService;

    /**
     * 删除班级，包括批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "class/{ids}",method = RequestMethod.DELETE)
    public Msg deleteCourseById(@PathVariable("ids") String ids){
        System.out.println(ids);
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] split=ids.split("-");

            for(String s:split){
                //System.out.println(s);
                del_ids.add(Integer.parseInt(s));
            }
            classInfoService.deleteBatch(del_ids);

        }else{
            Integer id=Integer.parseInt(ids);
            classInfoService.deleteClassById(id);
        }
        return Msg.success();
    }

    /**
     * 更新班级
     * @param classInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/class/{classId}",method = RequestMethod.PUT)
    public Msg saveCourse(ClassInfo classInfo){
        System.out.println(classInfo);
        classInfoService.updateClass(classInfo);
        return Msg.success();
    }

    /**
     * 插入班级信息
     * @param classInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/class",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveGrade(@Valid ClassInfo classInfo, BindingResult result){
        //System.out.println(classInfo);
        if(result.hasErrors() && classInfo!=null){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            classInfoService.addClass(classInfo);
            return Msg.success();
        }
        //System.out.println("插入数据成功！！");
    }

    /**
     * 校验班级名
     * @param className
     * @return
     */
    @RequestMapping(value = "/checkClass")
    @ResponseBody
    public Msg checkClass(@RequestParam("className")String className){
        //System.out.println(className);
        if(classInfoService.checkClassName(className)){
            return Msg.success();
        }
        else{
            return Msg.fail().add("va_msg","班级名不可用！！");
        }
    }

    /**
     * 获取课程信息包括班级名和班主任名
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllClasses",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCoursesInfoWithGrade(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //System.out.println(pn);
        PageHelper.startPage(pn,5);
        List<ClassInfo> allClassesWithTeacherName = classInfoService.getAllClassesWithTeacherName(null);
        PageInfo pageInfo=new PageInfo(allClassesWithTeacherName);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 跳转到前端courses.jsp页面
     * @return
     */
    @RequestMapping("/classes")
    @ResponseBody
    public ModelAndView getALlCoursesWithGrade(){
        ModelAndView model=new ModelAndView();
        model.setViewName("admin/classes");
        return model;
    }


    /**
     * 获取各个年级的人数
     * @return
     */
    @RequestMapping("/getEachGradeCount")
    @ResponseBody
    public Msg getGradeCount(
            @RequestParam(value = "gradeId",required = false)Integer gradeId
    ){
        System.out.println(gradeId);
        Map<String, Object> studentCountForClass = classInfoService.getStudentCountForClass(gradeId);
        String json= StudentCount.createBarJson(studentCountForClass);
        return Msg.success().add("JSON",json);
    }

    /**
     * 预添加班级处理
     * 跳转到前端studentCount.jsp页面
     * @return
     */
    @RequestMapping("/preStudentCount")
    @ResponseBody()
    public ModelAndView getpreStudentCount(){
        ModelAndView model=new ModelAndView();
        List<GradeInfo> allGrades = gradeInfoService.getAllGrades();
        model.setViewName("admin/charts/studentCount");
        model.addObject("grades",allGrades);
        return model;
    }
}
