package com.xzq.online_exam.domain;

public class ESMInfo {
    private Integer esmId;
    private ExamPaperInfo examPaperInfo;
    private SubjectInfo subjectInfo;

    public Integer getEsmId() {
        return esmId;
    }

    public void setEsmId(Integer esmId) {
        this.esmId = esmId;
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

    @Override
    public String toString() {
        return "ESMInfo{" +
                "esmId=" + esmId +
                ", examPaperInfo=" + examPaperInfo +
                ", subjectInfo=" + subjectInfo +
                '}';
    }
}
