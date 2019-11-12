package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ExamPaperInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ExamPaperInfoMapper {
     /**
      * 获取试卷总数
      * @return
      */
     public int getExamPaperTotal();


     /**
      * 获取所有试卷的信息
      * @return
      */
     List<ExamPaperInfo> getAllExamPapers();
}
