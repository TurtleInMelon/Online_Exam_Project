package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.StudentRecordMapper;
import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.StudentRecordInfo;
import com.xzq.online_exam.service.StudentRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentRecordServiceImpl implements StudentRecordService {
    @Autowired
    private StudentRecordMapper studentRecordMapper;
    @Override
    public List<ESMInfo> getRecordByStudentId(Integer id) {
        return studentRecordMapper.getRecordByStudentId(id);
    }

    @Override
    public void addOne(StudentRecordInfo studentRecordInfo) {
        studentRecordMapper.addOne(studentRecordInfo);
    }
}
