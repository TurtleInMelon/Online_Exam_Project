package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.service.CourseInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CourseInfoController {

    @Autowired
    private CourseInfoService courseInfoService;

    @RequestMapping(value = "/getAllCourses",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCoursesInfoWithGrade(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //System.out.println(pn);
        PageHelper.startPage(pn,5);
        List<CourseInfo> allCoursesWithGradeName = courseInfoService.getAllCoursesWithGradeName(null);
        PageInfo pageInfo=new PageInfo(allCoursesWithGradeName);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 跳转到前端courses.jsp页面
     * @return
     */
    @RequestMapping("/courses")
    @ResponseBody
    public ModelAndView getALlCoursesWithGrade(){
        ModelAndView model=new ModelAndView();
        model.setViewName("admin/courses");
        //model.addObject("pageInfo","pageInfo");
        return model;
    }
}
