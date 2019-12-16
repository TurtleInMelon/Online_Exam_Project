package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.SubjectInfo;

public interface SubjectInfoService {
    /**
     * 获取总的学科数
     * @return
     */
    public int getSubjectTotal();

    public SubjectInfo getSubjectInfoById(Integer id);
}
