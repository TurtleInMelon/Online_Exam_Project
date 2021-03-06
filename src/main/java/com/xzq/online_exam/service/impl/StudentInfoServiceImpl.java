package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.StudentInfoMapper;
import com.xzq.online_exam.domain.StudentInfo;
import com.xzq.online_exam.service.StudentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentInfoServiceImpl implements StudentInfoService {

    @Autowired
    private StudentInfoMapper studentInfoMapper;

    /**
     * 获取学生总数
     * @return
     */
    @Override
    public int getStudentTotal() {
        return studentInfoMapper.getStudentTotal();
    }

    /**
     * 根据班级编号获取学生信息
     * @param classId
     * @return
     */
    @Override
    public List<StudentInfo> getStudentsByClassId(Integer classId) {
        return studentInfoMapper.getStudentsByClassId(classId);
    }

    @Override
    public List<StudentInfo> getAllStudents() {
        //System.out.println("service");
        List<StudentInfo> all=studentInfoMapper.getAllStudents();
        for(StudentInfo studentInfo: all)
            System.out.println(studentInfo);
        return all;
    }

    @Override
    public void deleteOne(Integer id) {
        studentInfoMapper.deleteOne(id);
    }

    @Override
    public void addOne(StudentInfo studentInfo) {
        studentInfoMapper.addOne(studentInfo);
    }

    @Override
    public void updateOneStudent(StudentInfo studentInfo) {
        studentInfoMapper.updateOneStudent(studentInfo);
    }

    @Override
    public Integer checkUser(String studentName) {
        return studentInfoMapper.checkUser(studentName);
    }

    @Override
    public StudentInfo getStudentWithPwd(String studentAccount) {
        return studentInfoMapper.getStudentWithPwd(studentAccount);
    }
}
