package com.njupt.classroom.impl;

import com.njupt.classroom.dao.EnvironmentInfoMapper;
import com.njupt.classroom.pojo.EnvironmentInfo;
import com.njupt.classroom.service.EnvironmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/25.
 */
@Service
public class EnvironmentServiceImpl implements EnvironmentService {
    @Resource
    private EnvironmentInfoMapper environmentInfoMapper;

    @Override
    public List<EnvironmentInfo> get60EnvInfos(Integer labId){
        return environmentInfoMapper.select60ByLabId(labId);
    }

    @Override
    public void addEnvironmentInfo(EnvironmentInfo environmentInfo) {
        environmentInfoMapper.insertSelective(environmentInfo);
    }
}
