package com.xzq.online_exam.controller;

import com.google.gson.Gson;
import com.xzq.online_exam.service.ExamPaperInfoService;
import com.xzq.online_exam.service.StudentInfoService;
import com.xzq.online_exam.service.SubjectInfoService;
import com.xzq.online_exam.service.TeacherInfoService;
import com.xzq.online_exam.utils.HomeInfo;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminHomeController {

    @Autowired
    ExamPaperInfoService examPaperInfoService;
    @Autowired
    SubjectInfoService subjectInfoService;
    @Autowired
    TeacherInfoService teacherInfoService;
    @Autowired
    StudentInfoService studentInfoService;
    @Autowired
    Gson gson;


    @RequestMapping("/homeInfo")
    @ResponseBody
    public Msg getHomeInfo(){
        int examPaperTotal = examPaperInfoService.getExamPaperTotal();
        int subjectTotal = subjectInfoService.getSubjectTotal();
        int teacherTotal = teacherInfoService.getTeacherTotal();
        int studentTotal = studentInfoService.getStudentTotal();
        HomeInfo homeInfo=new HomeInfo();
        homeInfo.setExamPaperTotal(examPaperTotal);
        homeInfo.setSubjectTotal(subjectTotal);
        homeInfo.setTeacherTotal(teacherTotal);
        homeInfo.setStudentTotal(studentTotal);
        return Msg.success().add("homeInfo",homeInfo);

    }
}
