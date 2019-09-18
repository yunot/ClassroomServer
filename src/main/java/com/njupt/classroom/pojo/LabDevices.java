package com.njupt.classroom.pojo;

public class LabDevices {
    private Integer id;

    private Integer labId;

    private String labName;

    private String deviceName;

    private String deviceJsonInfo;

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

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName == null ? null : deviceName.trim();
    }

    public String getDeviceJsonInfo() {
        return deviceJsonInfo;
    }

    public void setDeviceJsonInfo(String deviceJsonInfo) {
        this.deviceJsonInfo = deviceJsonInfo == null ? null : deviceJsonInfo.trim();
    }
}