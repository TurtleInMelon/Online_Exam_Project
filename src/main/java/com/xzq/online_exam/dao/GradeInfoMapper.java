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

    /**
     * 添加员工
     * @param gradeInfo
     */
    void addGrade(GradeInfo gradeInfo);

    /**
     * 检查年级名是否可用
     * @param gradeName
     * @return
     */
    int checkGradeName(GradeInfo gradeName);

    /**
     * 更新年级信息
     * @param gradeInfo
     */
    void updateGrade(GradeInfo gradeInfo);

    /**
     * 单个删除年级信息
     * @param id
     */
    void deleteGrade(Integer id);
}
