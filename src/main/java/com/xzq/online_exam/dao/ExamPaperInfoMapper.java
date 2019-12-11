package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ExamPaperInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ExamPaperInfoMapper {
     /**
      * 获取试卷总数
      * @return
      */
     public int getExamPaperTotal();


     /**
      * 获取所有试卷的信息
      * @return
      */
     List<ExamPaperInfo> getAllExamPapers();

    /**
     * 添加试卷信息
     * @param examPaperInfo
     */
    void addExamPaper(ExamPaperInfo examPaperInfo);

    /**
     * 检查试卷名是否重复
     * @param examPaperName
     * @return
     */
    int checkExamPaperName(String examPaperName);

    /**
     * 更新试卷信息
     * @param examPaperInfo
     */
    void updateExamPaperInfo(ExamPaperInfo examPaperInfo);

    /**
     * 根据id删除试卷
     * @param id
     */
    void deleteExamPaperById(Integer id);
}
