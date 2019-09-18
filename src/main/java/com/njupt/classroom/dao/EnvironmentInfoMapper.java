package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.EnvironmentInfo;

import java.util.List;

public interface EnvironmentInfoMapper {

    int insertSelective(EnvironmentInfo record);

    List<EnvironmentInfo> select60ByLabId(Integer labId);
}