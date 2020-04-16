package com.xzq.online_exam.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.StudentInfo;
import com.xzq.online_exam.service.ClassInfoService;
import com.xzq.online_exam.service.StudentInfoService;
import com.xzq.online_exam.utils.Msg;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.BadLocationException;
import java.util.List;

@Controller
public class StudendsInfoController {

    @Autowired
    private StudentInfoService studentInfoService;
    @Autowired
    private ClassInfoService classInfoService;

    @RequestMapping("/students")
    @ResponseBody
    public ModelAndView getAllStudents(){
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("/admin/students");
        return modelAndView;
    }

    @RequestMapping("/getAllStudents")
    @ResponseBody
    public Msg getstudentsInfoWithGrade(@RequestParam(value = "pn",defaultValue = "1")Integer pn){

        PageHelper.startPage(pn,5);
        List<StudentInfo> allStudents =  studentInfoService.getAllStudents();
        PageInfo pageInfo=new PageInfo(allStudents);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/deleteOneStudent")
    @ResponseBody
    public Msg deleteOne(Integer id){
        studentInfoService.deleteOne(id);
        return Msg.success();
    }
//"studentId":id,"studentName":name,"studentAccount":account,"studentPwd":pwd,"classId":cls,"gradeId":grade}
    @RequestMapping("/addOneStudent")
    @ResponseBody
    public Msg addOne(HttpServletRequest request){
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setStudentName(request.getParameter("studentName"));
        studentInfo.setStudentPwd(request.getParameter("studentPwd"));
        studentInfo.setStudentAccount(request.getParameter("studentAccount"));
        ClassInfo classInfo=classInfoService.findClassByName(request.getParameter("classId"));
        studentInfo.setClassInfo(classInfo);
        System.out.println(studentInfo);
        studentInfoService.addOne(studentInfo);
        return Msg.success();
    }

    @RequestMapping("/updateOneStudent")
    @ResponseBody
    public Msg updateOne(HttpServletRequest request){
        StudentInfo studentInfo = new StudentInfo();
        studentInfo.setStudentId(Integer.valueOf(request.getParameter("studentId")));
        studentInfo.setStudentName(request.getParameter("studentName"));
        studentInfo.setStudentPwd(request.getParameter("studentPwd"));
        studentInfo.setStudentAccount(request.getParameter("studentAccount"));
        ClassInfo classInfo=classInfoService.findClassByName(request.getParameter("classId"));
        studentInfo.setClassInfo(classInfo);
        studentInfoService.updateOneStudent(studentInfo);
        return Msg.success();
    }

    @RequestMapping("/registerStu")
    @ResponseBody
    public Msg register(HttpServletRequest request){
        StudentInfo studentInfo=new StudentInfo();
        studentInfo.setStudentName(request.getParameter("studentName"));
        studentInfo.setStudentAccount(request.getParameter("studentAccount"));
        studentInfo.setStudentPwd(request.getParameter("studentPwd"));
        ClassInfo classInfo=classInfoService.findClassByName(request.getParameter("classId"));
        studentInfo.setClassInfo(classInfo);
        studentInfoService.addOne(studentInfo);
        return Msg.success();
    }

    @RequestMapping("/checkDulpicateUserName")
    @ResponseBody
    public Msg checkDuplicate(HttpServletRequest request){
        String studentName=request.getParameter("studentAccount");
        Integer count=studentInfoService.checkUser(studentName);
        return Msg.success().add("count",count);
    }

    @RequestMapping("/stuLogin")
    @ResponseBody
    public Msg studentLogin(HttpServletRequest request, HttpSession session){
        String studentAccount=request.getParameter("studentAccount");
        String pwd=request.getParameter("studentPwd");
        StudentInfo studentInfo=studentInfoService.getStudentWithPwd(studentAccount);
        //账户不存在
        System.out.println(studentAccount+studentInfo);
        if(studentInfo==null)
            return Msg.fail().add("login_info","账户不存在！");
        else {
            if(pwd.equals(studentInfo.getStudentPwd()))
            {
                session.setAttribute("studentName",studentInfo.getStudentName());
                session.setAttribute("studentId",studentInfo.getStudentId());
                return Msg.success().add("login_info","登陆成功！");
            }
            else {
                //账户存在，密码错误
                return Msg.fail().add("login_info","密码错误！");
            }
        }
    }
}
