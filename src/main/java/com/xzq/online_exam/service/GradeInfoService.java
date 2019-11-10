package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.GradeInfo;

import java.util.List;

public interface GradeInfoService {

    /**
     * 获取所有年级
     * @return
     */
    List<GradeInfo> getAllGrades();
}
