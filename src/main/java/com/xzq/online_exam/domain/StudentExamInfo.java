package com.xzq.online_exam.domain;

public class StudentExamInfo {
    private Integer studentId;
    private String studentName;
    private Integer examSum;
    private Integer avgScore;
    private Integer examScore;
    private String examPaperName;
    private Integer examPaperScore;

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

    public Integer getExamSum() {
        return examSum;
    }

    public void setExamSum(Integer examSum) {
        this.examSum = examSum;
    }

    public Integer getAvgScore() {
        return avgScore;
    }

    public void setAvgScore(Integer avgScore) {
        this.avgScore = avgScore;
    }

    public Integer getExamScore() {
        return examScore;
    }

    public void setExamScore(Integer examScore) {
        this.examScore = examScore;
    }

    public String getExamPaperName() {
        return examPaperName;
    }

    public void setExamPaperName(String examPaperName) {
        this.examPaperName = examPaperName;
    }

    public Integer getExamPaperScore() {
        return examPaperScore;
    }

    public void setExamPaperScore(Integer examPaperScore) {
        this.examPaperScore = examPaperScore;
    }

    @Override
    public String toString() {
        return "StudentExamInfo{" +
                "studentId=" + studentId +
                ", studentName='" + studentName + '\'' +
                ", examSum=" + examSum +
                ", avgScore=" + avgScore +
                ", examScore=" + examScore +
                ", examPaperName='" + examPaperName + '\'' +
                ", examPaperScore=" + examPaperScore +
                '}';
    }
}
