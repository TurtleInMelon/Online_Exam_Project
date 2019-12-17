package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.SubjectInfo;

import java.util.List;

public interface ESMInfoService {

    public List<ESMInfo> getAllESMInfo();

    public List<ESMInfo> getAllESMWithSubjects(Integer id);
}
