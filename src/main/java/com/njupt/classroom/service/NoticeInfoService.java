package com.njupt.classroom.service;

import com.njupt.classroom.pojo.NoticeInfo;

import java.util.List;

public interface NoticeInfoService {
     List<NoticeInfo> findAll(int page,int size);


}
