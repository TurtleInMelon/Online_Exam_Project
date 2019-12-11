package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamSubjectMiddleInfoMapper;
import com.xzq.online_exam.domain.ExamSubjectMiddleInfo;
import com.xzq.online_exam.service.ExamSubjectMiddleInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ExamSubjectMiddleInfoServiceImpl implements ExamSubjectMiddleInfoService {

    @Autowired
    private ExamSubjectMiddleInfoMapper examSubjectMiddleInfoMapper;

    @Override
    public List<ExamSubjectMiddleInfo> getAllESMByExamPaperId(Integer examPaperId) {
        return examSubjectMiddleInfoMapper.getAllESMByExamPaperId(examPaperId);
    }

    @Override
    public void removeSubjectByExamPaperIdAndSubjectId(Integer examPaperId, Integer subjectId) {
        examSubjectMiddleInfoMapper.removeSubjectByExamPaperIdAndSubjectId(examPaperId,subjectId);
    }

    @Override
    public void addESMByOne(Integer examPaperId, Integer subjectId) {
        examSubjectMiddleInfoMapper.addESMByOne(examPaperId,subjectId);
    }

    @Override
    public Boolean checkSubject(Integer examPaperId, Integer subjectId) {
        int count=examSubjectMiddleInfoMapper.checkSubject(examPaperId,subjectId);
        return count==0;
    }
}
