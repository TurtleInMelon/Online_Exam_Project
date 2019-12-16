package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamPaperInfoMapper;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.service.ExamPaperInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamPaperInfoServiceImpl implements ExamPaperInfoService {

    @Autowired
    private ExamPaperInfoMapper examPaperInfoMapper;

    /**
     * 获取试卷数量
     * @return
     */
    @Override
    public int getExamPaperTotal() {
        return examPaperInfoMapper.getExamPaperTotal();
    }

    @Override
    public ExamPaperInfo getExamPaperByName(String name) {
        return examPaperInfoMapper.getExamPaperByName(name);
    }

    @Override
    public List<ExamPaperInfo> getAllExamPaper() {
        return examPaperInfoMapper.getAllExamPaper();
    }

}
