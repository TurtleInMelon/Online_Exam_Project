package com.xzq.online_exam.service.impl;

import com.xzq.online_exam.dao.CourseInfoMapper;
import com.xzq.online_exam.domain.CourseInfo;
import com.xzq.online_exam.service.CourseInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseInfoServiceImpl implements CourseInfoService {

    @Autowired
    private CourseInfoMapper courseInfoMapper;

    @Override
    public List<CourseInfo> getAllCoursesWithGradeName(CourseInfo courseInfo) {
        return courseInfoMapper.getAllCoursesWithGradeName(courseInfo);
    }

    @Override
    public List<CourseInfo> getAllCourseNames() {
        return courseInfoMapper.getAllCourseNames();
    }

    @Override
    public void addCourse(CourseInfo courseInfo) {
        courseInfoMapper.addCourse(courseInfo);
    }

    @Override
    public boolean checkGradeName(String courseName) {
        int count=courseInfoMapper.checkGradeName(courseName);
        return count==0;
    }

    @Override
    public void updateCourse(CourseInfo courseInfo) {
        courseInfoMapper.updateCourse(courseInfo);
    }

    @Override
    public void deleteCourseById(Integer id) {
        courseInfoMapper.deleteCourseById(id);
    }

    @Override
    public void deleteBatch(List<Integer> del_ids) {
        for (Integer each : del_ids) {
            courseInfoMapper.deleteCourseById(each);
        }
    }
    public CourseInfo getCourseByName(String name) {
        return courseInfoMapper.getCourseByName(name);
    }
}
