package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.domain.SubjectInfo;
import com.xzq.online_exam.service.CourseInfoService;
import com.xzq.online_exam.service.ExamPaperInfoService;
import com.xzq.online_exam.service.GradeInfoService;
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

    @Autowired
    private CourseInfoService courseInfoService;

    @Autowired
    private GradeInfoService gradeInfoService;

    @Autowired
    ExamPaperInfoService examPaperInfoService;


    @RequestMapping(value = "/importSubject")
    @ResponseBody
    public Msg importSubject(){
        //获取所有课程
        List<CourseInfo> allCoursesWithGradeName = courseInfoService.getAllCoursesWithGradeName(null);
        List<GradeInfo> allGrades = gradeInfoService.getAllGrades();
        List<ExamPaperInfo> allExamPapers = examPaperInfoService.getAllExamPapers();
        return Msg.success().add("courses",allCoursesWithGradeName)
                .add("grades",allGrades).add("examPapers",allExamPapers);
    }


    /**\
     * 跳转到admin/importSubject.jsp页面
     * @return
     */
    @RequestMapping(value = "/initImport")
    public ModelAndView importSubjects(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/importSubject");
        return modelAndView;
    }


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
