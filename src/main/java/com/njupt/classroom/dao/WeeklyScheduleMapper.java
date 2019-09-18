package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.WeeklySchedule;

import java.util.List;

public interface WeeklyScheduleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WeeklySchedule record);

    int insertSelective(WeeklySchedule record);

    WeeklySchedule selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WeeklySchedule record);

    int updateByPrimaryKey(WeeklySchedule record);

    /**
    * @auther: Vic
    * @time: 2019/4/26
    *
    * @brief: 按实验室顺序获取全部信息（order by lab_id）
    * @param: []
    * @return: java.util.List<com.njupt.classroom.pojo.WeeklySchedule>
    */
    List<WeeklySchedule> selectWeeklyScheduleAll();

    List<WeeklySchedule> selectByTimeAndLabId(WeeklySchedule ws);

    List<WeeklySchedule> selectByLabId(Integer labId);

    int deleteByLabId(Integer labId);

    int insertAll(WeeklySchedule ws);

    /**
    * @auther: Vic
    * @time: 2019/4/26
    *
    * @brief: 按实验室顺序获取主课信息（order by lab_id）
    * @param: []
    * @return: java.util.List<com.njupt.classroom.pojo.WeeklySchedule>
    */
    List<WeeklySchedule> selectByCourseType1();

    List<WeeklySchedule> selectGroupByTime();

    /**
    * @auther: Vic
    * @time: 2019/5/21
    *
    * @brief:   根据星期时间周次删除批量设置的开放课程（一次开放实验所安排的实验室）
    * @param: [weeklySchedule]
    * @return: int
    */
    int deleteType2ByTimeWeek(WeeklySchedule weeklySchedule);
}