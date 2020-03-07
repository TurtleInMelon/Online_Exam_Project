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
    private GradeInfo gradeInfo;

    public ExamPaperInfo(Integer examPaperId){
        this.examPaperId=examPaperId;
    }
    public ExamPaperInfo(){}
    public ExamPaperInfo(String Name){
        this.examPaperName=Name;
    }
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

    public void setSubjectNum(int subjectNum) {
        this.subjectNum = subjectNum;
    }

    public void setExamPaperTime(int examPaperTime) {
        this.examPaperTime = examPaperTime;
    }

    public int getExamPaperTime() {
        return examPaperTime;
    }

    public void setExamPaperScore(int examPaperScore) {
        this.examPaperScore = examPaperScore;
    }

    public void setDivision(int division) {
        this.division = division;
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
	
    public Integer getSubjectNum() {
        return subjectNum;
    }

    public void setSubjectNum(Integer subjectNum) {
        this.subjectNum = subjectNum;
    }

    public Integer getExamPaperScore() {
        return examPaperScore;
    }

    public void setExamPaperScore(Integer examPaperScore) {
        this.examPaperScore = examPaperScore;
    }

    public GradeInfo getGradeInfo() {
        return gradeInfo;
    }

    public void setGradeInfo(GradeInfo gradeInfo) {
        this.gradeInfo = gradeInfo;
    }

    public Integer getDivision() {
        return division;
    }

    public void setDivision(Integer division) {
        this.division = division;
    }

    public Integer getExamPaperEasy() {
        return examPaperEasy;
    }

    public void setExamPaperEasy(Integer examPaperEasy) {
        this.examPaperEasy = examPaperEasy;
    }

    @Override
    public String toString() {
        return "ExamPaperInfo{" +
                "examPaperId=" + examPaperId +
                ", examPaperName='" + examPaperName + '\'' +
                ", subjectNum=" + subjectNum +
                ", examPaperScore=" + examPaperScore +
                ", division=" + division +
                ", examPaperEasy=" + examPaperEasy +
                ", grade=" + grade +
                ", examPaperTime='" + examPaperTime + '\'' +
                ", gradeInfo=" + gradeInfo +
                '}';
    }
}
