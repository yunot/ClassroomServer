package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.TeachAdvice;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TeachAdviceMapper {

    //查看建议
    @Select("select * from teach_advice")
    public List<TeachAdvice> findAll();

    //提交建议
    @Insert("insert into teach_advice (teachId, teacher_name, feedback_type, feedback) values (#{teachId},#{teacher_name},#{feedback_type},#{feedback})")
    public void subAdvice(TeachAdvice advice);
}
