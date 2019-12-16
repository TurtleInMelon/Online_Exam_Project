package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ExamChooseInfo;

import java.util.List;

public interface ExamChooseInfoService {
    public List<ExamChooseInfo> getAllExamChoose(String studentName,String examPaperName);

    public void saveExamChoose(ExamChooseInfo examChooseInfo);
}
