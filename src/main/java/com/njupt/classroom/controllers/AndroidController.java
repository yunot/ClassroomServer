package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.pojo.*;
import com.njupt.classroom.service.*;
import com.njupt.classroom.utils.StringUtils;
import com.njupt.classroom.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;


/**
 * Created by Vic_Hoo on 2019/4/17.
 */
@Controller
@RequestMapping("/android")
public class AndroidController {
    @Resource
    private AndroidService androidService;
    @Resource
    private UserService userService;
    @Resource
    private OpenScheduleService openScheduleService;
    @Resource
    private LabBookingService labBookingService;
    @Resource
    private EnvironmentService environmentService;

    private Logger log = Logger.getLogger(AndroidController.class.getName());

    /**
     * @auther: Vic
     * @time: 2019/4/19
     * @brief: 输入卡号返回持卡人信息
     * @param: [card_id]
     * @return: java.lang.String
     */
    @RequestMapping(value = "/CheckCardIdentity",
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String CheckCardIdentity(String RFID) {
        log.info("【CheckCardIdentity】被请求，RFID=" + RFID);
        if (StringUtils.isValued(RFID)) {
            BaseUserInfo baseUserInfo = androidService.CheckCardId(RFID);
            if (baseUserInfo == null) return "error_user_not_found";//用户不存在

            return JSONObject.toJSONString(baseUserInfo);//成功返回JSON

        } else
            return "error_card_id";//传输参数错误
    }

    /*
     *Android嵌入式客户端首页获取信息的接口
     * 返回信息包括当前课程、上课班级、上课老师、当前学期、当前周次
     *
     * */
    @RequestMapping(value = "getIndexInfo", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getIndexInfo(int LabId) {
        log.info("【getIndexInfo】被请求，LabId=" + LabId);
        try {
            TotalSchedule totalSchedule = androidService.getCurrentCourseByLabId(LabId);
            AndroidIndexInfo androidIndexInfo = new AndroidIndexInfo();
            TimeUtil timeUtil = new TimeUtil();
            //  log.info("课程：" + totalSchedule.getCourseName());
            if (totalSchedule.getCourseName().equals("")) {
                androidIndexInfo.setCourseClass("无");
                androidIndexInfo.setCourseName("无");
                androidIndexInfo.setCourseTeacherName("无");
            } else {
                androidIndexInfo.setCourseClass(totalSchedule.getClassId());
                androidIndexInfo.setCourseName(totalSchedule.getCourseName());
                androidIndexInfo.setCourseTeacherName(totalSchedule.getTeacherName());
            }
            androidIndexInfo.setSemesteName(androidService.getBaseSemesteInfo().getSemesteName());
            androidIndexInfo.setWeekName(timeUtil.getWhatWeek(
                    androidService.getBaseSemesteInfo().getBeginDate()));
            return JSONObject.toJSONString(androidIndexInfo);
        } catch (Exception e) {
            throw e;
            /*log.log(WARNING, e.toString());
            return "request_error";*/
        }
    }

    /*
     *Android嵌入式客户端考勤的接口
     *
     *
     * */
    @RequestMapping(value = "/AttendanceByRFID", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String AttendanceByRFID(int LabId, String RFID) {
        log.info("【AttendanceByRFID】被请求LabId:" + LabId + " & RFID:" + RFID);
        BaseUserInfo baseUserInfo = androidService.CheckCardId(RFID);
        TotalSchedule totalSchedule = androidService.getCurrentCourseByLabId(LabId);

        if (baseUserInfo == null) return "error_user_not_found";//用户不存在

        if (totalSchedule.getCourseName().equals("")) return "error_calss_not_found";//当前实验室没课

        if (totalSchedule.getCourseName().equals("开放实验")) { //开放实验的考勤处理
            log.info("开放实验考勤被请求");
            LabBooking labBooking = new LabBooking();
            labBooking.setUserId(baseUserInfo.getUserId());
           // labBooking.setUserName(baseUserInfo.getUserName());
           // labBooking.setClassId(baseUserInfo.getUserClass());
            labBooking.setBookDate(totalSchedule.getDate());
            labBooking.setBookWeek(totalSchedule.getWeek());
            labBooking.setBookTime(totalSchedule.getTime());
           // labBooking.setBookLabId(totalSchedule.getLabId());
           // labBooking.setBookLabName(totalSchedule.getLabName());
            log.info("查询预约记录labBooking：" + JSONObject.toJSONString(labBooking));
            LabBooking result = labBookingService.getHistory(labBooking);
            log.info("查询出预约记录result：" + JSONObject.toJSONString(result));
            if (result == null) return "error_lab";
            if (!result.getIsAttended()) {
                result.setStartTime(new Date());
                result.setIsAttended(true);
                labBookingService.updateBookingInfo(result);
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("type", "openBookingCome");
                jsonObject.put("data", JSONObject.toJSONString(result));
                return JSONObject.toJSONString(jsonObject);
            } else {
                result.setEndTime(new Date());
                result.setTotalTime(new Date(result.getEndTime().getTime() - result.getStartTime().getTime() - 1000 * 60 * 60 * 8));
                labBookingService.updateBookingInfo(result);
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("type", "openBookingLeave");
                jsonObject.put("data", JSONObject.toJSONString(result));
                return JSONObject.toJSONString(jsonObject);
            }
        }

        if (androidService.isDuplicateAttendance(baseUserInfo.getUserId())) return "error_duplicate_attendance";//重复刷卡

        if (baseUserInfo.getUserIdentity() == 1) { //刷卡用户是老师
            if (baseUserInfo.getUserId().equals(totalSchedule.getTeacherId())) {
                UserAttendanceInfo userAttendanceInfo = new UserAttendanceInfo();
                TimeUtil timeUtil = new TimeUtil();
                userAttendanceInfo.setUserId(baseUserInfo.getUserId());
                userAttendanceInfo.setUserName(baseUserInfo.getUserName());
                userAttendanceInfo.setUserIdentity(1);
                userAttendanceInfo.setClassId(totalSchedule.getClassId());
                userAttendanceInfo.setLabId(LabId);
                userAttendanceInfo.setClassName(totalSchedule.getCourseName());
                userAttendanceInfo.setAttendanceTime(new Date());
                userAttendanceInfo.setAttendanceWeek(timeUtil.getWhatWeek(
                        androidService.getBaseSemesteInfo().getBeginDate()));
                userAttendanceInfo.setAttendanceType(timeUtil.TimeOfClass());

                if (androidService.addUserAttendanceInfo(userAttendanceInfo) != 0) {
                    log.info("老师考勤成功");
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("type", "normalCourse");
                    jsonObject.put("data", JSONObject.toJSONString(userAttendanceInfo));
                    return JSONObject.toJSONString(jsonObject);
                }
            }
            return "error_lab"; //此实验室当前课程没有此用户
        }

        if (baseUserInfo.getUserIdentity() == 2) {  //刷卡用户是学生
            if (baseUserInfo.getUserClass().equals(totalSchedule.getClassId())) {
                UserAttendanceInfo userAttendanceInfo = new UserAttendanceInfo();
                TimeUtil timeUtil = new TimeUtil();
                userAttendanceInfo.setUserId(baseUserInfo.getUserId());
                userAttendanceInfo.setUserName(baseUserInfo.getUserName());
                userAttendanceInfo.setClassId(baseUserInfo.getUserClass());
                userAttendanceInfo.setUserIdentity(2);
                userAttendanceInfo.setLabId(LabId);
                userAttendanceInfo.setClassName(totalSchedule.getCourseName());
                userAttendanceInfo.setAttendanceTime(new Date());
                userAttendanceInfo.setAttendanceWeek(timeUtil.getWhatWeek(
                        androidService.getBaseSemesteInfo().getBeginDate()));
                userAttendanceInfo.setAttendanceType(timeUtil.TimeOfClass());
                if (androidService.addUserAttendanceInfo(userAttendanceInfo) != 0) {
                    log.info("学生考勤成功");
                    JSONObject jsonObject = new JSONObject();
                    jsonObject.put("type", "normalCourse");
                    jsonObject.put("data", JSONObject.toJSONString(userAttendanceInfo));
                    return JSONObject.toJSONString(jsonObject);
                }
            }
            return "error_lab";  //此实验室当前课程没有此用户
        }
        return "request_error";
    }

    /*
     * 设备报修接口
     * */
    @RequestMapping(value = "/ReportRepair", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String ReportRepair(@RequestBody String reportRepairInfo) {
        log.info("【ReportRepair】被请求:" + reportRepairInfo);
        androidService.addReportRepairInfo(JSON.toJavaObject(JSONObject.parseObject(reportRepairInfo), ReportRepairInfo.class));
        return "report_success";
    }

    /*
     * 填写教学日志接口
     * */
    @RequestMapping(value = "/TeachingLog", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String TeachingLog(@RequestBody String teachingLogInfo) {
        log.info("【TeachingLog】被请求:" + teachingLogInfo);
        androidService.addTeachingLogInfo(JSON.toJavaObject(JSONObject.parseObject(teachingLogInfo), TeachingLogInfo.class));
        return "add_success";
    }

    /*
     * 获取当前课程接口
     * */
    @RequestMapping(value = "getCurrentCourseByLabId", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getCurrentCourseByLabId(int LabId) {
        log.info("【getCurrentCourseByLabId】被请求");
        TotalSchedule totalSchedule = androidService.getCurrentCourseByLabId(LabId);
        return JSONObject.toJSONString(totalSchedule);
    }

    /*
     * 获取实验室信息接口
     * */
    @RequestMapping(value = "getLabInfoById", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getLabInfoById(int LabId) {
        log.info("【getLabInfoById】被请求");
        LabManagement labManagement = androidService.getLabInfoById(LabId);
        return JSONObject.toJSONString(labManagement);
    }

    /*
     * 获取可选择的开放实验信息接口
     * */
    @RequestMapping(value = "SelectBooking", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String SelectBooking() {
        log.info("【SelectBooking】被请求");
        List<OpenLabInfoBean> infoBeans = openScheduleService.getCurrentOpenLabInfo(7);
        return JSONObject.toJSONString(infoBeans);
    }

    /*
     * 新增预约记录接口
     * */
    @RequestMapping(value = "/CreateBookingLog", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String CreateBookingLog(@RequestBody String bookingInfo) {
        log.info("【CreateBookingLog】被请求:" + bookingInfo);
        LabBooking booking = JSON.toJavaObject(JSONObject.parseObject(bookingInfo), LabBooking.class);
        if (labBookingService.isBookingRepeated(booking)) return "error_duplicate_book";
        LabBooking bookingRespond = labBookingService.LabBookingByWeb(booking);
        if (bookingRespond != null) {
            if (bookingRespond.getIsBookValued()) {
                return JSONObject.toJSONString(bookingRespond);
            } else return "error_book_book";
        } else return "error_book_book";
    }

    /*
     * 上传环境信息的接口
     * */
    @RequestMapping(value = "EnvInfoUpload", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String EnvInfoUpload(String EnvInfo, String LabInfo) {
        log.info("【EnvInfoUpload】被请求 EnvInfo=" + EnvInfo + "&LabInfo=" + LabInfo);
        EnvironmentInfo environmentInfo = new EnvironmentInfo();
        JSONObject jsonObject = JSONObject.parseObject(LabInfo);
        environmentInfo.setLabId(jsonObject.getInteger("labId"));
        environmentInfo.setLabName(jsonObject.getString("labName"));
        environmentInfo.setEnvTemp(EnvInfo.split(",")[0]);
        environmentInfo.setEnvHumi(EnvInfo.split(",")[1]);
        environmentInfo.setEnvVoc(EnvInfo.split(",")[2]);
        if (EnvInfo.split(",")[3].equals("1")) environmentInfo.setEnvWater(true);
        if (EnvInfo.split(",")[3].equals("0")) environmentInfo.setEnvWater(false);
        if (EnvInfo.split(",")[4].equals("1")) environmentInfo.setEnvFrontDoor(true);
        if (EnvInfo.split(",")[4].equals("0")) environmentInfo.setEnvFrontDoor(false);
        if (EnvInfo.split(",")[5].equals("1")) environmentInfo.setEnvPower(true);
        if (EnvInfo.split(",")[5].equals("0")) environmentInfo.setEnvPower(false);
        if (EnvInfo.split(",")[6].equals("1")) environmentInfo.setEnvVtd(true);
        if (EnvInfo.split(",")[6].equals("0")) environmentInfo.setEnvVtd(false);
        environmentInfo.setEnvInfoTime(new Date());
        environmentService.addEnvironmentInfo(environmentInfo);
        return "add_EnvInfo_success";
    }
}
