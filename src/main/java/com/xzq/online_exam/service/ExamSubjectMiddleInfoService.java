package com.xzq.online_exam.service;


import com.xzq.online_exam.domain.ExamSubjectMiddleInfo;

import java.util.List;

public interface ExamSubjectMiddleInfoService {

    List<ExamSubjectMiddleInfo> getAllESMByExamPaperId(Integer examPaperId);

    void removeSubjectByExamPaperIdAndSubjectId(Integer examPaperId, Integer subjectId);
    //单个添加试题入试卷
    void addESMByOne(Integer examPaperId, Integer subjectId);

    //检查题目是否在该试卷中存在
    Boolean checkSubject(Integer examPaperId, Integer subjectId);

}
