/**
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery.js
 *              chart.js
 */
//获取全部实验室列表
var labInfoList;
function getLabInfo(labInfo){
    labInfoList = eval('('+labInfo+')');
}

//列表显示
//创建list
function createLabInfoList(userType){
    var htmlPage = '<ul id="PageList" class="list-group list-group-flush"></ul>';
    var htmlCollapse = '<ul id="CollapseList" class="list-group list-group-flush"></ul>';
    $('#labListPage').append(htmlPage);
    $('#labListCollapse').append(htmlCollapse)
    for(var i in labInfoList){
        addLabInfoRow(labInfoList[i], userType);
    }

}
//添加行
function addLabInfoRow(data, userType){
    var htmlPage = '<li onclick="queryEnvInfo(event,'+ userType +')" class="list-group-item text-center" style="cursor: pointer" data-labId="labId'+ data.labId +'">'+ data.labName +'</li>'
    var htmlCollapse = '<li onclick="queryEnvInfo(event,'+ userType +')" class="list-group-item text-center" style="cursor: pointer"  data-labId="labId'+ data.labId +'">'+ data.labName +'</li>'
    $('#PageList').append(htmlPage);
    $('#CollapseList').append(htmlCollapse);
}

//查询环境数据
function queryEnvInfo(event, userType){
    var url = "";
    if(userType == 3) //管理员
        url = "/admin/getLabEnvironmentInfo";
    else if(userType == 4)//维护人员
        url = "/safeguard/getLabEnvironmentInfo";
    else return;
    var li = event.srcElement;
    var labId = li.getAttribute("data-labId").replace("labId","");//撤销前缀
    var Collapse1 = document.getElementById("Collapse1");
    Collapse1.classList.remove('show');
    //console.log(labId);
    $('#myBody').loading('start');
    $.ajax({
        url: getProjectName() + url,
        type: "GET",
        data: {
            labId: labId
        },
        success: function(data){
            //解析数据并且画表
            getChartData(data);
            $('#myBody').loading('stop');
        },
        error: function(){
            $('#myBody').loading('stop');
        }
    });
}

//解析数据
var chartDataList;
var chartLabels;
var temperatureData;
var humidityData;
var vocData;
function getChartData(data){
    if(data == "[]"){
        showMsgDialog("暂时没有数据");
        return;
    }
    chartDataList = eval('('+data+')');
    chartLabels = new Array();
    temperatureData = new Array();
    humidityData = new Array();
    vocData  = new Array();
    var index;
    for(index = 0; index < chartDataList.length; index++){
        chartLabels.push(getDateTime(chartDataList[index].envInfoTime));
        temperatureData.push(chartDataList[index].envTemp);
        humidityData.push(chartDataList[index].envHumi);
        vocData.push(chartDataList[index].envVoc);
    }
    showChart();
    showOtherEnvInfo(chartDataList[index-1]);
}
//其他环境信息
function showOtherEnvInfo(data){
    var envWater = document.getElementById("envWater");
    var envPower = document.getElementById("envPower");
    var envVTD = document.getElementById("envVTD");
    var frontDoor = document.getElementById("frontDoor");
    var backDoor = document.getElementById("backDoor");
    var envWin1 = document.getElementById("envWin1");
    var envWin2 = document.getElementById("envWin2");
    var envWin3 = document.getElementById("envWin3");
    var envWin4 = document.getElementById("envWin4");
    if(data.envWater) envWater.innerHTML = " 水浸：异常";
    else envWater.innerHTML = " 水浸：正常";
    if(data.envPower) envPower.innerHTML = " 电源：开";
    else envPower.innerHTML = " 电源：关";
    if(data.envVTD) envVTD.innerHTML = " 防盗：有";
    else envVTD.innerHTML = " 防盗：无";
    if(data.frontDoor) frontDoor.innerHTML = " 前门：开";
    else frontDoor.innerHTML = " 前门：关";
    if(data.backDoor) backDoor.innerHTML = " 后门：开";
    else backDoor.innerHTML = " 后门：关";
    if(data.envWin1) envWin1.innerHTML = " 窗1：开";
    else envWin1.innerHTML = " 窗1：关";
    if(data.envWin2) envWin2.innerHTML = " 窗2：开";
    else envWin2.innerHTML = " 窗2：关";
    if(data.envWin3) envWin3.innerHTML = " 窗3：开";
    else envWin3.innerHTML = " 窗3：关";
    if(data.envWin4) envWin4.innerHTML = " 窗4：开";
    else envWin4.innerHTML = " 窗4：关";

}

///////////////////////////////////////////////////////
// DEPRECATED
window.randomScalingFactor = function() {
    return Math.floor(Math.random()*50);
};



var ColorBlue = 'rgba(0, 170, 255, 1)';
var ColorOrange = 'rgba(255, 200, 0, 1)';
var ColorRed = 'rgba(255, 170, 150, 1)';



//图表显示
var lineChart;
function showChart(){
    var myChart = document.getElementById('myChart').getContext('2d');
    var config = {
        type: 'line',
        data: {
            labels: chartLabels,//x轴
            datasets: [{
                label: '温度 ℃',
                backgroundColor: ColorRed,
                borderColor: ColorRed,
                pointRadius: 0.1,
                data: temperatureData,//Y轴数据
                fill: false
            }, {
                label: '湿度 %',
                fill: false,
                backgroundColor: ColorBlue,
                borderColor: ColorBlue,
                pointRadius: 0.1,
                data: humidityData
            }, {
                label: 'VOC ppm',
                fill: false,
                backgroundColor: ColorOrange,
                borderColor: ColorOrange,
                pointRadius: 0.1,
                data: vocData
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            title: {
                display: true,
                text: '最近一小时内的环境状况'
            },
            tooltips: {
                mode: 'index',
                intersect: false,
                position: "nearest"
            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: false,
                    scaleLabel: {
                        display: true,
                        labelString: '最近一小时'
                    }
                }],
                yAxes: [{
                    display: true,
                    scaleLabel: {
                        display: false,
                        labelString: ''
                    }
                }]
            }
        }
    };
    lineChart = new Chart(myChart, config);
}



