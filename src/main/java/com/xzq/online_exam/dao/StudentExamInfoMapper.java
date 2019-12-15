package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.StudentExamInfo;

import java.util.List;

public interface StudentExamInfoMapper {

    //后台教师查看指定班级中所有学生的平均成绩以及考试次数
    public List<StudentExamInfo> getAllStudentAvgScoreCount(int classId);

    //后台教师查看某一学生的考试信息
    List<StudentExamInfo> getStudentExamInfoById(Integer studentId);
}
