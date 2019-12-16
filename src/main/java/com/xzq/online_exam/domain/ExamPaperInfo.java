package com.xzq.online_exam.domain;

public class ExamPaperInfo {
    private Integer examPaperId;
    private String examPaperName;
    private Integer subjectNum;
    private String examPaperTime;
    private Integer examPaperScore;
    private GradeInfo gradeInfo;
    private Integer division;
    private Integer examPaperEasy;

    public ExamPaperInfo(Integer examPaperId){
        this.examPaperId=examPaperId;
    }
    public ExamPaperInfo(){}
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

    public Integer getSubjectNum() {
        return subjectNum;
    }

    public void setSubjectNum(Integer subjectNum) {
        this.subjectNum = subjectNum;
    }

    public String getExamPaperTime() {
        return examPaperTime;
    }

    public void setExamPaperTime(String examPaperTime) {
        this.examPaperTime = examPaperTime;
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
                ", examPaperTime='" + examPaperTime + '\'' +
                ", examPaperScore=" + examPaperScore +
                ", gradeInfo=" + gradeInfo +
                ", division=" + division +
                ", examPaperEasy=" + examPaperEasy +
                '}';
    }
}
