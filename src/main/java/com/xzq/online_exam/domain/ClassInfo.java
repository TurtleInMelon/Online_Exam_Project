package com.xzq.online_exam.domain;

import java.io.Serializable;

public class ClassInfo implements Serializable {
    //班级编号
    private Integer classId;
    //班级名称
    private String className;
    //年级信息
    private GradeInfo gradeInfo;
    //教师信息
    private TeacherInfo teacherInfo;

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public GradeInfo getGradeInfo() {
        return gradeInfo;
    }

    public void setGradeInfo(GradeInfo gradeInfo) {
        this.gradeInfo = gradeInfo;
    }

    public TeacherInfo getTeacherInfo() {
        return teacherInfo;
    }

    public void setTeacherInfo(TeacherInfo teacherInfo) {
        this.teacherInfo = teacherInfo;
    }

    @Override
    public String toString() {
        return "ClassInfo{" +
                "classId=" + classId +
                ", className='" + className + '\'' +
                ", gradeInfo=" + gradeInfo +
                ", teacherInfo=" + teacherInfo +
                '}';
    }
}
