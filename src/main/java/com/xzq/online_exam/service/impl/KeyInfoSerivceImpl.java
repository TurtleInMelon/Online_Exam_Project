package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.KeyInfoMapper;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.domain.KeyInfo;
import com.xzq.online_exam.service.KeyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KeyInfoSerivceImpl implements KeyInfoService {
    @Autowired
    private KeyInfoMapper keyInfoMapper;

    @Override
    public List<KeyInfo> getKeyByCourseId(Integer courseId) {
        return keyInfoMapper.getKeyByCourseId(courseId);
    }

    @Override
    public List<KeyInfo> getKeyPriorityBefore(Integer courseId, Integer priority) {
        return keyInfoMapper.getKeyPriorityBefore(courseId,priority);
    }

    @Override
    public void addOne(KeyInfo keyInfo) {
        keyInfoMapper.addOne(keyInfo);
    }

    @Override
    public void deleteOne(String keyName) {
        keyInfoMapper.deleteOne(keyName);
    }

    @Override
    public void editOne(KeyInfo keyInfo) {
        keyInfoMapper.editOne(keyInfo);
    }

    @Override
    public List<CourseInfo> getAllKeyDB() {
        return keyInfoMapper.getAllKeyDB();
    }

    @Override
    public List<Integer> getAllPriority(Integer courseId) {
        return keyInfoMapper.getAllPriority(courseId);
    }


}
