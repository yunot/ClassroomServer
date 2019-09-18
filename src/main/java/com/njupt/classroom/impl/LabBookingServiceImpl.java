package com.njupt.classroom.impl;

import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.controllers.AndroidController;
import com.njupt.classroom.dao.LabBookingMapper;
import com.njupt.classroom.dao.LabManagementMapper;
import com.njupt.classroom.dao.OpenScheduleMapper;
import com.njupt.classroom.dao.TotalScheduleMapper;
import com.njupt.classroom.pojo.LabBooking;
import com.njupt.classroom.pojo.LabManagement;
import com.njupt.classroom.pojo.OpenSchedule;
import com.njupt.classroom.service.LabBookingService;
import com.njupt.classroom.utils.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by Vic_Hoo on 2019/5/21.
 */
@Service
public class LabBookingServiceImpl implements LabBookingService {
    @Resource
    private OpenScheduleMapper openScheduleMapper;
    @Resource
    private LabBookingMapper labBookingMapper;
    @Resource
    private LabManagementMapper labManagementMapper;

    private Logger log = Logger.getLogger(LabBookingServiceImpl.class.getName());

    @Override
    public boolean isBookingRepeated(LabBooking booking) {
        LabBooking isRepeated = labBookingMapper.selectByUserIdOpenScheduleId(booking);
        if (isRepeated != null) return true;
        return false;
    }

    @Override
    public LabBooking LabBookingByWeb(LabBooking booking) {
        LabBooking bookingRespond = new LabBooking();
        Integer openLabScheduleId = booking.getOpenScheduleId();
        OpenSchedule schedule = openScheduleMapper.selectByPrimaryKey(openLabScheduleId);
        try {
            BeanUtils.copyProperties(bookingRespond, booking);
        } catch (Exception e) {
            System.out.println("LabBookingByWeb:" + e.getMessage());
        }
        //获取当前实验室的预约状况
        String[] labIds = schedule.getOpenLabIdOrder().split(",");
        String[] labOrders = schedule.getOpenLabOrder().split(",");
        String[] labPeople = schedule.getOpenLabPeople().split(",");
        Integer bookLabId = 0;
        String bookLabName = "";
        Integer bookTableNum = 0;
        int index;
        //按照实验室开放顺序进行
        for (index = 0; index < labOrders.length; index++) {
            Integer labId = Integer.parseInt(labOrders[index]);//得到顺序对应的实验室编号
            LabManagement labInfo = labManagementMapper.selectByPrimaryKey(labId);
            Integer labTableNum = labInfo.getTableNum();//课桌总数
            //当前人数
            Integer bookPeople = Integer.parseInt(labPeople[index]);
            if (bookPeople < labTableNum) {
                //可以预约
                bookLabId = labId;
                bookLabName = labInfo.getLabName();
                bookTableNum = bookPeople + 1;
                break;
            } else {
                //当前实验室已经满了
                continue;//下一间实验室
            }
        }
        if (bookTableNum == 0) {
            //预约满了
            bookingRespond.setIsBookValued(false);
        } else {
            //添加预约记录
            bookingRespond.setBookLabId(bookLabId);
            bookingRespond.setBookLabName(bookLabName);
            bookingRespond.setBookTableId(bookTableNum);
            bookingRespond.setIsBookValued(true);
            labBookingMapper.insertSelective(bookingRespond);
            //修改预约信息
            OpenSchedule update = new OpenSchedule();
            update.setId(schedule.getId());
            labPeople[index] = Integer.toString(bookTableNum);
            String updatePeople = "";
            for (int i = 0; i < labPeople.length; i++) {
                updatePeople += labPeople[i] + ",";
            }
            update.setOpenLabPeople(StringUtils.removeEndChar(updatePeople, ','));
            openScheduleMapper.updateByPrimaryKeySelective(update);
        }
        return bookingRespond;
    }

    @Override
    public List<LabBooking> getUserBookingHistory(String userId, Integer limit) {
        List<LabBooking> listAll = labBookingMapper.selectByUserId(userId);
        if (limit > 0) {
            int len = listAll.size();
            if (limit > len / 2) {
                for (int i = len - 1; i >= limit; i++) {
                    listAll.remove(i);
                }
                return listAll;
            } else {
                List<LabBooking> list = new ArrayList<>();
                for (int i = 0; i < limit; i++) {
                    list.add(listAll.get(i));
                }
                return list;
            }
        } else return listAll;
    }

    @Override
    public LabBooking getHistory(LabBooking booking) {
        int i = labBookingMapper.selectBySelective(booking).size();
        log.info(Integer.toString(i));
        if (i > 0)
            return labBookingMapper.selectBySelective(booking).get(0);
        return null;
    }

    @Override
    public LabBooking updateBookingInfo(LabBooking labBooking) {
        labBookingMapper.updateByPrimaryKeySelective(labBooking);
        return labBookingMapper.selectByPrimaryKey(labBooking.getId());
    }
}
