package com.xzq.online_exam.domain;

public class ExamPaperInfo {

    private Integer examPaperId;
    private String examPaperName;
    private int subjectNum;
    private int examPaperTime;
    private int examPaperScore;
    private int division;
    private int examPaperEasy;
    private GradeInfo grade;

    public Integer getExamPaperId() {
        return examPaperId;
    }

    public void setExamPaperId(Integer examPaperId) {
        this.examPaperId = examPaperId;
    }

    public String getExamPaperName() {
        return examPaperName;
    }

    public void setExamPaperName(String examPaperName) {
        this.examPaperName = examPaperName;
    }

    public int getSubjectNum() {
        return subjectNum;
    }

    public void setSubjectNum(int subjectNum) {
        this.subjectNum = subjectNum;
    }

    public int getExamPaperTime() {
        return examPaperTime;
    }

    public void setExamPaperTime(int examPaperTime) {
        this.examPaperTime = examPaperTime;
    }

    public int getExamPaperScore() {
        return examPaperScore;
    }

    public void setExamPaperScore(int examPaperScore) {
        this.examPaperScore = examPaperScore;
    }

    public int getDivision() {
        return division;
    }

    public void setDivision(int division) {
        this.division = division;
    }

    public int getExamPaperEasy() {
        return examPaperEasy;
    }

    public void setExamPaperEasy(int examPaperEasy) {
        this.examPaperEasy = examPaperEasy;
    }

    public GradeInfo getGrade() {
        return grade;
    }

    public void setGrade(GradeInfo grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "ExamPaperInfo{" +
                "examPaperId=" + examPaperId +
                ", examPaperName='" + examPaperName + '\'' +
                ", subjectNum=" + subjectNum +
                ", examPaperTime=" + examPaperTime +
                ", examPaperScore=" + examPaperScore +
                ", division=" + division +
                ", examPaperEasy=" + examPaperEasy +
                ", grade=" + grade +
                '}';
    }
}
