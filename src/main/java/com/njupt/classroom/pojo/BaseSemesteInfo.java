package com.njupt.classroom.pojo;

import java.util.Date;

public class BaseSemesteInfo {
    private Integer id;

    private Date beginDate;

    private Date stopData;

    private String semesteName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBeginDate() {
        return beginDate;
    }

    public void setBeginDate(Date beginDate) {
        this.beginDate = beginDate;
    }

    public Date getStopData() {
        return stopData;
    }

    public void setStopData(Date stopData) {
        this.stopData = stopData;
    }

    public String getSemesteName() {
        return semesteName;
    }

    public void setSemesteName(String semesteName) {
        this.semesteName = semesteName == null ? null : semesteName.trim();
    }
}