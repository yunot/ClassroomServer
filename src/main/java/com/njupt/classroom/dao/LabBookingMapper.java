package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.LabBooking;

import java.util.List;

public interface LabBookingMapper {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(LabBooking record);

    LabBooking selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LabBooking record);

    /**
     * @auther: Vic
     * @time: 2019/5/23
     *
     * @brief: 通过用户id和开放安排id查询信息
     * @param: [booking]
     * @return: com.njupt.classroom.pojo.LabBooking
     */
    LabBooking selectByUserIdOpenScheduleId(LabBooking booking);

    /**
     * @auther: Vic
     * @time: 2019/5/24
     *
     * @brief: 查询用户预约情况
     * @param: [userId]
     * @return: java.util.List<com.njupt.classroom.pojo.LabBooking>
     */
    List<LabBooking> selectByUserId(String userId);

    /**
    * @auther: Vic
    * @time: 2019/5/27
    *
    * @brief: 动态条件查询
    * @param: [booking]
    * @return: java.util.List<com.njupt.classroom.pojo.LabBooking>
    */
    List<LabBooking> selectBySelective(LabBooking booking);

}