package com.xzq.online_exam.dao;

import org.springframework.stereotype.Repository;

@Repository
public interface SubjectInfoMapper {

    /**
     * 获取学科数量
     * @return
     */
    public int getSubjectTotal();
}
