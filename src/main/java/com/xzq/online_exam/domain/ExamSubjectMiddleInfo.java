package com.xzq.online_exam.domain;

import java.io.Serializable;

public class ExamSubjectMiddleInfo implements Serializable {
    private Integer esmId;
    private ExamPaperInfo examPaper;
    private SubjectInfo subject;

    public Integer getEsmId() {
        return esmId;
    }

    public void setEsmId(Integer esmId) {
        this.esmId = esmId;
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

    @Override
    public String toString() {
        return "ExamSubjectMiddleInfo{" +
                "esmId=" + esmId +
                ", examPaper=" + examPaper +
                ", subject=" + subject +
                '}';
    }
}
