package com.njupt.classroom.pojo;

import lombok.Data;
import org.apache.ibatis.type.IntegerTypeHandler;

@Data
public class CourseManagement {
    private Integer id;

    private String courseType;

    private String courseName;

    private Integer courseTime;

    private String courseId;

    private String startWeeks;

    private String stopWeeks;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType == null ? null : courseType.trim();
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName == null ? null : courseName.trim();
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId == null ? null : courseId.trim();
    }

    public String getStartWeeks() {
        return startWeeks;
    }

    public void setStartWeeks(String startWeeks) {
        this.startWeeks = startWeeks == null ? null : startWeeks.trim();
    }

    public String getStopWeeks() {
        return stopWeeks;
    }

    public void setStopWeeks(String stopWeeks) {
        this.stopWeeks = stopWeeks == null ? null : stopWeeks.trim();
    }
}