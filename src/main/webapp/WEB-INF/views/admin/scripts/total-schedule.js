/**
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery-dataTables.js
 */

// 重置总课表
function resetView(){
    $('#resetView').modal('show');
}

var resetYear = document.getElementById("resetYear");
var resetMonth = document.getElementById("resetMonth");
var resetDay = document.getElementById("resetDay");
var resetWeek = document.getElementById("resetWeek");

function resetTotal(){
    checkResetInput();
    $('#myBody').loading('start');
    $.ajax({
        url: getProjectName() + "/admin/resetTotal",
        type: "GET",
        data: {
            date: resetYear.value + "-" + resetMonth.value + "-" + resetDay.value,
            weeks: resetWeek.value
        },
        success: function(data){
            console.log(data);
            $('#myBody').loading('stop');
            showMsgDialog("重置成功了");
        },
        error: function(data, type, error){

        }
    })
}

//检查重置输入
function checkResetInput(){
    if(!checkDate(resetYear.value + "-" +
        resetMonth.value + "-" +
        resetDay.value)){
        showMsgDialog("请输入正确的日期");
        return false;
    }
    if(isNotNumber(resetWeek.value)) {
        showMsgDialog("请输入正确的周次");
        return false;
    }
    return true;
}

//判断日期 2019-5-7格式
function checkDate(str){
    var reg = /^(\d+)-(\d{1,2})-(\d{1,2})$/;
    var r = str.match(reg);
    if(r==null)return false;
    r[2]=r[2]-1;
    var d= new Date(r[1], r[2],r[3]);
    if(d.getFullYear()!=r[1])return false;
    if(d.getMonth()!=r[2])return false;
    if(d.getDate()!=r[3])return false;
    return true;
}

/******* 导入周课表 *******/
function importWeeklySche(){
    $('#myBody').loading('start');
    $.ajax({
        url: getProjectName() + "/admin/importWeeklySche",
        type: "GET",
        success: function(){
            $('#myBody').loading('stop');
            showMsgDialog("导入完成！");
        },
        error: function(){
            $('#myBody').loading('stop');
            showMsgDialog("导入失败！");
        }
    })

}

//周菜单
function WeekSelector(List){
    var list = eval('('+List+')');
    //list = List.replace('[','').replace(']','').split(',');
    var selectWeek = document.getElementById("selectWeek");
    selectWeek.options.add(new Option("周次", "0"));
    for (var i = 0; i < list.length; i++){
        if(isInvalid(list[i])) continue;
        selectWeek.options.add(new Option(list[i], list[i]));
    }
}

//实验室菜单
function LabSelector(List){
    var list = eval('('+List+')');
    //list = List.replace('[','').replace(']','').split(',');
    var selectLab = document.getElementById("selectLab");
    selectLab.options.add(new Option("实验室", "0"));
    for (var i = 0; i < list.length; i++){
        if(isInvalid(list[i])) continue;
        selectLab.options.add(new Option(list[i], list[i]));
    }
}
//课程名称菜单
function courseNameSelector(List){
    var list = eval('('+List+')');
    //list = List.replace('[','').replace(']','').split(',');
    var selectCourseName = document.getElementById("selectCourseName");
    selectCourseName.options.add(new Option("课程名称", "0"));
    for (var i = 0; i < list.length; i++){
        if(isInvalid(list[i])) continue;
        selectCourseName.options.add(new Option(list[i], list[i]));
    }
}
//班级菜单
function classIdSelector(List){
    var list = eval('('+List+')');
    //list = List.replace('[','').replace(']','').split(',');
    var selectClassId = document.getElementById("selectClassId");
    selectClassId.options.add(new Option("班级", "0"));
    for (var i = 0; i < list.length; i++){
        if(isInvalid(list[i])) continue;
        selectClassId.options.add(new Option(list[i], list[i]));
    }
}
//教师菜单
function teacherSelector(List){
    var list = eval('('+List+')');
    //list = List.replace('[','').replace(']','').split(',');
    var selectTeacher = document.getElementById("selectTeacher");
    selectTeacher.options.add(new Option("教师", "0"));
    for (var i = 0; i < list.length; i++){
        if(isInvalid(list[i])) continue;
        selectTeacher.options.add(new Option(list[i], list[i]));
    }
}

