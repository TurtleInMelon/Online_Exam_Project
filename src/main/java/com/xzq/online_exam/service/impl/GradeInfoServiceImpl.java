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


    /**
     * 添加年级
     * @param gradeInfo
     */
    @Override
    public void addGrade(GradeInfo gradeInfo) {
        gradeInfoMapper.addGrade(gradeInfo);
    }

    /**
     * 检查年级名是否可用
     * @param gradeName
     * @return
     */
    @Override
    public boolean checkGradeName(String gradeName) {
        GradeInfo gradeInfo=new GradeInfo();
        gradeInfo.setGradeName(gradeName);
        int count = gradeInfoMapper.checkGradeName(gradeInfo);
        //System.out.println(count);
        return count==0;
    }


    @Override
    public void updateGrade(GradeInfo gradeInfo) {
        gradeInfoMapper.updateGrade(gradeInfo);
    }

    /**
     * 单个删除
     * @param id
     */
    @Override
    public void deleteGrade(Integer id) {
        gradeInfoMapper.deleteGrade(id);
    }

    /**
     * 批量删除
     * @param del_ids
     */
    @Override
    public void deleteBatch(List<Integer> del_ids) {
        for (Integer each:del_ids){
            gradeInfoMapper.deleteGrade(each);
        }
    }
}
