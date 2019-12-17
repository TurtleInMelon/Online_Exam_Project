package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ExamPaperInfo;

import java.util.List;

public interface ExamPaperInfoService {
    /**
     * 获取总的试卷数量
     * @return
     */
    public  int getExamPaperTotal();


    public List<ExamPaperInfo> getAllExamPapers();

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
    boolean checkExamPaperName(String examPaperName);

    /**
     * 更新试卷信息
     * @param examPaperInfo
     */
    void updateExamPaperInfo(ExamPaperInfo examPaperInfo);

    /**
     * 根据examPaperId删除试卷
     * @param id
     */
    void deleteExamPaperById(Integer id);

    /**
     * 批量删除
     * @param del_ids
     */
    void deleteBatch(List<Integer> del_ids);

    public ExamPaperInfo getExamPaperByName(String name);

    public List<ExamPaperInfo> getAllExamPaper();
}
