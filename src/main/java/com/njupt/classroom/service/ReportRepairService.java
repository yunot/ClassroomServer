package com.njupt.classroom.service;

import com.njupt.classroom.pojo.ReportRepairInfo;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/15.
 */
public interface ReportRepairService {

    List<ReportRepairInfo> getReportRepairInfoAll();

    ReportRepairInfo getReportRepairInfo(Integer id);

    int repairHandle(ReportRepairInfo repairInfo);
}
