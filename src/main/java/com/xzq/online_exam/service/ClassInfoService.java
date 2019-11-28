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

    /**
     * 检查班级名是否可用
     * @param className
     * @return
     */
    boolean checkClassName(String className);

    /**
     * 添加班级信息
     * @param classInfo
     */
    void addClass(ClassInfo classInfo);

    /**
     * 更新班级信息
     * @param classInfo
     */
    void updateClass(ClassInfo classInfo);

    void deleteClassById(Integer id);

    /**
     * 批量删除
     * @param del_ids
     */
    void deleteBatch(List<Integer> del_ids);

    //根据当前班级班主任编号获取当前班级信息
    ClassInfo getClassByTeacherId(Integer teacherId);
}