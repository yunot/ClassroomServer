package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSONObject;
import com.njupt.classroom.beans.*;
import com.njupt.classroom.dao.UserAttendanceInfoMapper;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.*;
import com.njupt.classroom.utils.StringUtils;
import com.njupt.classroom.utils.SystemPermission;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/4/22.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;
    @Resource
    private WeeklyScheduleService weeklyScheduleService;
    @Resource
    private TotalScheduleService totalScheduleService;
    @Resource
    private TeachingLogService teachingLogService;
    @Resource
    private ReportRepairService reportRepairService;
    @Resource
    private LabDevicesService labDevicesService;
    @Resource
    private OpenScheduleService openScheduleService;
    @Resource
    private LabBookingService labBookingService;
    @Resource
    private EnvironmentService environmentService;
    @Resource
    private UserAttendanceService userAttendanceService;
    @Resource
    private LabManagementService labManagementService;

    @RequestMapping("/Environment")
    public String Environment(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        List<LabManagement> labInfo = labManagementService.GetLabInfo();
        model.addAttribute("labInfo", JSONObject.toJSONString(labInfo));
        return "admin/Environment";
    }

    @RequestMapping (value = "/getLabEnvironmentInfo",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getLabEnvironmentInfo(Integer labId, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(labId);
        return JSONObject.toJSONString(environmentService.get60EnvInfos(labId));
    }



    @RequestMapping ("/LabManagement")
    public String LabManagement(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        List<LabManagement> labManagementList = labManagementService.GetLabInfo();
        model.addAttribute("labManagementList", labManagementList);
        return "admin/LabManagement";
    }

    @RequestMapping (value = "/UpdateLabManagement",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String UpdateLabManagement(LabManagement labManagement, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        if(labManagementService.UpdateLabInfo(labManagement) != 0) {//更新实验室配置信息
            if(labManagement.getMainLab()){
            //勾选主课实验室并同步到周课表
                //判断是否存在该实验室的课程
                int labItems = adminService.selectWSByLabId(labManagement.getLabId()).size();
                if(labItems > 0){
                    //存在则继续
                }else {
                    //不存在则新增内容并初始化

                    WeeklySchedule ws = new WeeklySchedule();
                    ws.setCourseType("1");//主要课程
                    ws.setLabId(labManagement.getLabId());//实验室编号
                    for (int i = 1; i <= 7; i++){
                        String time = "";
                        switch (i){
                            case 1: time = "星期一";break;
                            case 2: time = "星期二";break;
                            case 3: time = "星期三";break;
                            case 4: time = "星期四";break;
                            case 5: time = "星期五";break;
                            case 6: time = "星期六";break;
                            case 7: time = "星期日";break;
                            default:break;
                        }
                        //星期x上午
                        ws.setTime(time+"上午");
                        adminService.InsertWSCausedByMainLabChange(ws);
                        //星期x下午
                        ws.setTime(time+"下午");
                        adminService.InsertWSCausedByMainLabChange(ws);
                        ws.setLabId(labManagement.getLabId());
                        //星期一晚上
                        ws.setTime(time+"晚上");
                        adminService.InsertWSCausedByMainLabChange(ws);
                    }
                }
            }else {
            //撤销勾选则删除周课表中的相关内容
                adminService.DeleteWSCausedByMainLabChange(labManagement.getLabId());
            }
            return "UpdateSuccess";
        }
        else
            return "UpdateError";
    }

    @RequestMapping (value = "/OriginalLabManagement",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String OriginalLabManagement(Integer labId, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        LabManagement labManagement = labManagementService.selectLabInfoByLabId(labId);
        System.out.println(
                "ID:" + labManagement.getLabId() +
                        " Name:" + labManagement.getLabName() +
                        " main:" + labManagement.getMainLab().toString() +
                        " open:" + labManagement.getOpenLab().toString() +
                        " other:" + labManagement.getOtherLab().toString()
        );
        System.out.println("OriginalLabManagement");
        return JSONObject.toJSONString(labManagement);
    }

    @RequestMapping (value = "/GetLabDevices",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String GetLabDevices(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(labDevicesService.getLabDevices(id));
    }

    @RequestMapping (value = "/saveAddDevice",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveAddDevice(LabDevices labDevices, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        labDevicesService.addDeviceInfo(labDevices);
        return "设备添加成功";
    }

    @RequestMapping (value = "/GetLabDeviceInfo",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String GetLabDeviceInfo(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(id);
        return JSONObject.toJSONString(labDevicesService.getLabDeviceInfo(id));
    }

    @RequestMapping (value = "/updateDeviceInfo",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateDeviceInfo(LabDevices labDevices, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(JSONObject.toJSONString(labDevices));
        labDevicesService.updateDeviceInfo(labDevices);
        return "设备信息修改成功";
    }

    @RequestMapping (value = "/DeleteLabDevice",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String DeleteLabDevice(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        labDevicesService.deleteDevice(id);
        return "设备删除成功了！";
    }

    @RequestMapping("/CourseManagement")
    public String CourseManagement(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        List<CourseManagement> mainCourse = adminService.getMainCourse();
        List<CourseManagement> otherCourse = adminService.getOtherCourse();
        System.out.println(JSONObject.toJSONString(otherCourse));
        model.addAttribute("mainCourse", JSONObject.toJSONString(mainCourse));
        model.addAttribute("otherCourse", JSONObject.toJSONString(otherCourse));
        return "admin/CourseManagement";
    }

    @RequestMapping (value = "/saveAddMainCourse",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveAddMainCourse(CourseManagement cm, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        adminService.saveAddCourse(cm);
        return "添加一条主要课程";
    }

    @RequestMapping (value = "/saveAddOtherCourse",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveAddOtherCourse(CourseManagement cm, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        adminService.saveAddCourse(cm);
        return "添加一条其他课程";
    }

    @RequestMapping (value = "/editCourse",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String editCourse(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(adminService.getCourseInfo(id));
    }

    @RequestMapping (value = "/updateEditCourse",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateEditCourse(CourseManagement cm, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(adminService.updateCourse(cm));
    }

    @RequestMapping (value = "/saveDeleteCourse",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveDeleteCourse(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(id);
        return "删除了"+adminService.deleteCourse(id)+"条课程信息";
    }

    @RequestMapping("/WeeklySchedule")
    public String WeeklySchedule(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
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
        return "admin/WeeklySchedule";
    }

    @RequestMapping (value = "/EditWeeklySchedule",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String EditWeeklySchedule(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(id);
        WeeklyScheduleAdd weeklyScheduleAdd = weeklyScheduleService.GetWeeklyScheduleAddById(id);
        return JSONObject.toJSONString(weeklyScheduleAdd);
    }

    @RequestMapping (value = "/selectTeacher",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String selectTeacher(HttpServletRequest request){
        System.out.println("selectTeacher");
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        List<BaseUserInfo> teacherList = adminService.selectTeacherInfo();
        //清除密码信息 避免前端获取到密码
        for(int i = 0; i < teacherList.size(); i++){
            teacherList.get(i).setUserPassword("");
        }
        return JSONObject.toJSONString(teacherList);
    }

    @RequestMapping (value = "/saveWeeklySche",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveWeeklySche(WeeklySchedule weeklySchedule, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(JSONObject.toJSONString(weeklySchedule));
        adminService.saveWeeklySche(weeklySchedule);
        return "saveWeeklySche_success";
    }

    @RequestMapping (value = "/saveAddOpenSchedule",
            method =  RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveOpenSche(OpenLabAddBean bean, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(bean.getTeacherId());
        adminService.saveAddOpenSche(bean);
        return "开放实验添加成功，刷新网页即可查看最新信息";
    }

    @RequestMapping(value = "/getOpenScheById",
            method =  RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getOpenScheById(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(openScheduleService.getOpenSchedule(id));
    }

    @RequestMapping (value = "/updateOpenSchedule",
            method =  RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateOpenSchedule(OpenLabUpdateBean bean, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        adminService.updateOpenSchedule(bean);
        return "更新成功，刷新网页获取最新信息";
    }

    @RequestMapping (value = "/deleteOpenSchedule",
            method =  RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveDeleteOpenSche(OpenLabUpdateBean bean, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        adminService.deleteOpenSchedule(bean);
        return "删除成功，刷新网页获取最新信息";
    }

    @RequestMapping (value = "/saveAddOtherSche",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveAddOtherSche(WeeklySchedule ws, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        adminService.saveAddOtherSche(ws);
        return "saveAddOtherSche_success";
    }

    @RequestMapping(value = "/getOtherScheById",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getOtherScheById(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println("getOtherScheById:" + id);
        return JSONObject.toJSONString(weeklyScheduleService.GetWeeklyScheduleAddById(id));
    }

    @RequestMapping(value = "/updateEditOtherSche",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String updateEditOtherSche(WeeklySchedule ws, HttpServletRequest request){
        System.out.println(JSONObject.toJSONString(ws));
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        adminService.updateEditOtherSche(ws);
        return "saveEditOtherSche_success";
    }

    @RequestMapping(value = "/saveDeleteOtherSche",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveDeleteOtherSche(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        //System.out.println("saveDeleteOtherSche: id = " + id);
        weeklyScheduleService.DeleteWeeklyScheById(id);
        return "saveDeleteOtherSche_success";
    }

    @RequestMapping("/TotalSchedule")
    public String TotalSchedule(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        //model.addAttribute("TotalInfo", JSONObject.toJSONString(totalScheduleService.getTotalScheduleAll()));
        TotalScheduleSelectBean selectBean = totalScheduleService.getSelectOptions();
        model.addAttribute("weekSelect", JSONObject.toJSONString(selectBean.getWeekList()));
        model.addAttribute("labSelect", JSONObject.toJSONString(selectBean.getLabList()));
        model.addAttribute("courseNameSelect", JSONObject.toJSONString(selectBean.getCourseNameList()));
        model.addAttribute("classIdSelect", JSONObject.toJSONString(selectBean.getClassIdList()));
        model.addAttribute("teacherSelect", JSONObject.toJSONString(selectBean.getTeacherList()));
        return "admin/TotalSchedule";
    }

    @RequestMapping(value = "/resetTotal",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String resetTotal(String date, int weeks, HttpServletRequest request) throws ParseException{
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        totalScheduleService.resetTotalSchedule(date, weeks);
        return "resetTotalSchedule_success";
    }

    @RequestMapping(value = "/importWeeklySche",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String importWeeklySche(HttpServletRequest request) throws ParseException{
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        totalScheduleService.importWeeklySchedule();
        return "importWeeklySche_success";
    }

    @RequestMapping(value = "/TotalScheQuery",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String TotalScheQuery(TotalScheduleQueryBean bean, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        System.out.println(JSONObject.toJSONString(bean));
        bean.setDate(StringUtils.DateQuery(bean.getYear(), bean.getMonth(), bean.getDay()));//日期模糊查询
        bean.setTime(StringUtils.TimeQuery(bean.getDayOfWeek(), bean.getTimeOfDay()));//时间模糊查询
        return JSONObject.toJSONString(totalScheduleService.QueryByContext(bean));
    }

    @RequestMapping("/TeachingLog")
    public String TeachingLog(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        model.addAttribute("TeachingLogInfo", JSONObject.toJSONString(teachingLogService.getTeachingLogInfo()));
        return "admin/TeachingLog";
    }

    @RequestMapping (value = "/ViewTeachingLog",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String ViewTeachingLog(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(teachingLogService.getTeachingLogInfoById(id));
    }

    @RequestMapping("/CheckingIn")
    public String CheckingIn(Model model, HttpServletRequest request) {
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        List<UserAttendanceInfo> stuInfo = userAttendanceService.getStudentAttendanceInfo();
        List<UserAttendanceInfo> teaInfo = userAttendanceService.getTeacherAttendanceInfo();
        model.addAttribute("stuInfo", JSONObject.toJSONString(stuInfo));
        model.addAttribute("teaInfo", JSONObject.toJSONString(teaInfo));
        return "admin/CheckingIn";
    }

    @RequestMapping("/Booking")
    public String Booking(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        List<OpenLabInfoBean> openLabInfo = openScheduleService.getCurrentOpenLabInfo(0);
        model.addAttribute("openLabInfo", JSONObject.toJSONString(openLabInfo));
        return "admin/Booking";
    }

    @RequestMapping("/ReportRepairs")
    public String ReportRepairs(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.redirect;
        model.addAttribute("ReportRepairsInfo", JSONObject.toJSONString(reportRepairService.getReportRepairInfoAll()));
        return "admin/ReportRepairs";
    }

    @RequestMapping(value = "/ViewReportRepair",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String ViewReportRepair(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 3)) return SystemPermission.respondBody;
        return JSONObject.toJSONString(reportRepairService.getReportRepairInfo(id));
    }

}
