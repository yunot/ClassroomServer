package com.njupt.classroom.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Author: TangSong
 * @Date: 2019/5/8 15:52
 * @Version 1.0
 * @describe 时间段的判断工具
 */
public class TimeUtil {

    /*
     * 计算当前时间在一天中的时间段
     * */
    public String TimeOfDay() {
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("HH");
        String time = df.format(date);
        int hour = Integer.parseInt(time);
        if (hour >= 0 && hour < 12) {
            return ("上午");
        }
        if (hour >= 12 && hour < 18) {
            return ("下午");
        }
        if (hour >= 18 && hour < 24) {
            return ("晚上");
        }
        return "";
    }

    /*
     * 计算当前课程段
     * */
    public String TimeOfClass() {
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("HH:mm");
        String time = df.format(date);
        float timeNum = Float.parseFloat(time.split(":")[0])
                + Float.parseFloat(time.split(":")[1]) / 60;
        if ((timeNum >= 7.5 && timeNum < 8) || (timeNum >= 13.5 && timeNum < 14.0)) {
            return ("正常");//正常考勤
        }
        if ((timeNum >= 8.0 && timeNum < 8.5) || (timeNum >= 14.0 && timeNum < 14.5)) {
            return ("迟到");//迟到考勤
        }
        return "旷课";//旷课考勤
    }

    /*
     * 传入开学日期计算当前周次
     *
     */
    public String getWhatWeek(Date semesterBegin) {
        Calendar aCalendar = Calendar.getInstance();
        aCalendar.setTime(semesterBegin);
        int day1 = aCalendar.get(Calendar.DAY_OF_YEAR);
        aCalendar.setTime(new Date());
        int day2 = aCalendar.get(Calendar.DAY_OF_YEAR);
        int days = (day2 - day1) / 7 + 1;
        switch (days) {
            case 1:
                return "第一周";
            case 2:
                return "第二周";
            case 3:
                return "第三周";
            case 4:
                return "第四周";
            case 5:
                return "第五周";
            case 6:
                return "第六周";
            case 7:
                return "第七周";
            case 8:
                return "第八周";
            case 9:
                return "第九周";
            case 10:
                return "第十周";
            case 11:
                return "第十一周";
            case 12:
                return "第十二周";
            case 13:
                return "第十三周";
            case 14:
                return "第十四周";
            case 15:
                return "第十五周";
            case 16:
                return "第十六周";
            case 17:
                return "第十七周";
            case 18:
                return "第十八周";
            case 19:
                return "第十九周";
            case 20:
                return "第二十周";
            default:
                return "学期已结束";
        }
    }

    public String DayOfWeekEN2CH(String DayOfWeekEN) {
        switch (DayOfWeekEN) {
            case "Monday":
                return "星期一";
            case "Tuesday":
                return "星期二";
            case "Wednesday":
                return "星期三";
            case "Thursday":
                return "星期四";
            case "Friday":
                return "星期五";
            case "Saturday":
                return "星期六";
            case "Sunday":
                return "星期日";
            case "星期一":
                return "星期一";
            case "星期二":
                return "星期二";
            case "星期三":
                return "星期三";
            case "星期四":
                return "星期四";
            case "星期五":
                return "星期五";
            case "星期六":
                return "星期六";
            case "星期日":
                return "星期日";
            default:
                return "";
        }
    }
}
