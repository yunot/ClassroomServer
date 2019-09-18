/**
 * Created by Vic_Hoo on 2019/5/12.
 * PageEncoding: UTF-8
 * dependence: system-content.js
 */

var courseName = document.getElementById("CourseName");
var courseId = document.getElementById("CourseId");
var courseTime = document.getElementById("CourseTime");
var startWeek = document.getElementById("StartWeek");
var stopWeek = document.getElementById("StopWeek");
var saveBtn = document.getElementById("saveBtn");
var deleteBtn = document.getElementById("deleteBtn");
var mainBody = document.getElementById("mainBody");
var otherBody = document.getElementById("otherBody");

//进入界面
function tableShow(tableBody, List){
    if(isInvalid(List)) return;
    var list = eval('('+List+')');
    for(var i = 0; i < list.length; i++){
        trShow(tableBody, list[i]);
    }
}

/*** 添加主要课程 ***/
function addMain(){
    deleteBtn.style.display = "none";
    saveBtn.onclick = saveAddMain;
    $('#CourseView').modal('show');
}

function saveAddMain(){
    checkCourseInput();
    $.ajax({
        url: getProjectName() + "/admin/saveAddMainCourse",
        type: "POST",
        data: {
            courseType: "1",
            courseName: courseName.value.replace(/\s*/g,""),
            courseId: courseId.value.replace(/\s*/g,""),
            courseTime: courseTime.value,
            startWeeks: startWeek.value.replace(/\s*/g,""),
            stopWeeks: stopWeek.value.replace(/\s*/g,"")
        },
        success: function(data){
            addRow(mainBody);
            showMsgDialog(data);
        },
        error: function(data, type, error){

        }
    });
}

/*** 添加其他课程 ***/
function addOther(){
    deleteBtn.style.display = "none";
    saveBtn.onclick = saveAddOther;
    $('#CourseView').modal('show');
}

function saveAddOther(){
    checkCourseInput();
    $.ajax({
        url: getProjectName() + "/admin/saveAddOtherCourse",
        type: "POST",
        data: {
            courseType: "3",
            courseName: courseName.value.replace(/\s*/g,""),
            courseId: courseId.value.replace(/\s*/g,""),
            courseTime: courseTime.value,
            startWeeks: startWeek.value.replace(/\s*/g,""),
            stopWeeks: stopWeek.value.replace(/\s*/g,"")
        },
        success: function(data){
            addRow(otherBody);
            showMsgDialog(data);
        },
        error: function(data, type, error){

        }
    });
}

/** 编辑课程 **/
var editId;//编辑 全局id
function editCourse(id){
    editId = id;
    deleteBtn.style.display = "";
    deleteBtn.onclick = deleteCourse;
    saveBtn.onclick = updateEditCourse;
    $.ajax({
        url: getProjectName() + "/admin/editCourse",
        type: "GET",
        data: {
            id: id
        },
        success: function(data){
            var course = eval('('+data+')');
            console.log(course);
            courseName.value = course.courseName;
            courseId.value = course.courseId;
            courseTime.value = course.courseTime;
            startWeek.value = course.startWeeks;
            stopWeek.value = course.stopWeeks;
            $('#CourseView').modal('show');
        },
        error: function(data, type, error){
            console.log(error);
        }
    });
}

function updateEditCourse(){
    $.ajax({
        url: getProjectName() + "/admin/updateEditCourse",
        type: "POST",
        data: {
            id: editId,
            courseName: courseName.value.replace(/\s*/g,""),
            courseId: courseId.value.replace(/\s*/g,""),
            courseTime: courseTime.value,
            startWeeks: startWeek.value.replace(/\s*/g,""),
            stopWeeks: stopWeek.value.replace(/\s*/g,"")
        },
        success: function(data){
            var td_courseName = document.getElementById("mainCourseName"+editId);
            var td_courseId = document.getElementById("mainCourseId"+editId);
            var td_courseTime = document.getElementById("courseTime"+editId);
            var td_startWeek = document.getElementById("startWeek"+editId);
            var td_stopWeek = document.getElementById("stopWeek"+editId);
            td_courseName.innerHTML = courseName.value.replace(/\s*/g,"");
            td_courseTime.innerHTML = courseTime.value;
            td_courseId.innerHTML = courseId.value.replace(/\s*/g,"");
            td_startWeek.innerHTML = startWeek.value.replace(/\s*/g,"");
            td_stopWeek.innerHTML = stopWeek.value.replace(/\s*/g,"");
            showMsgDialog("修改成功");
        },
        error: function(data, type, error){
            console.log(error);
        }
    })
}

function deleteCourse(){
    $.ajax({
        url: getProjectName() + "/admin/saveDeleteCourse",
        type: "GET",
        data: {
            id: editId
        },
        success: function(data){
            var tr = document.getElementById(editId);
            tr.parentNode.removeChild(tr);
            showMsgDialog(data);
        },
        error: function(){

        }
    })
}



//输入判断
function checkCourseInput(){
    if(isInvalid(courseName.value)) {
        showMsgDialog("请输入课程名称");
        return false;
    }
    if(isInvalid(courseId.value)) {
        showMsgDialog("请输入课程编号");
        return false;
    }
    if(isNaN(courseTime.value)) {
        showMsgDialog("请用数字输入学时");
        return false;
    }
    if(isInvalid(startWeek.value)) {
        showMsgDialog("请输入开课周");
        return false;
    }
}

//插入一行课程
function addRow(tableBody){
    var tr = document.createElement("tr");
    var td_courseName = document.createElement("td");
    var td_courseId = document.createElement("td");
    var td_courseTime = document.createElement("td");
    var td_startWeek = document.createElement("td");
    var td_stopWeek = document.createElement("td");
    td_courseName.innerHTML = courseName.value.replace(/\s*/g,"");
    td_courseId.innerHTML = courseId.value.replace(/\s*/g,"");
    td_courseTime.innerHTML = courseTime.value;
    td_startWeek.innerHTML = startWeek.value.replace(/\s*/g,"");
    td_stopWeek.innerHTML = stopWeek.value.replace(/\s*/g,"");
    tr.appendChild(td_courseName);
    tr.appendChild(td_courseId);
    tr.appendChild(td_courseTime);
    tr.appendChild(td_startWeek);
    tr.appendChild(td_stopWeek);
    tableBody.appendChild(tr);
}

//插入一行课程
function trShow(tableBody, data){
    var tr = document.createElement("tr");
    var id = data.id;
    tr.id = id;
    tr.onclick = function(){editCourse(id)};
    var td_courseName = document.createElement("td");
    td_courseName.id = "mainCourseName" + id;
    var td_courseId = document.createElement("td");
    td_courseId.id = "mainCourseId" + id;
    var td_courseTime = document.createElement("td");
    td_courseTime.id = "courseTime" + id;
    var td_startWeek = document.createElement("td");
    td_startWeek.id = "startWeek" + id;
    var td_stopWeek = document.createElement("td");
    td_stopWeek.id = "stopWeek" + id;
    td_courseName.innerHTML = data.courseName.replace(/\s*/g,"");
    td_courseId.innerHTML = data.courseId.replace(/\s*/g,"");
    td_courseTime.innerHTML = data.courseTime;
    td_startWeek.innerHTML = data.startWeeks.replace(/\s*/g,"");
    td_stopWeek.innerHTML = data.stopWeeks.replace(/\s*/g,"");
    tr.appendChild(td_courseName);
    tr.appendChild(td_courseId);
    tr.appendChild(td_courseTime);
    tr.appendChild(td_startWeek);
    tr.appendChild(td_stopWeek);
    tableBody.appendChild(tr);
}
