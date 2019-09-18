package com.njupt.classroom.utils;

import java.security.MessageDigest;

/**
 * @Author: TangSong
 * @Date: 2019/4/18 17:20
 * @Version 1.0
 */
public class MD5EncodeUtil {
    /*
    * 将info转换成MD5加密后输出
    */
    public static String getMD5Code(String info) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(info.getBytes("UTF-8"));
            byte[] encryption = md5.digest();

            StringBuffer strBuf = new StringBuffer();
            for (int i = 0; i < encryption.length; i++) {
                if (Integer.toHexString(0xff & encryption[i]).length() == 1) {
                    strBuf.append("0").append(
                            Integer.toHexString(0xff & encryption[i]));
                } else {
                    strBuf.append(Integer.toHexString(0xff & encryption[i]));
                }
            }
            return strBuf.toString();
        } catch (Exception e) {
            // TODO: handle exception
            return "";
        }

    }
}
