package com.xzq.online_exam.dao;


import com.xzq.online_exam.domain.ExamHistoryInfo;
import com.xzq.online_exam.domain.StudentInfo;
import org.apache.ibatis.annotations.Param;
import org.junit.Test;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ExamHistroyInfoMapper {
    public List<ExamHistoryInfo> getExamHistory();

    public List<ExamHistoryInfo>getExamHistoryOfOne(Integer studentId);

    public void saveHistoryRecord(ExamHistoryInfo examHistoryInfo);

    public ExamHistoryInfo JudgeStuExam(@Param("eId") Integer eId,@Param("sId") Integer sId);
}
