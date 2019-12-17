package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamHistroyInfoMapper;
import com.xzq.online_exam.domain.ExamHistoryInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.domain.StudentInfo;
import com.xzq.online_exam.service.ExamHistoryInfoService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ExamHistoryServiceImpl implements ExamHistoryInfoService {
    @Autowired
    private ExamHistroyInfoMapper examHistroyInfoMapper;

    @Override
    public List<ExamHistoryInfo> getExamHistory() {
        List<ExamHistoryInfo>all=examHistroyInfoMapper.getExamHistory();
        return all;
    }

    @Override
    public List<ExamHistoryInfo> getExamHistoryOfOne(StudentInfo studentInfo) {
        return examHistroyInfoMapper.getExamHistoryOfOne(studentInfo);
    }

    @Override
    public void saveHistoryRecord(ExamHistoryInfo examHistoryInfo) {
        examHistroyInfoMapper.saveHistoryRecord(examHistoryInfo);
    }

    @Override
    public ExamHistoryInfo JudgeStuExam(Integer eId, Integer sId) {
        return examHistroyInfoMapper.JudgeStuExam(eId,sId);
    }
}
