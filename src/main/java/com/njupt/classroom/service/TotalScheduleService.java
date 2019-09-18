package com.njupt.classroom.service;

import com.njupt.classroom.beans.TotalScheduleQueryBean;
import com.njupt.classroom.beans.TotalScheduleSelectBean;
import com.njupt.classroom.pojo.TotalSchedule;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/7.
 */
public interface TotalScheduleService {

    void resetTotalSchedule(String strDate, int weeks) throws ParseException;

    void importWeeklySchedule();

    List<TotalSchedule> getTotalScheduleAll();

    TotalScheduleSelectBean getSelectOptions();

    List<TotalSchedule> QueryByContext(TotalScheduleQueryBean bean);

}
