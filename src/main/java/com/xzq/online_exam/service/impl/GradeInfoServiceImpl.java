package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.GradeInfoMapper;
import com.xzq.online_exam.domain.GradeInfo;
import com.xzq.online_exam.service.GradeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeInfoServiceImpl implements GradeInfoService {

    @Autowired
    private GradeInfoMapper gradeInfoMapper;

    @Override
    public List<GradeInfo> getAllGrades() {
        return gradeInfoMapper.getAllGrades();
    }
}
