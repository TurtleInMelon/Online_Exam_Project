package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.TeacherInfo;
import org.springframework.stereotype.Repository;

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
}
