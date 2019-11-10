package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.StudentInfoMapper;
import com.xzq.online_exam.service.StudentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentInfoServiceImpl implements StudentInfoService {

    @Autowired
    private StudentInfoMapper studentInfoMapper;

    @Override
    public int getStudentTotal() {
        return studentInfoMapper.getStudentTotal();
    }
}
