package com.xzq.online_exam.controller;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.xzq.online_exam.domain.ExamChooseInfo;
import com.xzq.online_exam.service.ExamChooseInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Choose")
public class ExamChooseInfoController {
    @Autowired
    private ExamChooseInfoService examChooseInfoService;

    @RequestMapping("/ha/{studentName}/{examPaperName}")
    public String hh(@PathVariable("studentName") String studentName,@PathVariable("examPaperName") String examPaperName,Model model){
        List<ExamChooseInfo>all=examChooseInfoService.getAllExamChoose(studentName,examPaperName);
        model.addAttribute("info",all);
        System.out.println(studentName+examPaperName+model);
        return "/admin/personalExamPaper";
    }

    @RequestMapping("/recordDetail")
    @ResponseBody
    public Msg getDetail(HttpServletRequest request,HttpSession session){
        Integer studentId=(Integer) session.getAttribute("studentId");
        Integer examPaperId=Integer.valueOf(request.getParameter("examPaperId"));
        Integer subjectId=Integer.valueOf(request.getParameter("subjectId"));
        ExamChooseInfo examChooseInfo=examChooseInfoService.getExamChoose(studentId,examPaperId,subjectId);
        return Msg.success().add("details",examChooseInfo);
    }
}
