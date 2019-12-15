package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.TeacherInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherInfoMapper {

    /**
     * 根据教师账户获取教师信息
     * @param account 教师账户
     * @return 教师信息
     */
    public TeacherInfo getTeacherByAccount(String account);

    /**
     * 获取教师数量
     * @return
     */
    public int getTeacherTotal();

    /**
     * 获取教师的所有信息
     * @return
     */
    List<TeacherInfo> getALlTeacherInfo();

    /**
     * 添加教师信息
     * @param teacherInfo
     */
    void addTeacher(TeacherInfo teacherInfo);

    /**
     * 检查教师名是否可用
     * @param teacherName
     * @return
     */
    int checkTeacherName(String teacherName);

    /**
     * 更新教师信息
     * @param teacherinfo
     */
    void updateTeacher(TeacherInfo teacherinfo);

    /**
     * 根据teacherid删除
     * @param id
     */
    void deleteTeacherById(Integer id);
}
