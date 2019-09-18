package com.njupt.classroom.service;

import com.njupt.classroom.pojo.EnvironmentInfo;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/25.
 */
public interface EnvironmentService {

    List<EnvironmentInfo> get60EnvInfos(Integer labId);

    void addEnvironmentInfo(EnvironmentInfo environmentInfo);
}
