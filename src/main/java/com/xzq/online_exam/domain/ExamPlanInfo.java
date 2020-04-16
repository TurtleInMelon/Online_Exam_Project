package com.xzq.online_exam.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import net.sf.jsqlparser.expression.DateTimeLiteralExpression;

import java.util.Date;

public class ExamPlanInfo {
    private Integer examPlanId;
    private CourseInfo courseInfo;
    private ClassInfo classInfo;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date beginTime;
    private ExamPaperInfo examPaperInfo;

    public Integer getExamPlanId() {
        return examPlanId;
    }

    public void setExamPlanId(Integer examPlanId) {
        this.examPlanId = examPlanId;
    }

    public CourseInfo getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(CourseInfo courseInfo) {
        this.courseInfo = courseInfo;
    }

    public ClassInfo getClassInfo() {
        return classInfo;
    }

    public void setClassInfo(ClassInfo classInfo) {
        this.classInfo = classInfo;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public ExamPaperInfo getExamPaperInfo() {
        return examPaperInfo;
    }

    public void setExamPaperInfo(ExamPaperInfo examPaperInfo) {
        this.examPaperInfo = examPaperInfo;
    }

    @Override
    public String toString() {
        return "ExamPlanInfo{" +
                "examPlanId=" + examPlanId +
                ", courseInfo=" + courseInfo +
                ", classInfo=" + classInfo +
                ", beginTime=" + beginTime +
                ", examPaperInfo=" + examPaperInfo +
                '}';
    }
}
