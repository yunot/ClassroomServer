package com.njupt.classroom.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
public class UploadController {

    @RequestMapping(value = "/savePic", method = RequestMethod.POST)
    public void saveHeaderPic(@RequestParam("file") CommonsMultipartFile file, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

        String resMsg = "";
        try {

            long  startTime=System.currentTimeMillis();
            System.out.println("fileName："+file.getOriginalFilename());
            //传到服务器里
            String path=request.getSession().getServletContext().getRealPath("/")+"WEB-INF\\views\\teacher\\images\\"+file.getOriginalFilename();
            //String path="C:\\Users\\YUNO\\Documents\\Tencent Files\\1403865996\\FileRecv\\ClassroomServer\\src\\main\\webapp\\WEB-INF\\views\\teacher\\images"/*+new Date().getTime()*/+file.getOriginalFilename();
            System.out.println("path:" + path);

            File newFile=new File(path);
            //通过CommonsMultipartFile的方法直接写文件
            file.transferTo(newFile);
            long  endTime=System.currentTimeMillis();
            System.out.println("运行时间："+String.valueOf(endTime-startTime)+"ms");
            resMsg = "success";
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            resMsg = "0";
        }
        response.getWriter().write(resMsg);

    }

}