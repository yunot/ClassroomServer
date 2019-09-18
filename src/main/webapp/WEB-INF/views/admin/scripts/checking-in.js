/**
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery.js
 *              jquery.dataTable.js
 *              jquery-loading-js
 */

//获取考勤信息
var stuAttendanceList;
var teaAttendanceList;
function showAttendanceInfo(stuInfo, teaInfo){
    $('#myBody').loading('start');
    showStuAttendanceInfo(stuInfo);
    showTeaAttendanceInfo(teaInfo);
    $('#myBody').loading('stop');
}

function showStuAttendanceInfo(data){
    stuAttendanceList = eval('('+data+')');
    for(var i in stuAttendanceList){
        addStuAttendanceRow(stuAttendanceList[i]);
    }
    $('#studentTable').DataTable({
        lengthMenu: [10, 20, 40, 80],//显示选择
        pageLength: 10,//默认选择
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
function showTeaAttendanceInfo(data){
    teaAttendanceList = eval('('+data+')');
    for(var i in teaAttendanceList){
        addTeaAttendanceRow(teaAttendanceList[i]);
    }
    $('#teacherTable').DataTable({
        lengthMenu: [10, 20, 40, 80],//显示选择
        pageLength: 10,//默认选择
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
//插入学生考勤
function addStuAttendanceRow(data){
    var stuTableBody = document.getElementById("stuTableBody");
    var tr = document.createElement("tr");
    var attendanceWeek = document.createElement("td");
    var className = document.createElement("td");
    var classId = document.createElement("td");
    var userName = document.createElement("td");
    var attendanceTime = document.createElement("td");
    var attendanceType = document.createElement("td");
    attendanceWeek.innerHTML = data.attendanceWeek;
    className.innerHTML = data.className;
    classId.innerHTML = data.classId;
    userName.innerHTML = data.userName;
    attendanceTime.innerHTML = getDateTime(data.attendanceTime);
    attendanceType.innerHTML = data.attendanceType;
    tr.appendChild(attendanceWeek);
    tr.appendChild(className);
    tr.appendChild(classId);
    tr.appendChild(userName);
    tr.appendChild(attendanceTime);
    tr.appendChild(attendanceType);
    stuTableBody.appendChild(tr);
}

//插入教师考勤
function addTeaAttendanceRow(data){
    var teaTableBody = document.getElementById("teaTableBody");
    var tr = document.createElement("tr");
    var attendanceWeek = document.createElement("td");
    var className = document.createElement("td");
    var userName = document.createElement("td");
    var attendanceTime = document.createElement("td");
    var attendanceType = document.createElement("td");
    attendanceWeek.innerHTML = data.attendanceWeek;
    className.innerHTML = data.className;
    userName.innerHTML = data.userName;
    attendanceTime.innerHTML = getDateTime(data.attendanceTime);
    attendanceType.innerHTML = data.attendanceType;
    tr.appendChild(attendanceWeek);
    tr.appendChild(className);
    tr.appendChild(userName);
    tr.appendChild(attendanceTime);
    tr.appendChild(attendanceType);
    teaTableBody.appendChild(tr);
}