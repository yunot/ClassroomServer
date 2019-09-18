package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.BaseUserInfo;

import java.util.List;

public interface BaseUserInfoMapper {
    int deleteByPrimaryKey(String userId);

    int insert(BaseUserInfo record);

    int insertSelective(BaseUserInfo record);

    BaseUserInfo selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(BaseUserInfo record);

    int updateByPrimaryKey(BaseUserInfo record);

    BaseUserInfo selectByCardId(String RFID);

    BaseUserInfo selectByTeacherId(String teacherId);

    List<BaseUserInfo> selectTeacherInfo();
}