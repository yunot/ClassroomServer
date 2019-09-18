package com.njupt.classroom.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class TeachingLogInfo {
    private Integer id;

    private String teacherId;

    private String teacherName;

    private String courseWeek;

    private Date courseDate;

    private String courseDayOfWeek;

    private String courseTimeOfDay;

    private String courseLabId;

    private String courseLabName;

    private String courseName;

    private String classId;

    private Integer classUserNum;

    private Integer courseClassHour;

    private String courseSafeInfo;

    private String courseEnvInfo;

    private String courseContent;

    private String remarks;

}