package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.internal.$Gson$Preconditions;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.domain.ExamPlanInfo;
import com.xzq.online_exam.service.ClassInfoService;
import com.xzq.online_exam.service.CourseInfoService;
import com.xzq.online_exam.service.ExamPaperInfoService;
import com.xzq.online_exam.service.ExamPlanService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class ExamPlanController {
    @Autowired
    private ExamPlanService examPlanService;
    @Autowired
    private ExamPaperInfoService examPaperInfoService;
    @Autowired
    private CourseInfoService courseInfoService;
    @Autowired
    private ClassInfoService classInfoService;

    @RequestMapping(value = "/examPlan")
    @ResponseBody
    public ModelAndView examPlans(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("admin/examPlans");
        return mv;
    }
    @RequestMapping(value = "/getExamPlans",method = RequestMethod.GET)
    @ResponseBody
    public Msg getExamPlans(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<ExamPlanInfo> all=examPlanService.getExamPlan();
        PageInfo pageInfo=new PageInfo(all);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/deleteOneRecord")
    @ResponseBody
    public Msg deleteOne(HttpServletRequest request){
        Integer id=Integer.valueOf(request.getParameter("id"));
        examPlanService.deleteOne(id);
        return Msg.success();
    }

    @RequestMapping("/updateOneRecord")
    @ResponseBody
    public Msg updateOne(HttpServletRequest request){
        ExamPlanInfo examPlanInfo=new ExamPlanInfo();
        examPlanInfo.setExamPlanId(Integer.valueOf(request.getParameter("id")));
        ClassInfo classInfo =classInfoService.findClassByName(request.getParameter("className"));
        CourseInfo courseInfo =courseInfoService.getCourseByName(request.getParameter("courseName"));
        ExamPaperInfo examPaperInfo =examPaperInfoService.getExamPaperByName(request.getParameter("examPaperName"));

        examPlanInfo.setExamPaperInfo(examPaperInfo);
        examPlanInfo.setClassInfo(classInfo);
        examPlanInfo.setCourseInfo(courseInfo);
        System.out.println(examPlanInfo+"=======================");
        examPlanService.updateOne(examPlanInfo);
        return Msg.success();
    }

    @RequestMapping("/addOneRecord")
    @ResponseBody
    public Msg addOne(HttpServletRequest request) {
        ExamPlanInfo examPlanInfo = new ExamPlanInfo();
        ClassInfo classInfo = classInfoService.findClassByName(request.getParameter("className"));
        CourseInfo courseInfo = courseInfoService.getCourseByName(request.getParameter("courseName"));
        ExamPaperInfo examPaperInfo = examPaperInfoService.getExamPaperByName(request.getParameter("examPaperName"));
        System.out.println(classInfo+""+courseInfo+""+examPaperInfo);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date beginTime = format.parse(request.getParameter("beginTime"));
            examPlanInfo.setBeginTime(beginTime);
            examPlanInfo.setExamPaperInfo(examPaperInfo);
            examPlanInfo.setClassInfo(classInfo);
            examPlanInfo.setCourseInfo(courseInfo);
            System.out.println(examPlanInfo);
            examPlanService.addOne(examPlanInfo);
            return Msg.success();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return Msg.fail();
    }
}
