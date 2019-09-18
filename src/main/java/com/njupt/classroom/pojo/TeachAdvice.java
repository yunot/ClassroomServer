package com.njupt.classroom.pojo;

public class TeachAdvice {
    private Integer teachId;
    private String teacher_name;
    private String feedback_type;
    private String feedback;

    @Override
    public String toString() {
        return "TeachAdvice{" +
                "teachId=" + teachId +
                ", teacher_name='" + teacher_name + '\'' +
                ", feedback_type='" + feedback_type + '\'' +
                ", feedback='" + feedback + '\'' +
                '}';
    }

    public Integer getTeachId() {
        return teachId;
    }

    public void setTeachId(Integer teachId) {
        this.teachId = teachId;
    }

    public String getTeacher_name() {
        return teacher_name;
    }

    public void setTeacher_name(String teacher_name) {
        this.teacher_name = teacher_name;
    }

    public String getFeedback_type() {
        return feedback_type;
    }

    public void setFeedback_type(String feedback_type) {
        this.feedback_type = feedback_type;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
