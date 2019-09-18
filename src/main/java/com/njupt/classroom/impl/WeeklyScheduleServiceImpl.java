package com.njupt.classroom.impl;

import com.njupt.classroom.beans.WeeklyScheduleBean;
import com.njupt.classroom.dao.*;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.WeeklyScheduleService;
import com.njupt.classroom.utils.StringUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/1.
 */
@Service
public class WeeklyScheduleServiceImpl implements WeeklyScheduleService {
    @Resource
    private LabManagementMapper labManagementMapper;
    @Resource
    private WeeklyScheduleMapper weeklyScheduleMapper;
    @Resource
    private BaseUserInfoMapper baseUserInfoMapper;
    @Resource
    private OpenScheduleMapper openScheduleMapper;
    @Resource
    private CourseManagementMapper courseManagementMapper;

    @Override
    public WeeklyScheduleBean GetWeeklySchedule(){
        WeeklyScheduleBean bean = new WeeklyScheduleBean();
        List<WeeklySchedule> weeklyScheduleList = weeklyScheduleMapper.selectWeeklyScheduleAll();
        List<WeeklyScheduleAdd> mainList = new ArrayList<>();
        List<OpenSchedule> openList = openScheduleMapper.selectAll();
        List<WeeklyScheduleAdd> otherList = new ArrayList<>();
        List<LabManagement> labList = labManagementMapper.selectAll();
        List<BaseUserInfo> teacherList = baseUserInfoMapper.selectTeacherInfo();
        //周课表参数
        List<WeeklyScheduleAdd> MonAm = new ArrayList<>();//星期一上午
        List<WeeklyScheduleAdd> MonPm = new ArrayList<>();//星期一下午
        List<WeeklyScheduleAdd> MonNt = new ArrayList<>();//星期一晚上
        List<WeeklyScheduleAdd> TuesAm = new ArrayList<>();//星期二上午
        List<WeeklyScheduleAdd> TuesPm = new ArrayList<>();//星期二下午
        List<WeeklyScheduleAdd> TuesNt = new ArrayList<>();//星期二晚上
        List<WeeklyScheduleAdd> WedAm = new ArrayList<>();//星期三上午
        List<WeeklyScheduleAdd> WedPm = new ArrayList<>();//星期三下午
        List<WeeklyScheduleAdd> WedNt = new ArrayList<>();//星期三晚上
        List<WeeklyScheduleAdd> ThursAm = new ArrayList<>();//星期四上午
        List<WeeklyScheduleAdd> ThursPm = new ArrayList<>();//星期四下午
        List<WeeklyScheduleAdd> ThursNt = new ArrayList<>();//星期四晚上
        List<WeeklyScheduleAdd> FriAm = new ArrayList<>();//星期五上午
        List<WeeklyScheduleAdd> FriPm = new ArrayList<>();//星期五下午
        List<WeeklyScheduleAdd> FriNt = new ArrayList<>();//星期五晚上
        List<WeeklyScheduleAdd> SatAm = new ArrayList<>();//星期六上午
        List<WeeklyScheduleAdd> SatPm = new ArrayList<>();//星期六下午
        List<WeeklyScheduleAdd> SatNt = new ArrayList<>();//星期六晚上
        List<WeeklyScheduleAdd> SunAm = new ArrayList<>();//星期日上午
        List<WeeklyScheduleAdd> SunPm = new ArrayList<>();//星期日下午
        List<WeeklyScheduleAdd> SunNt = new ArrayList<>();//星期日晚上
        //end 周课表参数
        List<LabManagement> mainLabInfo = new ArrayList<>();//提供周课表预览所需参数
        List<LabManagement> openLabInfo = new ArrayList<>();//提供开放表预览所需参数
        List<LabManagement> otherLabInfo = new ArrayList<>();//提供其他课表预览所需参数
        List<CourseManagement> mainCourse = courseManagementMapper.selectCourseByType("1");//提供主要课程信息
        List<CourseManagement> otherCourse = courseManagementMapper.selectCourseByType("3");//提供其他课程信息

        //一次遍历获取解析全部内容
        for(int i = 0; i < weeklyScheduleList.size(); i++){
            WeeklyScheduleAdd weeklyScheduleAdd = new WeeklyScheduleAdd();
            //通过实验室ID获取实验室名称
            Integer labId = weeklyScheduleList.get(i).getLabId();
            String labName = "";
            for(int j = 0; j < labList.size(); j++){
                //获取实验室名称
                if (labId == labList.get(j).getLabId()){
                    labName = labList.get(j).getLabName();break;
                }

            }
            weeklyScheduleAdd.setLabName(labName);
            //通过教师ID获取教师姓名
            String teacherId = weeklyScheduleList.get(i).getTeacherId();
            String teacherName = "";
            for(int j = 0; j < teacherList.size(); j++){
                if (teacherId.equals(teacherList.get(j).getUserId())){
                    teacherName = teacherList.get(j).getUserName();break;
                }
            }
            try {
                BeanUtils.copyProperties(weeklyScheduleAdd, weeklyScheduleList.get(i));
            } catch (Exception e){

            }
            weeklyScheduleAdd.setTeacherName(teacherName);
            //子类获取父类属性
            switch (weeklyScheduleList.get(i).getCourseType()){
                case "1":{
                    mainList.add(weeklyScheduleAdd);
                    switch (weeklyScheduleList.get(i).getTime()){
                        case "星期一上午":{MonAm.add(weeklyScheduleAdd);}break;
                        case "星期一下午":{MonPm.add(weeklyScheduleAdd);}break;
                        case "星期一晚上":{MonNt.add(weeklyScheduleAdd);}break;
                        case "星期二上午":{TuesAm.add(weeklyScheduleAdd);}break;
                        case "星期二下午":{TuesPm.add(weeklyScheduleAdd);}break;
                        case "星期二晚上":{TuesNt.add(weeklyScheduleAdd);}break;
                        case "星期三上午":{WedAm.add(weeklyScheduleAdd);}break;
                        case "星期三下午":{WedPm.add(weeklyScheduleAdd);}break;
                        case "星期三晚上":{WedNt.add(weeklyScheduleAdd);}break;
                        case "星期四上午":{ThursAm.add(weeklyScheduleAdd);}break;
                        case "星期四下午":{ThursPm.add(weeklyScheduleAdd);}break;
                        case "星期四晚上":{ThursNt.add(weeklyScheduleAdd);}break;
                        case "星期五上午":{FriAm.add(weeklyScheduleAdd);}break;
                        case "星期五下午":{FriPm.add(weeklyScheduleAdd);}break;
                        case "星期五晚上":{FriNt.add(weeklyScheduleAdd);}break;
                        case "星期六上午":{SatAm.add(weeklyScheduleAdd);}break;
                        case "星期六下午":{SatPm.add(weeklyScheduleAdd);}break;
                        case "星期六晚上":{SatNt.add(weeklyScheduleAdd);}break;
                        case "星期日上午":{SunAm.add(weeklyScheduleAdd);}break;
                        case "星期日下午":{SunPm.add(weeklyScheduleAdd);}break;
                        case "星期日晚上":{SunNt.add(weeklyScheduleAdd);}break;
                        default:break;
                    }
                }break;
                case "2":{
                    //openList.add(weeklyScheduleAdd);
                }break;
                case "3":{
                    otherList.add(weeklyScheduleAdd);
                }break;
                default:break;
            }
        }

        //openList按周排序
        Collections.sort(openList, new Comparator<OpenSchedule>() {
            public int compare(OpenSchedule op1, OpenSchedule op2){
                int week1 = op1.getOpenWeek();
                int week2 = op2.getOpenWeek();
                if (week1 > week2)
                    return 1;
                if (week1 == week2)
                    return 0;
                return -1;
            }

        });
        //otherList按周排序
        Collections.sort(otherList, new Comparator<WeeklyScheduleAdd>() {
            public int compare(WeeklyScheduleAdd w1, WeeklyScheduleAdd w2) {
                int week1 = Integer.parseInt(w1.getStartWeeks());
                int week2 = Integer.parseInt(w2.getStartWeeks());
                if (week1 > week2)
                    return 1;
                if (week1 == week2)
                    return 0;
                return -1;
            }
        });

        for(int j = 0; j < labList.size(); j++){
            //获取主要实验室信息
            if (labList.get(j).getMainLab()){
                mainLabInfo.add(labList.get(j));
            }
            if (labList.get(j).getOpenLab()){
                openLabInfo.add(labList.get(j));
            }
            if (labList.get(j).getOtherLab()){
                otherLabInfo.add(labList.get(j));
            }
        }

        bean.setWeeklyScheduleList(weeklyScheduleList);
        bean.setMainList(mainList);
        bean.setOpenList(openList);
        bean.setOtherList(otherList);
        bean.setLabList(labList);
        bean.setTeacherList(teacherList);
        bean.setMonAm(MonAm);
        bean.setMonPm(MonPm);
        bean.setMonNt(MonNt);
        bean.setTuesAm(TuesAm);
        bean.setTuesPm(TuesPm);
        bean.setTuesNt(TuesNt);
        bean.setWedAm(WedAm);
        bean.setWedPm(WedPm);
        bean.setWedNt(WedNt);
        bean.setThursAm(ThursAm);
        bean.setThursPm(ThursPm);
        bean.setThursNt(ThursNt);
        bean.setFriAm(FriAm);
        bean.setFriPm(FriPm);
        bean.setFriNt(FriNt);
        bean.setSatAm(SatAm);
        bean.setSatPm(SatPm);
        bean.setSatNt(SatNt);
        bean.setSunAm(SunAm);
        bean.setSunPm(SunPm);
        bean.setSunNt(SunNt);
        bean.setMainLabInfo(mainLabInfo);
        bean.setOpenLabInfo(openLabInfo);
        bean.setOtherLabInfo(otherLabInfo);
        bean.setMainCourse(mainCourse);
        bean.setOtherCourse(otherCourse);
        return bean;
    }

