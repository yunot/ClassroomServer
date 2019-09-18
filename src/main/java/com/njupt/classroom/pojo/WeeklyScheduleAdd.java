package com.njupt.classroom.pojo;

/**
 * Created by Vic_Hoo on 2019/4/24.
 */
public class WeeklyScheduleAdd extends WeeklySchedule{
    private String labName;

    private String teacherName;

    public void setLabName(String labName){
        this.labName = labName;
    }

    public String getLabName(){
        return this.labName;
    }

    public void setTeacherName(String teacherName){
        this.teacherName = teacherName;
    }

    public String getTeacherName(){
        return this.teacherName;
    }


}
