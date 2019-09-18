package com.njupt.classroom.impl;

import com.njupt.classroom.dao.ReportRepairInfoMapper;
import com.njupt.classroom.pojo.ReportRepairInfo;
import com.njupt.classroom.service.ReportRepairService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/15.
 */
@Service
public class ReportRepairServiceImpl implements ReportRepairService {
    @Resource
    private ReportRepairInfoMapper reportRepairInfoMapper;

    @Override
    public List<ReportRepairInfo> getReportRepairInfoAll(){
        return reportRepairInfoMapper.selectAll();
    }

    @Override
    public ReportRepairInfo getReportRepairInfo(Integer id){
        return reportRepairInfoMapper.selectByPrimaryKey(id);
    }

    @Override
    public int repairHandle(ReportRepairInfo repairInfo){
        return reportRepairInfoMapper.updateByPrimaryKeySelective(repairInfo);
    }
}
