package com.njupt.classroom.service;

import com.njupt.classroom.beans.WeeklyScheduleBean;
import com.njupt.classroom.pojo.BaseUserInfo;
import com.njupt.classroom.pojo.WeeklySchedule;
import com.njupt.classroom.pojo.WeeklyScheduleAdd;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/1.
 */
public interface WeeklyScheduleService {

    WeeklyScheduleBean GetWeeklySchedule();

    WeeklyScheduleAdd GetWeeklyScheduleAddById(Integer id);

    List<BaseUserInfo> GetTeachersInfo();

    int SaveWeeklySche(WeeklySchedule weeklySchedule);

    int DeleteWeeklyScheById(Integer id);


}
