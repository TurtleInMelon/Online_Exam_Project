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
}
