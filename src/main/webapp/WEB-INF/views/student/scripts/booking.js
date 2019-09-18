/**
 * PageEncoding: UTF-8
 * dependence: system-content.js
 *              jquery.js
 */
//变量
var iBooking = document.getElementById("iBooking");
var experimentContent = document.getElementById("experimentContent");
//列出最新的几个可用预约
var openLabList;
function showOpenLabList(openLab){
    openLabList = eval(openLab);
    console.log(openLabList);
    for(var i = 0; i < openLabList.length; i++){
        addOpenLabSchedule(openLabList[i]);
    }
}

//插入一行信息
function addOpenLabSchedule(data){
    var html = '<tr data-tr="openLabTr" id="'+ data.id +'" onclick="clickOpenLabSchedule(event)" style="cursor: pointer;">\
                    <td class="text-center text-nowrap">'+ getDate(data.openDate) +'</td>\
                    <td class="text-center text-nowrap">第'+ data.openWeek +'周</td>\
                    <td class="text-center text-nowrap">'+ data.openTime +'</td>\
                </tr>';
    $('#openLabBody').append(html);
}

//根据实验室安排表的id号获取开放信息
function getOpenScheduleById(id){
    var schedule = null;
    for(var i in openLabList){
        if(id == openLabList[i].id){
            schedule = openLabList[i];
            break;
        }
    }
    return schedule;
}

//获取实验室
var openLabInfo;//选择的预约信息全局变量
function clickOpenLabSchedule(event){
    var td = event.srcElement;
    var tr = td.parentNode;
    if( tr.getAttribute("data-tr") != "openLabTr") return;
    else{

        openLabInfo = getOpenScheduleById(tr.id);
        document.getElementById("bookDate").innerHTML = '<h5 id="bookDate" class="text-primary"><small class="text-muted">日期：</small>'+ getDate(openLabInfo.openDate) +'</h5>';
        document.getElementById("bookWeek").innerHTML = '<h5 id="bookDate" class="text-primary"><small class="text-muted">周次：</small>'+ openLabInfo.openWeek +'</h5>';
        document.getElementById("bookTime").innerHTML = '<h5 id="bookDate" class="text-primary"><small class="text-muted">时间：</small>'+ openLabInfo.openTime +'</h5>';
        document.getElementById("bookTeacher").innerHTML = '<h5 id="bookDate" class="text-primary"><small class="text-muted">教师：</small>'+ openLabInfo.openTeacherName +'</h5>';
        document.getElementById("bookNum").innerHTML = '<h5 id="bookDate" class="text-primary"><small class="text-muted">已预约：</small>'+ openLabInfo.bookingNum +' 人</h5>';
        document.getElementById("NotBookNum").innerHTML = '<h5 id="bookDate" class="text-primary"><small class="text-muted">可预约：</small>'+ openLabInfo.notBookingNum +' 人</h5>';

        scrollTo('#BookingDetail', 500);
    }
}



//我要预约
function goBooking(){
    var input = checkBookingInput();
    if(input == false) return;
    else{
        $('#myBody').loading('start');
        $.ajax({
            url: getProjectName() + "/student/iBooking",
            type: "POST",
            data: {
                classId: userInfo.userClass,
                userId: userInfo.userId,
                userName: userInfo.userName,
                openScheduleId: openLabInfo.id,
                bookDate: new Date(parseInt(openLabInfo.openDate, 10)),
                bookWeek: openLabInfo.openWeek,
                bookTime: openLabInfo.openTime,
                bookContent: experimentContent.value
            },
            success: function(data){
                if(data == "iBooking_repeated"){
                    showMsgDialog("你重复预约啦");
                }
                else if(data == "iBooking_failed"){
                    showMsgDialog("预约失败");
                }else{
                    //预约成功，更新历史记录菜单
                    var booking = eval('('+data+')');
                    //console.log(booking);
                    $.ajax({
                        url: getProjectName() + "/student/bookingUpdateHistory",
                        type: "GET",
                        data: {
                            userId: booking.userId,
                            openScheduleId: booking.openScheduleId
                        },
                        success: function(data){
                            var newHistory = eval('('+data+')');
                            //console.log(newHistory);
                            bookHistory.push(newHistory);
                            addHistoryRow(newHistory);
                            var msg =   '<div class="col-12 text-center">\
                                            <p>预约成功</p>\
                                            <p>你预约了<span class="text-primary">'+ booking.bookLabName +'</span>哟，实验桌是<span class="text-primary">'+ booking.bookTableId +'号 (๑╹◡╹)ﾉ</span></p>\
                                         </div>';
                            $('#myBody').loading('stop');
                            showMsgDialog(msg);
                        },
                        error: function(data,type,err){
                            console.log(err)
                        }
                    })
                }
            },
            error: function(){

            }
        })
    }
}

//历史记录
var bookHistory;
var limit = 7;
function showHistory(history){
    bookHistory = eval('('+history+')');
    console.log(bookHistory);
    if(limit < bookHistory.length){
        for(var i = 0; i < limit; i++){
            addHistoryRow(bookHistory[i]);
        }
    }
    else{
        for(var i in bookHistory){
            addHistoryRow(bookHistory[i]);
        }
    }
}

//查看全部记录
function showHistoryAll(){
    if(limit < bookHistory.length){
        for(; limit < bookHistory.length; limit++){
            addHistoryRow(bookHistory[limit]);
        }
    }else{
        showMsgDialog("已经没有预约记录啦");
    }
}

//根据id获取预约记录
function getHistoryById(id){
    var history = null;
    for(var i in bookHistory){
        if(id == bookHistory[i].id){
            history = bookHistory[i];
            break;
        }
    }
    return history;
}

