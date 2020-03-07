package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.StudentKeyInfoMapper;
import com.xzq.online_exam.domain.StudentKeyInfo;
import com.xzq.online_exam.domain.TeachingInfo;
import com.xzq.online_exam.service.StudentKeyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class StudentKeyInfoServiceImpl implements StudentKeyInfoService {
    @Autowired
    private StudentKeyInfoMapper studentKeyInfoMapper;
    @Override
    public List<Integer> theThirdKey(Integer studentId) {
        return studentKeyInfoMapper.theThirdKey(studentId);
    }

    @Override
    public List<StudentKeyInfo> getAllStudentsWithTheThirdKeys(TeachingInfo teachingInfo) {
        return studentKeyInfoMapper.getAllStudentsWithTheThirdKeys(teachingInfo);
    }

    @Override
    public List<String> getRecordByKey(Integer keyId) {
        return studentKeyInfoMapper.getRecordByKey(keyId);
    }

}
