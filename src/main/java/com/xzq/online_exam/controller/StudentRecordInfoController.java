package com.xzq.online_exam.controller;

import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.StudentInfo;
import com.xzq.online_exam.domain.StudentRecordInfo;
import com.xzq.online_exam.service.StudentRecordService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StudentRecordInfoController {
    @Autowired
    private StudentRecordService studentRecordService;

    @RequestMapping("/addOneWrong")
    public Msg addOne(HttpServletRequest request){
        StudentRecordInfo studentRecordInfo=new StudentRecordInfo();
        StudentInfo studentInfo=new StudentInfo(Integer.valueOf(request.getParameter("studentId")));
        ESMInfo esmInfo=new ESMInfo(Integer.valueOf(request.getParameter("esmId")));
        studentRecordInfo.setStudentInfo(studentInfo);
        studentRecordInfo.setEsmInfo(esmInfo);
        studentRecordService.addOne(studentRecordInfo);
        return Msg.success();
    }

    @RequestMapping("/showAllRecord")
    @ResponseBody
    public Msg show(HttpSession session){

        List<ESMInfo> all=studentRecordService.getRecordByStudentId((Integer) (session.getAttribute("studentId")));
        return Msg.success().add("record",all);
    }
}
