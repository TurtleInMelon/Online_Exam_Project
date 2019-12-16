package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.StudentInfo;

import java.util.List;

public interface StudentInfoService {

    /**
     * 获取学生总数
     * @return
     */
    public int getStudentTotal();

    public List<StudentInfo> getAllStudents();

    public void deleteOne(Integer id);

    public void addOne(StudentInfo studentInfo);

    public void updateOneStudent(StudentInfo studentInfo);

    public Integer checkUser(String studentName);

    public StudentInfo getStudentWithPwd(String studentAccount);
}
