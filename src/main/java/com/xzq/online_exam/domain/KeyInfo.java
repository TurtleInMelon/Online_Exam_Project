package com.xzq.online_exam.domain;

public class KeyInfo {
    private Integer keyId;
    private String keyName;
    private CourseInfo courseInfo;
    private Integer priority;

    public Integer getKeyId() {
        return keyId;
    }

    public void setKeyId(Integer keyId) {
        this.keyId = keyId;
    }

    public String getKeyName() {
        return keyName;
    }

    public void setKeyName(String keyName) {
        this.keyName = keyName;
    }

    public CourseInfo getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(CourseInfo courseInfo) {
        this.courseInfo = courseInfo;
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    @Override
    public String toString() {
        return "KeyInfo{" +
                "keyId=" + keyId +
                ", keyName='" + keyName + '\'' +
                ", courseInfo=" + courseInfo +
                ", priority=" + priority +
                '}';
    }
}
