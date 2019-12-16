package com.xzq.online_exam.domain;

public class StudentInfo {

    private Integer studentId;
    //学生id
    private String studentName;
    //学生姓名
    private String studentAccount;
    //学生账户
    private String studentPwd;
    //学生密码
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
