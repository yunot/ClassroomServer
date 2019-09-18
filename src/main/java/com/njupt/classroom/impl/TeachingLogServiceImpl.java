package com.njupt.classroom.impl;

import com.njupt.classroom.dao.TeachingLogInfoMapper;
import com.njupt.classroom.pojo.TeachingLogInfo;
import com.njupt.classroom.service.TeachingLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/13.
 */
@Service
public class TeachingLogServiceImpl implements TeachingLogService {
    @Resource
    private TeachingLogInfoMapper teachingLogInfoMapper;

    @Override
    public List<TeachingLogInfo> getTeachingLogInfo(){
        return teachingLogInfoMapper.selectAll();
    }

    @Override
    public TeachingLogInfo getTeachingLogInfoById(Integer id){
        return teachingLogInfoMapper.selectByPrimaryKey(id);
    }
}
