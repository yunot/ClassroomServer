package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.beans.TotalScheduleQueryBean;
import com.njupt.classroom.beans.TotalScheduleSelectBean;
import com.njupt.classroom.beans.WeeklyScheduleBean;
import com.njupt.classroom.dao.TotalScheduleMapper;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.*;
import com.njupt.classroom.utils.StringUtils;
import com.njupt.classroom.utils.SystemPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created by Vic_Hoo on 2019/4/30.
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Resource
    private TeacherService teacherService;
    @Resource
    private WeeklyScheduleService weeklyScheduleService;
    @Resource
    private TeachingLogService teachingLogService;
    @Resource
    private ReportRepairService reportRepairService;
    @Resource
    private NoticeInfoService noticeInfoService;



    @RequestMapping("/TeachingActivity")
    public String WeeklySchedule(Model model, HttpServletRequest request,
                                 @RequestParam(name = "page",required = true,defaultValue = "1")int page,
                                 @RequestParam(name = "size",required = true,defaultValue = "2")int size){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        WeeklyScheduleBean bean = weeklyScheduleService.GetWeeklySchedule();
        List<WeeklySchedule> weeklyScheduleList = bean.getWeeklyScheduleList();
        List<WeeklyScheduleAdd> mainList = bean.getMainList();
        List<OpenSchedule> openList = bean.getOpenList();
        List<WeeklyScheduleAdd> otherList = bean.getOtherList();
        List<LabManagement> labList = bean.getLabList();
        List<BaseUserInfo> teacherList = bean.getTeacherList();
        //周课表参数
        List<WeeklyScheduleAdd> MonAm = bean.getMonAm();//星期一上午
        List<WeeklyScheduleAdd> MonPm = bean.getMonPm();//星期一下午
        List<WeeklyScheduleAdd> MonNt = bean.getMonNt();//星期一晚上
        List<WeeklyScheduleAdd> TuesAm = bean.getTuesAm();//星期二上午
        List<WeeklyScheduleAdd> TuesPm = bean.getTuesPm();//星期二下午
        List<WeeklyScheduleAdd> TuesNt = bean.getTuesNt();//星期二晚上
        List<WeeklyScheduleAdd> WedAm = bean.getWedAm();//星期三上午
        List<WeeklyScheduleAdd> WedPm = bean.getWedPm();//星期三下午
        List<WeeklyScheduleAdd> WedNt = bean.getWedNt();//星期三晚上
        List<WeeklyScheduleAdd> ThursAm = bean.getThursAm();//星期四上午
        List<WeeklyScheduleAdd> ThursPm = bean.getThursPm();//星期四下午
        List<WeeklyScheduleAdd> ThursNt = bean.getThursNt();//星期四晚上
        List<WeeklyScheduleAdd> FriAm = bean.getFriAm();//星期五上午
        List<WeeklyScheduleAdd> FriPm = bean.getFriPm();//星期五下午
        List<WeeklyScheduleAdd> FriNt = bean.getFriNt();//星期五晚上
        List<WeeklyScheduleAdd> SatAm = bean.getSatAm();//星期六上午
        List<WeeklyScheduleAdd> SatPm = bean.getSatPm();//星期六下午
        List<WeeklyScheduleAdd> SatNt = bean.getSatNt();//星期六晚上
        List<WeeklyScheduleAdd> SunAm = bean.getSunAm();//星期日上午
        List<WeeklyScheduleAdd> SunPm = bean.getSunPm();//星期日下午
        List<WeeklyScheduleAdd> SunNt = bean.getSunNt();//星期日晚上
        //end 周课表参数
        List<LabManagement> mainLabInfo = bean.getMainLabInfo();//提供周课表预览所需参数
        List<LabManagement> openLabInfo = bean.getOpenLabInfo();//提供开放表预览所需参数
        List<LabManagement> otherLabInfo = bean.getOtherLabInfo();//提供其他课表预览所需参数
        List<CourseManagement> mainCourse = bean.getMainCourse();//提供主要课程信息
        List<CourseManagement> otherCourse = bean.getOtherCourse();//提供其他课程信息

        model.addAttribute("mainList", mainList);
        model.addAttribute("openList", JSONObject.toJSONString(openList));
        model.addAttribute("otherList", otherList);
        model.addAttribute("mainLabInfo", JSONObject.toJSONString(mainLabInfo));
        model.addAttribute("openLabInfo", JSONObject.toJSONString(openLabInfo));
        model.addAttribute("otherLabInfo", otherLabInfo);
        model.addAttribute("mainCourse", JSONObject.toJSONString(mainCourse));
        model.addAttribute("otherCourse", JSONObject.toJSONString(otherCourse));

        model.addAttribute("MonAm", JSONObject.toJSONString(MonAm));
        model.addAttribute("MonPm", JSONObject.toJSONString(MonPm));
        model.addAttribute("MonNt", JSONObject.toJSONString(MonNt));
        model.addAttribute("TuesAm", JSONObject.toJSONString(TuesAm));
        model.addAttribute("TuesPm", JSONObject.toJSONString(TuesPm));
        model.addAttribute("TuesNt", JSONObject.toJSONString(TuesNt));
        model.addAttribute("WedAm", JSONObject.toJSONString(WedAm));
        model.addAttribute("WedPm", JSONObject.toJSONString(WedPm));
        model.addAttribute("WedNt", JSONObject.toJSONString(WedNt));
        model.addAttribute("ThursAm", JSONObject.toJSONString(ThursAm));
        model.addAttribute("ThursPm", JSONObject.toJSONString(ThursPm));
        model.addAttribute("ThursNt", JSONObject.toJSONString(ThursNt));
        model.addAttribute("FriAm", JSONObject.toJSONString(FriAm));
        model.addAttribute("FriPm", JSONObject.toJSONString(FriPm));
        model.addAttribute("FriNt", JSONObject.toJSONString(FriNt));
        model.addAttribute("SatAm", JSONObject.toJSONString(SatAm));
        model.addAttribute("SatPm", JSONObject.toJSONString(SatPm));
        model.addAttribute("SatNt", JSONObject.toJSONString(SatNt));
        model.addAttribute("SunAm", JSONObject.toJSONString(SunAm));
        model.addAttribute("SunPm", JSONObject.toJSONString(SunPm));
        model.addAttribute("SunNt", JSONObject.toJSONString(SunNt));


        List<NoticeInfo> noticeInfos=noticeInfoService.findAll(page,size);
        //PageInfo是一個分頁類
        PageInfo pageInfo=new PageInfo(noticeInfos);
        model.addAttribute("pageInfo", pageInfo);





        return "teacher/TeachingActivity";
    }

    @RequestMapping("/PrepareClass")
    public String StudentForum(HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        return "teacher/PrepareClass";
    }

    @RequestMapping("/GradeEvaluation")
    public String GradeEvaluation(HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        return "teacher/GradeEvaluation";
    }

    @RequestMapping("/OpenProject")
    public String OpenProject(HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        return "teacher/OpenProject";
    }



    @RequestMapping("/QusBank")
    public String PrepareQuestion(HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        return "teacher/QusBank";
    }

    @RequestMapping("/DeviceManage")
    public String DeviceManage(Model model,HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        model.addAttribute("ReportRepairsInfo", JSONObject.toJSONString(reportRepairService.getReportRepairInfoAll()));
        return "teacher/DeviceManage";
    }

    @RequestMapping("/TeachingAdvice")
    public String TeachingAdvice(HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        return "teacher/TeachingAdvice";
    }

    @RequestMapping("/advice")
    public void subAdvice(TeachAdvice advice, HttpServletRequest request, HttpServletResponse response) throws IOException {
        teacherService.subAdvice(advice);
        response.sendRedirect(request.getContextPath()+"/teacher/TeachingAdvice");
        return ;
    }

    @RequestMapping("/viewAdvice")
    public String viewAdvice(Model model){
        List<TeachAdvice> advice = teacherService.findAll();
        model.addAttribute("advice",advice);
        return "teacher/newmodol";
    }


    @RequestMapping("/TeachingLog")
    public String TeachingLog(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;
        model.addAttribute("TeachingLogInfo", JSONObject.toJSONString(teachingLogService.getTeachingLogInfo()));
        return "teacher/TeachingLog";
    }





}


