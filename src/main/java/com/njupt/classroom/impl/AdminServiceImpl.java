package com.njupt.classroom.impl;

import com.njupt.classroom.beans.OpenLabAddBean;
import com.njupt.classroom.beans.OpenLabUpdateBean;
import com.njupt.classroom.dao.*;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.AdminService;
import com.njupt.classroom.utils.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/4/22.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private LabManagementMapper labManagementMapper;
    @Resource
    private WeeklyScheduleMapper weeklyScheduleMapper;
    @Resource
    private BaseUserInfoMapper baseUserInfoMapper;
    @Resource
    private CourseManagementMapper courseManagementMapper;
    @Resource
    private OpenScheduleMapper openScheduleMapper;
    @Resource
    private TotalScheduleMapper totalScheduleMapper;



    @Override
    public List<WeeklySchedule> GetWeeklySchedule(){
        return weeklyScheduleMapper.selectWeeklyScheduleAll();
    }

    @Override
    public BaseUserInfo selectByTeacherId(String teacherId){
        return baseUserInfoMapper.selectByTeacherId(teacherId);
    }

    @Override
    public List<WeeklySchedule> selectWSByTimeAndLabId(WeeklySchedule ws){
        return weeklyScheduleMapper.selectByTimeAndLabId(ws);
    }

    @Override
    public List<WeeklySchedule> selectWSByLabId(Integer labId){
        return weeklyScheduleMapper.selectByLabId(labId);
    }

    @Override
    public int InsertWSCausedByMainLabChange(WeeklySchedule ws){
        return weeklyScheduleMapper.insertAll(ws);
    }

    @Override
    public int DeleteWSCausedByMainLabChange(Integer mainLabId){
        return weeklyScheduleMapper.deleteByLabId(mainLabId);
    }

    @Override
    public List<BaseUserInfo> selectTeacherInfo(){
        return baseUserInfoMapper.selectTeacherInfo();
    }

    @Override
    public List<WeeklySchedule> selectMainCourses(){
        return weeklyScheduleMapper.selectByCourseType1();
    }

    @Override
    public int NumOfTime(){
        return weeklyScheduleMapper.selectGroupByTime().size();
    }

    @Override
    public int saveWeeklySche(WeeklySchedule weeklySchedule){
        return weeklyScheduleMapper.updateByPrimaryKeySelective(weeklySchedule);
    }

    @Override
    public int saveAddOpenSche(OpenLabAddBean bean){
        WeeklySchedule weeklySchedule = new WeeklySchedule();
        OpenSchedule openSchedule = new OpenSchedule();
        //配置周课表信息
        weeklySchedule.setCourseType("2");
        weeklySchedule.setCourseName("开放实验");
        weeklySchedule.setTeacherId(bean.getTeacherId());
        weeklySchedule.setStartWeeks(bean.getStartWeeks());
        weeklySchedule.setTime(bean.getTime());
        String[] labIdOrder_s = bean.getLabIdOrder().split(",");
        String[] labsOrder_s = bean.getLabsOrder().split(",");
        int lab_num = labIdOrder_s.length;
        for (int i = 0; i < lab_num; i++){
            if (labsOrder_s[i].equals("0")) continue;
            weeklySchedule.setLabId(Integer.parseInt(labIdOrder_s[i]));
            weeklySchedule.setCourseOrder(Integer.parseInt(labsOrder_s[i]));
            weeklyScheduleMapper.insertAll(weeklySchedule);
        }
        //配置开放信息
        //获取值班老师名字
        List<BaseUserInfo> teacherInfo = baseUserInfoMapper.selectTeacherInfo();
        String teacherName = "";
        if (StringUtils.isValued(bean.getTeacherId())){
            for(int i = 0; i < teacherInfo.size(); i++){
                if(bean.getTeacherId().equals(teacherInfo.get(i).getUserId())){
                    teacherName = teacherInfo.get(i).getUserName();break;
                }
            }
        }
        openSchedule.setOpenTeacherId(bean.getTeacherId());
        openSchedule.setOpenTeacherName(teacherName);
        openSchedule.setOpenWeek(Integer.parseInt(bean.getStartWeeks()));
        openSchedule.setOpenTime(bean.getTime());
        TotalSchedule weekAndTime = new TotalSchedule();
        weekAndTime.setWeek(Integer.parseInt(bean.getStartWeeks()));
        weekAndTime.setTime(bean.getTime());
        openSchedule.setOpenDate(totalScheduleMapper.selectDateByWeekTime(weekAndTime));
        String openLabIdOrder = "";//被选择开放的实验室id号
        String openLabNameOrder = "";//被选择开放的实验室名称
        String openLabOrder = "";//被开放实验室的有限开放顺序
        String labPeople = "";//与之对应的初始化人数
        for(int i = 0; i < lab_num; i++){
            if (labsOrder_s[i].equals("0")) continue;
            openLabIdOrder += labIdOrder_s[i] + ",";
            openLabOrder += labsOrder_s[i] + ",";
            labPeople += "0,";
        }
        //用实验室名称表示开放顺序
        for(int i = 1; i <= lab_num; i++){
            for (int j = 0; j < labsOrder_s.length; j++){
                if (labsOrder_s[j].equals(Integer.toString(i))){
                    openLabNameOrder +=
                            labManagementMapper.selectByPrimaryKey(Integer.parseInt(labIdOrder_s[j])).getLabName() + ",";
                    break;
                }
            }
        }
        openSchedule.setOpenLabIdOrder(StringUtils.removeEndChar(openLabIdOrder, ','));
        openSchedule.setOpenLabNameOrder(StringUtils.removeEndChar(openLabNameOrder, ','));
        openSchedule.setOpenLabOrder(StringUtils.removeEndChar(openLabOrder, ','));
        openSchedule.setOpenLabPeople(StringUtils.removeEndChar(labPeople, ','));
        openScheduleMapper.insertSelective(openSchedule);
        return 0;
    }

    @Override
    public int updateOpenSchedule(OpenLabUpdateBean bean){
        WeeklySchedule weeklySchedule = new WeeklySchedule();
        OpenSchedule openSchedule = new OpenSchedule();
        //因为课程不多，直接删除原有的周课表记录再重新添加，实现方便
        weeklySchedule.setStartWeeks(bean.getStartWeeksOld());
        weeklySchedule.setTime(bean.getTimeOld());
        weeklyScheduleMapper.deleteType2ByTimeWeek(weeklySchedule);
        //配置周课表信息
        weeklySchedule.setCourseType("2");
        weeklySchedule.setCourseName("开放实验");
        weeklySchedule.setTeacherId(bean.getTeacherId());
        weeklySchedule.setStartWeeks(bean.getStartWeeks());
        weeklySchedule.setTime(bean.getTime());
        String[] labIdOrder_s = bean.getLabIdOrder().split(",");
        String[] labsOrder_s = bean.getLabsOrder().split(",");
        int lab_num = labIdOrder_s.length;
        for (int i = 0; i < lab_num; i++){
            if (labsOrder_s[i].equals("0")) continue;
            weeklySchedule.setLabId(Integer.parseInt(labIdOrder_s[i]));
            weeklySchedule.setCourseOrder(Integer.parseInt(labsOrder_s[i]));
            weeklyScheduleMapper.insertAll(weeklySchedule);
    }
        //配置开放信息
        //获取值班老师名字
        List<BaseUserInfo> teacherInfo = baseUserInfoMapper.selectTeacherInfo();
        String teacherName = "";
        if (StringUtils.isValued(bean.getTeacherId())){
            for(int i = 0; i < teacherInfo.size(); i++){
                if(bean.getTeacherId().equals(teacherInfo.get(i).getUserId())){
                    teacherName = teacherInfo.get(i).getUserName();break;
                }
            }
        }
        openSchedule.setId(bean.getId());
        openSchedule.setOpenTeacherId(bean.getTeacherId());
        openSchedule.setOpenTeacherName(teacherName);
        openSchedule.setOpenWeek(Integer.parseInt(bean.getStartWeeks()));
        openSchedule.setOpenTime(bean.getTime());
        TotalSchedule weekAndTime = new TotalSchedule();
        weekAndTime.setWeek(Integer.parseInt(bean.getStartWeeks()));
        weekAndTime.setTime(bean.getTime());
        openSchedule.setOpenDate(totalScheduleMapper.selectDateByWeekTime(weekAndTime));
        String openLabIdOrder = "";//被选择开放的实验室id号
        String openLabNameOrder = "";//被选择开放的实验室名称
        String openLabOrder = "";//被开放实验室的有限开放顺序
        String labPeople = "";//与之对应的初始化人数
        for(int i = 0; i < lab_num; i++){
            if (labsOrder_s[i].equals("0")) continue;
            openLabIdOrder += labIdOrder_s[i] + ",";
            openLabOrder += labsOrder_s[i] + ",";
            labPeople += "0,";
        }
        //用实验室名称表示开放顺序
        for(int i = 1; i <= lab_num; i++){
            for (int j = 0; j < labsOrder_s.length; j++){
                if (labsOrder_s[j].equals(Integer.toString(i))){
                    openLabNameOrder +=
                            labManagementMapper.selectByPrimaryKey(Integer.parseInt(labIdOrder_s[j])).getLabName() + ",";
                    break;
                }
            }
        }
        openSchedule.setOpenLabIdOrder(StringUtils.removeEndChar(openLabIdOrder, ','));
        openSchedule.setOpenLabNameOrder(StringUtils.removeEndChar(openLabNameOrder, ','));
        openSchedule.setOpenLabOrder(StringUtils.removeEndChar(openLabOrder, ','));
        openSchedule.setOpenLabPeople(StringUtils.removeEndChar(labPeople, ','));
        openScheduleMapper.updateByPrimaryKeySelective(openSchedule);
        return 0;
    }

    @Override
    public int deleteOpenSchedule(OpenLabUpdateBean bean){
        WeeklySchedule weeklySchedule = new WeeklySchedule();
        //根据类型时间周次删除周课表记录
        weeklySchedule.setStartWeeks(bean.getStartWeeksOld());
        weeklySchedule.setTime(bean.getTimeOld());
        weeklyScheduleMapper.deleteType2ByTimeWeek(weeklySchedule);
        //根据id删除开放课程安排
        openScheduleMapper.deleteByPrimaryKey(bean.getId());
        return 0;
    }

    @Override
    public int saveAddOtherSche(WeeklySchedule ws){
        return weeklyScheduleMapper.insertAll(ws);
    }

    @Override
    public int updateEditOtherSche(WeeklySchedule weeklySchedule){
        return weeklyScheduleMapper.updateByPrimaryKeySelective(weeklySchedule);
    }

    @Override
    public int saveAddCourse(CourseManagement cm){
        return courseManagementMapper.insertSelective(cm);
    }

    @Override
    public List<CourseManagement> getMainCourse(){
        return courseManagementMapper.selectCourseByType("1");
    }

    @Override
    public List<CourseManagement> getOtherCourse(){
        return courseManagementMapper.selectCourseByType("3");
    }

    @Override
    public CourseManagement getCourseInfo(Integer id){
        return courseManagementMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateCourse(CourseManagement cm){
        return courseManagementMapper.updateByPrimaryKeySelective(cm);
    }

    @Override
    public int deleteCourse(Integer id){
        return courseManagementMapper.deleteByPrimaryKey(id);
    }
}
