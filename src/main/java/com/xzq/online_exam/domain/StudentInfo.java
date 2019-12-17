package com.xzq.online_exam.domain;

public class StudentInfo {
    private Integer studentId;
    private String studentName;
    private String studentAccount;
    private String studentPwd;
    private ClassInfo classInfo;

    public StudentInfo(Integer studentId){
        this.studentId=studentId;
    }
    public StudentInfo(){}
    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentAccount() {
        return studentAccount;
    }

    public void setStudentAccount(String studentAccount) {
        this.studentAccount = studentAccount;
    }

    public String getStudentPwd() {
        return studentPwd;
    }

    public void setStudentPwd(String studentPwd) {
        this.studentPwd = studentPwd;
    }

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }

    @Override
    public String toString() {
        return "StudentInfo{" +
                "studentId=" + studentId +
                ", studentName='" + studentName + '\'' +
                ", studentAccount='" + studentAccount + '\'' +
                ", studentPwd='" + studentPwd + '\'' +
                ", classInfo=" + classInfo +
                '}';
    }
}
