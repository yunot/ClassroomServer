package com.njupt.classroom.beans;

import com.njupt.classroom.pojo.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/1.
 */
@Data
public class WeeklyScheduleBean {
    private List<WeeklySchedule> weeklyScheduleList;
    private List<WeeklyScheduleAdd> mainList;
    private List<OpenSchedule> openList;
    private List<WeeklyScheduleAdd> otherList;
    private List<LabManagement> labList;
    private List<BaseUserInfo> teacherList;
    //周课表参数
    private List<WeeklyScheduleAdd> MonAm;//星期一上午
    private List<WeeklyScheduleAdd> MonPm;//星期一下午
    private List<WeeklyScheduleAdd> MonNt;//星期一晚上
    private List<WeeklyScheduleAdd> TuesAm;//星期二上午
    private List<WeeklyScheduleAdd> TuesPm;//星期二下午
    private List<WeeklyScheduleAdd> TuesNt;//星期二晚上
    private List<WeeklyScheduleAdd> WedAm;//星期三上午
    private List<WeeklyScheduleAdd> WedPm;//星期三下午
    private List<WeeklyScheduleAdd> WedNt;//星期三晚上
    private List<WeeklyScheduleAdd> ThursAm;//星期四上午
    private List<WeeklyScheduleAdd> ThursPm;//星期四下午
    private List<WeeklyScheduleAdd> ThursNt;//星期四晚上
    private List<WeeklyScheduleAdd> FriAm;//星期五上午
    private List<WeeklyScheduleAdd> FriPm;//星期五下午
    private List<WeeklyScheduleAdd> FriNt;//星期五晚上
    private List<WeeklyScheduleAdd> SatAm;//星期六上午
    private List<WeeklyScheduleAdd> SatPm;//星期六下午
    private List<WeeklyScheduleAdd> SatNt;//星期六晚上
    private List<WeeklyScheduleAdd> SunAm;//星期日上午
    private List<WeeklyScheduleAdd> SunPm;//星期日下午
    private List<WeeklyScheduleAdd> SunNt;//星期日晚上
    private List<LabManagement> mainLabInfo;//提供周课表预览所需参数
    private List<LabManagement> openLabInfo;//提供开放表预览所需参数
    private List<LabManagement> otherLabInfo;//提供开放表预览所需参数
    private List<CourseManagement> mainCourse;//提供主要课程信息
    private List<CourseManagement> otherCourse;//提供其他课程信息
}
