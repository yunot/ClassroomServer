package com.njupt.classroom.impl;

import com.njupt.classroom.dao.LabManagementMapper;
import com.njupt.classroom.pojo.LabManagement;
import com.njupt.classroom.service.LabManagementService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/27.
 */
@Service
public class LabManagementServiceImpl implements LabManagementService {
    @Resource
    private LabManagementMapper labManagementMapper;

    @Override
    public List<LabManagement> GetLabInfo(){
        return labManagementMapper.selectAll();
    }

    @Override
    public LabManagement selectLabInfoByLabId(Integer labId){
        return labManagementMapper.selectByPrimaryKey(labId);
    }

    @Override
    public int UpdateLabInfo(LabManagement labManagement){
        return labManagementMapper.updateByPrimaryKey(labManagement);
    }
}