    @Override
    public WeeklyScheduleAdd GetWeeklyScheduleAddById(Integer id){
        WeeklySchedule weeklySchedule = weeklyScheduleMapper.selectByPrimaryKey(id);
        WeeklyScheduleAdd weeklyScheduleAdd = new WeeklyScheduleAdd();
        String teacherId = weeklySchedule.getTeacherId();
        String teacherName = "";
        if (StringUtils.isValued(teacherId)){
            BaseUserInfo teacherInfo = baseUserInfoMapper.selectByTeacherId(teacherId);
            if(teacherInfo != null){
                teacherName = teacherInfo.getUserName();
            }
        }
        weeklyScheduleAdd.setTeacherName(teacherName);
        Integer labId = weeklySchedule.getLabId();
        String labName = "";
        if (labId != null && labId != 0)
            labName = labManagementMapper.selectByPrimaryKey(labId).getLabName();
        if (StringUtils.isValued(labName) != true){
            labName = "";
        }
        weeklyScheduleAdd.setLabName(labName);
        try {
            BeanUtils.copyProperties(weeklyScheduleAdd, weeklySchedule);
        } catch (Exception e){

        }
        return weeklyScheduleAdd;
    }

    @Override
    public List<BaseUserInfo> GetTeachersInfo(){
        return baseUserInfoMapper.selectTeacherInfo();
    }

    @Override
    public int SaveWeeklySche(WeeklySchedule weeklySchedule){
        return weeklyScheduleMapper.updateByPrimaryKeySelective(weeklySchedule);
    }

    @Override
    public int DeleteWeeklyScheById(Integer id){
        return weeklyScheduleMapper.deleteByPrimaryKey(id);
    }

}
