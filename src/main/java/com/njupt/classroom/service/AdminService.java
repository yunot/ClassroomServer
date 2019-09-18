package com.njupt.classroom.service;

import com.njupt.classroom.beans.OpenLabAddBean;
import com.njupt.classroom.beans.OpenLabUpdateBean;
import com.njupt.classroom.pojo.*;

import java.util.List;

/**
 * Created by Vic_Hoo on 2019/4/22.
 */
public interface AdminService {

    List<WeeklySchedule> GetWeeklySchedule();

    BaseUserInfo selectByTeacherId(String teacherId);

    List<WeeklySchedule> selectWSByTimeAndLabId(WeeklySchedule ws);

    List<WeeklySchedule> selectWSByLabId(Integer labId);

    int InsertWSCausedByMainLabChange(WeeklySchedule ws);

    int DeleteWSCausedByMainLabChange(Integer mainLabId);

    List<BaseUserInfo> selectTeacherInfo();

    List<WeeklySchedule> selectMainCourses();

    int NumOfTime();

    int saveWeeklySche(WeeklySchedule weeklySchedule);

    int saveAddOpenSche(OpenLabAddBean bean);

    int updateOpenSchedule(OpenLabUpdateBean bean);

    int deleteOpenSchedule(OpenLabUpdateBean bean);

    int saveAddOtherSche(WeeklySchedule ws);

    int updateEditOtherSche(WeeklySchedule weeklySchedule);

    List<CourseManagement> getMainCourse();

    List<CourseManagement> getOtherCourse();

    int saveAddCourse(CourseManagement cm);

    CourseManagement getCourseInfo(Integer id);

    int updateCourse(CourseManagement cm);

    int deleteCourse(Integer id);
}
