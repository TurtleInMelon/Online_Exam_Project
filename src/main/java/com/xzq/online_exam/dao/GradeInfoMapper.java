package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.GradeInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface GradeInfoMapper {

    /**
     * 获取所有年级
     * @return
     */
    List<GradeInfo> getAllGrades();
}
