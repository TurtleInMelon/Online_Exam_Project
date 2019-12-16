package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ExamPaperInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExamPaperInfoMapper {
     public int getExamPaperTotal();

     public ExamPaperInfo getExamPaperByName(String name);

     public List<ExamPaperInfo> getAllExamPaper();
}
