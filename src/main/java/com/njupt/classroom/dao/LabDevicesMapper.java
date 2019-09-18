package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.LabDevices;

import java.util.List;

public interface LabDevicesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LabDevices record);

    int insertSelective(LabDevices record);

    LabDevices selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LabDevices record);

    int updateByPrimaryKey(LabDevices record);

    List<LabDevices> selectDeviceNameByLabId(Integer labId);
}