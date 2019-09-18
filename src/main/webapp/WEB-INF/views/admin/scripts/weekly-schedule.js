/**
 * PageEncoding: UTF-8
 * dependence: system-content.js
 *              jquery.js
 */

/****************************主要课程********************************/
/** 编辑框设计 **/
var editId = document.getElementById("editId");
var mainCourseTime = document.getElementById("mainCourseTime");//时间段
var mainCourseLabName = document.getElementById("mainCourseLabName");
var mainCourseName = document.getElementById("mainCourseName");
var mainCourseId = document.getElementById("mainCourseId");
var mainCourseTeacher = document.getElementById("mainCourseTeacher");
var mainCourseClass = document.getElementById("mainCourseClass");
var mainCourseStart = document.getElementById("mainCourseStart");
var mainCourseEnd = document.getElementById("mainCourseEnd");
var mainTimeHour = document.getElementById("mainTimeHour");//学时



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
        td.classList.add("td-hover");
        td.id = wsJsonList[i].id;
        td.onclick = function edit (event){
            var td = event.srcElement;
            editView(td.id)
        };
        td.innerHTML = wsJsonList[i].courseName + "<br>" +wsJsonList[i].teacherName + "<br>" + wsJsonList[i].classId;
        tr.appendChild(td);//添加到tr行
    }
    wsTableBody.appendChild(tr);
}


function editView(id){
    editId.innerHTML = id;
    $('#myBody').loading('start');
    $.ajax({
        url: getProjectName() + "/admin/EditWeeklySchedule?id="+id,
        type: "GET",
        success: function(dataa){
            var data = eval('('+dataa+')');
            //console.log(data);
            mainCourseTime.innerHTML = data.time;
            mainCourseLabName.innerHTML = data.labName;
            for(var i = 0; i < mainCourseName.options.length; i++){
                console.log("option: " + mainCourseName.options[i].text + " courseName: " + data.courseName);
                if(mainCourseName.options[i].text == removeBlank(data.courseName) ){
                    mainCourseName.options[i].selected = true; break;
                }else{
                    mainCourseName.options[i].selected = false;
                }
            }
            mainCourseId.innerHTML = data.courseId;
            mainCourseClass.value = data.classId;
            mainCourseStart.innerHTML = data.startWeeks;
            mainCourseEnd.innerHTML = data.stopWeeks;
            mainTimeHour.innerHTML = data.courseTime;
            for(var i = 0; i < mainCourseTeacher.options.length; i++){
                //console.log("options:" + mainCourseTeacher.options[i].value + ", teacherId:" + data.teacherId);
                if(mainCourseTeacher.options[i].value == data.teacherId){
                    mainCourseTeacher.options[i].selected = true;
                    break;
                }else{
                    mainCourseTeacher.options[i].selected = false;
                }
            }
            $('#myBody').loading('stop');
            $('#editWeeklySche').modal('show');
        },
        cache: false,
        timeout: 10000,//10*1000ms
        error: function(){

        }
    });
}

function saveWeeklySche() {
    var input = checkMainInput();//先运行checkMainInput，让消息框弹出
    if(input == false) return;
    else{
        $('#myBody').loading('start');
        $.ajax({
            url: getProjectName() + "/admin/saveWeeklySche",
            type: "POST",
            data: {
                id: editId.innerHTML,
                courseId: mainCourseId.innerHTML,
                courseType: 1,
                time: mainCourseTime.innerHTML,
                startWeeks: mainCourseStart.innerHTML,
                stopWeeks: mainCourseEnd.innerHTML,
                courseName: getMainCourseName(mainCourseName.value),
                courseTime: mainTimeHour.innerHTML,
                classId: mainCourseClass.value,
                teacherId: mainCourseTeacher.value,
                labId: getMainLabId(mainCourseLabName.innerHTML)
            },
            success: function(data){
                //console.log(data);
                var tdModified = document.getElementById(editId.innerHTML);
                tdModified.innerHTML = getMainCourseName(mainCourseName.value) + "<br>" + getTeacherName(mainCourseTeacher.value) + "<br>" + mainCourseClass.value;
                $('#myBody').loading('stop');
            },
            error: function(){

            }
        });
    }
}

