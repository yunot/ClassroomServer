/**
 * Created by Vic_Hoo on 2019/5/4.
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery-dataTables.js
 */


//添加行
function addReportRepairRow(data){
    var reportRepairBody = document.getElementById("reportRepairBody");
    var tr = document.createElement("tr");
    tr.id = data.id;
    var instrumentLabName = document.createElement("td");
    var instrumentTableId = document.createElement("td");
    var instrumentName = document.createElement("td");
    var instrumentId = document.createElement("td");
    var reporterName = document.createElement("td");
    var reportTime = document.createElement("td");
    var isRepaired = document.createElement("td");
    var repairTime = document.createElement("td");
    var repairmanName = document.createElement("td");

    instrumentLabName.innerHTML = data.instrumentLabName;
    instrumentTableId.innerHTML = data.instrumentTableId;
    instrumentName.innerHTML = data.instrumentName;
    instrumentId.innerHTML = data.instrumentId;
    reporterName.innerHTML = data.reporterName;
    reportTime.innerHTML = getDate(data.reportTime);
    isRepaired.innerHTML = data.isRepaired;
    if(!isInvalid(data.repairTime))
        repairTime.innerHTML = getDate(data.repairTime);
    repairmanName.innerHTML = data.repairmanName;

    tr.appendChild(instrumentLabName);
    tr.appendChild(instrumentTableId);
    tr.appendChild(instrumentName);
    tr.appendChild(instrumentId);
    tr.appendChild(reporterName);
    tr.appendChild(reportTime);
    tr.appendChild(isRepaired);
    tr.appendChild(repairTime);
    tr.appendChild(repairmanName);

    reportRepairBody.appendChild(tr);
}

//创建表格
function createReportRepairBody(List){
    var list = eval('('+List+')');
    for(var i = 0; i < list.length; i++){
        addReportRepairRow(list[i]);
    }
    $('#reportRepairTable').DataTable({
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

//报修详情
function getReportRepairDetail(id, userType){
    var url;
    if(userType == 1)//教师
        url = getProjectName() + "/teacher/ViewReportRepair";
    else if(userType == 3)//管理员
        url = getProjectName() + "/admin/ViewReportRepair";
    else if(userType == 4)//维护人
        url = getProjectName() + "/safeguard/ViewReportRepair";
    else
        return;
    $.ajax({
        url: url,
        type: "GET",
        data: {
            id: id
        },
        success: function(data){
            var dataObject = eval('('+data+')');
            console.log(dataObject)
            $('#inputRepairTime').datepicker({
                language: "zh-CN",
                todayBtn: "linked"
            });
            reportRepairAnalysis(dataObject);
            $('#ViewReportRepair').modal('show');
        },
        error: function(){

        }
    })
}

//报修数据解析
function reportRepairAnalysis(data){
    var ReportLabName = document.getElementById("ReportLabName");
    var ReportTableId = document.getElementById("ReportTableId");
    var InstrumentName = document.getElementById("InstrumentName");
    var InstrumentId = document.getElementById("InstrumentId");
    var ReporterName = document.getElementById("ReporterName");
    var ReportTime = document.getElementById("ReportTime");
    var DamageInfo = document.getElementById("DamageInfo");
    var Remark = document.getElementById("Remark");
    var IsRepaired = document.getElementById("IsRepaired");
    var RepairTime = document.getElementById("RepairTime");
    var RepairManName = document.getElementById("RepairManName");
    ReportLabName.innerHTML = data.instrumentLabName;
    ReportTableId.innerHTML = data.instrumentTableId;
    InstrumentName.innerHTML = data.instrumentName;
    InstrumentId.innerHTML = data.instrumentId;
    ReporterName.innerHTML = data.reporterName;
    ReportTime.innerHTML = getDate(data.reportTime);
    DamageInfo.innerHTML = data.damageInfo;
    Remark.innerHTML = data.remarks;
    IsRepaired.innerHTML = data.isRepaired;
    if(!isInvalid(data.repairTime))
        RepairTime.innerHTML = getDate(data.repairTime);
    RepairManName.innerHTML = data.repairmanName;
    if(userType == 4){
        var collapseRepair = document.getElementById("collapseRepair");
        collapseRepair.classList.remove("show");
        var btnSave = document.getElementById("btnSave");
        btnSave.onclick = function(){repairHandle(data.id)};
    }
}


var inputRepair = document.getElementById("inputRepair");
var inputRepairTime = document.getElementById("inputRepairTime");
var inputRepairManName = document.getElementById("inputRepairManName");
//报修处理
function repairHandle(id){
    var input = checkRepairInput();
    if(input == false) return;
    else{
        $('#myBody').loading('start');
        $.ajax({
            url: getProjectName() + "/safeguard/RepairHandle",
            type: "POST",
            data: {
                id: id,
                isRepaired: inputRepair.value,
                repairTime: new Date(inputRepairTime.value.replace("年","-").replace("月","-").replace("日","")),
                repairmanId: userId,
                repairmanName: inputRepairManName.value
            },
            success: function(data){
                var tr = document.getElementById(id);
                var tds = tr.children;
                tds[6].innerHTML = inputRepair.value;//维修情况
                tds[7].innerHTML = inputRepairTime.value;
                tds[8].innerHTML = inputRepairManName.value;
                $('#myBody').loading('stop');
                showMsgDialog(data);
            },
            error: function(){
                $('#myBody').loading('stop');
            }
        });
    }
}

//输入判断
function checkRepairInput(){
    if(isInvalid(inputRepair.value)){
        showMsgDialog("请输入维修情况！");
        return false;
    }
    if(isInvalid(inputRepairTime.value)){
        showMsgDialog("请输入维修时间！");
        return false;
    }
    if(isInvalid(inputRepairManName.value)){
        showMsgDialog("请输入维修人姓名！");
        return false;
    }
}
//获取用户id
var userId;
var userType;
function getUserId(UserId, UserType){
    userId = UserId;
    userType = UserType;
}
