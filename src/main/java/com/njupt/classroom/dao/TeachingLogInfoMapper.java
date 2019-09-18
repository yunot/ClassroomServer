package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.TeachingLogInfo;

import java.util.List;

public interface TeachingLogInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeachingLogInfo record);

    int insertSelective(TeachingLogInfo record);

    TeachingLogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeachingLogInfo record);

    int updateByPrimaryKey(TeachingLogInfo record);

    List<TeachingLogInfo> selectAll();
}