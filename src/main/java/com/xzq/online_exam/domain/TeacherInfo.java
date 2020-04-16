package com.xzq.online_exam.domain;

import java.io.Serializable;

public class TeacherInfo implements Serializable {
    private Integer teacherId;
    private String teacherName;
    private String teacherAccount;
    private String teacherPwd;
    private int adminPower;
    private Integer isWork;
    //查找时把相应的班级信息一起找出

    public TeacherInfo (Integer teacherId){
        this.teacherId=teacherId;
    }
    public TeacherInfo(){};
    private ClassInfo classInfo;

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherAccount() {
        return teacherAccount;
    }

    public void setTeacherAccount(String teacherAccount) {
        this.teacherAccount = teacherAccount;
    }

    public String getTeacherPwd() {
        return teacherPwd;
    }

    public void setTeacherPwd(String teacherPwd) {
        this.teacherPwd = teacherPwd;
    }

    public int getAdminPower() {
        return adminPower;
    }

    public void setAdminPower(int adminPower) {
        this.adminPower = adminPower;
    }

    public Integer getIsWork() {
        return isWork;
    }

    public void setIsWork(Integer isWork) {
        this.isWork = isWork;
    }

    @Override
    public String toString() {
        return "TeacherInfo{" +
                "teacherId=" + teacherId +
                ", teacherName='" + teacherName + '\'' +
                ", teacherAccount='" + teacherAccount + '\'' +
                ", teacherPwd='" + teacherPwd + '\'' +
                ", adminPower=" + adminPower +
                ", isWork=" + isWork +
                ", classInfo=" + classInfo +
                '}';
    }
}
