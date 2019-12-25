package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.service.ExamPaperInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ExamPaperController {

    @Autowired
    private ExamPaperInfoService examPaperInfoService;

    /**
     * 删除包括批量删除试卷
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "examPaper/{ids}",method = RequestMethod.DELETE)
    public Msg deleteCourseById(@PathVariable("ids") String ids){
        //System.out.println(ids);
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] split=ids.split("-");

            for(String s:split){
                System.out.println(s);
                del_ids.add(Integer.parseInt(s));
            }
            examPaperInfoService.deleteBatch(del_ids);

        }else{
            Integer id=Integer.parseInt(ids);
            examPaperInfoService.deleteExamPaperById(id);
        }
        return Msg.success();
    }

    /**
     * 更新试卷信息
     * @param examPaperInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/examPaper/{examPaperId}",method = RequestMethod.PUT)
    public Msg saveExamPaper(ExamPaperInfo examPaperInfo){
        //System.out.println(examPaperInfo);
        examPaperInfoService.updateExamPaperInfo(examPaperInfo);
        return Msg.success();
    }

    /**
     * 检查试卷名是否可用
     * @param examPaperName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkExamPaperName")
    public Msg checkExamPaperName(@RequestParam("examPaperName") String examPaperName){
        System.out.println(examPaperName);
        if(examPaperInfoService.checkExamPaperName(examPaperName)){
            return Msg.success();
        }
        else{
            return Msg.fail().add("va_msg","试卷名不可用！！");
        }
    }

    /**
     * 添加试题信息
     * @param examPaperInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/examPaper")
    @ResponseBody
    public Msg saveExamPaper(@Valid ExamPaperInfo examPaperInfo, BindingResult result){
        System.out.println(examPaperInfo);
        if(result.hasErrors() && examPaperInfo!=null){
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            examPaperInfoService.addExamPaper(examPaperInfo);
            return Msg.success();
        }
        //System.out.println("插入数据成功！！");
    }

    @RequestMapping(value = "/getAllExamPaperNames",method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllExamPaperNames(){
        List<ExamPaperInfo> allExamPapers = examPaperInfoService.getAllExamPapers();
        return Msg.success().add("examPapers",allExamPapers);
    }

    /**
     * 获取所有试题信息
     * @param pn
     * @return
     */
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

    @RequestMapping("/getAllPaperNames")
    @ResponseBody
    public Msg getAll(){
        System.out.println(examPaperInfoService.getAllPaperName());
        return Msg.success().add("papers",examPaperInfoService.getAllPaperName());
    }
}
