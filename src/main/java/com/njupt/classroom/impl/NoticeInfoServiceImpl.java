package com.njupt.classroom.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.njupt.classroom.dao.NoticeInfoMapper;
import com.njupt.classroom.pojo.NoticeInfo;
import com.njupt.classroom.service.NoticeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeInfoServiceImpl implements NoticeInfoService {

    @Autowired
    private NoticeInfoMapper noticeInfoMapper;
    @Override
    public List<NoticeInfo> findAll(int page,int size) {
        //参数pageNum 页码值  pageSize代表每页显示条数
        PageHelper.startPage(page,size);
       return noticeInfoMapper.findAll();
    }


}
