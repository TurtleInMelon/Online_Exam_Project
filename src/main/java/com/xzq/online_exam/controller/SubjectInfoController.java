package com.xzq.online_exam.controller;

import com.xzq.online_exam.service.SubjectInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubjectInfoController {
    @Autowired private SubjectInfoService subjectInfoService;

    @RequestMapping("/getWrongRecord")
    public String getWrong(){
        return "/reception/wrongRecord";
    }
}
