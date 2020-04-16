package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ExamChooseInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ExamChooseInfoService {
    public List<ExamChooseInfo> getAllExamChoose(String studentName, String examPaperName);

    public void saveExamChoose(ExamChooseInfo examChooseInfo);

    public ExamChooseInfo getExamChoose(Integer studentId, Integer examPaperId, Integer subjectId);
}
