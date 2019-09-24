package com.njupt.classroom.dao;

import com.njupt.classroom.pojo.Note;
import com.njupt.classroom.pojo.Semester;
import com.njupt.classroom.pojo.TeachAdvice;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
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
    @Select("select * from note where (user_id) = #{user_id} limit #{before}, #{after}")
    List<Note> getPagesNoteInfoById(@Param("user_id") String user_id, @Param("before") int before, @Param("after") int after);

    //通过id查找备忘录条数
    @Select("select count(*) from note where (user_id) = #{user_id}")
    int countById(@Param("user_id")String user_id);

    //修改备忘录
    int updateNote(Note note);

    //删除备忘录
    int deleteNote(int id);
}
