package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.Note;
import com.njupt.classroom.pojo.Semester;
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

    //通过id查询学期信息
    @Select("select * from semesters where (user_id) = #{user_id}")
    public List<Semester> getCalendarById(String userId);

    //保存学期信息
    @Insert("insert into semesters (start_day,total_weeks,semester_name,user_id) values(#{start_day},#{total_weeks},#{semester_name},#{user_id})")
    public void saveSemesterInfo(Semester semester);

    //保存工作标签
    @Insert("insert into note (note,create_date,user_id) values(#{note},#{create_date},#{user_id})")
    void saveNote(Note note);


    //查看工作标签
    @Select("select * from note where (user_id) = #{user_id}")
    List<Note> getNoteInfoById(String userId);
}
