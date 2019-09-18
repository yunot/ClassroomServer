package com.njupt.classroom.beans;

import lombok.Data;

/**
 * Created by Vic_Hoo on 2019/5/9.
 */
@Data
public class TotalScheduleQueryBean {
    private String year;
    private String month;
    private String day;
    private String date;
    private String week;
    private String dayOfWeek;
    private String timeOfDay;
    private String time;
    private String labName;
    private String courseType;
    private String courseName;
    private String classId;
    private String teacherName;
}
