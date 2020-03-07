package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.TeachingInfoMapper;
import com.xzq.online_exam.domain.ClassInfo;
import com.xzq.online_exam.domain.TeachingInfo;
import com.xzq.online_exam.service.TeachingInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TeachingInfoServiceImpl implements TeachingInfoService {
    @Autowired
    private TeachingInfoMapper teachingInfoMapper;
    @Override
    public List<TeachingInfo> getAllClassesByTeacherId(Integer teacherId) {

        return teachingInfoMapper.getAllClassesByTeacherId(teacherId);
    }

    @Override
    public TeachingInfo getTeachingInfoById(Integer teachingId) {
        return teachingInfoMapper.getTeachingInfoById(teachingId);
    }
}