//插入一行历史记录
function addHistoryRow(data){

    var html = '<tr onclick="clickBookHistory(event)" data-tr="bookHistoryTr" style="cursor: pointer;" id="history'+ data.id +'" ">\
                    <td class="text-center text-nowrap">'+ getDate(data.bookDate) +'</td>\
                    <td class="text-center text-nowrap">第'+ data.bookWeek +'周</td>\
                    <td class="text-center text-nowrap">'+ data.bookTime +'</td>\
                </tr>';
    $('#historyBody').append(html);
}

//查看历史记录
function clickBookHistory(event){
    var td = event.srcElement;
    var tr = td.parentNode;
    //td>>tr
    if(tr.getAttribute("data-tr") != "bookHistoryTr") return;
    else{
        var id = tr.id.replace("history","");//撤销前缀
        var history = getHistoryById(id);
        var schedule = getOpenScheduleById(history.openScheduleId);
        document.getElementById("historyDate").innerHTML = '<h5 class="text-warning"><small class="text-muted">日期：</small>'+ getDate(history.bookDate) +'</h5>'
        document.getElementById("historyWeek").innerHTML = '<h5 class="text-warning"><small class="text-muted">周次：</small>'+ history.bookWeek +'</h5>'
        document.getElementById("historyTime").innerHTML = '<h5 class="text-warning"><small class="text-muted">时间：</small>'+ history.bookTime +'</h5>'
        document.getElementById("historyTeacherName").innerHTML = '<h5 class="text-warning"><small class="text-muted">教师：</small>'+ schedule.openTeacherName +'</h5>'
        document.getElementById("historyLabName").innerHTML = '<h5 class="text-warning"><small class="text-muted">实验室：</small>'+ history.bookLabName +'</h5>'
        document.getElementById("historyTableId").innerHTML = '<h5 class="text-warning"><small class="text-muted">实验桌：</small>'+ history.bookTableId +'</h5>'
        var historyStartTime = document.getElementById("historyStartTime");
        if(history.startTime != -28800000)
                historyStartTime.innerHTML = '<h5 class="text-warning"><small class="text-muted">实验时间：</small>'+ getTime(history.startTime) +'</h5>'
        else    historyStartTime.innerHTML = '<h5><small class="text-muted">实验时间：</small></h5>'

        var historyStopTime = document.getElementById("historyStopTime");
        if(history.endTime != -28800000)
                historyStopTime.innerHTML = '<h5 class="text-warning"><small class="text-muted">离开时间：</small>'+ getTime(history.endTime) +'</h5>'
        else    historyStopTime.innerHTML = '<h5><small class="text-muted">离开时间：</small></h5>'

        var historyTotalTime = document.getElementById("historyTotalTime");
        if(history.totalTime != -28800000)
                historyTotalTime.innerHTML = '<h5 class="text-warning"><small class="text-muted">实验时长：</small>'+ getTime(history.totalTime) +'</h5>'
        else    historyTotalTime.innerHTML = '<h5><small class="text-muted">实验时长：</small></h5>'

        var historyAttendance = document.getElementById("historyAttendance");
        if(history.isAttended == true)
                historyAttendance.innerHTML = '<h5 class="text-success"><small class="text-muted">考勤状况：</small>考勤成功</h5>'
        else    historyAttendance.innerHTML = '<h5 class="text-danger"><small class="text-muted">考勤状况：</small>未考勤</h5>'

        document.getElementById("historyExperimentContent").innerHTML = history.bookContent;

        ResetComponentsHeight();

        scrollTo('#historyDetail', 500);
    }
}

//page scroll
function scrollTo(ele, scrollTime){
    if(!scrollTime) scrollTime = 300;
    if(!ele){
        $('html,body').animate({scrollTop:0}, scrollTime);
    }else{
        if(ele.length>0)
            $('html,body').animate({scrollTop: $(ele).offset().top - 80 }, scrollTime);
    }
    return false;
}

//获取用户页面信息
var userInfo;
function getUserInfo(userId){
    $.ajax({
        url: getProjectName() + "/student/GetUserInfo",
        type: "GET",
        data: {
            userId: userId
        },
        success: function(data){
            userInfo = eval('('+data+')');
        },
        error: function(){

        }
    })
}

//输入判断
function checkBookingInput(){
    if(isInvalid(experimentContent.value)) {
        showMsgDialog("请输入实验内容！");
        return false;
    }
    if(openLabInfo.notBookingNum <= 0){
        showMsgDialog("预约名额已满，请预约其他时间");
        return false;
    }
    if(isInvalid(userInfo.userClass)) {
        showMsgDialog("用户班级信息获取失败，请于管理员联系");
        return false;
    }
    if(isInvalid(userInfo.userId)) {
        showMsgDialog("用户账号信息获取失败，请于管理员联系");
        return false;
    }
    if(isInvalid(userInfo.userName)) {
        showMsgDialog("用户姓名信息获取失败，请于管理员联系");
        return false;
    }
    if(isInvalid(userInfo.userName)) {
        showMsgDialog("用户姓名信息获取失败，请于管理员联系");
        return false;
    }
    return true;
}



function getBackgroundColor(){
    //颜色风格偏黄绿色
    var r= 100 + Math.floor(Math.random()*150);
    var g= 100 + Math.floor(Math.random()*150);
    var b= 50 + Math.floor(Math.random()*100);
    return "rgb("+r+','+g+','+b+")";//所有方法的拼接都可以用ES6新特性`其他字符串{$变量名}`替换
}
