package com.njupt.classroom.beans;

import lombok.Data;

/**
 * Created by Vic_Hoo on 2019/5/21.
 */
@Data
public class OpenLabUpdateBean {
    private int id;
    private String startWeeks;
    private String startWeeksOld;
    private String teacherId;
    private String time;
    private String timeOld;
    private String labIdOrder;
    private String labsOrder;
}
