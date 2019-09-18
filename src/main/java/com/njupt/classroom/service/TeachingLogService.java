package com.njupt.classroom.service;

import com.njupt.classroom.pojo.TeachingLogInfo;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/13.
 */
public interface TeachingLogService {

    List<TeachingLogInfo> getTeachingLogInfo();

    TeachingLogInfo getTeachingLogInfoById(Integer id);
}
