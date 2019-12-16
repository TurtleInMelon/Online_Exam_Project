package com.xzq.online_exam.domain;

public class ExamHistoryInfo {
    private Integer historyId;
    private StudentInfo studentInfo;
    private ExamPaperInfo examPaperInfo;
    private Integer examScore;

    public Integer getHistoryId() {
        return historyId;
    }

    public void setHistoryId(Integer historyId) {
        this.historyId = historyId;
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

    public Integer getExamScore() {
        return examScore;
    }

    public void setExamScore(Integer examScore) {
        this.examScore = examScore;
    }

    @Override
    public String toString() {
        return "ExamHistoryInfo{" +
                "historyId=" + historyId +
                ", studentInfo=" + studentInfo +
                ", examPaperInfo=" + examPaperInfo +
                ", examScore=" + examScore +
                '}';
    }
}
