package com.njupt.classroom.controllers;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.pojo.BaseUserInfo;
import com.njupt.classroom.pojo.LabBooking;
import com.njupt.classroom.service.EnvironmentService;
import com.njupt.classroom.service.LabBookingService;
import com.njupt.classroom.service.OpenScheduleService;
import com.njupt.classroom.service.UserService;
import com.njupt.classroom.utils.MD5EncodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Logger;

/**
 * @Author: TangSong
 * @Date: 2019/4/17 20:02
 * @Version 1.0
 */

@Controller()
@RequestMapping("/wechat")
public class WechatController {

    @Resource
    UserService userService;
    @Resource
    private LabBookingService labBookingService;
    @Resource
    private OpenScheduleService openScheduleService;

    private Logger log = Logger.getLogger(AndroidController.class.getName());


    @RequestMapping(value = "/WechatLogin", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String WechatLogin(String userId , String psw) {
        try {
            //查询此用户是否存在，若存在则继续判断密码
            BaseUserInfo baseUserInfo = userService.selectByPrimaryKey(userId);
            if ((baseUserInfo != null)) {
                if (MD5EncodeUtil.getMD5Code(psw).equals(baseUserInfo.getUserPassword()))
                    return JSONObject.toJSONString(baseUserInfo); //返回用户基础信息
                else return "error_user_400"; //密码错误
            } else return "error_user_404";  //用户不存在
        } catch (Exception e) {
            e.printStackTrace();
            return "error_user_500";
        }
    }

    /*
     * 获取可选择的开放实验信息接口
     * */
    @RequestMapping(value = "SelectBooking", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String SelectBooking() {
        log.info("【SelectBooking】被请求");
        List<OpenLabInfoBean> infoBeans = openScheduleService.getCurrentOpenLabInfo(10);
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

}
