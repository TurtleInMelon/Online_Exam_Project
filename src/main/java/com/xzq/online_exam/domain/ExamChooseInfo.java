package com.xzq.online_exam.domain;

public class ExamChooseInfo {
    private Integer chooseId;
    private StudentInfo studentInfo;
    private ExamPaperInfo examPaperInfo;
    private SubjectInfo subjectInfo;
    private String chooseResult;

    public Integer getChooseId() {
        return chooseId;
    }

    public void setChooseId(Integer chooseId) {
        this.chooseId = chooseId;
    }

    public StudentInfo getStudentInfo() {
        return studentInfo;
    }

    public void setStudentInfo(StudentInfo studentInfo) {
        this.studentInfo = studentInfo;
    }

    public ExamPaperInfo getExamPaperInfo() {
        return examPaperInfo;
    }

    public void setExamPaperInfo(ExamPaperInfo examPaperInfo) {
        this.examPaperInfo = examPaperInfo;
    }

    public SubjectInfo getSubjectInfo() {
        return subjectInfo;
    }

    public void setSubjectInfo(SubjectInfo subjectInfo) {
        this.subjectInfo = subjectInfo;
    }

    public String getChooseResult() {
        return chooseResult;
    }

    public void setChooseResult(String chooseResult) {
        this.chooseResult = chooseResult;
    }

    @Override
    public String toString() {
        return "ExamChooseInfo{" +
                "chooseId=" + chooseId +
                ", studentInfo=" + studentInfo +
                ", examPaperInfo=" + examPaperInfo +
                ", subjectInfo=" + subjectInfo +
                ", chooseResult='" + chooseResult + '\'' +
                '}';
    }
}
