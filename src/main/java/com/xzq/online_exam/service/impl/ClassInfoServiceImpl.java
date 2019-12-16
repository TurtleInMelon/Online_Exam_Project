package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ClassInfoMapper;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.service.ClassInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassInfoServiceImpl implements ClassInfoService {

    @Autowired
    private ClassInfoMapper classInfoMapper;

    /**
     * 返回所有班级信息，包含班级名和班主任名
     * @param classInfo
     * @return
     */
    @Override
    public List<ClassInfo> getAllClassesWithTeacherName(ClassInfo classInfo) {
        return classInfoMapper.getAllClassesWithTeacherName(null);
    }

    @Override
    public ClassInfo findClassByName(String className) {
        return classInfoMapper.findClassByName(className);
    }

    @Override
    public List<ClassInfo> getAllClassInfo() {
        return classInfoMapper.getAllClassInfo();
    }
}