//查询面板控制
var searchResult = document.getElementById("searchResult");
function searchResultView(boolean){
    //占用空间
    //if(boolean == true) searchResult.style.visibility = "visible";
    //if(boolean == false) searchResult.style.visibility = "hidden";
    //释放空间
    if(boolean == true) searchResult.style.display = "";
    if(boolean == false) searchResult.style.display = "none";
}

//查询
function QueryContext(userType){
    var url = "";
    if(userType == 3)//管理员
        url = "/admin/TotalScheQuery";
    else if (userType == 1)
        url = "/teacher/TotalScheQuery";
    else return;
    $('#myBody').loading('start');
    var inputYear = document.getElementById("inputYear");
    var inputMonth = document.getElementById("inputMonth");
    var inputDay = document.getElementById("inputDay");
    var selectWeek = document.getElementById("selectWeek");
    var selectDay = document.getElementById("selectDay");
    var selectTime = document.getElementById("selectTime");
    var selectLab = document.getElementById("selectLab");
    var selectCourseType = document.getElementById("selectCourseType");
    var selectCourseName = document.getElementById("selectCourseName");
    var selectClassId = document.getElementById("selectClassId");
    var selectTeacher = document.getElementById("selectTeacher");
    //预处理
    var year_t = null, month_t = null, day_t = null, week_t = null, dayOfWeek_t = null, timeOfDay_t = null,
        labName_t = null, courseType_t = null, courseName_t = null, classId_t = null, teacherName_t = null;
    //判断输入
    if(!isInvalid(inputYear.value)) year_t = inputYear.value.replace(/\s*/g,"");
    if(!isInvalid(inputMonth.value)) month_t = inputMonth.value.replace(/\s*/g,"");
    if(!isInvalid(inputDay.value)) day_t = inputDay.value.replace(/\s*/g,"");
    if(selectWeek.value != "0") week_t = selectWeek.value.replace(/\s*/g,"");
    if(selectDay.value != "0") dayOfWeek_t = selectDay.value.replace(/\s*/g,"");
    if(selectTime.value != "0") timeOfDay_t = selectTime.value.replace(/\s*/g,"");
    if(selectLab.value != "0") labName_t = selectLab.value.replace(/\s*/g,"");
    if(selectCourseType.value != "0") courseType_t = selectCourseType.value.replace(/\s*/g,"");
    if(selectCourseName.value != "0") courseName_t = selectCourseName.value.replace(/\s*/g,"");
    if(selectClassId.value != "0") classId_t = selectClassId.value.replace(/\s*/g,"");
    if(selectTeacher.value != "0") teacherName_t = selectTeacher.value.replace(/\s*/g,"");
    $.ajax({
        url: getProjectName() + url,
        type: "POST",
        data: {
            year: year_t,
            month: month_t,
            day: day_t,
            week: week_t,
            dayOfWeek: dayOfWeek_t,
            timeOfDay: timeOfDay_t,
            labName: labName_t,
            courseType: courseType_t,
            courseName: courseName_t,
            classId: classId_t,
            teacherName: teacherName_t
        },
        success: function(data){
            //var list = eval("("+data+")");
            //console.log(data)
            //showDataTable(eval('('+data+')'));
            //console.log(list);
            loadTotalSchedule(data);
            //createQueryTableBody(list);//建表
            searchResultView(true);//显示


            $('#myBody').loading('stop');
        },
        error: function(data, type, error){
            console.log(error);
            $('#myBody').loading('stop');
        }
    });

}

//清空
function QueryClean(){
    searchResultView(false);
}

