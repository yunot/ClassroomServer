package com.njupt.classroom.service;

import com.njupt.classroom.pojo.BaseUserInfo;

/**
 * @Author: TangSong
 * @Date: 2019/4/18 17:51
 * @Version 1.0
 */
public interface UserService {
    BaseUserInfo selectByPrimaryKey(String userId);

    String getTeacherNameByuserId(String userId);
}
