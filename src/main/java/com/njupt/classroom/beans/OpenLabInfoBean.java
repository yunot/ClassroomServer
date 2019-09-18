package com.njupt.classroom.beans;

import lombok.Data;

import java.util.Date;

/**
 * Created by Vic_Hoo on 2019/5/21.
 */
@Data
public class OpenLabInfoBean {
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

    private Integer totalPeopleNum;//总人数

    private Integer bookingNum;//已经预约

    private Integer notBookingNum;//未预约
}
