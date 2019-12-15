package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.TeacherInfo;
import com.xzq.online_exam.service.TeacherInfoService;
import com.xzq.online_exam.utils.Msg;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TeacherInfoController {

    @Autowired
    private TeacherInfoService  teacherInfoService;

    private Logger logger=Logger.getLogger(TeacherInfoController.class);

    /**
     * 删除教师包括批量删除
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "teacher/{ids}",method = RequestMethod.DELETE)
    public Msg deleteTeacherById(@PathVariable("ids") String ids){
        //System.out.println(ids);
        if(ids.contains("-")){
            List<Integer> del_ids=new ArrayList<>();
            String[] split=ids.split("-");

            for(String s:split){
                //System.out.println(s);
                del_ids.add(Integer.parseInt(s));
            }
            teacherInfoService.deleteBatch(del_ids);

        }else{
            Integer id=Integer.parseInt(ids);
            teacherInfoService.deleteTeacherById(id);
        }
        return Msg.success();
    }


    /**
     * 更新教师信息
     * @param teacherinfo
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/teacher/{teacherId}",method = RequestMethod.PUT)
    public Msg saveCourse(TeacherInfo teacherinfo){
        //System.out.println(teacherinfo);
        teacherInfoService.updateTeacher(teacherinfo);
        return Msg.success();
    }

    /**
     * 检查教师是否已经存在
     * @param teacherName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkTeacherName")
    public Msg checkCourse(@RequestParam("teacherName") String teacherName){
        System.out.println(teacherName);
        if(teacherInfoService.checkTeacherName(teacherName)){
            return Msg.success();
        }
        else{
            return Msg.fail().add("va_msg","教师名不可用！！");
        }
    }

    /**
     * 添加教师信息
     * @param courseInfo
     * @param result
     * @return
     */
    @RequestMapping(value = "/teacher",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveTeacher(@Valid TeacherInfo teacherInfo, BindingResult result){
        System.out.println(teacherInfo);
        if(result.hasErrors() && teacherInfo!=null){
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError:errors){
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorField",map);
        }
        //System.out.println(employee);
        else{
            teacherInfoService.addTeacher(teacherInfo);
            return Msg.success();
        }
        //System.out.println("插入数据成功！！");
    }

    /**
     * 获取所有教师的名字
     * @return
     */
    @RequestMapping(value = "/getAllTeacherNames")
    @ResponseBody
    public Msg getAllGradeNames(){
        List<TeacherInfo> allGradeNames=teacherInfoService.getALlTeacherInfo();
        return Msg.success().add("list",allGradeNames);
    }

    /**
     * 根据教师账户获取教师信息
     * @param teacherAccount
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/teacherAccount/{teacherAccount}",method = RequestMethod.GET)
    public Msg getTeacherInfoByAccount(@PathVariable("teacherAccount") String teacherAccount){
        TeacherInfo teacherByAccount = teacherInfoService.getTeacherByAccount(teacherAccount);
        if(teacherByAccount!=null){
            return Msg.success().add("teachInfo",teacherByAccount);
        }
        else{
            return Msg.fail();
        }
    }

    /**
     * 处理教师后台登录
     * @param teacherAccount
     * @param request
     * @return
     */
    @RequestMapping(value = "/teacherlogin",method = RequestMethod.POST)
    public String teacherLogin(@RequestParam("teacherAccount") String teacherAccount,
                               HttpServletRequest request) {
        //System.out.println(".........."+teacherAccount+".............");
        //System.out.println(teacherAccount);
        if (teacherAccount == null || "".equals(teacherAccount)) {
            logger.error("教师账号为空");
            request.setAttribute("error", "登录信息有误");
            return "reception/error";
        }
        logger.info("教师  "+teacherAccount+" 登录");

        //获取当前登录教师
        TeacherInfo teacherInfo = teacherInfoService.getTeacherByAccount(teacherAccount);
        //System.out.println("=====================================");
        //System.out.println(teacherInfo);

        if(teacherInfo == null){
            logger.error("教师账号为空");
            request.setAttribute("error", "账号不存在！");
            return "reception/error";
        }
        String teacherPwd = request.getParameter("teacherPwd");
        if(!teacherInfo.getTeacherPwd().equals(teacherPwd)){
            logger.error("密码错误");
            request.setAttribute("error", "密码错误！");
            return "reception/error";
        }
        //将当前登录教师 后台权限存入 Session
        request.getSession().setAttribute("adminPower", teacherInfo.getAdminPower());
        request.getSession().setAttribute("loginTeacher", teacherInfo);

        return "redirect:admin/index.jsp";
    }

    /**
     * 获取所有教师信息
     * @param pn
     * @return
     */
    @RequestMapping(value = "/getAllTeachers",method = RequestMethod.GET)
    @ResponseBody
    public Msg getAllTeacherInfo(@RequestParam(value = "pn",defaultValue = "1")Integer pn){

        PageHelper.startPage(pn,5);
        //List<CourseInfo> allCoursesWithGradeName = courseInfoService.getAllCoursesWithGradeName(null);
        List<TeacherInfo> allTeacherInfo = teacherInfoService.getALlTeacherInfo();
        PageInfo pageInfo=new PageInfo(allTeacherInfo);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 跳转到admin/teachers.jsp页面中
     * @return
     */
    @RequestMapping("/teachers")
    public ModelAndView getTeachers(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("admin/teachers");
        return modelAndView;
    }

    @RequestMapping("/exitTeacher")
    public void exitTeacher(HttpSession session, HttpServletResponse response) throws IOException {
        session.removeAttribute("loginTeacher");
        session.removeAttribute("adminPower");
        response.sendRedirect("admin/admin_login.jsp");
    }
}