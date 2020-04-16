package com.xzq.online_exam.service;

import com.xzq.online_exam.domain.CourseInfo;

import java.util.List;

public interface CourseInfoService {

    List<CourseInfo> getAllCoursesWithGradeName(CourseInfo courseInfo);

    /**
     * 获取所有课程信息
     * @return
     */
    List<CourseInfo> getAllCourseNames();

    /**
     * 插入
     * @param courseInfo
     */
    void addCourse(CourseInfo courseInfo);

    /**
     * 检查课程名是否可用
     * @param courseName
     * @return
     */
    boolean checkGradeName(String courseName);

    /**
     * 更新课程信息
     * @param courseInfo
     */
    void updateCourse(CourseInfo courseInfo);

    /**
     * 根据课程Id删除
     * @param id
     */
    void deleteCourseById(Integer id);

    /**
     * 批量删除
     * @param del_ids
     */
    void deleteBatch(List<Integer> del_ids);

    public CourseInfo getCourseByName(String name);

    String getCourseNameById(int courseId);
}
