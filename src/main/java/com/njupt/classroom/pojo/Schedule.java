package com.njupt.classroom.pojo;


public class Schedule {

    private Integer id;
    private String headName;
    private String amCourse;
    private String pmCourse;
    private String ntCourse;
    private String amTime;
    private String pmTime;
    private String ntTime;

    @Override
    public String toString() {
        return "Schedule{" +
                "id=" + id +
                ", headName='" + headName + '\'' +
                ", amCourse='" + amCourse + '\'' +
                ", pmCourse='" + pmCourse + '\'' +
                ", ntCourse='" + ntCourse + '\'' +
                ", amTime='" + amTime + '\'' +
                ", pmTime='" + pmTime + '\'' +
                ", ntTime='" + ntTime + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHeadName() {
        return headName;
    }

    public void setHeadName(String headName) {
        this.headName = headName;
    }

    public String getAmCourse() {
        return amCourse;
    }

    public void setAmCourse(String amCourse) {
        this.amCourse = amCourse;
    }

    public String getPmCourse() {
        return pmCourse;
    }

    public void setPmCourse(String pmCourse) {
        this.pmCourse = pmCourse;
    }

    public String getNtCourse() {
        return ntCourse;
    }

    public void setNtCourse(String ntCourse) {
        this.ntCourse = ntCourse;
    }

    public String getAmTime() {
        return amTime;
    }

    public void setAmTime(String amTime) {
        this.amTime = amTime;
    }

    public String getPmTime() {
        return pmTime;
    }

    public void setPmTime(String pmTime) {
        this.pmTime = pmTime;
    }

    public String getNtTime() {
        return ntTime;
    }

    public void setNtTime(String ntTime) {
        this.ntTime = ntTime;
    }
}
