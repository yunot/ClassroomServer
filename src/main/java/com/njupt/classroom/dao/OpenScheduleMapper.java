package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.OpenSchedule;

import java.util.Date;
import java.util.List;

public interface OpenScheduleMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(OpenSchedule record);

    OpenSchedule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OpenSchedule record);

    List<OpenSchedule> selectAll();

    List<OpenSchedule> selectCurrentByOpenWeek(Integer currentWeek);

    List<OpenSchedule> selectCurrentByOpenDate(Date currentDate);


}