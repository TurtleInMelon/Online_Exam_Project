package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.SubjectInfo;
import com.xzq.online_exam.service.SubjectInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class SubjectInfoController {

    @Autowired
    private SubjectInfoService subjectInfoService;


    /**
     * 获取试题信息通过Id
     * @return
     */
    @RequestMapping("/subject/{subjectId}")
    public Msg getSubjectById(@PathVariable("subjectId")Integer subjectId){
        SubjectInfo subject = subjectInfoService.getSubjectWithId(subjectId);
        return null;
    }

    /**
     * 获取所有页面的分页信息
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllSubjects",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCoursesInfoWithGrade(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        System.out.println(pn);
        PageHelper.startPage(pn,10);
        List<SubjectInfo> allSubjects = subjectInfoService.getAllSubjects();
        PageInfo pageInfo=new PageInfo(allSubjects);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**\
     * 跳转到admin/subjects.jsp页面
     * @return
     */
    @RequestMapping(value = "/subjects")
    public ModelAndView getSubjects(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/subjects");
        return modelAndView;
    }
}
