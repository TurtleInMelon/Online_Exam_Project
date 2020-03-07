package com.xzq.online_exam.domain;

public class TeachingInfo {
    private Integer teachingId;
    private CourseInfo courseInfo;
    private TeacherInfo teacherInfo;
    private  ClassInfo classInfo;


    public Integer getTeachingId() {
        return teachingId;
    }

    public void setTeachingId(Integer teachingId) {
        this.teachingId = teachingId;
    }

    public CourseInfo getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(CourseInfo courseInfo) {
        this.courseInfo = courseInfo;
    }

    public TeacherInfo getTeacherInfo() {
        return teacherInfo;
    }

    public void setTeacherInfo(TeacherInfo teacherInfo) {
        this.teacherInfo = teacherInfo;
    }

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }

    @Override
    public String toString() {
        return "TeachingInfo{" +
                "teachingId=" + teachingId +
                ", courseInfo=" + courseInfo +
                ", teacherInfo=" + teacherInfo +
                ", classInfo=" + classInfo +
                '}';
    }
}
