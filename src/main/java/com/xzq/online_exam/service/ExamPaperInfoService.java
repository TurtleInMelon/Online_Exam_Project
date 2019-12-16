package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ExamPaperInfo;

import java.util.List;

public interface ExamPaperInfoService {
    /**
     * 获取总的试卷数量
     * @return
     */
    public  int getExamPaperTotal();

    public ExamPaperInfo getExamPaperByName(String name);

    public List<ExamPaperInfo> getAllExamPaper();
}
