package com.njupt.classroom.service;

import com.njupt.classroom.pojo.*;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/1.
 */
public interface TeacherService {


    //查看建议
    public List<TeachAdvice> findAll();

    //提交建议
    public void subAdvice(TeachAdvice advice);


}
