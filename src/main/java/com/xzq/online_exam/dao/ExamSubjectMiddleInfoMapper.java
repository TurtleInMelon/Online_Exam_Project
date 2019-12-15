package com.xzq.online_exam.dao;


import com.xzq.online_exam.domain.ExamSubjectMiddleInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Repository
public interface ExamSubjectMiddleInfoMapper {


    List<ExamSubjectMiddleInfo> getAllESMByExamPaperId(Integer examPaperId);

    void removeSubjectByExamPaperIdAndSubjectId(@Param("examPaperId") Integer examPaperId, @Param("subjectId") Integer subjectId);

    void addESMByOne(@Param("examPaperId") Integer examPaperId, @Param("subjectId") Integer subjectId);

    int checkSubject(@Param("examPaperId") Integer examPaperId, @Param("subjectId") Integer subjectId);
}
