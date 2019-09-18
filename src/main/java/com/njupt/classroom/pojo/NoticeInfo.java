package com.njupt.classroom.pojo;


import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

@Scope("prototype") //是否是单例注解,prototype:不是单例,singleton:单例，默认值
@Component
public class NoticeInfo  {

    private int notice_id;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date notice_date;
    private String notice_headline;
    private String notice_content;
    private String notice_details;




    public int getNotice_id() {
        return notice_id;
    }

    public void setNotice_id(int notice_id) {
        this.notice_id = notice_id;
    }

    public Date getNotice_date() {
        return notice_date;
    }

    public void setNotice_date(Date notic_date) {
        this.notice_date = notic_date;
    }

    public String getNotice_headline() {
        return notice_headline;
    }

    public void setNotice_headline(String notice_headline) {
        this.notice_headline = notice_headline;
    }

    public String getNotice_content() {
        return notice_content;
    }

    public void setNotice_content(String notice_content) {
        this.notice_content = notice_content;
    }

    public String getNotice_details() {
        return notice_details;
    }

    public void setNotice_details(String notice_details) {
        this.notice_details = notice_details;
    }

    @Override
    public String toString() {
        return "NoticeInfo{" +
                "notice_id=" + notice_id +
                ", notice_date=" + notice_date +
                ", notice_headline='" + notice_headline + '\'' +
                ", notice_content='" + notice_content + '\'' +
                ", notice_details='" + notice_details + '\'' +
                '}';
    }
}
