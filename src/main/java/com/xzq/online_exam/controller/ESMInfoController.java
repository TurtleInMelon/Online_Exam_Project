package com.xzq.online_exam.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xzq.online_exam.domain.*;
import com.xzq.online_exam.service.*;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionActivationListener;
import java.util.List;
@Controller
public class ESMInfoController {
    @Autowired
    private ESMInfoService esmInfoService;
    @Autowired
    private ExamPlanService examPlanService;
    @Autowired
    private ExamChooseInfoService examChooseInfoService;
    @Autowired
    private ExamHistoryInfoService examHistoryInfoService;
    @Autowired
    private SubjectInfoService subjectInfoService;

    private static Integer examScore=0;

    @RequestMapping("/getAllExamInfo")
    public String showAllExams(Model model){
        List<ExamPlanInfo> all=examPlanService.getExamPlan();
        model.addAttribute("exams",all);
        return "/reception/examDisplay";
    }

    @RequestMapping("/eachExam/{examPaperId}/{examPaperTime}")
    public String findExamPaper(@PathVariable("examPaperId") String examPaperId, @PathVariable("examPaperTime") String examPaperTime, Model model, HttpSession session){
        Integer id=Integer.valueOf(examPaperId);
        List<ESMInfo>all=esmInfoService.getAllESMWithSubjects(id);
        model.addAttribute("examList",all);
        model.addAttribute("examPaperTime",examPaperTime);

        ExamHistoryInfo examHistoryInfo=examHistoryInfoService.JudgeStuExam(id,(Integer) session.getAttribute("studentId"));
        System.out.println(examHistoryInfo+"================================");
        if(examHistoryInfo!=null)
        {
            return "/reception/contactTeacher";
        }
        System.out.println(model);
        return "/reception/exam";
    }

    @RequestMapping("/initScore")
    @ResponseBody
    public void setScoreZero(){
        examScore=0;
    }

    @RequestMapping("/Ha/submitResult")
    @ResponseBody
    public Msg submitSuccess(HttpServletRequest request){
        ExamChooseInfo examChooseInfo=new ExamChooseInfo();
        StudentInfo studentInfo=new StudentInfo(Integer.valueOf(request.getParameter("studentId")));
        examChooseInfo.setStudentInfo(studentInfo);
        ExamPaperInfo examPaperInfo=new ExamPaperInfo(Integer.valueOf(request.getParameter("examPaperId")));
        examChooseInfo.setExamPaperInfo(examPaperInfo);
        SubjectInfo subjectInfo=new SubjectInfo(Integer.valueOf(request.getParameter("subjectId")));
        examChooseInfo.setSubjectInfo(subjectInfo);
        examChooseInfo.setChooseResult(request.getParameter("answer"));
        examChooseInfoService.saveExamChoose(examChooseInfo);

        SubjectInfo right=subjectInfoService.getSubjectInfoById(Integer.valueOf(request.getParameter("subjectId")));
        if(right.getRightResult().equals(request.getParameter("answer"))){
            examScore+=Integer.valueOf(right.getSubjectScore());
        }
        else {
            examScore+=0;
        }
        System.out.println(examScore+"=====================================================");
        return Msg.success().add("examScore",examScore);
    }

    @RequestMapping("/saveHistory")
    public void saveHistoryRecord(HttpServletRequest request){
        StudentInfo studentInfo=new StudentInfo(Integer.valueOf(request.getParameter("studentId")));
        ExamPaperInfo examPaperInfo=new ExamPaperInfo(Integer.valueOf(request.getParameter("examPaperId")));
        ExamHistoryInfo examHistoryInfo=new ExamHistoryInfo();
        examHistoryInfo.setStudentInfo(studentInfo);
        examHistoryInfo.setExamPaperInfo(examPaperInfo);
        examHistoryInfo.setExamScore(examScore);
        System.out.println(examHistoryInfo);
        examHistoryInfoService.saveHistoryRecord(examHistoryInfo);
    }
}
