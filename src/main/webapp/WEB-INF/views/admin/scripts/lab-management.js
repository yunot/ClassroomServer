/**
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery.js
 */
//全局控制
var toggle;
var rowId;
var iptLabName;
var mainCheck;
var openCheck;
var otherCheck;
var iptTableNum;

function toggleOnClick(event){
    toggle = event.srcElement;
    console.log(toggle.id);
    rowId = toggle.id;
    console.log(rowId);

    iptLabName = document.getElementById("inputLabName" + rowId);
    mainCheck = document.getElementById("mainLabCheckbox" + rowId);
    openCheck = document.getElementById("openLabCheckbox" + rowId);
    otherCheck = document.getElementById("otherLabCheckbox" + rowId);
    iptTableNum = document.getElementById("inputTableNum" + rowId);

    if(toggle.checked == true){
        toggle.checked = false;
        $('#checkModify').modal('show')
    }
    syncDisplay();
}

function saveModify(){
    if(isNaN(iptTableNum.value)){
        showMsgDialog("请用数字输入实验桌总数");
        return false;
    }
    toggle.checked = true;
    syncDisplay();
    document.getElementById("waitingDialogMsg").innerText = ("正在配置实验室信息...");
    $('#waitingDialog').modal('show');
    $(function(){
        $.ajax({
            url: getProjectName() + "/admin/UpdateLabManagement",
            type: "POST",
            data: {
                labId: rowId,
                labName: iptLabName.value,
                mainLab: mainCheck.checked,
                openLab: openCheck.checked,
                otherLab: otherCheck.checked,
                tableNum: iptTableNum.value
            },
            success: function(data){
                if(data=="UpdateSuccess") {
                    $('#waitingDialog').modal('hide');
                    document.getElementById("updateDialogMsg").innerText = "修改成功！";
                    $('#updateDialog').modal('show')

                }
                else {
                    $('#updateDialogMsg').innerHTML = "修改失败！";
                    $('#updateDialog').modal('show')
                }
                console.log(data);
            },
            timeout: 10000,//10*1000ms
            error: function(){
                document.getElementById("waitingDialogMsg").innerText = ("实验室信息配置失败");
                $('#waitingDialog').modal('show');
            }
        });
    });
    console.log("保存")
}

function notModify(){
    //console.log(rowId);
    $.ajax({
        url: getProjectName() + "/admin/OriginalLabManagement",
        type: "POST",
        data: {
            "labId": rowId
        },
        dataType: "json",
        success: function(data){
            console.log(data);
            iptLabName.value = data.labName;
            mainCheck.checked = data.mainLab;
            openCheck.checked = data.openLab;
            otherCheck.checked = data.otherLab;
            iptTableNum.value = data.tableNum;
        }

    });

    toggle.checked = true;
    syncDisplay();
    console.log("取消")
}
//同步更新控件
function syncDisplay(){
    iptLabName.disabled = toggle.checked;
    mainCheck.disabled = toggle.checked;
    openCheck.disabled = toggle.checked;
    otherCheck.disabled = toggle.checked;
    iptTableNum.disabled = toggle.checked;
}

//实验室设备管理
function viewLabDevices(id){
    var viewLabId = id;
    $.ajax({
        url: getProjectName() + "/admin/GetLabDevices",
        type: "GET",
        data: {
            id: id
        },
        success: function(data){
            var jsonObject = eval('('+data+')');
            console.log(jsonObject)
            showDeviceInfo(jsonObject);
            var addDeviceBtn = document.getElementById("addDeviceBtn");
            var deviceLabName = document.getElementById("deviceLabName");
            addDeviceBtn.disabled = false;
            addDeviceBtn.onclick = function(){addDevice(viewLabId)};
            deviceLabName.innerHTML = document.getElementById("inputLabName"+viewLabId).value;
        },
        error: function(){

        }
    });
}

//设备列表显示
function showDeviceInfo(list){
    var listDevicesParent = document.getElementById("listDevicesParent");
    var temp = document.getElementById("listDevices");
    if(temp != null || temp != undefined) temp.parentNode.removeChild(temp);
    var ul = document.createElement("ul");
    ul.classList.add("list-group");
    ul.classList.add("list-group-flush");
    ul.id = "listDevices";
    for(var i = 0; i < list.length; i++){
        ul.appendChild(createDeviceRow(list[i]));
    }
    listDevicesParent.appendChild(ul);
}

//创建设备列表行
function createDeviceRow(data){
    var li = document.createElement("li");
    li.classList.add("list-group-item");
    li.classList.add("list-group-item-action");
    li.innerHTML = data.deviceName;
    var id = "Device" + data.id;//id号和labID重复了
    li.id = id;
    li.onclick = function(){viewDeviceInfo(id)};
    return li;
}

//添加设备
function addDevice(labId){
    var addDeviceInfoBtn = document.getElementById("addDeviceInfoBtn");
    addDeviceInfoBtn.onclick = function(){addDeviceInfoAction()};
    var saveAddDeviceBtn = document.getElementById("saveAddDeviceBtn");
    saveAddDeviceBtn.onclick = function(){saveAddDevice(labId)};
    var deleteDeviceBtn = document.getElementById("deleteDeviceBtn");
    deleteDeviceBtn.style.display = "none";
    document.getElementById("deviceInfo").innerHTML = "";
    $('#addDevice').modal('show');
}

