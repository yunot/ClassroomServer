package com.njupt.classroom.impl;

import com.njupt.classroom.dao.*;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.AndroidService;
import com.njupt.classroom.utils.TimeUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

/**
 * Created by Vic_Hoo on 2019/4/19.
 */
@Service
public class AndroidServiceImplement implements AndroidService {
    @Resource
    private BaseUserInfoMapper baseUserInfoMapper;
    @Resource
    private TotalScheduleMapper totalScheduleMapper;
    @Resource
    private BaseSemesteInfoMapper baseSemesteInfoMapper;
    @Resource
    private UserAttendanceInfoMapper userAttendanceInfoMapper;
    @Resource
    private ReportRepairInfoMapper reportRepairInfoMapper;
    @Resource
    private TeachingLogInfoMapper teachingLogInfoMapper;
    @Resource
    private LabManagementMapper labManagementMapper;

    private java.util.logging.Logger log = Logger.getLogger(AndroidServiceImplement.class.getName());

    @Override
    public BaseUserInfo CheckCardId(String RFID) {
        BaseUserInfo baseUserInfo = baseUserInfoMapper.selectByCardId(RFID);
        if(baseUserInfo == null) return null;
        return baseUserInfo;
    }

    /*
     * 获取当前实验室的课程
     * */
    @Override
    public TotalSchedule getCurrentCourseByLabId(int LabId) {
        Date date = new Date();
        SimpleDateFormat df_week = new SimpleDateFormat("EEEE");
        SimpleDateFormat df_date = new SimpleDateFormat("yyyy-MM-dd");
        TimeUtil timeUtil = new TimeUtil();
        String courseWeek = timeUtil.DayOfWeekEN2CH(df_week.format(date));
        String courseDate = df_date.format(date);
        String timeOfDay = timeUtil.TimeOfDay();
        List<TotalSchedule> allInfo = totalScheduleMapper.selectByLabId(LabId);
        for (TotalSchedule totalSchedule : allInfo) {
            if (totalSchedule.getTime().equals(courseWeek + timeOfDay) &&
                    (df_date.format(totalSchedule.getDate()).equals(courseDate)))
                return totalSchedule;
        }
        return null;
    }

    /*
     * 获取当前学期的信息，包括开学日期，结束日期，学期名字
     * */
    @Override
    public BaseSemesteInfo getBaseSemesteInfo() {
        return baseSemesteInfoMapper.selectByPrimaryKey(1);
    }

    /*
     * 考勤记录入库
     * */
    @Override
    public int addUserAttendanceInfo(UserAttendanceInfo userAttendanceInfo) {
        return userAttendanceInfoMapper.insert(userAttendanceInfo);
    }

    /*
     * 判断是否重复刷卡
     * */
    @Override
    public boolean isDuplicateAttendance(String user_id) {
        List<UserAttendanceInfo> list = userAttendanceInfoMapper.selectByUseridOrderByTime(user_id);
        Date now = new Date();
        if (list.size() > 0) {
            if (now.getTime() - list.get(0).getAttendanceTime().getTime() < (235 * 60 * 1000)) {
                return true;
            }
        }
        return false;
    }

    /*
     * 报修日志入库
     *
     * */
    @Override
    public void addReportRepairInfo(ReportRepairInfo reportRepairInfo) {
        reportRepairInfoMapper.insertSelective(reportRepairInfo);
    }

    /*
     * 教学日志入库
     * */
    @Override
    public void addTeachingLogInfo(TeachingLogInfo teachingLogInfo) {
        teachingLogInfoMapper.insertSelective(teachingLogInfo);
    }

    @Override
    public LabManagement getLabInfoById(int LabId) {
        return labManagementMapper.selectByPrimaryKey(LabId);
    }


}
