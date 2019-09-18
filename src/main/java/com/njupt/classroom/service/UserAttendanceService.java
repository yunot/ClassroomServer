package com.njupt.classroom.service;

import com.njupt.classroom.pojo.UserAttendanceInfo;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/26.
 */
public interface UserAttendanceService {

    List<UserAttendanceInfo> getStudentAttendanceInfo();

    List<UserAttendanceInfo> getTeacherAttendanceInfo();
}
