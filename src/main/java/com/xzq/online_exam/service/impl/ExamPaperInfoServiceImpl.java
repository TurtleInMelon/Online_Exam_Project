package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamPaperInfoMapper;
import com.xzq.online_exam.service.ExamPaperInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