//主要实验室信息
var mainLabInfo;
function getMainLabInfo(mainLabData){
    mainLabInfo = eval('('+mainLabData+')');
    console.log(mainLabInfo);
}

//获取主要实验室id
function getMainLabId(labName){
    var labId = 0;
    for(var i = 0; i < mainLabInfo.length; i++){
        if(labName == mainLabInfo[i].labName){
            labId = mainLabInfo[i].labId;
            break;
        }
    }
    return labId;
}

//主要课程信息下拉列表
var mainCourseList;
function createMainCourseSelect(mainCourse){
    mainCourseList = eval('('+mainCourse+')');
    //console.log(mainCourseList);
    mainCourseName.options.add(new Option("请选择课程名称", "0"));
    for(var i = 0; i < mainCourseList.length; i++){
        mainCourseName.options.add(new Option( removeBlank(mainCourseList[i].courseName), mainCourseList[i].id));
    }
    mainCourseName.addEventListener("change", function(){mainCourseSelect()});
}

//通过课程编号获取课程id号码
function getMainCourseId(courseId){
    var id = "0";
    for(var i = 0; i < mainCourseList.length; i++){
        if(courseId == mainCourseList[i].courseId){
            id = mainCourseList[i].id;
            break;
        }
    }
    return id;
}
//通过课程id获取课程名称
function getMainCourseName(id){
    var courseName = "";
    for(var i = 0; i < mainCourseList.length; i++){
        if(id == mainCourseList[i].id){
            courseName = mainCourseList[i].courseName;
            break;
        }
    }
    return courseName;
}

//自动填充课程信息
function mainCourseSelect(){
    var id = mainCourseName.value;
    if( id == 0 ){
        mainCourseId.innerHTML = '';
        mainCourseStart.innerHTML = '';
        mainCourseEnd.innerHTML = '';
        mainTimeHour.innerHTML = 0;
    }
    else{
        for(var i = 0; i < mainCourseList.length; i++){
            if(id == mainCourseList[i].id){
                mainCourseId.innerHTML = mainCourseList[i].courseId;
                mainCourseStart.innerHTML = mainCourseList[i].startWeeks;
                mainCourseEnd.innerHTML = mainCourseList[i].stopWeeks;
                mainTimeHour.innerHTML = mainCourseList[i].courseTime;
                break;
            }
        }
    }
}

