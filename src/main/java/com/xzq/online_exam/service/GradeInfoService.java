package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.GradeInfo;

import java.util.List;

public interface GradeInfoService {

    /**
     * 获取所有年级
     * @return
     */
    List<GradeInfo> getAllGrades();

    /**
     * 添加年级
     * @param gradeInfo
     */
    void addGrade(GradeInfo gradeInfo);

    /**
     * 检查年级名是否可用
     * @param gradeName
     * @return
     */
    boolean checkGradeName(String gradeName);

    /**
     * 更新年级数据
     * @param gradeInfo
     */
    void updateGrade(GradeInfo gradeInfo);

    /**
     * 单个删除数据
     * @param id
     */
    void deleteGrade(Integer id);

    /**
     * 批量删除
     * @param del_ids
     */
    void deleteBatch(List<Integer> del_ids);
}
