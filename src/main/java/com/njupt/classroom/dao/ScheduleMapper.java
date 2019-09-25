package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.Schedule;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ScheduleMapper {

    List<Schedule> findAll();

    int update(Schedule schedule);

}
