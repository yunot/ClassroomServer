package com.njupt.classroom.dao;

import com.njupt.classroom.beans.TotalScheduleQueryBean;
import com.njupt.classroom.pojo.TotalSchedule;

import java.util.Date;
import java.util.List;

public interface TotalScheduleMapper {
    int deleteByPrimaryKey(Integer key);

    int insert(TotalSchedule record);

    int insertSelective(TotalSchedule record);

    TotalSchedule selectByPrimaryKey(Integer key);

    List<TotalSchedule> selectByLabId(Integer lab_id);

    int updateByPrimaryKeySelective(TotalSchedule record);

    int updateByPrimaryKey(TotalSchedule record);

    int deleteAll();

    int insertAll(TotalSchedule record);

    int updateByWeekTimeLabId(TotalSchedule record);
    /**
    * @auther: Vic
    * @time: 2019/5/8
    *
    * @brief:   对周课表内容进行无条件更新（可置空）
    * @param: [record]
    * @return: int
    */
    int updateWeeklyScheByWeekTimeLabId(TotalSchedule record);

    List<TotalSchedule> selectAll();

    List<String> selectGroupByWeek();

    List<String> selectGroupByLabName();

    List<String> selectGroupByCourseName();

    List<String> selectGroupByClassId();

    List<String> selectGroupByTeacherName();

    /**
    * @auther: Vic
    * @time: 2019/5/9
    *
    * @brief:  动态条件查询,根据TotalSchedule中被赋值的参数查询
    * @param: [record]
    * @return: java.util.List<com.njupt.classroom.pojo.TotalSchedule>
    */
    List<TotalSchedule> selectByContext(TotalScheduleQueryBean record);

    /**
    * @auther: Vic
    * @time: 2019/5/21
    *
    * @brief: 得到有课程安排的记录
    * @param: []
    * @return: java.util.List<com.njupt.classroom.pojo.TotalSchedule>
    */
    List<TotalSchedule> selectHasWeeklySchedule();

    int selectCurrentWeekByDate(Date date);

    /**
    * @auther: Vic
    * @time: 2019/5/22
    *
    * @brief:   周数和时间段获取当前日期
    * @param: [week, time]
    * @return: java.util.Date
    */
    Date selectDateByWeekTime(TotalSchedule weekAndTime);
}