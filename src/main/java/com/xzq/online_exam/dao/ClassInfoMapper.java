package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ClassInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassInfoMapper {

    /**
     * 获取所有班级信息带上班主任的名字
     * @param classInfo
     * @return
     */
    public List<ClassInfo> getAllClassesWithTeacherName(ClassInfo classInfo);

    public ClassInfo findClassByName(String className);

    public List<ClassInfo> getAllClassInfo();
}
