package com.njupt.classroom.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserAttendanceInfo {
    private Integer attendanceKey;

    private String userId;

    private Integer userIdentity;

    private Integer labId;

    private String className;

    private Date attendanceTime;

    private String attendanceWeek;

    private String attendanceType;

    private String classId;

    private String userName;

    public Integer getAttendanceKey() {
        return attendanceKey;
    }

    public void setAttendanceKey(Integer attendanceKey) {
        this.attendanceKey = attendanceKey;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getLabId() {
        return labId;
    }

    public void setLabId(Integer labId) {
        this.labId = labId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className == null ? null : className.trim();
    }

    public Date getAttendanceTime() {
        return attendanceTime;
    }

    public void setAttendanceTime(Date attendanceTime) {
        this.attendanceTime = attendanceTime;
    }

    public String getAttendanceWeek() {
        return attendanceWeek;
    }

    public void setAttendanceWeek(String attendanceWeek) {
        this.attendanceWeek = attendanceWeek == null ? null : attendanceWeek.trim();
    }

    public String getAttendanceType() {
        return attendanceType;
    }

    public void setAttendanceType(String attendanceType) {
        this.attendanceType = attendanceType == null ? null : attendanceType.trim();
    }

    public String getClassId() {
        return classId;
    }

    public void setClassId(String classId) {
        this.classId = classId == null ? null : classId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }
}