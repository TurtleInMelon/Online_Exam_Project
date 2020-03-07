package com.xzq.online_exam.domain;

public class StudentKeyInfo {
    private Integer skId;
    private StudentInfo studentInfo;
    private KeyInfo keyInfo;
    private CourseInfo courseInfo;
    private Integer times;

    public Integer getSkId() {
        return skId;
    }

    public void setSkId(Integer skId) {
        this.skId = skId;
    }

    public StudentInfo getStudentInfo() {
        return studentInfo;
    }

    public void setStudentInfo(StudentInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public KeyInfo getKeyInfo() {
        return keyInfo;
    }

    public void setKeyInfo(KeyInfo keyInfo) {
        this.keyInfo = keyInfo;
    }

    public CourseInfo getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(CourseInfo courseInfo) {
        this.courseInfo = courseInfo;
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
    }

    @Override
    public String toString() {
        return "StudentKeyInfo{" +
                "skId=" + skId +
                ", studentInfo=" + studentInfo +
                ", keyInfo=" + keyInfo +
                ", courseInfo=" + courseInfo +
                ", times=" + times +
                '}';
    }
}
