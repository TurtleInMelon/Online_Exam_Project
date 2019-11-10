package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.SubjectInfoMapper;
import com.xzq.online_exam.service.SubjectInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SubjectInfoServiceImpl implements SubjectInfoService {


    @Autowired
    private SubjectInfoMapper subjectInfoMapper;
    /**
     * 获取学科数量
     * @return
     */
    @Override
    public int getSubjectTotal() {
        return subjectInfoMapper.getSubjectTotal();
    }
}
