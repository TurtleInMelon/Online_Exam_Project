package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamPlanMapper;
import com.xzq.online_exam.domain.ExamPlanInfo;
import com.xzq.online_exam.service.ExamPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ExamPlanServiceImpl implements ExamPlanService {
    @Autowired
    private ExamPlanMapper examPlanMapper;
    @Override
    public List<ExamPlanInfo> getExamPlan() {
        List<ExamPlanInfo>all=examPlanMapper.getExamPlan();
        return all;
    }

    @Override
    public void deleteOne(Integer id) {
        examPlanMapper.deleteOne(id);
    }

    @Override
    public void updateOne(ExamPlanInfo examPlanInfo) {
        examPlanMapper.updateOne(examPlanInfo);
    }

    @Override
    public void addOne(ExamPlanInfo examPlanInfo) {
        System.out.println("service==============================");
        examPlanMapper.addOne(examPlanInfo);
    }
}
