package com.njupt.classroom.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class OpenSchedule {
    private Integer id;

    private Integer openWeek;

    private String openTime;

    private Date openDate;

    private String openTeacherId;

    private String openTeacherName;

    private String openLabIdOrder;

    private String openLabNameOrder;

    private String openLabOrder;

    private String openLabPeople;
}