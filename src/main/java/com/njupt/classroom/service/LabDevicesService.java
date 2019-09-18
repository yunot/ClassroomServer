package com.njupt.classroom.service;

import com.njupt.classroom.pojo.LabDevices;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/20.
 */
public interface LabDevicesService {

    List<LabDevices> getLabDevices(Integer labId);

    LabDevices getLabDeviceInfo(Integer id);

    int updateDeviceInfo(LabDevices labDevices);

    int addDeviceInfo(LabDevices labDevices);

    int deleteDevice(Integer id);
}
