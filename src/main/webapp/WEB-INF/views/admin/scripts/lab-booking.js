/**
 * PageEncoding: UTF-8
 * dependence:  system-content.js
 *              jquery.js
 */

var bookingTable = document.getElementById("bookingTable");
var bookingBody = document.getElementById("bookingBody");

//显示当前可选的开放信息
function showBookTable(openScheduleInfo){
    var openList = eval('('+openScheduleInfo+')');
    //console.log(openList);
    var oldBody = document.getElementById("bookingBody");
    if(oldBody != null || oldBody!= undefined) oldBody.parentNode.removeChild(oldBody);
    var bookingBody = document.createElement("tbody");
    for(var i = 0; i < openList.length; i++){
        bookingBody.appendChild(createBookRow(openList[i]));
    }
    bookingTable.appendChild(bookingBody);
}

//创建一行数据
function createBookRow(data){
    var tr = document.createElement("tr");
    var openWeek = document.createElement("td");
    var openTime = document.createElement("td");
    var openDate = document.createElement("td");
    var openTeacherName = document.createElement("td");
    var totalPeopleNum = document.createElement("td");
    var bookingNum = document.createElement("td");
    var notBookingNum = document.createElement("td");
    openWeek.innerHTML = data.openWeek;
    openTime.innerHTML = data.openTime;
    openDate.innerHTML = getDate(data.openDate);
    openTeacherName.innerHTML = data.openTeacherName;
    totalPeopleNum.innerHTML = data.totalPeopleNum;
    bookingNum.innerHTML = data.bookingNum;
    notBookingNum.innerHTML = data.notBookingNum;
    tr.appendChild(openWeek);
    tr.appendChild(openTime);
    tr.appendChild(openDate);
    tr.appendChild(openTeacherName);
    tr.appendChild(totalPeopleNum);
    tr.appendChild(bookingNum);
    tr.appendChild(notBookingNum);
    return tr;
}



