package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.service.ClassInfoService;
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
public class ClassInfoController {

    @Autowired
    private ClassInfoService classInfoService;

    /**
     * 获取课程信息包括班级名和班主任名
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllClasses",method = RequestMethod.GET)
    @ResponseBody
    public Msg getCoursesInfoWithGrade(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //System.out.println(pn);
        PageHelper.startPage(pn,5);
        List<ClassInfo> allClassesWithTeacherName = classInfoService.getAllClassesWithTeacherName(null);
        PageInfo pageInfo=new PageInfo(allClassesWithTeacherName);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 跳转到前端courses.jsp页面
     * @return
     */
    @RequestMapping("/classes")
    @ResponseBody
    public ModelAndView getALlCoursesWithGrade(){
        ModelAndView model=new ModelAndView();
        model.setViewName("admin/classes");
        return model;
    }

    /**
     * 预添加班级处理
     * 跳转到前端studentCount.jsp页面
     * @return
     */
    @RequestMapping("/preStudentCount")
    @ResponseBody
    public ModelAndView getpreStudentCount(){
        ModelAndView model=new ModelAndView();
        model.setViewName("admin/charts/studentCount");
        return model;
    }

    @RequestMapping("/getAllClass")
    @ResponseBody
    public Msg getAllClass(){
        return Msg.success().add("classes",classInfoService.getAllClassInfo());
    }
}
