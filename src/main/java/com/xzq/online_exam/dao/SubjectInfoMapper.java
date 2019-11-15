package com.xzq.online_exam.dao;

import com.xzq.online_exam.controller.SubjectInfoController;
import com.xzq.online_exam.domain.SubjectInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubjectInfoMapper {

    /**
     * 获取学科数量
     * @return
     */
    public int getSubjectTotal();

    /**
     * 获取所有试题信息
     * @return
     */
    List<SubjectInfo> getAllSubjects();

    /**
     * 通过学科id查找试题信息
     * @param subjectId
     * @return
     */
    SubjectInfo getSubjectWithId(Integer subjectId);
}