//创建表体
function createQueryTableBody(totalList){
    var resultTable = document.getElementById("resultTable");
    var temp = document.getElementById("resultBody");
    if (temp != null && temp != undefined) temp.parentNode.removeChild(temp);
    var body = document.createElement("tbody");
    body.id = "resultBody";
    //表体
    for(var i = 0; i < totalList.length; i++){
        var tr = document.createElement("tr");
        tr.id = totalList[i].key;
        var td_date = document.createElement("td");
        var td_week = document.createElement("td");
        var td_time = document.createElement("td");
        var td_labName = document.createElement("td");
        var td_courseName = document.createElement("td");
        var td_courseTime = document.createElement("td");
        var td_classId = document.createElement("td");
        var td_teacherName = document.createElement("td");
        td_date.innerHTML = getDate(totalList[i].date);
        td_week.innerHTML = totalList[i].week;
        td_time.innerHTML = totalList[i].time;
        td_labName.innerHTML = totalList[i].labName;
        td_courseName.innerHTML = totalList[i].courseName;
        td_courseTime.innerHTML = totalList[i].courseTime;
        td_classId.innerHTML = totalList[i].classId;
        td_teacherName.innerHTML = totalList[i].teacherName;
        tr.appendChild(td_date);
        tr.appendChild(td_week);
        tr.appendChild(td_time);
        tr.appendChild(td_labName);
        tr.appendChild(td_courseName);
        tr.appendChild(td_courseTime);
        tr.appendChild(td_classId);
        tr.appendChild(td_teacherName);
        body.appendChild(tr);
    }
    //end 表体
    resultTable.appendChild(body);
}


//加载表格
function loadTotalSchedule(TotalList){
    var list = eval('('+TotalList+')');
    createQueryTableBody(list);//建表
}

var table;
function showDataTable(){
    var inputYear = document.getElementById("inputYear");
    var inputMonth = document.getElementById("inputMonth");
    var inputDay = document.getElementById("inputDay");
    var selectWeek = document.getElementById("selectWeek");
    var selectDay = document.getElementById("selectDay");
    var selectTime = document.getElementById("selectTime");
    var selectLab = document.getElementById("selectLab");
    var selectCourseType = document.getElementById("selectCourseType");
    var selectCourseName = document.getElementById("selectCourseName");
    var selectClassId = document.getElementById("selectClassId");
    var selectTeacher = document.getElementById("selectTeacher");
    //预处理
    var year_t = null, month_t = null, day_t = null, week_t = null, dayOfWeek_t = null, timeOfDay_t = null,
        labName_t = null, courseType_t = null, courseName_t = null, classId_t = null, teacherName_t = null;
    //判断输入
    if(!isInvalid(inputYear.value)) year_t = inputYear.value.replace(/\s*/g,"");
    if(!isInvalid(inputMonth.value)) month_t = inputMonth.value.replace(/\s*/g,"");
    if(!isInvalid(inputDay.value)) day_t = inputDay.value.replace(/\s*/g,"");
    if(selectWeek.value != "0") week_t = selectWeek.value.replace(/\s*/g,"");
    if(selectDay.value != "0") dayOfWeek_t = selectDay.value.replace(/\s*/g,"");
    if(selectTime.value != "0") timeOfDay_t = selectTime.value.replace(/\s*/g,"");
    if(selectLab.value != "0") labName_t = selectLab.value.replace(/\s*/g,"");
    if(selectCourseType.value != "0") courseType_t = selectCourseType.value.replace(/\s*/g,"");
    if(selectCourseName.value != "0") courseName_t = selectCourseName.value.replace(/\s*/g,"");
    if(selectClassId.value != "0") classId_t = selectClassId.value.replace(/\s*/g,"");
    if(selectTeacher.value != "0") teacherName_t = selectTeacher.value.replace(/\s*/g,"");

    if(table != null && table != undefined){
        table.destroy();//销毁实例
        $('#resultTable').empty();//清空
    }
    //建表并实例化
    table = $('#resultTable').DataTable({
        //建表
        serverSide: true,
        ajax: {
            url: getProjectName() + "/admin/TotalScheQuery",
            type: "POST",
            data: {
                year: year_t,
                month: month_t,
                day: day_t,
                week: week_t,
                dayOfWeek: dayOfWeek_t,
                timeOfDay: timeOfDay_t,
                labName: labName_t,
                courseType: courseType_t,
                courseName: courseName_t,
                classId: classId_t,
                teacherName: teacherName_t
            }
        },
        columns: [
            { data: 'date', title: '日期' },
            { data: 'week', title: '周次' },
            { data: 'time', title: '时间' },
            { data: 'labName',title: '实验室' },
            { data: 'courseName',title: '课程名称' },
            { data: 'courseTime',title: '学时' },
            { data: 'classId',title: '班级' },
            { data: 'teacherName',title: '教师' }
        ],
        lengthMenu: [10, 20, 40, 80],//显示选择
        pageLength: 10,//默认选择
        destroy: true,
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







