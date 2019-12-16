package com.xzq.online_exam.domain;

public class SubjectInfo {
    private Integer subjectId;
    private String subjectName;
    private String optionA;
    private String optionB;
    private String optionC;
    private String optionD;
    private String rightResult;
    private Integer subjectScore;
    private Integer subjectType;
    private CourseInfo course;
    private GradeInfo grade;
    private Integer subjectEasy;
    private Integer division;

    public SubjectInfo (Integer subjectId){
        this.subjectId=subjectId;
    }
    public SubjectInfo(){}
    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getOptionA() {
        return optionA;
    }

    public void setOptionA(String optionA) {
        this.optionA = optionA;
    }

    public String getOptionB() {
        return optionB;
    }

    public void setOptionB(String optionB) {
        this.optionB = optionB;
    }

    public String getOptionC() {
        return optionC;
    }

    public void setOptionC(String optionC) {
        this.optionC = optionC;
    }

    public String getOptionD() {
        return optionD;
    }

    public void setOptionD(String optionD) {
        this.optionD = optionD;
    }

    public String getRightResult() {
        return rightResult;
    }

    public void setRightResult(String rightResult) {
        this.rightResult = rightResult;
    }

    public Integer getSubjectScore() {
        return subjectScore;
    }

    public void setSubjectScore(Integer subjectScore) {
        this.subjectScore = subjectScore;
    }

    public Integer getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(Integer subjectType) {
        this.subjectType = subjectType;
    }

    public CourseInfo getCourse() {
        return course;
    }

    public void setCourse(CourseInfo course) {
        this.course = course;
    }

    public GradeInfo getGrade() {
        return grade;
    }

    public void setGrade(GradeInfo grade) {
        this.grade = grade;
    }

    public Integer getSubjectEasy() {
        return subjectEasy;
    }

    public void setSubjectEasy(Integer subjectEasy) {
        this.subjectEasy = subjectEasy;
    }

    public Integer getDivision() {
        return division;
    }

    public void setDivision(Integer division) {
        this.division = division;
    }

    @Override
    public String toString() {
        return "SubjectInfo{" +
                "subjectId=" + subjectId +
                ", subjectName='" + subjectName + '\'' +
                ", optionA='" + optionA + '\'' +
                ", optionB='" + optionB + '\'' +
                ", optionC='" + optionC + '\'' +
                ", optionD='" + optionD + '\'' +
                ", rightResult='" + rightResult + '\'' +
                ", subjectScore=" + subjectScore +
                ", subjectType=" + subjectType +
                ", course=" + course +
                ", grade=" + grade +
                ", subjectEasy=" + subjectEasy +
                ", division=" + division +
                '}';
    }
}
