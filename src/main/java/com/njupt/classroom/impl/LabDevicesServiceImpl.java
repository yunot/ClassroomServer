package com.njupt.classroom.impl;

import com.njupt.classroom.dao.LabDevicesMapper;
import com.njupt.classroom.pojo.LabDevices;
import com.njupt.classroom.service.LabDevicesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/20.
 */
@Service
public class LabDevicesServiceImpl implements LabDevicesService {
    @Resource
    private LabDevicesMapper labDevicesMapper;

    @Override
    public List<LabDevices> getLabDevices(Integer labId){
        return labDevicesMapper.selectDeviceNameByLabId(labId);
    }

    @Override
    public LabDevices getLabDeviceInfo(Integer id){
        return labDevicesMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateDeviceInfo(LabDevices labDevices){
        return labDevicesMapper.updateByPrimaryKeySelective(labDevices);
    }

    @Override
    public int addDeviceInfo(LabDevices labDevices){
        return labDevicesMapper.insertSelective(labDevices);
    }

    @Override
    public int deleteDevice(Integer id){
        return labDevicesMapper.deleteByPrimaryKey(id);
    }
}
