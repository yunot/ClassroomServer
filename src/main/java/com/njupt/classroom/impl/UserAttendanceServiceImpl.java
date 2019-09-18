package com.njupt.classroom.impl;

import com.njupt.classroom.dao.UserAttendanceInfoMapper;
import com.njupt.classroom.pojo.UserAttendanceInfo;
import com.njupt.classroom.service.UserAttendanceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/26.
 */
@Service
public class UserAttendanceServiceImpl implements UserAttendanceService {
    @Resource
    private UserAttendanceInfoMapper userAttendanceInfoMapper;

    @Override
    public List<UserAttendanceInfo> getStudentAttendanceInfo(){
        return userAttendanceInfoMapper.selectByUserIdentity(2);
    }

    @Override
    public List<UserAttendanceInfo> getTeacherAttendanceInfo(){
        return userAttendanceInfoMapper.selectByUserIdentity(1);
    }
}
