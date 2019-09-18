/**
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery-dataTables.js
 */

var teachingLogBody = document.getElementById("TeachingLogBody");


function addTeachingLogRow(data){
    var tr = document.createElement("tr");
    tr.id = data.id;
    var td_date = document.createElement("td");
    var td_time = document.createElement("td");
    var td_lab = document.createElement("td");
    var td_courseName = document.createElement("td");
    var td_courseHour = document.createElement("td");//学时
    var td_classId = document.createElement("td");
    var td_classUser = document.createElement("td");
    var td_safe = document.createElement("td");
    var td_env = document.createElement("td");
    var td_teacher = document.createElement("td");
    td_date.innerHTML = getDate(data.courseDate);
    td_time.innerHTML = data.courseTimeOfDay;//时间段
    td_lab.innerHTML = data.courseLabName;
    td_courseName.innerHTML = data.courseName;
    td_courseHour.innerHTML = data.courseClassHour;//学时
    td_classId.innerHTML = data.classId;
    td_classUser.innerHTML = data.classUserNum;
    td_safe.innerHTML = data.courseSafeInfo;
    td_env.innerHTML = data.courseEnvInfo;
    td_teacher.innerHTML = data.teacherName;
    tr.appendChild(td_date);
    tr.appendChild(td_time);
    tr.appendChild(td_lab);
    tr.appendChild(td_courseName);
    tr.appendChild(td_courseHour);
    tr.appendChild(td_classId);
    tr.appendChild(td_classUser);
    tr.appendChild(td_safe);
    tr.appendChild(td_env);
    tr.appendChild(td_teacher);
    teachingLogBody.appendChild(tr);
}

//解析后端数据并添加表格
function teachingLogShow(List){
    var list = eval('('+List+')');
    for(var i = 0; i < list.length; i++){
        addTeachingLogRow(list[i]);
    }
    $('#logTable').DataTable({
        lengthMenu: [10, 20, 40, 80],//显示选择
        pageLength: 10,//默认选择
        //界面语言
        language: {
            "decimal":        "",
            "emptyTable":     "表中没有可用数据",
            "info":           "显示 _START_ 到 _END_ 项  共 _TOTAL_ 项",
            "infoEmpty":      "显示 0 到 0 项  共 0 项",
            "infoFiltered":   "(从 _MAX_ 项中筛选)",
            "infoPostFix":    "",
            "thousands":      ",",
            "lengthMenu":     "每页显示 _MENU_ 项",
            "loadingRecords": "加载中...",
            "processing":     "处理中...",
            "search":         "查询:",
            "zeroRecords":    "没有找到匹配的记录",
            "paginate": {
                "first":      "首页",
                "last":       "末页",
                "next":       "下页",
                "previous":   "上页"
            },
            "aria": {
                "sortAscending":  ": 以升序排序此列",
                "sortDescending": ": 以降序排序此列"
            }
        }
    });
}

//日志详情
var editId;
function getLogDetail(id, userType){
    editId = id;
    var url;
    if(userType == 1)//teacher
        url = getProjectName() + "/teacher/ViewTeachingLog";
    else if(userType == 3)//admin
        url = getProjectName() + "/admin/ViewTeachingLog";
    else
        return;
    $.ajax({
        url: url,
        type: "GET",
        data: {
            id: id
        },
        success: function(data){
            console.log(data);
            var dataObject = eval('('+data+')');
            console.log(dataObject);
            analysisData(dataObject);
        },
        error: function(){

        }
    })
}

//解析数据
function analysisData(data){
    var LogDate = document.getElementById("LogDate");
    var LogWeek = document.getElementById("LogWeek");
    var LogDayOfWeek = document.getElementById("LogDayOfWeek");
    var LogTimeOfDay = document.getElementById("LogTimeOfDay");
    var LogLabName = document.getElementById("LogLabName");
    var LogCourseName = document.getElementById("LogCourseName");
    var LogCourseHour = document.getElementById("LogCourseHour");
    var LogTeacherId = document.getElementById("LogTeacherId");
    var LogTeacherName = document.getElementById("LogTeacherName");
    var LogClassId = document.getElementById("LogClassId");
    var LogClassUser = document.getElementById("LogClassUser");
    var LogSafe = document.getElementById("LogSafe");
    var LogEnv = document.getElementById("LogEnv");
    var LogContent = document.getElementById("LogContent");
    var LogRemark = document.getElementById("LogRemark");
    LogDate.innerHTML = getDate(data.courseDate);
    LogWeek.innerHTML = data.courseWeek;
    LogDayOfWeek.innerHTML = data.courseDayOfWeek;
    LogTimeOfDay.innerHTML = data.courseTimeOfDay;
    LogLabName.innerHTML = data.courseLabName;
    LogCourseName.innerHTML = data.courseName;
    LogCourseHour.innerHTML = data.courseClassHour;
    LogTeacherId.innerHTML = data.teacherId;
    LogTeacherName.innerHTML = data.teacherName;
    LogClassId.innerHTML = data.classId;
    LogClassUser.value = data.classUserNum;
    LogSafe.value = data.courseSafeInfo;
    LogEnv.value = data.courseEnvInfo;
    LogContent.value = data.courseContent;
    LogRemark.value = data.remarks;
}
