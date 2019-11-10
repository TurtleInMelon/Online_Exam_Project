package com.xzq.online_exam.domain;

import java.io.Serializable;

public class CourseInfo implements Serializable {

    //学科编号
    private Integer courseId;

    //学科名字
    private String courseName;

    //分科情况 0：不分科 1文科 2立刻
    private Integer division;

    //年级信息
    private GradeInfo gradeInfo;

    @Override
    public String toString() {
        return "CourseInfo{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", division=" + division +
                ", gradeInfo=" + gradeInfo +
                '}';
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getDivision() {
        return division;
    }

    public void setDivision(Integer division) {
        this.division = division;
    }

    public GradeInfo getGradeInfo() {
        return gradeInfo;
    }

    public void setGradeInfo(GradeInfo gradeInfo) {
        this.gradeInfo = gradeInfo;
    }
}
