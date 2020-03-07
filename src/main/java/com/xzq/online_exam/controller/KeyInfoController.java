package com.xzq.online_exam.controller;

import com.google.gson.Gson;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.KeyInfo;
import com.xzq.online_exam.service.KeyInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class KeyInfoController {
    @Autowired
    private KeyInfoService keyInfoService;

    @RequestMapping("/showKeyDB")
    public String show(Model model){
        List<CourseInfo> keyDB=keyInfoService.getAllKeyDB();
        model.addAttribute("keyDB",keyDB);
        return "/admin/keyDB";
    }

    @RequestMapping("/detailKeyDB/{courseId}")
    public String showDetail(HttpServletRequest request, Model model, @PathVariable("courseId") String courseId){
        List<KeyInfo> keyInfos=keyInfoService.getKeyByCourseId(Integer.valueOf(courseId));
        model.addAttribute("keyInfos",new Gson().toJson(keyInfos));
        return "/admin/keyDetails";
    }

    @RequestMapping("/refreshDB/{courseId}")
    @ResponseBody
    public Msg refresh(HttpServletRequest request, @PathVariable("courseId") String courseId){
        List<KeyInfo> keyInfos=keyInfoService.getKeyByCourseId(Integer.valueOf(courseId));
        return Msg.success().add("reKeyInfos",keyInfos);
    }

    @RequestMapping("/addOneKey")
    @ResponseBody
    public Msg addOne(HttpServletRequest request){
        KeyInfo keyInfo=new KeyInfo();
        keyInfo.setPriority(Integer.valueOf(request.getParameter("priority")));
        keyInfo.setKeyName(request.getParameter("keyName"));
        keyInfo.setCourseInfo(new CourseInfo(Integer.valueOf(request.getParameter("courseId"))));
        keyInfoService.addOne(keyInfo);
        return Msg.success();
    }

    @RequestMapping("/deleteOneKey")
    @ResponseBody
    public Msg deleteOne(HttpServletRequest request){
        keyInfoService.deleteOne(request.getParameter("keyName"));
        return Msg.success();
    }

    @RequestMapping("/getAllPriority")
    @ResponseBody
    public Msg getAllPro(HttpServletRequest request){
        List<Integer> all=keyInfoService.getAllPriority(Integer.valueOf(request.getParameter("courseId")));
        return Msg.success().add("priorities",all);
    }

}
