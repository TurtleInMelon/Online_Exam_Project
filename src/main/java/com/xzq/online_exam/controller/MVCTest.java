package com.xzq.online_exam.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MVCTest {

    @RequestMapping("/classinfo")
    public String getAllClassInfo(){
        System.out.println("获取成功！！");
        return "/reception/success.jsp";
    }

}
