package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.SubjectInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ESMInfoMapper {
    public List<ESMInfo> getAllESMInfo();

    public List<ESMInfo> getAllESMWithSubjects(Integer id);

    public ESMInfo getCertain(@Param("subjectId") Integer subjectId, @Param("examPaperId") Integer examPaperId);
}
