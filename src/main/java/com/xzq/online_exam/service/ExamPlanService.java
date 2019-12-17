package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ExamPlanInfo;

import java.util.List;

public interface ExamPlanService {
    public List<ExamPlanInfo>getExamPlan();

    public void deleteOne(Integer id);

    public void updateOne(ExamPlanInfo examPlanInfo);

    public void addOne(ExamPlanInfo examPlanInfo);
}
