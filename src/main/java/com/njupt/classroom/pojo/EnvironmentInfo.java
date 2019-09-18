package com.njupt.classroom.pojo;

import java.util.Date;

public class EnvironmentInfo {
    private Integer id;

    private Integer labId;

    private String labName;

    private String envTemp;

    private String envHumi;

    private String envVoc;

    private Boolean envWater;

    private Boolean envPower;

    private Boolean envVtd;

    private Boolean envFrontDoor;

    private Boolean envBackDoor;

    private Boolean envWin1;

    private Boolean envWin2;

    private Boolean envWin3;

    private Boolean envWin4;

    private Date envInfoTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLabId() {
        return labId;
    }

    public void setLabId(Integer labId) {
        this.labId = labId;
    }

    public String getLabName() {
        return labName;
    }

    public void setLabName(String labName) {
        this.labName = labName == null ? null : labName.trim();
    }

    public String getEnvTemp() {
        return envTemp;
    }

    public void setEnvTemp(String envTemp) {
        this.envTemp = envTemp == null ? null : envTemp.trim();
    }

    public String getEnvHumi() {
        return envHumi;
    }

    public void setEnvHumi(String envHumi) {
        this.envHumi = envHumi == null ? null : envHumi.trim();
    }

    public String getEnvVoc() {
        return envVoc;
    }

    public void setEnvVoc(String envVoc) {
        this.envVoc = envVoc == null ? null : envVoc.trim();
    }

    public Boolean getEnvWater() {
        return envWater;
    }

    public void setEnvWater(Boolean envWater) {
        this.envWater = envWater;
    }

    public Boolean getEnvPower() {
        return envPower;
    }

    public void setEnvPower(Boolean envPower) {
        this.envPower = envPower;
    }

    public Boolean getEnvVtd() {
        return envVtd;
    }

    public void setEnvVtd(Boolean envVtd) {
        this.envVtd = envVtd;
    }

    public Boolean getEnvFrontDoor() {
        return envFrontDoor;
    }

    public void setEnvFrontDoor(Boolean envFrontDoor) {
        this.envFrontDoor = envFrontDoor;
    }

    public Boolean getEnvBackDoor() {
        return envBackDoor;
    }

    public void setEnvBackDoor(Boolean envBackDoor) {
        this.envBackDoor = envBackDoor;
    }

    public Boolean getEnvWin1() {
        return envWin1;
    }

    public void setEnvWin1(Boolean envWin1) {
        this.envWin1 = envWin1;
    }

    public Boolean getEnvWin2() {
        return envWin2;
    }

    public void setEnvWin2(Boolean envWin2) {
        this.envWin2 = envWin2;
    }

    public Boolean getEnvWin3() {
        return envWin3;
    }

    public void setEnvWin3(Boolean envWin3) {
        this.envWin3 = envWin3;
    }

    public Boolean getEnvWin4() {
        return envWin4;
    }

    public void setEnvWin4(Boolean envWin4) {
        this.envWin4 = envWin4;
    }

    public Date getEnvInfoTime() {
        return envInfoTime;
    }

    public void setEnvInfoTime(Date envInfoTime) {
        this.envInfoTime = envInfoTime;
    }
}