//检查输入
function checkMainInput(){
    if(mainCourseName.value == "0"){
        showMsgDialog("请选择课程名称");
        return false;
    }
    if(mainCourseTeacher.value == "0"){
        showMsgDialog("请选择任课教师");
        return false;
    }
    if(isInvalid(mainCourseClass.value)){
        showMsgDialog("请输入上课班级");
        return false;
    }
    return true;
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
    var id = data.id;
    tr.id = "OpenLab"+id;//加上前缀防止重复
    tr.onclick = function(){viewOpenLabSchedule(id)};//直接传id
    var openWeek = document.createElement("td");
    var openTime = document.createElement("td");
    var openDate = document.createElement("td");
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

//查看一条实验室开放信息
function viewOpenLabSchedule(id){
    //传的是无前缀的id
    $.ajax({
        url: getProjectName() + "/admin/getOpenScheById",
        type: "GET",
        data: {
            id: id
        },
        success: function(data){
            var openInfo = eval('('+data+')');
            openWeek.value = openInfo.openWeek;
            openDay.value = openInfo.openTime.substr(0, 3);
            openTime.value = openInfo.openTime.substr(3, 2);
            openTeacher.value = openInfo.openTeacherId;
            //保存旧变量用于更新
            openStartWeeksOld = removeBlank(openWeek.value);
            openTimeOld = removeBlank(openDay.value + openTime.value);
            cleanSelect();//复位选择卡
            var labIdOrder = openInfo.openLabIdOrder.split(",");//被选择的实验室编号
            var labOrder = openInfo.openLabOrder.split(",");//对应实验室的顺序
            for(var i = 0; i < labIdOrder.length; i++){
                var labCard = document.getElementById("labCard"+labIdOrder[i]);
                var spanLabOrder = document.getElementById("labOrder"+labIdOrder[i]);
                //remove
                labCard.classList.remove("border");
                labCard.classList.remove("border-light");
                labCard.classList.remove("text-muted");
                //add
                labCard.classList.add("text-white");
                labCard.classList.add("bg-success");
                openLabOrder++;
                spanLabOrder.innerHTML = labOrder[i];
            }
        },
        error: function(){

        }
    });
    var saveOpenLabBtn = document.getElementById("saveOpenLabBtn");
    saveOpenLabBtn.onclick = function(){updateOpenSchedule(id)};
    var deleteOpenLabBtn = document.getElementById("deleteOpenLabBtn");
    deleteOpenLabBtn.style.display = "";
    deleteOpenLabBtn.onclick = function(){deleteOpenLabSchedule(id)};
    $('#addOpenLab').modal('show');
}



function addOpenLab(){
    cleanSelect();//清除顺序
    var saveOpenLabBtn = document.getElementById("saveOpenLabBtn");
    saveOpenLabBtn.onclick = function(){saveAddOpenLab()};
    var deleteOpenLabBtn = document.getElementById("deleteOpenLabBtn");
    deleteOpenLabBtn.style.display = "none";
    $('#addOpenLab').modal('show');
}

//选择清除（复位）
function cleanSelect(){
    openLabOrder = 0;
    var labOrder = document.getElementsByName("labOrder");
    for(var i = 0; i < labOrder.length; i++){
        labOrder[i].innerHTML = "0";
    }
    var labCard = document.getElementsByName("labCard");
    for(var i = 0; i < labCard.length; i++){
        if(labCard[i].classList.contains("bg-success")){
            //remove
            labCard[i].classList.remove("text-white");
            labCard[i].classList.remove("bg-success");
            //add
            labCard[i].classList.add("border");
            labCard[i].classList.add("border-light");
            labCard[i].classList.add("text-muted");
        }
    }
}

//创建选择卡片，生成labId对应顺序，暂存开放实验室数据
var labIdOrder = "";
var openLabInfoList;
function createOpenLabCard(openLabInfo){
    openLabInfoList = eval('('+openLabInfo+')');
    //console.log(openLabInfoList);
    for(var i = 0; i < openLabInfoList.length; i++){
        labIdOrder += openLabInfoList[i].labId;
        if (i < openLabInfoList.length-1 ) labIdOrder += ",";
        var html = '<div class="col-6 col-lg-4 pt-1" onclick="labOrderSelect(event)">\
                        <div id="labCard'+ openLabInfoList[i].labId +'" name="labCard" class="border border-light rounded text-muted p-3">' + openLabInfoList[i].labName + '\
                        <span id="labOrder'+ openLabInfoList[i].labId +'" name="labOrder" class="badge badge-pill badge-light" style="float: right;">0</span></div>\
                    </div>';
        $('#openLabSelect').append(html);
    }
}

//实验室选择控制
function labOrderSelect(event){
    var card = event.srcElement;//文本区域
    if(card.id.indexOf("labCard") < 0) return;
    var id = card.id.replace("labCard","");
    var labOrder = document.getElementById("labOrder"+id);
    //未选择
    if(card.classList.contains("border")){
        //remove
        card.classList.remove("border");
        card.classList.remove("border-light");
        card.classList.remove("text-muted");
        //add
        card.classList.add("text-white");
        card.classList.add("bg-success");
        openLabOrder++;
        labOrder.innerHTML = openLabOrder.toString();
    }
    //已选择
    else if(card.classList.contains("border") == false){
        //remove
        card.classList.remove("text-white");
        card.classList.remove("bg-success");
        //add
        card.classList.add("border");
        card.classList.add("border-light");
        card.classList.add("text-muted");
        var labOrderList = document.getElementsByName("labOrder");
        for(var i = 0; i < labOrderList.length; i++){
            var order = Number(labOrderList[i].innerHTML);
            if( order > Number(labOrder.innerHTML)) labOrderList[i].innerHTML = (--order);
        }
        openLabOrder--;
        labOrder.innerHTML = 0;
    }
}

//保存添加开放实验室
function saveAddOpenLab(){
    if(checkAddOpenLabInput() == false) return;
    $('#myBody').loading('start');
    var openDay = document.getElementById("OpenDay");
    var openTime = document.getElementById("OpenTime");
    $.ajax({
        url: getProjectName() + "/admin/saveAddOpenSchedule",
        type: "POST",
        data: {
            startWeeks: removeBlank(openWeek.value),
            teacherId: removeBlank(openTeacher.value),
            time: removeBlank(openDay.value + openTime.value),
            labIdOrder: labIdOrder,
            labsOrder: packageLabOrder
        },
        success: function(data){
            //var openLabBody = document.getElementById("openLabBody");
            //var tr = document.createElement("tr");
            //var openWeek = document.createElement("td");
            //var openTime = document.createElement("td");
            //var openLab = document.createElement("td");
            //var openTeacher = document.createElement("td");
            //openWeek.innerHTML = openWeek.value;
            //openTime.innerHTML = data.openTime;
            //openLab.innerHTML = data.openLabNameOrder;
            //openTeacher.innerHTML = data.openTeacherName;
            //tr.appendChild(openWeek);
            //tr.appendChild(openTime);
            //tr.appendChild(openLab);
            //tr.appendChild(openTeacher);
            $('#myBody').loading('stop');
            showMsgDialog(data);
        },
        error: function(data,type,error){
            showMsgDialog(error);
        }
    })
}

//修改信息
function updateOpenSchedule(id){
    if(checkAddOpenLabInput() == false) return;
    $('#myBody').loading('start');
    $.ajax({
        url: getProjectName() + "/admin/updateOpenSchedule",
        type: "POST",
        data: {
            id: id,
            startWeeks: removeBlank(openWeek.value),
            startWeeksOld: removeBlank(openStartWeeksOld),
            teacherId: removeBlank(openTeacher.value),
            time: removeBlank(openDay.value + openTime.value),
            timeOld: removeBlank(openTimeOld),
            labIdOrder: labIdOrder,
            labsOrder: packageLabOrder
        },
        success: function(data){
            //var openLabBody = document.getElementById("openLabBody");
            //var tr = document.createElement("tr");
            //var openWeek = document.createElement("td");
            //var openTime = document.createElement("td");
            //var openLab = document.createElement("td");
            //var openTeacher = document.createElement("td");
            //openWeek.innerHTML = openWeek.value;
            //openTime.innerHTML = data.openTime;
            //openLab.innerHTML = data.openLabNameOrder;
            //openTeacher.innerHTML = data.openTeacherName;
            //tr.appendChild(openWeek);
            //tr.appendChild(openTime);
            //tr.appendChild(openLab);
            //tr.appendChild(openTeacher);
            $('#myBody').loading('stop');
            showMsgDialog(data);
        },
        error: function(data,type,error){
            showMsgDialog(error);
        }
    })
}

//删除开放课程
function deleteOpenLabSchedule(id){
    $('#myBody').loading('start');
    $.ajax({
        url: getProjectName() + "/admin/deleteOpenSchedule",
        type: "POST",
        data: {
            id: id,
            startWeeksOld: removeBlank(openStartWeeksOld),
            timeOld: removeBlank(openTimeOld)
        },
        success: function(data){
            //var openLabBody = document.getElementById("openLabBody");
            //var tr = document.createElement("tr");
            //var openWeek = document.createElement("td");
            //var openTime = document.createElement("td");
            //var openLab = document.createElement("td");
            //var openTeacher = document.createElement("td");
            //openWeek.innerHTML = openWeek.value;
            //openTime.innerHTML = data.openTime;
            //openLab.innerHTML = data.openLabNameOrder;
            //openTeacher.innerHTML = data.openTeacherName;
            //tr.appendChild(openWeek);
            //tr.appendChild(openTime);
            //tr.appendChild(openLab);
            //tr.appendChild(openTeacher);
            $('#myBody').loading('stop');
            showMsgDialog(data);
        },
        error: function(data,type,error){
            showMsgDialog(error);
        }
    })
}


/*************开放实验室辅助函数*******************/
//根据实验室ID获取实验室名称
function getOpenLabName(openLabId){
    var labName = "";
    for(var i = 0; i < openLabInfoList.length; i++){
        if(openLabId == openLabInfoList[i].labId){
            labName = openLabInfoList[i].labName;
        }
    }
    return labName;
}

//判断开放实验室输入
function checkAddOpenLabInput(){
    if(isNotNumber(openWeek.value)) {
        showMsgDialog("请输入周次！");
        return false;
    }
    if(openTeacher.value == "0"){
        showMsgDialog("请选择值班教师!");
        return false;
    }
    if(openLabOrder == 0){
        showMsgDialog("至少选择一间教室!");
        return false;
    }

}

//组合实验室开放顺序
function packageLabOrder(){
    var labOrderList = document.getElementsByName("labOrder");
    var labOrder = "";
    for(var i = 0; i < labOrderList.length; i++){
        labOrder += labOrderList[i].innerHTML;
        if(i < labOrderList.length - 1) labOrder += ","
    }
    return labOrder;
}
/****************************end 开放实验********************************/


/***************************其他课程***************************/


//其他课程实验室信息
var otherLabInfo;
function getOtherLabInfo(otherLab){
    otherLabInfo = eval('('+otherLab+')');
    console.log(otherLabInfo);
}


/************************* end 其他课程************************/


/***********************其他功能函数**********************/

var teacherList;
//创建教师下拉菜单
function CreateTeacherSelect(){
    $.ajax({
        url: getProjectName() + "/admin/selectTeacher",
        type: "GET",
        success: function(data){
            teacherList = eval(data);
            //console.log(teacherList);
            mainCourseTeacher.options.add(new Option("请选择任课教师", "0"));
            openTeacher.options.add(new Option("请选择值班教师", "0"));
            otherTeacher.options.add(new Option("请选择任课教师", "0"));
            for(var i = 0; i < teacherList.length; i++){
                mainCourseTeacher.options.add(new Option(teacherList[i].userName + " - " + teacherList[i].userId, teacherList[i].userId));//Option(Text, Value)
                openTeacher.options.add(new Option(teacherList[i].userName + " - " + teacherList[i].userId, teacherList[i].userId));//Option(Text, Value)
                otherTeacher.options.add(new Option(teacherList[i].userName + " - " + teacherList[i].userId, teacherList[i].userId));//Option(Text, Value)
            }
        },
        error: function(data,type,error){
            showMsgDialog(error);
        }
    });
}

//根据教师id获取教师名字
function getTeacherName(teacherId){
    if(teacherId == "0") return "未安排教师";
    var teacherName = "";
    for(var i = 0; i < teacherList.length; i++){
        if(teacherId == teacherList[i].userId){
            teacherName = teacherList[i].userName;
            break;
        }
    }
    return teacherName;
}


