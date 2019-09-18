package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.UserAttendanceInfo;

import java.util.List;

public interface UserAttendanceInfoMapper {
    int deleteByPrimaryKey(Integer attendanceKey);

    int insert(UserAttendanceInfo record);

    int insertSelective(UserAttendanceInfo record);

    UserAttendanceInfo selectByPrimaryKey(Integer attendanceKey);

    int updateByPrimaryKeySelective(UserAttendanceInfo record);

    int updateByPrimaryKey(UserAttendanceInfo record);

    List<UserAttendanceInfo> selectByUseridOrderByTime(String user_id);

    List<UserAttendanceInfo> selectByUserIdentity(Integer userIdentity);
}