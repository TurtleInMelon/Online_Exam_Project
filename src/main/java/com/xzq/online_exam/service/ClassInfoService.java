package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ClassInfo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface ClassInfoService {

    // 获取班级集合
    public List<ClassInfo> getAllClassesWithTeacherName(ClassInfo classInfo);

    //获取每个班级学生的数量
    public Map<String, Object> getStudentCountForClass(Integer gradeId);

}