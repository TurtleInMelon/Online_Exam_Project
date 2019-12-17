package com.xzq.online_exam.dao;

import com.xzq.online_exam.domain.CourseInfo;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Repository
public interface CourseInfoMapper {

    List<CourseInfo> getAllCoursesWithGradeName(CourseInfo courseInfo);

    List<CourseInfo> getAllCourseNames();

    /**
     * 添加课程记录
     * @param courseInfo
     */
    void addCourse(CourseInfo courseInfo);

    /**
     * 检查课程名是否有唯一
     * @param courseName
     * @return
     */
    int checkGradeName(String courseName);

    /**
     * 更新课程名
     * @param courseInfo
     */
    void updateCourse(CourseInfo courseInfo);

    /**
     * 根据课程id删除课程信息
     * @param id
     */
    void deleteCourseById(Integer id);

    public CourseInfo getCourseByName(String name);
}
