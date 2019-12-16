package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.service.GradeInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class GradeInfoController {

    @Autowired
    private GradeInfoService gradeInfoService;




    @RequestMapping("/getGrades")
    @ResponseBody
    public Msg getGrades(@RequestParam(value = "pg",defaultValue = "1")Integer pg){
        PageHelper.startPage(pg,5);
        List<GradeInfo> allGrades = gradeInfoService.getAllGrades();
        PageInfo pageInfo=new PageInfo(allGrades);
        return Msg.success().add("pageInfo",pageInfo);
    }


    /**
     * 跳转到前端grades.jsp页面
     * @return
     */
    @RequestMapping("/grades")
    @ResponseBody
    public ModelAndView getGrades(){
        ModelAndView model=new ModelAndView();
        model.setViewName("admin/grades");
        //model.addObject("pageInfo","pageInfo");
        return model;
    }

    @RequestMapping("/getAllGrades")
    @ResponseBody
    public Msg getAllGrades(){
        return Msg.success().add("grades",gradeInfoService.getAllGrades());
    }
}
