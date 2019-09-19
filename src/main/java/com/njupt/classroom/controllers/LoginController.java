package com.njupt.classroom.controllers;

import com.njupt.classroom.pojo.BaseUserInfo;

import com.njupt.classroom.service.UserService;
import com.njupt.classroom.utils.MD5EncodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Vic_Hoo on 2019/4/29.
 */
@Controller
public class LoginController {
    @Resource
    private UserService userService;

    /*
    * @auther: Vic
    * @time: 2019/5/4
    *
    * @brief:   1.点击进入系统，先判断是否已经登录
    *           已经登录则转跳值对应界面
    *           没登录则转去登录
    *
    *           2.登录转跳
    * @param: [request]
    * @return: java.lang.String
    */
    @RequestMapping("/GoInto")
    public String goLogin(HttpServletRequest request){
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String uri = "login/login";
        try {
            switch ((Integer)session.getAttribute("userIdentity")){
                case 1: uri = "redirect:/teacher/TeachingActivity?userId="+userId; break;//教师
                case 2: uri = "redirect:/student/WeeklySchedule"; break;//学生
                case 3: uri = "redirect:/admin/Environment"; break;//管理员
                case 4: uri = "redirect:/safeguard/ReportRepairs"; break;//维护人员
                default: break;
            }
        } catch (Exception e){

        }

        return uri;
    }

    /**
    * @auther: Vic
    * @time: 2019/5/4
    *
    * @brief:   登录验证
    * @param: [userName, password, userIdentity, request]
    * @return: java.lang.String
    */
    @RequestMapping( value = "/Login",
            method = RequestMethod.POST,
            produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String Login(String userId, String password, Integer userIdentity, HttpServletRequest request){
        System.out.println(userId);
        BaseUserInfo userInfo = userService.selectByPrimaryKey(userId);
        if (userInfo!=null){
            String pwd = MD5EncodeUtil.getMD5Code(password);
            if(pwd.equals(userInfo.getUserPassword()) && userInfo.getUserIdentity() == userIdentity ){
                HttpSession session = request.getSession();
                session.setAttribute("userId", userInfo.getUserId());
                session.setAttribute("userName", userInfo.getUserName());
                session.setAttribute("userIdentity", userInfo.getUserIdentity());
                return "login_success";
            }
            else {
                return "login_failed";
            }
        }
        else{
            return "login_failed";
        }

    }

    @RequestMapping("/Quit")
    public String Quit(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("userName");
        session.removeAttribute("userIdentity");
        return "../../index";//WEB-INF
    }


}
