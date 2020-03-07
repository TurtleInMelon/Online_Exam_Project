package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.StudentRecordInfo;

import java.util.List;

public interface StudentRecordService {
    public List<ESMInfo> getRecordByStudentId(Integer id);

    public void addOne(StudentRecordInfo studentRecordInfo);
}
