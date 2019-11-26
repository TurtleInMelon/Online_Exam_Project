package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.TeacherInfo;

import java.util.List;

public interface TeacherInfoService {

    /**
     * 通过教师账户获取教师信息
     * @param account
     * @return
     */
    public TeacherInfo getTeacherByAccount(String account);

    /**
     * 获取教师数量
     * @return
     */
    public int getTeacherTotal();

    /**
     * 获取教师所有信息
     * @return
     */
    List<TeacherInfo> getALlTeacherInfo();

    /**
     * 添加教师信息
     * @param teacherInfo
     */
    void addTeacher(TeacherInfo teacherInfo);

    /**
     * 检查教师名是否存在
     * @param teacherName
     * @return
     */
    boolean checkTeacherName(String teacherName);

    /**
     * 更新教师信息
     * @param teacherinfo
     */
    void updateTeacher(TeacherInfo teacherinfo);

    /**
     * 根据teacherId删除
     * @param id
     */
    void deleteTeacherById(Integer id);

    /**
     * 批量删除
     * @param del_ids
     */
    void deleteBatch(List<Integer> del_ids);
}
