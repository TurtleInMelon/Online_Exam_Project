package com.xzq.online_exam.utils;

public class HomeInfo {

    private int examPaperTotal;
    private int subjectTotal ;
    private int teacherTotal ;
    private int studentTotal ;

    @Override
    public String toString() {
        return "HomeInfo{" +
                "examPaperTotal=" + examPaperTotal +
                ", subjectTotal=" + subjectTotal +
                ", teacherTotal=" + teacherTotal +
                ", studentTotal=" + studentTotal +
                '}';
    }

    public int getExamPaperTotal() {
        return examPaperTotal;
    }

    public void setExamPaperTotal(int examPaperTotal) {
        this.examPaperTotal = examPaperTotal;
    }

    public int getSubjectTotal() {
        return subjectTotal;
    }

    public void setSubjectTotal(int subjectTotal) {
        this.subjectTotal = subjectTotal;
    }

    public int getTeacherTotal() {
        return teacherTotal;
    }

    public void setTeacherTotal(int teacherTotal) {
        this.teacherTotal = teacherTotal;
    }

    public int getStudentTotal() {
        return studentTotal;
    }

    public void setStudentTotal(int studentTotal) {
        this.studentTotal = studentTotal;
    }
}
