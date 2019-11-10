package com.xzq.online_exam.controller;

import com.xzq.online_exam.domain.TeacherInfo;
import com.xzq.online_exam.service.TeacherInfoService;
import com.xzq.online_exam.utils.Msg;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TeacherInfoController {

    @Autowired
    private TeacherInfoService  teacherInfoService;

    private Logger logger=Logger.getLogger(TeacherInfoController.class);


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



}