package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ClassInfoMapper;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.service.ClassInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    /**
     * 根据班级id获取每个班级学生的数量
     * @param gradeId
     * @return
     */
    @Override
    public Map<String, Object> getStudentCountForClass(Integer gradeId) {
        return classInfoMapper.getStudentCountForClass(gradeId);
    }

    /**
     * 检查班级名是否可用
     * @param className
     * @return
     */
    @Override
    public boolean checkClassName(String className) {
        int count=classInfoMapper.checkClassName(className);
        return count==0;
    }

    /**
     * 添加班级信息
     * @param classInfo
     */
    @Override
    public void addClass(ClassInfo classInfo) {
        classInfoMapper.addClass(classInfo);
    }

    /**
     * 更新班级信息
     * @param classInfo
     */
    @Override
    public void updateClass(ClassInfo classInfo) {
        classInfoMapper.updateClass(classInfo);
    }

    /**
     * 单个删除班级
     * @param id
     */
    @Override
    public void deleteClassById(Integer id) {
        classInfoMapper.deleteClassById(id);
    }

    /**
     * 批量删除
     * @param del_ids
     */
    @Override
    public void deleteBatch(List<Integer> del_ids) {
        for(Integer each:del_ids){
            classInfoMapper.deleteClassById(each);
        }
    }
}
