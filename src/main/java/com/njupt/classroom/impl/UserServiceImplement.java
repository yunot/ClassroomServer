package com.njupt.classroom.impl;

import com.njupt.classroom.dao.BaseUserInfoMapper;
import com.njupt.classroom.pojo.BaseUserInfo;
import com.njupt.classroom.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: TangSong
 * @Date: 2019/4/18 17:52
 * @Version 1.0
 */

@Service
public class UserServiceImplement implements UserService {

    @Resource
    BaseUserInfoMapper baseUserInfoMapper;

    @Override
    public BaseUserInfo selectByPrimaryKey(String userId) {
        return baseUserInfoMapper.selectByPrimaryKey(userId);
    }

    @Override
    public String getTeacherNameByuserId(String userId) {
        return baseUserInfoMapper.selectByPrimaryKey(userId).getUserName();
    }
}
