package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.service.GradeInfoService;
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
public class GradeInfoController {

    @Autowired
    private GradeInfoService gradeInfoService;

    /**
     * 删除年级包括批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "grade/{ids}",method = RequestMethod.DELETE)
    public Msg deleteGradeById(@PathVariable("ids") String ids){
        //System.out.println(ids);
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] split=ids.split("-");

            for(String s:split){
                //System.out.println(s);
                del_ids.add(Integer.parseInt(s));
            }
            gradeInfoService.deleteBatch(del_ids);

        }else{
            Integer id=Integer.parseInt(ids);
            gradeInfoService.deleteGrade(id);
        }
        return Msg.success();
    }

    /**
     * 年级更新
     * @param gradeInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/grade/{gradeId}",method = RequestMethod.PUT)
    public Msg updateGrade(GradeInfo gradeInfo){
        //System.out.println(gradeInfo);
        gradeInfoService.updateGrade(gradeInfo);
        return Msg.success();
    }

    /**
     * 检查年级名是否可用
     * @param gradeName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkGrade")
    public Msg checkGrade(@RequestParam("gradeName") String gradeName){
        //System.out.println(gradeName);
        if(gradeInfoService.checkGradeName(gradeName)){
            return Msg.success();
        }
        else{
            return Msg.fail().add("va_msg","用户名不可用！！");
        }
    }

    /**
     * 保存年级进入数据库
     * @param gradeInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/grade",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveGrade(@Valid GradeInfo gradeInfo, BindingResult result){
        //System.out.println(gradeInfo);
        if(result.hasErrors() && gradeInfo!=null){
            Map<String,Object> map=new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            gradeInfoService.addGrade(gradeInfo);
            return Msg.success();
        }
        //System.out.println("插入数据成功！！");
    }


    /**
     * 获取所有年级名称
     * @return
     */
    @RequestMapping(value = "/getAllGradeNames")
    @ResponseBody
    public Msg getAllGradeNames(){
        List<GradeInfo> allGradeNames=gradeInfoService.getAllGrades();
        return Msg.success().add("list",allGradeNames);
    }

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
}
