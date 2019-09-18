package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.BaseSemesteInfo;

public interface BaseSemesteInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BaseSemesteInfo record);

    int insertSelective(BaseSemesteInfo record);

    BaseSemesteInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BaseSemesteInfo record);

    int updateByPrimaryKey(BaseSemesteInfo record);
}