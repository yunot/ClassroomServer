package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.CourseManagement;

import java.util.List;

public interface CourseManagementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CourseManagement record);

    int insertSelective(CourseManagement record);

    CourseManagement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseManagement record);

    int updateByPrimaryKey(CourseManagement record);

    List<CourseManagement> selectCourseByType(String type);

}