package com.xzq.online_exam.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface StudentInfoMapper {

    /**
     * 获取学生的总数
     * @return
     */
    public int getStudentTotal();
}
