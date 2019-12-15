package com.xzq.online_exam.dao;

import com.xzq.online_exam.controller.SubjectInfoController;
import com.xzq.online_exam.domain.SubjectInfo;
import org.apache.ibatis.annotations.Param;
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

    /**
     *根据条件寻找合适的题目
     * @param division
     * @param gradeId
     * @param subjectEasy
     *ao @return
     */
    List<SubjectInfo> chooseSubjects(@Param("division") Integer division, @Param("gradeId") Integer gradeId, @Param("subjectEasy") Integer subjectEasy);

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

    //删除试题
    void deleteSubjectById(Integer id);
}
