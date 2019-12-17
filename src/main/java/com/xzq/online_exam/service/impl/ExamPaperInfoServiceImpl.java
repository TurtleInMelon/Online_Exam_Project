package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.ExamPaperInfoMapper;
import com.xzq.online_exam.domain.ExamPaperInfo;
import com.xzq.online_exam.service.ExamPaperInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ExamPaperInfoServiceImpl implements ExamPaperInfoService {

    @Autowired
    private ExamPaperInfoMapper examPaperInfoMapper;

    /**
     * 获取试卷数量
     * @return
     */
    @Override
    public int getExamPaperTotal() {
        return examPaperInfoMapper.getExamPaperTotal();
    }

    /**
     * 获取所有的试卷信息
     * @return
     */
    @Override
    public List<ExamPaperInfo> getAllExamPapers() {
        return examPaperInfoMapper.getAllExamPapers();
    }

    /**
     * 添加试卷信息
     * @param examPaperInfo
     */
    @Override
    public void addExamPaper(ExamPaperInfo examPaperInfo) {
        examPaperInfoMapper.addExamPaper(examPaperInfo);
    }

    /**
     * 检查试卷名是否重复
     * @param examPaperName
     * @return
     */
    @Override
    public boolean checkExamPaperName(String examPaperName) {
        int count=examPaperInfoMapper.checkExamPaperName(examPaperName);
        return count==0;
    }

    /**
     * 更新试卷信息
     * @param examPaperInfo
     */
    @Override
    public void updateExamPaperInfo(ExamPaperInfo examPaperInfo) {
        examPaperInfoMapper.updateExamPaperInfo(examPaperInfo);
    }

    /**
     * 删除试卷
     * @param id
     */
    @Override
    public void deleteExamPaperById(Integer id) {
        examPaperInfoMapper.deleteExamPaperById(id);
    }

    /**
     * 批量删除
     * @param del_ids
     */
    @Override
    public void deleteBatch(List<Integer> del_ids) {
        for(Integer each:del_ids){
            examPaperInfoMapper.deleteExamPaperById(each);
        }
    }
    @Override
    public ExamPaperInfo getExamPaperByName(String name) {
        return examPaperInfoMapper.getExamPaperByName(name);
    }

    @Override
    public List<ExamPaperInfo> getAllExamPaper() {
        return examPaperInfoMapper.getAllExamPaper();
    }

}
