package com.njupt.classroom.service;

import com.njupt.classroom.beans.OpenLabInfoBean;
import com.njupt.classroom.pojo.OpenSchedule;

import java.util.Date;
import java.util.List;

/**
 * Created by Vic_Hoo on 2019/5/21.
 */
public interface OpenScheduleService {

    /**
    * @auther: Vic
    * @time: 2019/5/23
    *
    * @brief: 根据Id获取原始数据
    * @param: [id]
    * @return: com.njupt.classroom.pojo.OpenSchedule
    */
    OpenSchedule getOpenSchedule(Integer id);

    /**
    * @auther: Vic
    * @time: 2019/5/23
    *
    * @brief: 根据Id获取处理后的数据
    * @param: [id]
    * @return: com.njupt.classroom.beans.OpenLabInfoBean
    */
    OpenLabInfoBean getOpenLabInfoBean(Integer id);

    /**
     * @auther: Vic
     * @time: 2019/5/23
     *
     * @brief: 根据限制来获取当前开放安排。0表示全部，大于0表示限制数量
     * @param: [limit]
     * @return: java.util.List<com.njupt.classroom.pojo.OpenSchedule>
     */
    List<OpenSchedule> getCurrentOpenSchedule(Integer limit);

    /**
    * @auther: Vic
    * @time: 2019/5/23
    *
    * @brief: 获取人数处理后的开发信息
    * @param: [limit]
    * @return: java.util.List<com.njupt.classroom.beans.OpenLabInfoBean>
    */
    List<OpenLabInfoBean> getCurrentOpenLabInfo(Integer limit);

}
