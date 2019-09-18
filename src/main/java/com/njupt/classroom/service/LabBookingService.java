package com.njupt.classroom.service;

import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.pojo.LabBooking;

import java.util.Date;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/21.
 */
public interface LabBookingService {

    /**
    * @auther: Vic
    * @time: 2019/5/23
    *
    * @brief:   判断是否重复预约
    * @param: [booking]
    * @return: com.njupt.classroom.pojo.LabBooking
    */
    boolean isBookingRepeated(LabBooking booking);

    /**
    * @auther: Vic
    * @time: 2019/5/23
    *
    * @brief: 通过浏览器前端预约，返回预约情况
    * @param: [booking]
    * @return: int
    */
    LabBooking LabBookingByWeb(LabBooking booking);

    /**
    * @auther: Vic
    * @time: 2019/5/24
    *
    * @brief:   获取用户预约记录
    * @param: [userId, limit] limit:0 全部记录；limit>0有限记录
    * @return: java.util.List<com.njupt.classroom.pojo.LabBooking>
    */
    List<LabBooking> getUserBookingHistory(String userId, Integer limit);

    /**
    * @auther: Vic
    * @time: 2019/5/24
    *
    * @brief: gets a history by userId and openScheduleId
    * @param: [booking]
    * @return: com.njupt.classroom.pojo.LabBooking
    */
    LabBooking getHistory(LabBooking booking);

    /**
    * 更新预约信息
    * */
    LabBooking updateBookingInfo(LabBooking labBooking);
}
