package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.StudentExamInfoMapper;
import com.xzq.online_exam.domain.StudentExamInfo;
import com.xzq.online_exam.service.StudentExamInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentExamInfoServiceImpl implements StudentExamInfoService {

    @Autowired
    private StudentExamInfoMapper studentExamInfoMapper;

    @Override
    public List<StudentExamInfo> getAllStudentAvgScoreCount(int classId) {
        return studentExamInfoMapper.getAllStudentAvgScoreCount(classId);
    }

    @Override
    public List<StudentExamInfo> getStudentExamInfoById(Integer studentId) {
        return studentExamInfoMapper.getStudentExamInfoById(studentId);
    }
}
