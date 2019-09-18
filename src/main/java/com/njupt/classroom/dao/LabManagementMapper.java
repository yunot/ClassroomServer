package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.LabManagement;

import java.util.List;

public interface LabManagementMapper {
    int deleteByPrimaryKey(Integer labId);

    int insert(LabManagement record);

    int insertSelective(LabManagement record);

    LabManagement selectByPrimaryKey(Integer labId);

    int updateByPrimaryKeySelective(LabManagement record);

    int updateByPrimaryKey(LabManagement record);

    List<LabManagement> selectAll();
}