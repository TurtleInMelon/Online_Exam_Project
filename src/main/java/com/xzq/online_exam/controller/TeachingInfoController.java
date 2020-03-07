package com.xzq.online_exam.controller;

import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.TeachingInfo;
import com.xzq.online_exam.service.TeachingInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class TeachingInfoController {
    @Autowired
    private TeachingInfoService teachingInfoService;

    @RequestMapping("/getAllClassesByTeacherId")
    @ResponseBody
    public Msg getAllClassesByTeacherId(HttpSession session){
        Integer teacherId=(Integer) session.getAttribute("teacherId");
        List<TeachingInfo> all=teachingInfoService.getAllClassesByTeacherId(teacherId);
        return Msg.success().add("teachingList",all);
    }
}
