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
}
