package com.xzq.online_exam.service;

import com.xzq.online_exam.controller.SubjectInfoController;
import com.xzq.online_exam.domain.SubjectInfo;

import java.util.List;

public interface SubjectInfoService {
    /**
     * 获取总的学科数
     * @return
     */
    public int getSubjectTotal();


    /**
     * 查询所有试卷信息
     * @return
     */
    public List<SubjectInfo> getAllSubjects();


    /**
     * 获取试题信息By Id
     * @param subjectId
     * @return
     */
    SubjectInfo getSubjectWithId(Integer subjectId);

    /**
     * 选择合适的试题
     * @param division
     * @param gradeId
     * @param subjectEasy
     * @return
     */
    List<SubjectInfo> chooseSubjects(Integer division, Integer gradeId, Integer subjectEasy);
}
