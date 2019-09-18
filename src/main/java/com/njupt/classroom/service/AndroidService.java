package com.njupt.classroom.service;

import com.njupt.classroom.pojo.*;

/**
 * Created by Vic_Hoo on 2019/4/19.
 */
public interface AndroidService {

    BaseUserInfo CheckCardId(String RFID);

    TotalSchedule getCurrentCourseByLabId(int LabId);

    BaseSemesteInfo getBaseSemesteInfo();

    int addUserAttendanceInfo(UserAttendanceInfo userAttendanceInfo);

    boolean isDuplicateAttendance(String user_id);

    void addReportRepairInfo(ReportRepairInfo reportRepairInfo);

    void addTeachingLogInfo(TeachingLogInfo teachingLogInfo);

    LabManagement getLabInfoById(int LabId);
}
