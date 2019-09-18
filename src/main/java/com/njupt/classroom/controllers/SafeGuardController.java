package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSONObject;
import com.njupt.classroom.beans.WeeklyScheduleBean;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.EnvironmentService;
import com.njupt.classroom.service.LabManagementService;
import com.njupt.classroom.service.ReportRepairService;
import com.njupt.classroom.service.WeeklyScheduleService;
import com.njupt.classroom.utils.SystemPermission;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/12.
 */
@Controller
@RequestMapping("/safeguard")
public class SafeGuardController {
    @Resource
    private WeeklyScheduleService weeklyScheduleService;
    @Resource
    private ReportRepairService reportRepairService;
    @Resource
    private EnvironmentService environmentService;
    @Resource
    private LabManagementService labManagementService;

    @RequestMapping("/ReportRepairs")
    public String ReportRepairs(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.redirect;
        model.addAttribute("ReportRepairsInfo", JSONObject.toJSONString(reportRepairService.getReportRepairInfoAll()));
        return "safeguard/ReportRepairs";
    }

    @RequestMapping(value = "/ViewReportRepair",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String ViewReportRepair(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(reportRepairService.getReportRepairInfo(id));
    }

    @RequestMapping(value = "/RepairHandle",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String RepairHandle(ReportRepairInfo repairInfo, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.respondBody;
        String result = "";
        if(reportRepairService.repairHandle(repairInfo) > 0)
            result = "报修处理成功！";
        else result = "报修处理失败！";
        return result;
    }


    @RequestMapping("/Environment")
    public String Environment(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.redirect;
        List<LabManagement> labInfo = labManagementService.GetLabInfo();
        model.addAttribute("labInfo", JSONObject.toJSONString(labInfo));
        return "safeguard/Environment";
    }

    @RequestMapping (value = "/getLabEnvironmentInfo",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getLabEnvironmentInfo(Integer labId, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.respondBody;
        System.out.println(labId);
        return JSONObject.toJSONString(environmentService.get60EnvInfos(labId));
    }

    @RequestMapping("/WeeklySchedule")
    public String WeeklySchedule(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.redirect;
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
        return "safeguard/WeeklySchedule";
    }

    @RequestMapping("/TotalSchedule")
    public String TotalSchedule(HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 4)) return SystemPermission.redirect;

        return "safeguard/TotalSchedule";
    }
}
