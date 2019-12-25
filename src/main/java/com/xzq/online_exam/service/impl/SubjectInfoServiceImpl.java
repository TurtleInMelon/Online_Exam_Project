package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.SubjectInfoMapper;
import com.xzq.online_exam.domain.SubjectInfo;
import com.xzq.online_exam.service.SubjectInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    /**
     获取所有试题的信息
     * @return
     */
    @Override
    public List<SubjectInfo> getAllSubjects() {
        return subjectInfoMapper.getAllSubjects();
    }

    /**
     * 获取试题信息By Id
     * @param subjectId
     * @return
     */
    @Override
    public SubjectInfo getSubjectWithId(Integer subjectId) {
        return subjectInfoMapper.getSubjectWithId(subjectId);
    }

    /**
     * 根据条件寻找合适的试题
     * @param division
     * @param gradeId
     * @param subjectEasy
     * @return
     */
    @Override
    public List<SubjectInfo> chooseSubjects(Integer division, Integer gradeId, Integer subjectEasy) {
        return subjectInfoMapper.chooseSubjects(division,gradeId,subjectEasy);
    }

    @Override
    public void addSubject(SubjectInfo subjectInfo) {
        subjectInfoMapper.addSubject(subjectInfo);
    }

    @Override
    public void updateSubject(SubjectInfo subjectInfo) {
        subjectInfoMapper.updateSubject(subjectInfo);
    }

    @Override
    public void deleteSubjectById(Integer id) {
        subjectInfoMapper.deleteSubjectById(id);
    }

    @Override
    public void deleteBatch(List<Integer> del_ids) {
        for (Integer each : del_ids) {
            System.out.println(each);
            subjectInfoMapper.deleteSubjectById(each);
        }
    }
    @Override
    public SubjectInfo getSubjectInfoById(Integer id) {
        return subjectInfoMapper.getSubjectInfoById(id);
    }
}
