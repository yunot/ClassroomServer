package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.ReportRepairInfo;

import java.util.List;

public interface ReportRepairInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReportRepairInfo record);

    int insertSelective(ReportRepairInfo record);

    ReportRepairInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReportRepairInfo record);

    int updateByPrimaryKey(ReportRepairInfo record);

    List<ReportRepairInfo> selectAll();
}