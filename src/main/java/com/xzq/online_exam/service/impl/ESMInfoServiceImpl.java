package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ESMInfoMapper;
import com.xzq.online_exam.domain.ESMInfo;
import com.xzq.online_exam.domain.SubjectInfo;
import com.xzq.online_exam.service.ESMInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ESMInfoServiceImpl implements ESMInfoService {
    @Autowired
    private ESMInfoMapper esmInfoMapper;
    @Override
    public List<ESMInfo> getAllESMInfo() {
        return esmInfoMapper.getAllESMInfo();
    }

    @Override
    public List<ESMInfo> getAllESMWithSubjects(Integer id) {
        return esmInfoMapper.getAllESMWithSubjects(id);
    }
}
