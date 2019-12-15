package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.StudentInfo;

import java.util.List;

public interface StudentInfoService {

    /**
     * 获取学生总数
     * @return
     */
    public int getStudentTotal();


    List<StudentInfo> getStudentsByClassId(Integer classId);
}
