package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.TeacherInfoMapper;
import com.xzq.online_exam.domain.TeacherInfo;
import com.xzq.online_exam.service.TeacherInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class TeacherInfoServiceImpl implements TeacherInfoService {

    @Autowired
    private TeacherInfoMapper teacherInfoMapper;

    /**
     * 根据教师账户寻找账户信息
     * @param account
     * @return
     */
    @Override
    public TeacherInfo getTeacherByAccount(String account) {
        return teacherInfoMapper.getTeacherByAccount(account);
    }


    /**
     * 返回教师数量
     * @return
     */
    @Override
    public int getTeacherTotal() {
        return teacherInfoMapper.getTeacherTotal();
    }


    /**
     * 获取教师的所有信息
     * @return
     */
    @Override
    public List<TeacherInfo> getALlTeacherInfo() {
        return teacherInfoMapper.getALlTeacherInfo();
    }
}
