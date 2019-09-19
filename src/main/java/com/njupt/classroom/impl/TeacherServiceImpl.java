package com.njupt.classroom.impl;

import com.alibaba.fastjson.JSONObject;
import com.njupt.classroom.dao.BaseUserInfoMapper;
import com.njupt.classroom.dao.LabManagementMapper;
import com.njupt.classroom.dao.TeachAdviceMapper;
import com.njupt.classroom.dao.WeeklyScheduleMapper;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.TeacherService;
import com.njupt.classroom.utils.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/1.
 */
@Service
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private WeeklyScheduleMapper weeklyScheduleMapper;
    @Resource
    private BaseUserInfoMapper baseUserInfoMapper;
    @Resource
    private LabManagementMapper labManagementMapper;
    @Autowired
    private TeachAdviceMapper teachAdviceMapper;

    @Override
    public List<TeachAdvice> findAll() {
        return teachAdviceMapper.findAll();
    }

    @Override
    public void subAdvice(TeachAdvice advice) {
        teachAdviceMapper.subAdvice(advice);
    }

    @Override
    public List<Semester> getCalendarById(String userId) {
        return teachAdviceMapper.getCalendarById(userId);
    }

    @Override
    public void saveSemesterInfo(Semester semester) {
        teachAdviceMapper.saveSemesterInfo(semester);
    }

    @Override
    public void saveNote(Note note) {
        teachAdviceMapper.saveNote(note);
    }

    @Override
    public List<Note> getNoteInfoById(String userId) {
        return teachAdviceMapper.getNoteInfoById(userId);
    }
}
