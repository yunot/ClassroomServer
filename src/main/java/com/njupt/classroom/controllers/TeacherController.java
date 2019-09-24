package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
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
import org.apache.ibatis.annotations.Param;
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
import java.text.SimpleDateFormat;
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
    @Resource
    private UserService userService;



    @RequestMapping("/TeachingActivity")
    public String WeeklySchedule(String userId,Model model, HttpServletRequest request,
                                 @RequestParam(name = "page",required = true,defaultValue = "1")int page,
                                 @RequestParam(name = "size",required = true,defaultValue = "2")int size){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.redirect;

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        List<Semester> calendar = teacherService.getCalendarById(userId);
        Semester se =  calendar.get(calendar.size()-1);
        model.addAttribute("calendar", calendar);
        model.addAttribute("weeks",se.getTotal_weeks());
        Date date = se.getStart_day();
        String dateFormat = sdf.format(date);
        model.addAttribute("startDay",dateFormat);
        model.addAttribute("semName",se.getSemester_name());

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


    /**
     * 更改校历
     */
    @RequestMapping (value = "/saveCalendar",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveAddMainCourse(Semester semester, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.respondBody;
        teacherService.saveSemesterInfo(semester);
        return "更改成功";
    }

    /**
     * 添加工作标签
     */
    @RequestMapping (value = "/saveNote",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String saveNote(Note note,HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.respondBody;
        teacherService.saveNote(note);
        return "添加成功";
    }


    /**
     *通过id查看工作标签
     */
    @RequestMapping("/getNote")
    public String getNote(){
        return "teacher/memorandum";
    }

    @RequestMapping( value = "/getNoteById",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String GetNoteById(@Param("userId")String userId, int page, int limit){
        int before = limit * (page - 1);
        List<Note> noteList = teacherService.getPagesNoteInfoById(userId,before,limit);
        int count = teacherService.countById(userId);
        String jsonObject = JSONObject.toJSONString(noteList);
        String note = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+jsonObject+"}";
        return note;
    }

    @RequestMapping( value = "/GetUserInfo",
            method = RequestMethod.GET,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String GetUserInfo(String userId, HttpServletRequest request){
        if (!SystemPermission.checkIdentity(request, 1)) return SystemPermission.respondBody;
        BaseUserInfo userInfo = userService.selectByPrimaryKey(userId);
        userInfo.setUserPassword("");
        return JSONObject.toJSONString(userInfo);
    }

    @RequestMapping (value = "/updateNote",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public void updateNote(Note note){
        teacherService.updateNote(note);
    }

    @RequestMapping (value = "/deleteNote",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public void deleteNote(int id){
        teacherService.deleteNote(id);
    }



}


