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

    /**
     * 添加教师信息
     * @param teacherInfo
     */
    @Override
    public void addTeacher(TeacherInfo teacherInfo) {
        teacherInfoMapper.addTeacher(teacherInfo);
    }

    /**
     * 检查教师名是否可用
     * @param teacherName
     * @return
     */
    @Override
    public boolean checkTeacherName(String teacherName) {
        int count=teacherInfoMapper.checkTeacherName(teacherName);
        return count==0;
    }

    /**
     * 更新教师信息
     * @param teacherinfo
     */
    @Override
    public void updateTeacher(TeacherInfo teacherinfo) {
        teacherInfoMapper.updateTeacher(teacherinfo);
    }

    /**
     * 根据teacherId删除教师信息
     * @param id
     */
    @Override
    public void deleteTeacherById(Integer id) {
        teacherInfoMapper.deleteTeacherById(id);
    }

    /**
     * 批量删除
     * @param del_ids
     */
    @Override
    public void deleteBatch(List<Integer> del_ids) {
        for(Integer each:del_ids){
            teacherInfoMapper.deleteTeacherById(each);
        }
    }
}
