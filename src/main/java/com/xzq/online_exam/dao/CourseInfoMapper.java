package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.CourseInfo;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Repository
public interface CourseInfoMapper {

    List<CourseInfo> getAllCoursesWithGradeName(CourseInfo courseInfo);
}
