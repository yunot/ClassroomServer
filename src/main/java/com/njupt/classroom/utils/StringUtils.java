package com.njupt.classroom.utils;

/**
 * Created by Vic_Hoo on 2019/4/19.
 */
public class StringUtils {
    /**
    * @auther: Vic
    * @time: 2019/4/19
    *
    * @brief: 输入字符串判断是有效否
    * @param: [string]
    * @return: boolean
    */
    public static boolean isValued(String str){
        if( (str != null) && (str.equals("") != true )) return true;
        else return false;
    }
    /**
    * @auther: Vic
    * @time: 2019/5/9
    *
    * @brief:   年月日模糊筛选条件
    * @param: [year, month, day]
    * @return: java.lang.String
    */
    public static String DateQuery(String year, String month, String day){
        String query = null;//0
        if (isValued(year) && isValued(month) && isValued(day))//7
            query = year + "-" + month + "-" + day;
        if (isValued(year) && isValued(month) && !isValued(day))//6
            query = year + "-" + month + "-%";
        if (isValued(year) && !isValued(month) && isValued(day))//5
            query = year + "-%-" + day;
        if (isValued(year) && !isValued(month) && !isValued(day))//4
            query = year +  "-%";
        if (!isValued(year) && isValued(month) && isValued(day))//3
            query = "%-" + month + "-" + day;
        if (!isValued(year) && isValued(month) && !isValued(day))//2
            query = "%-" + month + "-%";
        if (!isValued(year) && !isValued(month) && isValued(day))//1
            query = "%-" + day;

        return query;
    }
    /**
    * @auther: Vic
    * @time: 2019/5/9
    *
    * @brief: 时间查询参数
    * @param: [dayOfWeek, time]
    * @return: java.lang.String
    */
    public static String TimeQuery(String dayOfWeek, String time){
        String t = null;//0
        if (isValued(dayOfWeek) && isValued(time))//3
            t = dayOfWeek + time;
        if (isValued(dayOfWeek) && !isValued(time))//2
            t = dayOfWeek + "%";
        if (!isValued(dayOfWeek) && isValued(time))//1
            t = "%" + time;
        return t;
    }
    /**
    * @auther: Vic
    * @time: 2019/5/21
    *
    * @brief:   去除字符串末尾的指定字符
    * @param: [str, ch]
    * @return: java.lang.String
    */
    public static String removeEndChar(String str, char ch){
        if ( (str.lastIndexOf(ch) + 1) == str.length() ){
            return str.substring(0, str.length()-1);
        }
        else return str;
    }
}
