package com.njupt.classroom.pojo;

import lombok.Data;

@Data
public class WeeklySchedule {
    private Integer id;

    private String courseId;

    private String courseType;

    private String time;//上课时间

    private String startWeeks;

    private String stopWeeks;

    private String courseName;

    private String courseTime;//学时

    private String classId;

    private String teacherId;

    private Integer labId;

    private Integer courseOrder;
}