package com.njupt.classroom.dao;



import com.njupt.classroom.pojo.NoticeInfo;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface NoticeInfoMapper {

    //查看通知信息
    @Select("select * from notice_info")
    public List<NoticeInfo> findAll();
}
