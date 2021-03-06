<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>总课表</title>
    <meta name="description" content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/all.css" rel="stylesheet">
    <!--Material+Icons-->
    <link href="${pageContext.request.contextPath}/views/admin/vendor/MaterialDesign/css/materialdesignicons.min.css" rel="stylesheet">
    <!--Bootstrap CSS-->
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/views/admin/styles/shards-dashboards.1.1.0.min.css" rel="stylesheet" id="main-stylesheet" data-version="1.1.0">
    <link href="${pageContext.request.contextPath}/views/admin/styles/extras.1.1.0.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/jquery.loading.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/jquery.dataTables.css" rel="stylesheet">
    <style>
        .thead-sticky thead tr {
            background-color: #fafafa;
            display: block;
            position: sticky;
            top: 0;
        }
        .thead-sticky tbody{
            display: block;
        }
        .thead-sticky tbody tr td,
        .thead-sticky thead tr th{
            white-space: nowrap;
            width: 150px;
        }
    </style>
    <script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>
    <style>

        table.schedule {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
            width: 100%;
        }

        table.schedule th:nth-child(1) {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #D1EEEE;
        }

        table.schedule th {
            font-size: medium;
            text-align: center;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #F0FFF0;
        }

        table.schedule td {
            text-align: center;
            font-size: 14px;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
</head>
<body class="h-100" id="myBody">
<!-- Message Dialog -->
<div class="modal fade" tabindex="-1" role="dialog" id="msgDialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row" id="msgBody">
                        <!-- javascript add table -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="msgBtn" onclick="">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- end Message Dialog -->
<div class="container-fluid">
    <div class="row">
        <!-- Main Sidebar -->
        <aside class="main-sidebar col-12 col-md-3 col-lg-2 px-0">
            <div class="main-navbar">
                <nav class="navbar align-items-stretch navbar-light bg-white flex-md-nowrap border-bottom p-0">
                    <a class="navbar-brand w-100 mr-0" href="#" style="line-height: 25px;">
                        <div class="d-table m-auto">
                            <span id="main-logo" class="mdi mdi-18px mdi-school d-inline-block align-top mr-1"></span>
                            <span class="d-none d-md-inline ml-1">iLearning</span>
                        </div>
                    </a>
                    <a class="toggle-sidebar d-sm-inline d-md-none d-lg-none">
                        <span class="mdi mdi-arrow-collapse-left"></span>
                    </a>
                </nav>
            </div>
            <div class="nav-wrapper">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link " href="${pageContext.request.contextPath}/admin/Environment">
                            <span class="mdi mdi-18px mdi-remote"></span> 环境状况
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/LabManagement">
                            <span class="mdi mdi-18px mdi-home"></span> 实验室管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/CourseManagement">
                            <span class="mdi mdi-18px mdi-notebook-multiple"></span> 课程管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/WeeklySchedule">
                            <span class="mdi mdi-18px mdi-numeric-7-box-multiple-outline"></span> 周课表管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/TotalSchedule">
                            <span class="mdi mdi-18px mdi-table"></span> 总课表管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/TeachingLog">
                            <span class="mdi mdi-18px mdi-teach"></span> 教学日志
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="${pageContext.request.contextPath}/admin/CheckingIn">
                            <span class="mdi mdi-18px mdi-account-clock"></span> 上课考勤
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="${pageContext.request.contextPath}/admin/Booking">
                            <span class="mdi mdi-18px mdi-bookmark-check"></span>开放预约
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/ReportRepairs">
                            <span class="mdi mdi-18px mdi-hammer"></span> 设备报修
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        <!-- End Main Sidebar -->

        <main class="main-content col-lg-10 col-md-9 col-sm-12 p-0 offset-lg-2 offset-md-3">
            <div class="main-navbar sticky-top bg-white">
                <!-- Main Navbar -->
                <nav class="navbar align-items-stretch navbar-light flex-md-nowrap p-0  justify-content-end">
                    <ul class="navbar-nav border-left flex-row">
                        <li class="nav-item border-right dropdown notifications">
                            <a class="nav-link nav-link-icon text-center" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="nav-link-icon__wrapper">
                                    <span class="mdi mdi-24px mdi-dark mdi-bell"></span>
                                    <span class="badge badge-pill badge-danger">2</span>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-small" aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="#">
                                    <div class="notification__icon-wrapper">
                                        <div class="notification__icon pt-3">
                                            <span class="mdi mdi-18px mdi-dark mdi-inactive mdi-message-text-outline"></span>
                                        </div>
                                    </div>
                                    <div class="notification__content">
                                        <span class="notification__category">通知1</span>
                                        <p>通知内容</p>
                                    </div>
                                </a>
                                <a class="dropdown-item" href="#">
                                    <div class="notification__icon-wrapper">
                                        <div class="notification__icon pt-3">
                                            <span class="mdi mdi-18px mdi-dark mdi-inactive mdi-message-text-outline"></span>
                                        </div>
                                    </div>
                                    <div class="notification__content">
                                        <span class="notification__category">通知2</span>
                                        <p>通知内容</p>
                                    </div>
                                </a>
                                <a class="dropdown-item notification__all text-center" href="#"> 查看全部消息 </a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-nowrap px-3" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle mr-2" data-src="holder.js/40x40?random=yes&text=iLab" alt="User Avatar">
                                <span class="d-none d-md-inline-block">${sessionScope.get("userName")}</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-small">
                                <a class="dropdown-item" href="#">
                                    <span class="mdi mdi-dark mdi-account"></span> 个人设置</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item text-danger" onclick="goQuit()">
                                    <span class="mdi mdi-dark mdi-logout-variant"></span> 退出登录 </a>
                            </div>
                        </li>
                    </ul>
                    <nav class="nav">
                        <a href="#" class="nav-link nav-link-icon toggle-sidebar d-md-inline d-lg-none text-center border-left" data-toggle="collapse" data-target=".header-navbar" aria-expanded="false" aria-controls="header-navbar">
                            <span class="mdi mdi-24px mdi-menu"></span>
                        </a>
                    </nav>
                </nav>
            </div>
            <!-- / .main-navbar -->
            <div class="main-content-container container-fluid px-4">
                <!-- Page Header -->
                <div class="page-header row no-gutters py-4">
                    <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
                        <h3 class="page-title">总课表信息</h3>
                        <span class="text-uppercase page-subtitle">Total Schedule</span>
                    </div>
                </div>
                <!-- End Page Header -->
                <!-- Info Card -->
                <div class="card card-small mb-4">
                    <div class="card-header">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-4">
                                    <h6>总课表管理</h6>
                                </div>
                                <div class="col-12 col-md-8 text-right">
                                    <div class="btn-group" role="group">
                                        <button type="button" class="btn btn-white" onclick="changeSchedule()">修改作息时间</button>
                                        <button type="button" class="btn btn-white" onclick="importWeeklySche()">导入周课表</button>
                                        <button type="button" class="btn btn-white" onclick="resetView()">重置总课表</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0 pb-3 text-center">
                        <!-- tabs -->
                        <!-- Nav Tab -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">总表查询</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">调课安排</a>
                            </li>
                        </ul>
                        <!-- Tab Panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><input id="inputYear" class="form-control" placeholder="按年查询"></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><input id="inputMonth" class="form-control" placeholder="按月查询"></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><input id="inputDay" class="form-control" placeholder="按日查询"></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><select id="selectWeek" class="form-control"></select></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1">
                                            <select id="selectDay" class="form-control">
                                                <option value="0">按星期查询</option>
                                                <option value="星期一">星期一</option>
                                                <option value="星期二">星期二</option>
                                                <option value="星期三">星期三</option>
                                                <option value="星期四">星期四</option>
                                                <option value="星期五">星期五</option>
                                                <option value="星期六">星期六</option>
                                                <option value="星期日">星期日</option>
                                            </select>
                                        </div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1">
                                            <select id="selectTime" class="form-control">
                                                <option value="0">按时间段查询</option>
                                                <option value="上午">上午</option>
                                                <option value="下午">下午</option>
                                                <option value="晚上">晚上</option>
                                            </select>
                                        </div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><select id="selectLab" class="form-control"></select></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1">
                                            <select id="selectCourseType" class="form-control">
                                                <option value="0">按课程类型查询</option>
                                                <option value="1">主要课程</option>
                                                <option value="2">开放实验</option>
                                                <option value="3">其他课程</option>
                                            </select>
                                        </div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><select id="selectCourseName" class="form-control"></select></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><select id="selectClassId" class="form-control"></select></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1"><select id="selectTeacher" class="form-control"></select></div>
                                        <div class="col-6 col-md-4 col-lg-2 pt-1">
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-white w-50" onclick="QueryContext()">查询</button>
                                                <button type="button" class="btn btn-white w-50" onclick="QueryClean()">清空</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="container-fluid">
                                    <div class="table table-responsive">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Info Card -->
                <div id="searchResult" class="card card-small mb-4" style="display: none">
                    <div class="card-header">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-4">
                                    <h6>查询结果</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0 pb-3 text-center">
                        <div id="resultParent" class="table-responsive-lg" style="height: 60%; overflow: auto;">
                            <!-- 结果显示 -->
                            <table id="resultTable" class="table table-sm table-hover thead-sticky">
                                <thead class="bg-light">
                                <tr>
                                    <th>日期</th>
                                    <th>周次</th>
                                    <th>时间</th>
                                    <th>实验室</th>
                                    <th>课程名称</th>
                                    <th>学时</th>
                                    <th>班级</th>
                                    <th>教师</th>
                                </tr>
                                </thead>
                                <tbody id="resultBody"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="main-footer d-flex p-2 px-3 bg-white border-top">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-2 col-md-1 text-nowrap"><a class="text-primary" href="../index.jsp">首页</a></div>
                        <div class="col-2 col-md-1 text-nowrap"><a class="text-primary" href="">服务</a></div>
                        <div class="col-2 col-md-1 text-nowrap"><a class="text-primary" href="">关于</a></div>
                        <div class="col-12 col-md-9 text-right"><span class="copyright ml-auto my-auto mr-2">Copyright &copy; 2017-2019 iLearning. All rights reserved.</span></div>
                    </div>
                </div>
            </footer>
        </main>
    </div>
</div>
<!-- Reset View -->
<div class="modal fade" tabindex="-1" role="dialog" id="resetView">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">重置总课表</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <h6 class="text-danger">重置总课表将删除包含调课安排的全部信息</h6>
                    <div class="row">
                        <div class="col-md-12"><h6 class="text-primary">设置学期开始时间</h6></div>
                    </div>
                    <div class="row">
                        <div class="col-md-3"><input class="form-control" id="resetYear" placeholder="请输入年份"></div>
                        <div class="col-md-1"><h6 class="text-primary">年</h6></div>
                        <div class="col-md-3"><input class="form-control" id="resetMonth" placeholder="请输入月份"></div>
                        <div class="col-md-1"><h6 class="text-primary">月</h6></div>
                        <div class="col-md-3"><input class="form-control" id="resetDay" placeholder="请输入日期"></div>
                        <div class="col-md-1"><h6 class="text-primary">日</h6></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"><h6 class="text-primary">设置学期周数</h6></div>
                        <div class="col-md-4"><input class="form-control" id="resetWeek" placeholder="请输入周数"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="resetTotal()">重置</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>

<%--修改作息时间--%>
<div class="modal fade" tabindex="-1" role="dialog" id="ScheduleTable">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">更改作息时间</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table id="timeTable" class="schedule"></table>
            </div>
        </div>
    </div>
</div>



<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/shards.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.sharrre.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.loading.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/holder.min.js"></script>

<script src="${pageContext.request.contextPath}/views/admin/scripts/extras.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/shards-dashboards.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/app/app-blog-overview.1.1.0.js"></script>

<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js" type="text/javascript" charset="utf-8"></script>
<!-- This page javascript sourse -->
<script src="${pageContext.request.contextPath}/views/admin/scripts/total-schedule.js"></script>

<script type="text/javascript">
    window.onload = function(){
        $('#myBody').loading('start');
        //loadTotalSchedule('${TotalInfo}');
        WeekSelector('${weekSelect}');
        LabSelector('${labSelect}');
        courseNameSelector('${courseNameSelect}');
        classIdSelector('${classIdSelect}');
        teacherSelector('${teacherSelect}');
        $('#myBody').loading('stop');
    }

</script>

<script>
    function changeSchedule() {
        $('#ScheduleTable').modal('show');
    }
</script>

<script>
    //将list转为js数组
    var amCourse = '${amCourse}'.replace('[', '').replace(']', '').split(',');
    var pmCourse = '${pmCourse}'.replace('[', '').replace(']', '').split(',');
    var ntCourse = '${ntCourse}'.replace('[', '').replace(']', '').split(',');
    var amTime = '${amTime}'.replace('[', '').replace(']', '').split(',');
    var pmTime = '${pmTime}'.replace('[', '').replace(']', '').split(',');
    var ntTime = '${ntTime}'.replace('[', '').replace(']', '').split(',');

    /* var amCourse = ["预备铃", "第一节课", "第二节课", "第三节课", "第四节课", "第五节课"];
     var pmCourse = ["预备铃", "第一节课", "第二节课", "第三节课", "第四节课", "第五节课"];
     var ntCourse = ["第一节课", "第二节课", "第三节课", "第四节课", "第五节课"];
     var amTime = ["7:50", "8:00-8:45", "8:50-9:35", "9:50-10:35", "10:40-11:25", "11:30-12:15"];
     var pmTime = ["13:35", "13:45-14:30", "14:35-15:20", "15:35-16:20", "16:25-17:10"];
     var ntTime = ["18:30-19:15", "19:25-20:10", "20:20-21:05"];*/

    var table = document.getElementById("timeTable");
    var headName = '${headName}';
    //添加表头
    addTableHead(headName, 3, table);
    //上午
    createSchedule("上午", 6, table, amCourse, amTime, "am");
    //空行
    addSpaceRow(3, 10, table);
    //下午
    createSchedule("下午", 5, table, pmCourse, pmTime, "pm");
    //空行
    addSpaceRow(3, 10, table);
    //晚上
    createSchedule("晚上", 3, table, ntCourse, ntTime, "nt");


    //添加表头
    function addTableHead(head, colspan, tableName) {
        var tr = document.createElement("tr");
        var td = document.createElement("td");
        td.innerHTML = head;
        td.id = "head";
        td.height = 50;
        td.classList.add("edit");
        // th.onclick = function edit(event) {
        //     alert("您点击的是:" + event.srcElement.id);
        // }
        td.colSpan = colspan;
        tr.appendChild(td);
        tableName.appendChild(tr);
    }

    //添加空行
    function addSpaceRow(colspan, rowHeight, tableName) {
        var tr = document.createElement("tr");
        var td = document.createElement("td");
        td.innerHTML = '';
        td.colSpan = colspan;
        td.height = rowHeight;
        tr.appendChild(td);
        tableName.appendChild(tr);
    }

    //添加不同时间段的安排
    function createSchedule(periodName, courseNum, tableName, courseName, courseTime, src) {
        //时间段名称
        tr = document.createElement("tr");
        var td = document.createElement("td");
        td.innerHTML = periodName;
        td.id = td.innerHTML;
        td.rowSpan = courseNum + 1;
        // td.classList.add("edit");
        // td.onclick = function edit(event) {
        //     alert("您点击的是:" + event.srcElement.id);
        // }
        tr.appendChild(td);
        tableName.appendChild(tr);

        for (var i = 1; i < courseNum + 1; i++) {
            var tr = document.createElement("tr");
            var td1 = document.createElement("td");
            var td2 = document.createElement("td");
            td1.innerHTML = courseName[i - 1];
            td1.id = i + "," + src + "_course";
            td1.classList.add("edit");
            // td1.onclick = function edit(event) {
            //     alert("您点击的是:" + event.srcElement.id);
            // }
            td2.innerHTML = courseTime[i - 1];
            td2.id = i + "," + src + "_time";
            td2.classList.add("edit");
            // td2.onclick = function edit(event) {
            //     alert("您点击的是:" + event.srcElement.id);
            // }
            tr.appendChild(td1);
            tr.appendChild(td2);
            tableName.appendChild(tr);
        }
    }
</script>

<script>
    $(function () {
        $(".edit").click(function (event) {
            //td中已经有了input,则不需要响应点击事件
            if ($(this).children("input").length > 0)
                return false;
            var tdObj = $(this);
            var preText = tdObj.html();
            //得到当前文本内容
            var inputObj = $("<input type='text' />");
            //创建一个文本框元素
            tdObj.html(""); //清空td中的所有元素
            inputObj
                .width(tdObj.width()/2)
                //设置文本框宽度与td相同
                .height(tdObj.height())
                .css({
                    // border: "0px",
                    // fontSize: "17px",
                    // font: "宋体"
                })
                .val(preText)
                .appendTo(tdObj)
                //把创建的文本框插入到tdObj子节点的最后
                .trigger("focus")
                //用trigger方法触发事件
                .trigger("select");

            inputObj.blur(function () {
                tdObj.html(preText);
            });
            inputObj.keyup(function (event) {
                if (13 === event.which)
                //用户按下回车
                {
                    var text = $(this).val();
                    tdObj.html(text);
                    var id = tdObj.attr("id");
                    var str = id.split(",");
                    if (str[1] === "am_time") {
                        $.ajax({
                            url: getProjectName() + "/admin/updateSchedule",
                            type: "POST",
                            data: {
                                id: str[0],
                                amTime: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    } else if (str[1] === "am_course") {
                        $.ajax({
                            url: getProjectName() + "/admin/updateSchedule",
                            type: "POST",
                            data: {
                                id: str[0],
                                amCourse: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    } else if (str[1] === "pm_course") {
                        $.ajax({
                            url: getProjectName() + "/admin/updateSchedule",
                            type: "POST",
                            data: {
                                id: str[0],
                                pmCourse: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    } else if (str[1] === "pm_time") {
                        $.ajax({
                            url: getProjectName() + "/admin/updateSchedule",
                            type: "POST",
                            data: {
                                id: str[0],
                                pmTime: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    } else if (str[1] === "nt_course") {
                        $.ajax({
                            url: getProjectName() + "/user/updateSchedule",
                            type: "POST",
                            data: {
                                id: str[0],
                                ntCourse: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    } else if (str[1] === "nt_time") {
                        $.ajax({
                            url: getProjectName() + "/admin/updateSchedule",
                            type: "POST",
                            data: {
                                id: str[0],
                                ntTime: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    } else if (id === "head") {
                        $.ajax({
                            url: getProjectName() + "/user/updateSchedule",
                            type: "POST",
                            data: {
                                id: 1,
                                headName: text
                            },
                            success: function () {
                                alert("更改成功!");
                            },
                            error: function () {
                                alert("失败");
                            }
                        });
                    }

                } else if (27 === event.which)
                //ESC键
                {
                    tdObj.html(preText);
                }
            });
            //已进入编辑状态后，不再处理click事件
            inputObj.click(function () {
                return false;
            });
        });
    });
</script>


</body>
</html>

