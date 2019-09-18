package com.njupt.classroom.impl;

import com.njupt.classroom.beans.TotalScheduleQueryBean;
import com.njupt.classroom.beans.TotalScheduleSelectBean;
import com.njupt.classroom.dao.BaseUserInfoMapper;
import com.njupt.classroom.dao.LabManagementMapper;
import com.njupt.classroom.dao.TotalScheduleMapper;
import com.njupt.classroom.dao.WeeklyScheduleMapper;
import com.njupt.classroom.pojo.BaseUserInfo;
import com.njupt.classroom.pojo.LabManagement;
import com.njupt.classroom.pojo.TotalSchedule;
import com.njupt.classroom.pojo.WeeklySchedule;
import com.njupt.classroom.service.TotalScheduleService;
import com.njupt.classroom.utils.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.List;


/**
 * Created by Vic_Hoo on 2019/5/7.
 */
@Service
public class TotalScheduleServiceImpl implements TotalScheduleService {
    @Resource
    private TotalScheduleMapper totalScheduleMapper;
    @Resource
    private LabManagementMapper labManagementMapper;
    @Resource
    private WeeklyScheduleMapper weeklyScheduleMapper;
    @Resource
    private BaseUserInfoMapper baseUserInfoMapper;

    @Override
    public void resetTotalSchedule(String strDate, int weeks) throws ParseException{
        totalScheduleMapper.deleteAll();
        List<LabManagement> labList = labManagementMapper.selectAll();//实验室总个数
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = dateFormat.parse(strDate);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        for (int w = 1; w <= weeks; w++){
            //周总数
            for (int i = 0; i < 7; i++){
                //每周有7天
                for (int n = 0; n < labList.size(); n++){
                    //每个实验室一周7天的课程
                    //一天三个时间段
                    TotalSchedule pojo = new TotalSchedule();
                    pojo.setDate(calendar.getTime());
                    pojo.setWeek(w);
                    pojo.setLabId(labList.get(n).getLabId());
                    pojo.setLabName(labList.get(n).getLabName());
                    String week_s = "";
                    int week_t = calendar.get(Calendar.DAY_OF_WEEK);
                    switch (week_t){
                        case 1: week_s = "星期日";break;
                        case 2: week_s = "星期一";break;
                        case 3: week_s = "星期二";break;
                        case 4: week_s = "星期三";break;
                        case 5: week_s = "星期四";break;
                        case 6: week_s = "星期五";break;
                        case 7: week_s = "星期六";break;
                        default:break;
                    }
                    pojo.setTime(week_s + "上午");
                    totalScheduleMapper.insertAll(pojo);
                    pojo.setTime(week_s + "下午");
                    totalScheduleMapper.insertAll(pojo);
                    pojo.setTime(week_s + "晚上");
                    totalScheduleMapper.insertAll(pojo);
                }
                calendar.add(Calendar.DAY_OF_WEEK, 1);//下一天
            }
        }
    }

    @Override
    public void importWeeklySchedule(){
        List<WeeklySchedule> weekList = weeklyScheduleMapper.selectWeeklyScheduleAll();
        List<BaseUserInfo> teacherList = baseUserInfoMapper.selectTeacherInfo();
        List<LabManagement> labList = labManagementMapper.selectAll();
        /////////////////////删除不存在的记录///////////////////////////
        List<TotalSchedule> totalScheduleList = totalScheduleMapper.selectHasWeeklySchedule();
        int total = totalScheduleList.size();
        for(int i = 0; i < total; i++){
            TotalSchedule testExsit = totalScheduleList.get(i);
            if(weeklyScheduleMapper.selectByPrimaryKey(testExsit.getWeeklyScheduleId()) == null){
                //清除课程
                TotalSchedule setNull = new TotalSchedule();
                setNull.setWeek(testExsit.getWeek());
                setNull.setTime(testExsit.getTime());
                setNull.setLabId(testExsit.getLabId());
                setNull.setCourseName("");
                setNull.setCourseTime(0);
                setNull.setCourseType("");
                setNull.setCourseId("");
                setNull.setTeacherName("");
                setNull.setTeacherId("");
                setNull.setClassId("");
                totalScheduleMapper.updateWeeklyScheByWeekTimeLabId(setNull);
            }
        }
        //////////////////////////////////////////////////////////////
        for (int i = 0; i < weekList.size(); i++){
            //遍历周课表补全信息
            TotalSchedule ts = new TotalSchedule();
            try {
                BeanUtils.copyProperties(ts, weekList.get(i));
            }catch (Exception e){
                System.out.println("importWeeklySchedule: " + e.getCause());
            }
            String labName = "";
            for (int j = 0; j < labList.size(); j++){
                if (weekList.get(i).getLabId() == labList.get(j).getLabId()){
                    labName = labList.get(j).getLabName();break;
                }
            }
            ts.setLabName(labName);
            String teacherName = "";
            String teacherId = weekList.get(i).getTeacherId();
            for (int j = 0; j < teacherList.size(); j++){
                if (teacherId.equals(teacherList.get(j).getUserId())){
                    teacherName = teacherList.get(j).getUserName();break;
                }
            }
            ts.setTeacherName(teacherName);
            ts.setWeeklyScheduleId(weekList.get(i).getId());
            //解析startWeeks stopWeeks
            //e.g startWeeks: 5-18; stopWeeks: 6,9,10
            //start end
            String start = weekList.get(i).getStartWeeks();
            String start_s = "", end_s = "";
            int start_t = 0, end_t = 0;
            String stop = weekList.get(i).getStopWeeks();
            if (start.indexOf("-") >= 0){
                String[] weeks = start.split("-");
                start_s = weeks[0];
                end_s = weeks[1];
                start_t = Integer.parseInt(start_s);
                end_t = Integer.parseInt(end_s);
                for (int week = start_t; week <= end_t; week++){
                    //开始导入课程
                    if ( stop.indexOf(Integer.toString(week)) >= 0 ){
                        //停课周的处理
                        continue;
                    }else {
                        ts.setWeek(week);
                        totalScheduleMapper.updateWeeklyScheByWeekTimeLabId(ts);
                    }

                }
            }
            //e.g startWeeks: 5
            else {
                if (StringUtils.isValued(start)){
                    int week = Integer.parseInt(weekList.get(i).getStartWeeks());
                    ts.setWeek(week);
                    totalScheduleMapper.updateWeeklyScheByWeekTimeLabId(ts);
                }
            }
        }
    }

    @Override
    public List<TotalSchedule> getTotalScheduleAll(){
        return totalScheduleMapper.selectAll();
    }

    @Override
    public TotalScheduleSelectBean getSelectOptions(){
        TotalScheduleSelectBean bean = new TotalScheduleSelectBean();
        bean.setWeekList(totalScheduleMapper.selectGroupByWeek());
        bean.setLabList(totalScheduleMapper.selectGroupByLabName());
        bean.setCourseNameList(totalScheduleMapper.selectGroupByCourseName());
        bean.setClassIdList(totalScheduleMapper.selectGroupByClassId());
        bean.setTeacherList(totalScheduleMapper.selectGroupByTeacherName());
        return bean;
    }

    @Override
    public List<TotalSchedule> QueryByContext(TotalScheduleQueryBean bean){
        return totalScheduleMapper.selectByContext(bean);
    }

}
