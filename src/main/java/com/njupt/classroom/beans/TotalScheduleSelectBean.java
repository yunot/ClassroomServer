package com.njupt.classroom.beans;

import com.njupt.classroom.pojo.TotalSchedule;
import lombok.Data;


import java.util.List;
import java.util.Map;


/**
 * Created by Vic_Hoo on 2019/5/8.
 */
@Data
public class TotalScheduleSelectBean {
    private List<String> weekList;
    private List<String> labList;
    private List<String> courseNameList;
    private List<String> classIdList;
    private List<String> teacherList;
}
