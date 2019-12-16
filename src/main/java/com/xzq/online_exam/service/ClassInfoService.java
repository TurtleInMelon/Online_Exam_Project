package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ClassInfo;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ClassInfoService {

    // 获取班级集合
    public List<ClassInfo> getAllClassesWithTeacherName(ClassInfo classInfo);

    public ClassInfo findClassByName(String className);

    public List<ClassInfo> getAllClassInfo();
}
