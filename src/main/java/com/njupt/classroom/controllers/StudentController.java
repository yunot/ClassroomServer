package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSONObject;
import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.beans.WeeklyScheduleBean;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.LabBookingService;
import com.njupt.classroom.service.OpenScheduleService;
import com.njupt.classroom.service.UserService;
import com.njupt.classroom.service.WeeklyScheduleService;
import com.njupt.classroom.utils.StringUtils;
import com.njupt.classroom.utils.SystemPermission;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/1.
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Resource
    private WeeklyScheduleService weeklyScheduleService;
    @Resource
    private OpenScheduleService openScheduleService;
    @Resource
    private LabBookingService labBookingService;
    @Resource
    private UserService userService;

    @RequestMapping("/WeeklySchedule")
    public String teacherWeeklySche(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 2)) return SystemPermission.redirect;
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
        return "student/WeeklySchedule";
    }

    @RequestMapping (value = "/ViewWeeklySchedule",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String ViewWeeklySchedule(Integer id, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 2)) return SystemPermission.respondBody;
        System.out.println(id);
        WeeklyScheduleAdd weeklyScheduleAdd = weeklyScheduleService.GetWeeklyScheduleAddById(id);
        return JSONObject.toJSONString(weeklyScheduleAdd);
    }

    @RequestMapping("/Booking")
    public String Booking(Model model, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 2)) return SystemPermission.redirect;
        List<OpenLabInfoBean> infoBeans = openScheduleService.getCurrentOpenLabInfo(7);
        HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        if (StringUtils.isValued(userId)){
            List<LabBooking> bookHistory = labBookingService.getUserBookingHistory(userId, 0);
            model.addAttribute("bookHistory", JSONObject.toJSONString(bookHistory));
        }
        model.addAttribute("openLabInfo", JSONObject.toJSONString(infoBeans));

        return "student/Booking";
    }

    @RequestMapping( value = "/iBooking",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String iBooking(LabBooking booking, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 2)) return SystemPermission.respondBody;
        //System.out.println(JSONObject.toJSONString(booking));
        if (labBookingService.isBookingRepeated(booking)) return "iBooking_repeated";
        LabBooking bookingRespond = labBookingService.LabBookingByWeb(booking);
        if (bookingRespond!=null){
            if (bookingRespond.getIsBookValued()){
                return JSONObject.toJSONString(bookingRespond);
            }
            else return "iBooking_failed";
        } else return "iBooking_failed";

    }

    @RequestMapping( value = "/bookingUpdateHistory",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String bookingUpdateHistory(String userId, Integer openScheduleId, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 2)) return SystemPermission.respondBody;
        LabBooking booking = new LabBooking();
        booking.setUserId(userId);
        booking.setOpenScheduleId(openScheduleId);
        return JSONObject.toJSONString(labBookingService.getHistory(booking));
    }

    @RequestMapping( value = "/GetUserInfo",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String GetUserInfo(String userId, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 2)) return SystemPermission.respondBody;
        BaseUserInfo userInfo = userService.selectByPrimaryKey(userId);
        userInfo.setUserPassword("");
        return JSONObject.toJSONString(userInfo);
    }
}
