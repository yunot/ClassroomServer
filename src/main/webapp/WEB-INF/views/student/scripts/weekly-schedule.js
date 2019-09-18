/**
 * PageEncoding: UTF-8
 * dependence: system-content.js
 *              jquery.js
 */

/****************************主要课程********************************/

//创建周课表表格
function createWeeklyScheduleHead(){
    var wsTable = document.getElementById("wsTable");
    var thead = document.createElement("thead");
    //表头
    var tr = document.createElement("tr");
    var th0 = document.createElement("th");
    th0.innerHTML = "时间";
    tr.appendChild(th0);
    for (var i = 0; i < mainLabInfo.length; i++){
        var th = document.createElement("th");
        th.innerHTML =  mainLabInfo[i].labName;
        tr.appendChild(th);
    }
    thead.appendChild(tr);
    wsTable.appendChild(thead);
    //表体
    var tbody = document.createElement("tbody");
    tbody.id = "wsTableBody";
    wsTable.appendChild(tbody);
}

//创建表体
function createWeeklyScheduleTr(trHeadText, trMsg){
    var wsTableBody = document.getElementById("wsTableBody");
    var tr = document.createElement("tr");
    var th0 = document.createElement("th");//第一列
    th0.innerHTML = trHeadText;
    if(trHeadText.indexOf("晚上")>0){
        tr.classList.add("bg-light");
    }
    tr.appendChild(th0);
    var wsJsonList = eval(trMsg);
    //console.log(wsJsonList);
    //console.log("len:"+ wsJsonList.length);
    for(var i = 0; i < wsJsonList.length; i++){
        var td = document.createElement("td");
        td.id = wsJsonList[i].id;
        td.innerHTML = wsJsonList[i].courseName + "<br>" +wsJsonList[i].teacherName + "<br>" + wsJsonList[i].classId;
        tr.appendChild(td);//添加到tr行
    }
    wsTableBody.appendChild(tr);
}

//主要实验室信息
var mainLabInfo;
function getMainLabInfo(mainLabData){
    mainLabInfo = eval('('+mainLabData+')');
    //console.log(mainLabInfo);
}

/**************************** end主要课程 ***************************/

/****************************开放实验********************************/
var openLabBody = document.getElementById("openLabBody");
var openTeacher = document.getElementById("OpenTeacher");
var openWeek = document.getElementById("OpenWeek");
var openDay = document.getElementById("OpenDay");
var openTime = document.getElementById("OpenTime");

var openStartWeeksOld;
var openTimeOld;

/*****实验室选择顺序******/
var openLabOrder = 0;

//列表展示
function showOpenLab(openList){
    var jsonObject = eval('('+openList+')');
    //console.log(jsonObject)
    var openLabBody = document.getElementById("openLabBody");
    for(var i = 0; i < jsonObject.length; i++){
        openLabBody.appendChild(createOpenLabRow(jsonObject[i]));
    }
}


//创建行
function createOpenLabRow(data){
    var tr = document.createElement("tr");
    var openWeek = document.createElement("td");
    var openTime = document.createElement("td");
    var openLab = document.createElement("td");
    var openTeacher = document.createElement("td");
    openWeek.innerHTML = data.openWeek;
    openTime.innerHTML = data.openTime;
    openLab.innerHTML = data.openLabNameOrder;
    openTeacher.innerHTML = data.openTeacherName;
    tr.appendChild(openWeek);
    tr.appendChild(openTime);
    tr.appendChild(openLab);
    tr.appendChild(openTeacher);
    return tr;
}

/****************************end 开放实验********************************/


/***************************其他课程***************************/




/************************* end 其他课程************************/


/***********************其他功能函数**********************/


