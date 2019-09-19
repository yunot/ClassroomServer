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


    //通过id展示校历
    public List<Semester> getCalendarById(String userId);

    //保存学期信息
    public void saveSemesterInfo(Semester semester);

    //保存工作标签
    void saveNote(Note note);

    //通过id查看工作标签
    List<Note> getNoteInfoById(String userId);
}
