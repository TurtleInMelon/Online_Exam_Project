package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.ExamChooseInfo;
import com.xzq.online_exam.domain.ExamHistoryInfo;
import com.xzq.online_exam.domain.StudentInfo;
import com.xzq.online_exam.service.ExamHistoryInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ExamHistoryController {
    @Autowired
    private ExamHistoryInfoService examHistoryInfoService;

    @RequestMapping("/historys")
    @ResponseBody
    public ModelAndView History(){
        ModelAndView mv =new ModelAndView();
        mv.setViewName("/admin/historyDisplay");
        return mv;
    }

    @RequestMapping("/getHistory")
    @ResponseBody
    public Msg getExamHistory(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //System.out.println("controller=============================================");
        PageHelper.startPage(pn,5);
        List<ExamHistoryInfo>all=examHistoryInfoService.getExamHistory();
        PageInfo pageInfo=new PageInfo(all);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/showHistory")
    public String showStuHistory(HttpSession session, Model model) {
        String studentName=(String) session.getAttribute("studentName");
        Integer studentId=(Integer) session.getAttribute("studentId");
        if("".equals(studentName)){
            return "";
        }
        else {

            List<ExamHistoryInfo> all=examHistoryInfoService.getExamHistoryOfOne(studentId);
            System.out.println(all);
            model.addAttribute("examInfo",all);
            return "/reception/examHistory";
        }
    }
}
