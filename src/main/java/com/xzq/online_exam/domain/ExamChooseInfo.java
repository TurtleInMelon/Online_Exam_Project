package com.xzq.online_exam.domain;

import java.io.Serializable;

public class ExamChooseInfo implements Serializable {
    private Integer chooseId;
    private StudentInfo student;
    private ExamPaperInfo examPaper;
    private SubjectInfo subject;
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

    public StudentInfo getStudent() {
        return student;
    }

    public void setStudent(StudentInfo student) {
        this.student = student;
    }

    public ExamPaperInfo getExamPaper() {
        return examPaper;
    }

    public void setExamPaper(ExamPaperInfo examPaper) {
        this.examPaper = examPaper;
    }

    public SubjectInfo getSubject() {
        return subject;
    }

    public void setSubject(SubjectInfo subject) {
        this.subject = subject;
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
                ", student=" + student +
                ", examPaper=" + examPaper +
                ", subject=" + subject +
                ", studentInfo=" + studentInfo +
                ", examPaperInfo=" + examPaperInfo +
                ", subjectInfo=" + subjectInfo +
                ", chooseResult='" + chooseResult + '\'' +
                '}';
    }
}
