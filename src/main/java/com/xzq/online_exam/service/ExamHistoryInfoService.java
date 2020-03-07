package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ExamHistoryInfo;
import com.xzq.online_exam.domain.StudentInfo;

import java.util.List;

public interface ExamHistoryInfoService {
    public List<ExamHistoryInfo>getExamHistory();

    public List<ExamHistoryInfo>getExamHistoryOfOne(Integer studentId);

    public void saveHistoryRecord(ExamHistoryInfo examHistoryInfo);

    public ExamHistoryInfo JudgeStuExam(Integer eId,Integer sId);
}