//点击按键添加设备信息
function addDeviceInfoAction(){
    var html = '<div class="row pt-1">\
                    <div class="col-5"><input type="text" name="name" class="form-control"></div>\
                    <div class="col-6"><input type="text" name="content" class="form-control"></div>\
                    <div class="col-1"><a onclick="removeDeviceInfo(event)"><h4><span class="mdi mdi-trash-can-outline"></span></h4></a></div>\
                </div>';
    $('#deviceInfo').append(html);
}

//移除信息行
function removeDeviceInfo(event){
    var i = event.srcElement;//i标签
    var divRow = i.parentNode.parentNode.parentNode.parentNode;
    //i>>h4>>a>>div>>div
    divRow.parentNode.removeChild(divRow);
}

//保存添加设备信息
var addDeviceName = document.getElementById("addDeviceName");
function saveAddDevice(labId){
    checkAddDeviceInput();
    $.ajax({
        url: getProjectName() + "/admin/saveAddDevice",
        type: "POST",
        data: {
            labId: labId,
            deviceName: addDeviceName.value,
            deviceJsonInfo: packageInJson()
        },
        success: function(data){
            var ul = document.getElementById("listDevices");
            var li = document.createElement("li");
            li.classList.add("list-group-item");
            li.classList.add("list-group-item-action");
            li.innerHTML = addDeviceName.value;
            ul.appendChild(li);
            showMsgDialog(data);
        },
        error: function(){

        }
    })
}

//输入判断
function checkAddDeviceInput(){
    if(isInvalid(addDeviceName)) {
        showMsgDialog("请输入设备名称！");
        return false;
    }
    return true;
}

//组合json
function packageInJson(){
    var nameList = document.getElementsByName("name");
    var contentList = document.getElementsByName("content");
    var jsonList = '[';
    for (var i = 0; i < nameList.length; i++){
        var jsonObject = '{"' + nameList[i].value + '":"' + contentList[i].value + '"}';
        jsonList += jsonObject;
        if(i != nameList.length-1) jsonList += ',';
    }
    jsonList += ']';
    return jsonList;
}

//浏览设备信息
function viewDeviceInfo(deviceId){
    var id = deviceId.replace("Device","");//撤销前缀
    $.ajax({
        url: getProjectName() + "/admin/GetLabDeviceInfo",
        type: "GET",
        data: {
            id: id
        },
        success: function(data){
            var jsonObject = eval('('+data+')');
            addDeviceName.value = jsonObject.deviceName;
            var deviceInfo = jsonObject.deviceJsonInfo;
            var deviceInfoList = eval('('+deviceInfo+')');
            document.getElementById("deviceInfo").innerHTML = "";//清空
            for(var i = 0; i < deviceInfoList.length; i++){
                for(var key in deviceInfoList[i]){
                    var html = '<div class="row pt-1">\
                                    <div class="col-5"><input type="text" name="name" class="form-control" value="'+ key +'"></div>\
                                    <div class="col-6"><input type="text" name="content" class="form-control" value="'+ deviceInfoList[i][key] +'"></div>\
                                    <div class="col-1"><a onclick="removeDeviceInfo(event)"><h4><span class="mdi mdi-trash-can-outline"></span></h4></a></div>\
                                </div>';
                    $('#deviceInfo').append(html);
                }
            }
            var addDeviceInfoBtn = document.getElementById("addDeviceInfoBtn");
            addDeviceInfoBtn.onclick = function(){addDeviceInfoAction()};
            var saveAddDeviceBtn = document.getElementById("saveAddDeviceBtn");
            saveAddDeviceBtn.onclick = function(){updateDeviceInfo(id)};
            var deleteDeviceBtn = document.getElementById("deleteDeviceBtn");
            deleteDeviceBtn.style.display = "";
            deleteDeviceBtn.onclick = function(){deleteDevice(id)};
            $('#addDevice').modal('show');
        },
        error: function(){

        }
    })
}

//更新设备信息
function updateDeviceInfo(deviceId){
    $.ajax({
        url: getProjectName() + "/admin/updateDeviceInfo",
        type: "POST",
        data: {
            id: deviceId,
            deviceName: addDeviceName.value,
            deviceJsonInfo: packageInJson()
        },
        success: function(data){
            var li = document.getElementById("Device"+deviceId);//还原前缀
            console.log("id: "+deviceId + "text: " + li.innerHTML)
            li.innerHTML = addDeviceName.value;
            showMsgDialog(data)
        },
        error: function(){

        }
    })
}

//删除设备
function deleteDevice(deviceId){
    $.ajax({
        url: getProjectName() + "/admin/DeleteLabDevice",
        type: "GET",
        data: {
            id: deviceId
        },
        success: function(data){
            var li = document.getElementById("Device"+deviceId);
            li.parentNode.removeChild(li);
            showMsgDialog(data);
        },
        error: function(){

        }
    })
}