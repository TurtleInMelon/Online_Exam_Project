package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamChooseInfoMapper;
import com.xzq.online_exam.domain.ExamChooseInfo;
import com.xzq.online_exam.service.ExamChooseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ExamChooseInfoServiceImpl implements ExamChooseInfoService {
    @Autowired
    private ExamChooseInfoMapper examChooseInfoMapper;

    @Override
    public List<ExamChooseInfo> getAllExamChoose(String studentName, String examPaperName) {
        return examChooseInfoMapper.getAllExamChoose(studentName,examPaperName);
    }

    @Override
    public void saveExamChoose(ExamChooseInfo examChooseInfo) {
        examChooseInfoMapper.saveExamChoose(examChooseInfo);
    }

    @Override
    public ExamChooseInfo getExamChoose(Integer studentId, Integer examPaperId, Integer subjectId) {
        return examChooseInfoMapper.getExamChoose(studentId,examPaperId,subjectId);
    }
}
