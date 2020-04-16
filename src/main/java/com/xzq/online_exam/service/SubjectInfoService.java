package com.xzq.online_exam.service;
import com.xzq.online_exam.domain.SubjectInfo;
import jnr.ffi.annotations.In;

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

    /**
     * 添加试题
     * @param subjectInfo
     */
    void addSubject(SubjectInfo subjectInfo);

    /**
     * 更新试题
     * @param subjectInfo
     */
    void updateSubject(SubjectInfo subjectInfo);

    /**
     * 单个删除
     * @param id
     */
    void deleteSubjectById(Integer id);

    /**
     * 批量删除
     * @param del_ids
     */
    void deleteBatch(List<Integer> del_ids);
    public SubjectInfo getSubjectInfoById(Integer id);

    public List<SubjectInfo> getSubjectByKey(Integer keyId);

    List<SubjectInfo> getSubjectsByKeyId(Integer valueOf);

    boolean checkKeyId(Integer keyId);
}
