package com.njupt.classroom.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Vic_Hoo on 2019/5/2.
 */
public class SystemPermission {
    public static String redirect = "redirect:/GoInto";
    public static String respondBody = "Permission Denied";
    /**
    * @auther: Vic
    * @time: 2019/5/2
    *
    * @brief: 验证身份类型，控制访问权限
    * @param: [request, type]
    * @return: boolean
    */
    public static boolean checkIdentity(HttpServletRequest request, Integer type){
        boolean permission = false;
        HttpSession session = request.getSession();
        Integer identity = (Integer)session.getAttribute("userIdentity");
        if (identity != null &&
            identity.equals("") != true){
            //session is valued
            if (identity == type) permission = true;
        }
        return permission;
    }
    
}
