package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.service.ExamPaperInfoService;
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
public class ExamPaperController {

    @Autowired
    private ExamPaperInfoService examPaperInfoService;

    @RequestMapping(value = "/getAllExamPapers",method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllExamPaperInfo(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,5);
        List<ExamPaperInfo> allExamPapers = examPaperInfoService.getAllExamPapers();
        PageInfo pageInfo=new PageInfo(allExamPapers);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 跳转到examPapers.jsp页面
     * @return
     */
    @RequestMapping("/examPapers")
    public ModelAndView getExamPaperPage(){
        ModelAndView model=new ModelAndView();
        model.setViewName("admin/examPapers");
        //model.addObject("pageInfo","pageInfo");
        return model;
    }
}
