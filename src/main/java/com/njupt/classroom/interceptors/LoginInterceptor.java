package com.njupt.classroom.interceptors;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Vic_Hoo on 2019/4/29.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object object)
            throws Exception{

        if (request.getRequestURI().indexOf("login") > 0){
            return true;
        }

        HttpSession session = request.getSession();
        String userName = (String)session.getAttribute("userName");
        if (userName != null){
            return true;
        }

        request.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(request, response);

        return false;
    };

    @Override
    public void postHandle(HttpServletRequest var1,
                           HttpServletResponse var2,
                           Object var3,
                           ModelAndView var4)
            throws Exception{

    };
    @Override
    public void afterCompletion(HttpServletRequest var1,
                                HttpServletResponse var2,
                                Object var3,
                                Exception var4)
            throws Exception{

    };
}
