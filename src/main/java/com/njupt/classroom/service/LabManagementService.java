package com.njupt.classroom.service;

import com.njupt.classroom.pojo.LabManagement;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/27.
 */
public interface LabManagementService {

    public List<LabManagement> GetLabInfo();

    LabManagement selectLabInfoByLabId(Integer labId);

    int UpdateLabInfo(LabManagement labManagement);
}
