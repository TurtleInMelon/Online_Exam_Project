package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.service.CourseInfoService;
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
public class CourseInfoController {

    @Autowired
    private CourseInfoService courseInfoService;

    /**
     * 删除课程包括批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "course/{ids}",method = RequestMethod.DELETE)
    public Msg deleteCourseById(@PathVariable("ids") String ids){
        //System.out.println(ids);
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] split=ids.split("-");

            for(String s:split){
                System.out.println(s);
                del_ids.add(Integer.parseInt(s));
            }
            courseInfoService.deleteBatch(del_ids);

        }else{
            Integer id=Integer.parseInt(ids);
            courseInfoService.deleteCourseById(id);
        }
        return Msg.success();
    }

    /**
     * 更新课程信息
     * @param courseInfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/course/{courseId}",method = RequestMethod.PUT)
    public Msg saveCourse(CourseInfo courseInfo){
        //System.out.println(courseInfo);
        courseInfoService.updateCourse(courseInfo);
        return Msg.success();
    }


    /**
     * 检查课程名是否重复
     * @param courseName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkCourse")
    public Msg checkCourse(@RequestParam("courseName") String courseName){
        System.out.println(courseName);
        if(courseInfoService.checkGradeName(courseName)){
            return Msg.success();
        }
        else{
            return Msg.fail().add("va_msg","用户名不可用！！");
        }
    }

    /**
     * 添加学科
     * @param courseInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/course",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveCourse(@Valid CourseInfo courseInfo, BindingResult result){
        //System.out.println(courseInfo);
        if(result.hasErrors() && courseInfo!=null){
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            courseInfoService.addCourse(courseInfo);
            return Msg.success();
        }
        //System.out.println("插入数据成功！！");
    }

    /**
     * 获取所有课程名字
     */
    @RequestMapping(value = "/getAllCourseNames")
    @ResponseBody
    public Msg getAllGradeNames(){
        List<CourseInfo> courseInfos=courseInfoService.getAllCourseNames();
        return Msg.success().add("list",courseInfos);
    }

    /**
     * 获取所有课程信息
     * @param pn
     * @return
     */
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
