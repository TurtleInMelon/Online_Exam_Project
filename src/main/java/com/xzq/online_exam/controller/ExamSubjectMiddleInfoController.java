package com.xzq.online_exam.controller;

import com.xzq.online_exam.domain.ExamSubjectMiddleInfo;
import com.xzq.online_exam.domain.SubjectInfo;
import com.xzq.online_exam.service.ExamPaperInfoService;
import com.xzq.online_exam.service.ExamSubjectMiddleInfoService;
import com.xzq.online_exam.service.SubjectInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Controller
public class ExamSubjectMiddleInfoController {

    @Autowired
    private ExamSubjectMiddleInfoService esmService;
    @Autowired
    private ExamPaperInfoService examPaperInfoService;
    @Autowired
    private SubjectInfoService subjectInfoService;


    /**
     * 随机出题
     * @param examPaperId
     * @param subjectNum
     * @param division
     * @param gradeId
     * @param subjectEasy
     * @return
     */
    @RequestMapping(value = "/autoAddSubjects",method = RequestMethod.POST)
    @ResponseBody
    public Msg autoAddSubjects(@RequestParam("examPaperId") Integer examPaperId,
                               @RequestParam("subjectNum") Integer subjectNum,
                               @RequestParam("division") Integer division,
                               @RequestParam("gradeId") Integer gradeId,
                               @RequestParam("subjectEasy") Integer subjectEasy){

        Random random=new Random();
        //选择合适的试题
        List<SubjectInfo> allSubjects = subjectInfoService.chooseSubjects(division,gradeId,subjectEasy);
        int subjectTotal=allSubjects.size()-1;
        if(subjectNum>subjectTotal){
            subjectNum=subjectTotal;
        }
        for(int i=0;i<subjectNum;++i){
            int index=random.nextInt(subjectTotal);
            if(esmService.checkSubject(examPaperId,index)){
                int subjectId=allSubjects.get(index).getSubjectId();
                esmService.addESMByOne(examPaperId,subjectId);
            }else{
                i--;
            }
        }
        return Msg.success().add("mess","自动添加试题成功！！");
    }

    /**
     * 批量添加试题
     * @return
     */
    @RequestMapping(value = "/addESMBatch")
    @ResponseBody
    public Msg addESMBatch(@RequestParam("addStrs") String ids,
                           @RequestParam("examPaperId") Integer examPaperId){
        //System.out.println(ids);
        List<Integer> add_ids=new ArrayList<>();
        String[] split=ids.split("-");

        for(String s:split){
            //System.out.println(s);
            add_ids.add(Integer.parseInt(s));
        }
        Boolean isRight=true;
        for(Integer each:add_ids){
            //1.检测该试卷中是否有相应的题
            Boolean result=esmService.checkSubject(examPaperId,each);
            if(result==true){
                esmService.addESMByOne(examPaperId,each);
            }else{
                isRight=false;
            }
        }
        if(isRight){
            return Msg.success().add("mess","批量添加成功，无重复的题目！！");
        }else{
            return Msg.fail().add("mess","存在重复的题目，系统将其排除后添加！！");
        }
    }

    /**
     * 单个添加试题入试卷
     * @param subjectId
     * @param examPaperId
     * @return
     */
    @RequestMapping(value = "/addESMByOne")
    @ResponseBody
    public Msg addESMByOne(@RequestParam("subjectId") Integer subjectId,
                           @RequestParam("examPaperId") Integer examPaperId){
        //1.检测该试卷中是否有相应的题
        Boolean result=esmService.checkSubject(examPaperId,subjectId);
        if(result==true){
            esmService.addESMByOne(examPaperId,subjectId);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    /**
     * 移除试题
     * @param subjectId
     * @param examPaperId
     * @return
     */
    @RequestMapping(value="/removeSubjectByExamPaperIdAndSubjectId")
    @ResponseBody
    public Msg removeSubjectByExamPaperIdAndSubjectId(@RequestParam("subjectId") Integer subjectId,
                                                      @RequestParam("examPaperId") Integer examPaperId)
    {
        esmService.removeSubjectByExamPaperIdAndSubjectId(examPaperId,subjectId);
        return Msg.success();
    }

    //根据试卷Id获取所有试题信息
    @RequestMapping(value = "/getAllESMByExamPaperId",method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllESMByExamPaperId(@RequestParam(value = "examPaperId") Integer examPaperId){
        //根据examPaperId获取试题
        List<ExamSubjectMiddleInfo> ems=esmService.getAllESMByExamPaperId(examPaperId);
        return Msg.success().add("list",ems);
    }


}
