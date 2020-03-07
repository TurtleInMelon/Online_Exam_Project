package com.xzq.online_exam.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xzq.online_exam.domain.*;
import com.xzq.online_exam.service.KeyInfoService;
import com.xzq.online_exam.service.StudentKeyInfoService;
import com.xzq.online_exam.service.SubjectInfoService;
import com.xzq.online_exam.service.TeachingInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class StudentKeyInfoController {
    @Autowired private StudentKeyInfoService studentKeyInfoService;

    @Autowired private TeachingInfoService teachingInfoService;

    @Autowired private SubjectInfoService subjectInfoService;

    @Autowired private KeyInfoService keyInfoService;

    @RequestMapping("/autoShow")
    public String autoDisplay(HttpSession session, Model model){
        Integer studentId=(Integer)session.getAttribute("studentId");
        List<SubjectInfo> exam=new ArrayList<SubjectInfo>();
        List<Integer> keys=studentKeyInfoService.theThirdKey(studentId);
        for(Integer k:keys){
            List<SubjectInfo>sub=subjectInfoService.getSubjectByKey(k);
            for(SubjectInfo s:sub)
                exam.add(s);
        }
        //System.out.println(exam);
        ModelAndView mv=new ModelAndView("/reception/autoExam");
        model.addAttribute("exam",exam);
        return  "/reception/autoExam";
    }

    @RequestMapping("/getAllStudentsWithTheThirdKeys")
    @ResponseBody
    public Msg getAll(HttpServletRequest request,HttpSession session){
        Integer classId=Integer.valueOf(request.getParameter("classId"));
        Integer courseId=Integer.valueOf(request.getParameter("courseId"));
        Integer teacherId=(Integer)session.getAttribute("teacherId");

        TeachingInfo teachingInfo=new TeachingInfo();
        teachingInfo.setTeacherInfo(new TeacherInfo(teacherId));
        teachingInfo.setCourseInfo(new CourseInfo(courseId));
        teachingInfo.setClassInfo(new ClassInfo(classId));
        //System.out.println(teachingInfo+"=====================================");

        List<StudentKeyInfo>all=studentKeyInfoService.getAllStudentsWithTheThirdKeys(teachingInfo);
        return Msg.success().add("studentKeys",all);
    }

    @RequestMapping("/showRecordByKey")
    @ResponseBody
    public Msg showByKey(HttpServletRequest request){
        List<KeyInfo> all=keyInfoService.getKeyByCourseId(Integer.valueOf(request.getParameter("courseId")));
        String list;
        for(KeyInfo k:all){
            List<String> keyRecordList=studentKeyInfoService.getRecordByKey(k.getKeyId());
            list="";
            for(String s:keyRecordList){
                list=list+" "+s;
            }
            //System.out.println(list);
        }
        return Msg.success();
    }
}
