package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.SubjectInfo;

import java.util.List;

public interface ESMInfoMapper {
    public List<ESMInfo> getAllESMInfo();

    public List<ESMInfo> getAllESMWithSubjects(Integer id);
}
