package com.xzq.online_exam.controller;


import com.xzq.online_exam.charts.StudentExamInfoCharts;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.StudentExamInfo;
import com.xzq.online_exam.domain.StudentInfo;
import com.xzq.online_exam.service.ClassInfoService;
import com.xzq.online_exam.service.StudentExamInfoService;
import com.xzq.online_exam.service.StudentInfoService;
import com.xzq.online_exam.utils.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class StudentExamInfoController {

    @Autowired
    private ClassInfoService classInfoService;

    @Autowired
    private StudentInfoService studentInfoService;

    @Autowired
    private StudentExamInfoService studentExamInfoService;

    /**
     * 获取同一班级的所有学生
     * @param teacherId
     * @param response
     * @return
     */
    @RequestMapping("/getAllStudentsWithSameClass")
    @ResponseBody
    public Msg getStudentsByClassId(@RequestParam("teacherId")Integer teacherId, HttpServletResponse response){
        if(teacherId==null){
            return Msg.fail().add("fail_msg","teacherId为空");
        }
        else{
            ClassInfo classInfo=classInfoService.getClassByTeacherId(teacherId);
            Integer classId = classInfo.getClassId();
            List<StudentInfo> studentInfos=studentInfoService.getStudentsByClassId(classId);
            return Msg.success().add("students",studentInfos);
        }
    }

    /**
     * 获取平均分等信息
     * @param teacherId
     * @param response
     * @return
     */
    @RequestMapping("/avgcounts")
    @ResponseBody
    public Msg getAllStudentAvgScoreCount(@RequestParam("teacherId") Integer teacherId, HttpServletResponse response){
        if(teacherId==null){
            return Msg.fail().add("fail_msg","teacherId为空");
        }
        else{
            ClassInfo classInfo = classInfoService.getClassByTeacherId(teacherId);
            //获取所有学生信息 平均分等信息
            Integer classId = classInfo.getClassId();
            List<StudentExamInfo> stuExamInfos =studentExamInfoService.getAllStudentAvgScoreCount(classId) ;
            return Msg.success().add("json", StudentExamInfoCharts.createAvgCountLineJson(stuExamInfos));
        }
    }


    @RequestMapping("/getStudentExamInfoById")
    @ResponseBody
    public Msg getStudentExamInfoById(@RequestParam("studentId") Integer studentId, HttpServletResponse response){
        if(studentId==null){
            return Msg.fail().add("fail_msg","teacherId为空");
        }
        else{
            //获取学生考试信息
            List<StudentExamInfo> stuExamInfos = studentExamInfoService.getStudentExamInfoById(studentId);
            return Msg.success().add("json",StudentExamInfoCharts.createStudentExamLineJson(stuExamInfos));
        }
    }
}
