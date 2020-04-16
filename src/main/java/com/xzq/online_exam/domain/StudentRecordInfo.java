package com.xzq.online_exam.domain;

public class StudentRecordInfo {
    private Integer srId;
    private StudentInfo studentInfo;
    private ESMInfo esmInfo;

    public Integer getSrId() {
        return srId;
    }

    public void setSrId(Integer srId) {
        this.srId = srId;
    }

    public StudentInfo getStudentInfo() {
        return studentInfo;
    }

    public void setStudentInfo(StudentInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public ESMInfo getEsmInfo() {
        return esmInfo;
    }

    public void setEsmInfo(ESMInfo esmInfo) {
        this.esmInfo = esmInfo;
    }

    @Override
    public String toString() {
        return "StudentRecordInfo{" +
                "srId=" + srId +
                ", studentInfo=" + studentInfo +
                ", esmInfo=" + esmInfo +
                '}';
    }
}
