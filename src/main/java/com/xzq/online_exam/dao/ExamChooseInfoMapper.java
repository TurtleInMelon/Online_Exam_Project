package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ExamChooseInfo;
import com.xzq.online_exam.domain.ExamPaperInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ExamChooseInfoMapper {

    public List<ExamChooseInfo> getAllExamChoose(@Param("studentName")String studentName, @Param("examPaperName") String examPaperName);

    public void saveExamChoose(ExamChooseInfo examChooseInfo);

    public ExamChooseInfo getExamChoose(@Param("studentId") Integer studentId,@Param("examPaperId") Integer examPaperId,@Param("subjectId") Integer subjectId);
}
