package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.CourseInfo;

import java.util.List;

public interface CourseInfoService {

    List<CourseInfo> getAllCoursesWithGradeName(CourseInfo courseInfo);

    public CourseInfo getCourseByName(String name);
}
