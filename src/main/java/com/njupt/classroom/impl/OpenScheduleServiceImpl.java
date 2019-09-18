package com.njupt.classroom.impl;

import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.dao.LabManagementMapper;
import com.njupt.classroom.dao.OpenScheduleMapper;
import com.njupt.classroom.dao.TotalScheduleMapper;
import com.njupt.classroom.pojo.OpenSchedule;
import com.njupt.classroom.service.OpenScheduleService;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/21.
 */
@Service
public class OpenScheduleServiceImpl implements OpenScheduleService {
    @Resource
    private TotalScheduleMapper totalScheduleMapper;
    @Resource
    private OpenScheduleMapper openScheduleMapper;
    @Resource
    private LabManagementMapper labManagementMapper;

    @Override
    public OpenSchedule getOpenSchedule(Integer id){
        return openScheduleMapper.selectByPrimaryKey(id);
    }

    @Override
    public OpenLabInfoBean getOpenLabInfoBean(Integer id){
        OpenSchedule schedule = openScheduleMapper.selectByPrimaryKey(id);
        OpenLabInfoBean infoBean = new OpenLabInfoBean();
        try {
            BeanUtils.copyProperties(infoBean, schedule);
        }catch (Exception e){
            System.out.println("getOpenLabInfo: " + e.getMessage());
        }
        //计算人数
        Integer totalPeopleNum = 0;
        Integer bookingNum = 0;
        Integer notBookingNum = 0;
        //实验室总人数
        String[] labIds = schedule.getOpenLabIdOrder().split(",");
        for (int j = 0; j < labIds.length; j++){
            totalPeopleNum += labManagementMapper.selectByPrimaryKey(Integer.parseInt(labIds[j])).getTableNum();
        }
        //已经预约的人数
        String[] bookPeople = schedule.getOpenLabPeople().split(",");
        for (int j = 0; j < bookPeople.length; j++){
            bookingNum += Integer.parseInt(bookPeople[j]);
        }
        //未预约的人数
        notBookingNum = totalPeopleNum - bookingNum;
        infoBean.setTotalPeopleNum(totalPeopleNum);
        infoBean.setBookingNum(bookingNum);
        infoBean.setNotBookingNum(notBookingNum);
        return infoBean;
    }

    @Override
    public List<OpenSchedule> getCurrentOpenSchedule(Integer limit){
        List<OpenSchedule> list = openScheduleMapper.selectCurrentByOpenDate(new Date());
        if (limit > 0){
            int len = list.size();
            if(limit < len/2){
                List<OpenSchedule> listAdd = new ArrayList<>();
                for(int i = 0; i < limit; i++){
                    listAdd.add(list.get(i));
                }
                return listAdd;
            }
            else{
                for(int i = len-1; i >= limit; i--){
                    list.remove(i);
                }
                return list;
            }
        }else {
            return list;
        }
    }

    @Override
    public List<OpenLabInfoBean> getCurrentOpenLabInfo(Integer limit){
        List<OpenLabInfoBean> openLabInfoBeans = new ArrayList<>();
        List<OpenSchedule> openScheduleList = openScheduleMapper.selectCurrentByOpenDate(new Date());
        for (int i = 0; i < openScheduleList.size(); i++){
            OpenLabInfoBean bean = new OpenLabInfoBean();
            try {
                BeanUtils.copyProperties(bean, openScheduleList.get(i));
            }catch (Exception e){
                System.out.println("getOpenLabInfo: " + e.getMessage());
            }
            //计算人数
            Integer totalPeopleNum = 0;
            Integer bookingNum = 0;
            Integer notBookingNum = 0;
            //实验室总人数
            String[] labIds = openScheduleList.get(i).getOpenLabIdOrder().split(",");
            for (int j = 0; j < labIds.length; j++){
                totalPeopleNum += labManagementMapper.selectByPrimaryKey(Integer.parseInt(labIds[j])).getTableNum();
            }
            //已经预约的人数
            String[] bookPeople = openScheduleList.get(i).getOpenLabPeople().split(",");
            for (int j = 0; j < bookPeople.length; j++){
                bookingNum += Integer.parseInt(bookPeople[j]);
            }
            //未预约的人数
            notBookingNum = totalPeopleNum - bookingNum;
            bean.setTotalPeopleNum(totalPeopleNum);
            bean.setBookingNum(bookingNum);
            bean.setNotBookingNum(notBookingNum);
            openLabInfoBeans.add(bean);
        }
        //有限读取
        if (limit > 0){
            int len = openLabInfoBeans.size();
            if (limit < len/2){
                List<OpenLabInfoBean> limitBeans = new ArrayList<>();
                for (int i = 0; i < limit; i++){
                    limitBeans.add(openLabInfoBeans.get(i));
                }
                return limitBeans;
            }
            else {
                for (int i = len - 1; i >= limit; i--){
                    openLabInfoBeans.remove(i);
                }
                return openLabInfoBeans;
            }
        }
        else return openLabInfoBeans;
    }

}
