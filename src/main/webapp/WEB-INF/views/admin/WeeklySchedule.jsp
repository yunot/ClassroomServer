<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>周课表</title>
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
    <script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/WeeklySchedule.css">
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
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/WeeklySchedule">
                            <span class="mdi mdi-18px mdi-numeric-7-box-multiple-outline"></span>周课表管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/TotalSchedule">
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
                            <span class="mdi mdi-18px mdi-bookmark-check"></span> 开放预约<
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
                        <h3 class="page-title">周课表信息</h3>
                        <span class="text-uppercase page-subtitle">Weekly schedule</span>
                    </div>
                </div>
                <!-- End Page Header -->
                <!-- Info Card -->
                <div class="card card-small mb-4">
                    <div class="card-header">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12 text-right">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0 pb-3 text-center">
                        <!-- tabs -->
                        <!-- Nav Tab -->
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">主要课程</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">开放实验</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="messages-tab" data-toggle="tab" href="#messages" role="tab" aria-controls="messages" aria-selected="false">其他课程</a>
                            </li>
                        </ul>

                        <!-- Tab Panes -->
                        <div class="tab-content">
                            <!-- 主要课程 -->
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                <div class="wsTableContent">
                                    <table id="wsTable" class="table table-sm table-bordered thead-sticky">

                                    </table>
                                </div>

                            </div>
                            <!-- 开放实验 -->
                            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <div class="container-fluid">
                                    <div class="table-responsive" style="overflow: auto;">
                                        <table class="table table-sm table-hover" id="openTable">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-nowrap">周次</th>
                                                <th class="text-nowrap">时间</th>
                                                <th class="text-nowrap">实验室开放顺序</th>
                                                <th class="text-nowrap">值班教师</th>
                                            </tr>
                                            </thead>
                                            <tbody id="openLabBody"></tbody>
                                        </table>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12 text-center">
                                            <button id="addOpenLabBtn" class="btn btn-primary" onclick="addOpenLab()">添加开放实验室</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 其他课程 -->
                            <div class="tab-pane fade" id="messages" role="tabpanel" aria-labelledby="messages-tab">
                                <div class="container-fluid">
                                    <div class="table-responsive" style="overflow: auto;">
                                        <!-- table -->
                                        <table class="table table-sm table-hover" id="otherTable">
                                            <thead class="bg-light">
                                            <tr>
                                                <th class="text-nowrap">开课周</th>
                                                <th class="text-nowrap">无课周</th>
                                                <th class="text-nowrap">时间</th>
                                                <th class="text-nowrap">实验室</th>
                                                <th class="text-nowrap">课程名称</th>
                                                <th class="text-nowrap">课程编号</th>
                                                <th class="text-nowrap">学时</th>
                                                <th class="text-nowrap">任课教师</th>
                                                <th class="text-nowrap">上课班级</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${otherList}" var="otherPojo" varStatus="otherListStatus">
                                                <tr id="${otherPojo.id}" onclick="editOtherSche(${otherPojo.id})">
                                                    <td id="otherStartWeeks${otherPojo.id}"> ${otherPojo.startWeeks} </td>
                                                    <td id="otherStopWeeks${otherPojo.id}"> ${otherPojo.stopWeeks} </td>
                                                    <td id="otherTime${otherPojo.id}"> ${otherPojo.time} </td>
                                                    <td id="otherLabName${otherPojo.id}"> ${otherPojo.labName} </td>
                                                    <td id="otherCourseName${otherPojo.id}"> ${otherPojo.courseName} </td>
                                                    <td id="otherCourseId${otherPojo.id}"> ${otherPojo.courseId} </td>
                                                    <td id="otherCourseTime${otherPojo.id}"> ${otherPojo.courseTime} </td>
                                                    <td id="otherTeacherName${otherPojo.id}"> ${otherPojo.teacherName} </td>
                                                    <td id="otherClassId${otherPojo.id}"> ${otherPojo.classId} </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- end table -->
                                    <div class="row">
                                        <div class="col-sm-12 text-center">
                                            <button class="btn btn-primary" onclick="addOtherSche()">添加课程</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end tabs -->
                    </div>
                </div>
                <!-- End Info Card -->
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

<!-- Edit WeeklySchedule  -->
<div class="modal fade" tabindex="-1" role="dialog" id="editWeeklySche">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑主要课程信息<span id="editId" class="invisible">hidden</span></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">时间</h6></div>
                        <div class="col-md-4"><h5 id="mainCourseTime"></h5></div>
                        <div class="col-md-2"><h6 class="text-primary">实验室</h6></div>
                        <div class="col-md-4"><h5 id="mainCourseLabName"></h5></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">课程名称</h6></div>
                        <div class="col-md-4">
                            <select class="form-control" id="mainCourseName">

                            </select>
                        </div>
                        <div class="col-md-2"><h6 class="text-primary">课程编号</h6></div>
                        <div class="col-md-4"><h5 id="mainCourseId"></h5></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">开课周</h6></div>
                        <div class="col-md-4"><h5 id="mainCourseStart"></h5></div>
                        <div class="col-md-2"><h6 class="text-primary">无课周</h6></div>
                        <div class="col-md-4"><h5 id="mainCourseEnd"></h5></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">学时</h6></div>
                        <div class="col-md-4"><h5 id="mainTimeHour"></h5></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">任课教师</h6></div>
                        <div class="col-md-4"><select class="custom-select" id="mainCourseTeacher" placeholder="任课教师"></select></div>
                        <div class="col-md-2"><h6 class="text-primary">上课班级</h6></div>
                        <div class="col-md-4"><input class="form-control" id="mainCourseClass" placeholder="上课班级"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveWeeklySche()">保存</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">


    //创建下拉菜单
    window.onload = function(){
        showOpenLab('${openList}');
        createOpenLabCard('${openLabInfo}');
        createMainCourseSelect('${mainCourse}');
        CreateTeacherSelect();//创建教师下拉菜单
        //创建主要课程
        getMainLabInfo('${mainLabInfo}');
        createWeeklyScheduleHead();
        createWeeklyScheduleTr("星期一上午", ${MonAm});
        createWeeklyScheduleTr("星期一下午", ${MonPm});
        createWeeklyScheduleTr("星期一晚上", ${MonNt});
        createWeeklyScheduleTr("星期二上午", ${TuesAm});
        createWeeklyScheduleTr("星期二下午", ${TuesPm});
        createWeeklyScheduleTr("星期二晚上", ${TuesNt});
        createWeeklyScheduleTr("星期三上午", ${WedAm});
        createWeeklyScheduleTr("星期三下午", ${WedPm});
        createWeeklyScheduleTr("星期三晚上", ${WedNt});
        createWeeklyScheduleTr("星期四上午", ${ThursAm});
        createWeeklyScheduleTr("星期四下午", ${ThursPm});
        createWeeklyScheduleTr("星期四晚上", ${ThursNt});
        createWeeklyScheduleTr("星期五上午", ${FriAm});
        createWeeklyScheduleTr("星期五下午", ${FriPm});
        createWeeklyScheduleTr("星期五晚上", ${FriNt});
        createWeeklyScheduleTr("星期六上午", ${SatAm});
        createWeeklyScheduleTr("星期六下午", ${SatPm});
        createWeeklyScheduleTr("星期六晚上", ${SatNt});
        createWeeklyScheduleTr("星期日上午", ${SunAm});
        createWeeklyScheduleTr("星期日下午", ${SunPm});
        createWeeklyScheduleTr("星期日晚上", ${SunNt});
    }



</script>
<!-- end Edit WeeklySchedule -->
<!-- Add OpenSchedule -->
<div class="modal fade" tabindex="-1" role="dialog" id="addOpenLab">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">开放实验室</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-2"><h6 class="text-primary">周次</h6></div>
                        <div class="col-4"><input class="form-control" id="OpenWeek" placeholder="周次"></div>
                        <div class="col-2"><h6 class="text-primary">星期</h6></div>
                        <div class="col-4">
                            <select class="custom-select" id="OpenDay">
                                <option value="星期一">星期一</option>
                                <option value="星期二">星期二</option>
                                <option value="星期三">星期三</option>
                                <option value="星期四">星期四</option>
                                <option value="星期五">星期五</option>
                                <option value="星期六">星期六</option>
                                <option value="星期日">星期日</option>
                            </select>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-2"><h6 class="text-primary">时段</h6></div>
                        <div class="col-4">
                            <select class="custom-select" id="OpenTime">
                                <option value="上午">上午</option>
                                <option value="下午">下午</option>
                                <option value="晚上">晚上</option>
                            </select>
                        </div>
                        <div class="col-2"><h6 class="text-primary">值班老师</h6></div>
                        <div class="col-4"><select class="custom-select" id="OpenTeacher"></select></div>
                    </div>
                    <div class="row"><div class="col-12"><h6 class="text-primary">实验室开放顺序</h6></div></div>
                    <div class="row" id="openLabSelect">

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveOpenLabBtn">保存</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal" id="deleteOpenLabBtn">删除</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- /. End Add OpenSchedule -->

<!-- Edit otherSchedule  -->
<div class="modal fade" tabindex="-1" role="dialog" id="editOtherSche">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">其他课程信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">时间</h6></div>
                        <div class="col-md-2">
                            <select class="custom-select" id="OtherDay">
                                <option value="星期一">星期一</option>
                                <option value="星期二">星期二</option>
                                <option value="星期三">星期三</option>
                                <option value="星期四">星期四</option>
                                <option value="星期五">星期五</option>
                                <option value="星期六">星期六</option>
                                <option value="星期日">星期日</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <select class="custom-select" id="OtherTime">
                                <option value="上午">上午</option>
                                <option value="下午">下午</option>
                                <option value="晚上">晚上</option>
                            </select>
                        </div>
                        <div class="col-md-2"><h6 class="text-primary">实验室</h6></div>
                        <div class="col-md-4"><select class="custom-select" id="OtherLab"></select></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">课程名称</h6></div>
                        <div class="col-md-4"><input class="form-control" id="OtherCourseName" placeholder="课程名称"></div>
                        <div class="col-md-2"><h6 class="text-primary">课程编号</h6></div>
                        <div class="col-md-4"><input class="form-control" id="OtherCourseId" placeholder="课程编号"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">开课周</h6></div>
                        <div class="col-md-4"><input class="form-control" id="OtherStart" placeholder="开课周"></div>
                        <div class="col-md-2"><h6 class="text-primary">无课周</h6></div>
                        <div class="col-md-4"><input class="form-control" id="OtherEnd" placeholder="无课周"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">学时</h6></div>
                        <div class="col-md-4"><input class="form-control" id="OtherTimeLong" placeholder="学时"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><h6 class="text-primary">任课教师</h6></div>
                        <div class="col-md-4"><select class="custom-select" id="OtherTeacher"></select></div>
                        <div class="col-md-2"><h6 class="text-primary">上课班级</h6></div>
                        <div class="col-md-4"><input class="form-control" id="OtherClassId" placeholder="上课班级"></div>
                        <div class="col-md-12"><br></div>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button id="otherSave" type="button" class="btn btn-outline-primary" data-dismiss="modal" onclick="">保存</button>
                <button id="otherDelete" type="button" class="btn btn-outline-warning" data-dismiss="modal" onclick="">删除</button>
                <button type="button" class="btn btn-outline-dark" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var editOtherId;
    var otherDay = document.getElementById("OtherDay");
    var otherTime = document.getElementById("OtherTime");
    var otherLab = document.getElementById("OtherLab");
    var otherCourseName = document.getElementById("OtherCourseName");
    var otherCourseId = document.getElementById("OtherCourseId");
    var otherTeacher = document.getElementById("OtherTeacher");
    var otherClassId = document.getElementById("OtherClassId");
    var otherStart = document.getElementById("OtherStart");
    var otherEnd = document.getElementById("OtherEnd");
    var otherTimeLong = document.getElementById("OtherTimeLong");
    var otherSave = document.getElementById("otherSave");
    var otherDelete = document.getElementById("otherDelete");

    /** 其他课程实验室列表 **/
    otherLab.options.add(new Option("请选择实验室"), "0");
    <c:forEach items="${otherLabInfo}" var="otherLabPojo">
        otherLab.options.add(new Option("${otherLabPojo.labName}", "${otherLabPojo.labId}"));
    </c:forEach>

    /** 添加其他课程 **/
    function addOtherSche(){
        otherSave.onclick = saveAddOtherSche;
        otherDelete.style.display = "none";
        $('#editOtherSche').modal('show');
    }
    function saveAddOtherSche(){
        msgBtn.onclick = function(){};//解绑按键功能
        if(checkOtherInput() == false) return;
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/saveAddOtherSche",
            type: "POST",
            data: {
                time: otherDay.value + otherTime.value,
                labId: otherLab.value,
                courseName: otherCourseName.value,
                courseId: otherCourseId.value,
                teacherId: otherTeacher.value,
                classId: otherClassId.value,
                startWeeks: otherStart.value,
                stopWeeks: otherEnd.value,
                courseTime: otherTimeLong.value,
                courseType: "3"
            },
            success: function(data){
                //console.log(data);
                //动态更新表格
                $('#editOtherSche').modal('hide');
                var otherTable = document.getElementById("otherTable");
                var tr = document.createElement("tr");
                var td_start = document.createElement("td");
                var td_end = document.createElement("td");
                var td_time = document.createElement("td");
                var td_lab = document.createElement("td");
                var td_courseName = document.createElement("td");
                var td_courseId = document.createElement("td");
                var td_courseTime = document.createElement("td");
                var td_teacher = document.createElement("td");
                var td_classId = document.createElement("td");
                td_start.innerHTML = otherStart.value;
                td_end.innerHTML = otherEnd.value;
                td_time.innerHTML = otherDay.value + otherTime.value;
                td_lab.innerHTML = getOtherLabName(otherLab.value);
                td_courseName.innerHTML = otherCourseName.value;
                td_courseId.innerHTML = otherCourseId.value;
                td_courseTime.innerHTML = otherTimeLong.value;
                td_teacher.innerHTML = getTeacherName(otherTeacher.value);
                td_classId.innerHTML = otherClassId.value;
                tr.appendChild(td_start);
                tr.appendChild(td_end);
                tr.appendChild(td_time);
                tr.appendChild(td_lab);
                tr.appendChild(td_courseName);
                tr.appendChild(td_courseId);
                tr.appendChild(td_courseTime);
                tr.appendChild(td_teacher);
                tr.appendChild(td_classId);
                otherTable.appendChild(tr);
                document.getElementById("msgBody").innerHTML = "添加成功了哟~";
                $('#msgDialog').modal('show');
            },
            error: function(data){
                console.log(data)
            }
        });
    }
    /** 编辑其他课程 **/
    //单元格对象
    var editOtherTime;
    var editOtherStart;
    var editOtherEnd;
    var editOtherLabName;
    var editOtherCourseName;
    var editOtherCourseId;
    var editOtherCourseTime;
    var editOtherTeacher;
    var editOtherClassId;
    function editOtherSche(id){
        //console.log(id);
        editOtherId = id;
        editOtherTime = document.getElementById("otherTime" + editOtherId);
        editOtherStart = document.getElementById("otherStartWeeks" + editOtherId);
        editOtherEnd = document.getElementById("otherStopWeeks" + editOtherId);
        editOtherLabName = document.getElementById("otherLabName" + editOtherId);
        editOtherCourseName = document.getElementById("otherCourseName" + editOtherId);
        editOtherCourseId = document.getElementById("otherCourseId" + editOtherId);
        editOtherCourseTime = document.getElementById("otherCourseTime" + editOtherId);
        editOtherTeacher = document.getElementById("otherTeacherName" + editOtherId);
        editOtherClassId = document.getElementById("otherClassId" + editOtherId);
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/getOtherScheById",
            type: "GET",
            data:{
                id: editOtherId
            },
            success: function(data_t){
                var data = eval("("+data_t+")");
                console.log(data);
                otherDay.options[0].selected = true;
                for(var i = 0; i < otherDay.length; i++){
                    if(otherDay.options[i].value == data.time.substr(0, 3)){
                        otherDay.options[i].selected = true;break;}
                }
                otherTime.options[0].selected = true;
                for(var i = 0; i < otherTime.length; i++){
                    if(otherTime.options[i].value == data.time.substr(3, 2)){
                        otherTime.options[i].selected = true;break;}
                }
                otherLab.options[0].selected = true;
                for(var i = 0; i < otherLab.length; i++){
                    if(otherLab.options[i].value == data.labId){
                        otherLab.options[i].selected = true;break;}
                }
                otherCourseName.value = data.courseName;
                otherCourseId.value = data.courseId;
                otherCourseId.value = data.courseTime;
                otherTeacher.options[0].selected = true;
                for(var i = 0; i < otherTeacher.length; i++){
                    if(otherTeacher.options[i].value === data.teacherId){
                        otherTeacher.options[i].selected = true;break;}
                }
                otherClassId.value = data.classId;
                otherStart.value = data.startWeeks;
                otherEnd.value = data.stopWeeks;
                otherDelete.style.display = "block";
                otherDelete.onclick = saveDeleteOtherSche;
                otherSave.onclick = saveEditOtherSche;
                $('#editOtherSche').modal('show');
            },
            error: function(data, type, error){
                console.log("type: " + type);
                console.log("error: " + error);
            }
        });
    }
    function saveEditOtherSche(){
        msgBtn.onclick = function(){};//按键解绑
        if(checkOtherInput() == false) return;
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/updateEditOtherSche",
            type: "POST",
            data: {
                id: editOtherId,
                courseId: otherCourseId.value,
                time: otherDay.value + otherTime.value,
                startWeeks: otherStart.value,
                stopWeeks: otherEnd.value,
                courseName: otherCourseName.value,
                courseTime: otherTimeLong.value,
                classId: otherClassId.value,
                teacherId: otherTeacher.value,
                labId: otherLab.value
            },
            success: function(data) {
                editOtherStart.innerHTML = otherStart.value;
                editOtherEnd.innerHTML = otherEnd.value;
                editOtherTime.innerHTML = otherDay.value + otherTime.value;
                editOtherLabName.innerHTML = getOtherLabName(otherLab.value);
                editOtherCourseName.innerHTML = otherCourseName.value;
                editOtherCourseId.innerHTML = otherCourseId.value;
                editOtherCourseTime.innerHTML = otherTimeLong.value;
                editOtherTeacher.innerHTML = getTeacherName(otherTeacher.value);
                editOtherClassId.innerHTML = otherClassId.value;
                document.getElementById("msgBody").innerHTML = "改好了！";
                $('#msgDialog').modal('show');
            },
            error: function(){
                console.log("saveEditOtherSche: error");
            }
        });
    }

    /**
     *  删除功能
     *  ID号在窗口弹出前 由 editOtherSche(id) 配置好了
     *  可以直接用，也可以再赋值，不过值都是一样的
     */
    function deleteOtherSche(id){
        editOtherId = id;
        document.getElementById("msgBody").innerHTML = "真的要删除吗？";
        msgBtn.onclick = saveDeleteOtherSche;
    }
    function saveDeleteOtherSche(){
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/saveDeleteOtherSche",
            type: "GET",
            data: {
                id: editOtherId
            },
            success: function(data){
                //console.log(data);
                var deleteTr = document.getElementById(editOtherId);
                deleteTr.parentNode.removeChild(deleteTr);
                msg.innerHTML = "删除了哟(^u^)/";
                $('#msgDialog').modal('show');
            },
            error: function(data, type ,error){
                console.log("deleteOtherSche_error:" + error);
            }
        });
    }

    /** 辅助功能函数 **/
    function checkOtherInput(){
        if( otherLab.options[0].selected ){
            msg.innerHTML = "请选择实验室啊！";
            $('#msgDialog').modal('show');
            return false;
        }
        if( otherTeacher.value == "0" ){
            msg.innerHTML = "请选择任课教师啊！";
            $('#msgDialog').modal('show');
            return false;
        }
        if( otherStart.value == "" ||
                otherStart.value == null ||
                otherStart.value == undefined ||
            isNaN(otherStart.value) ){
            msg.innerHTML = "请用数字输入开课周！";
            $('#msgDialog').modal('show');
            return false;
        }
    }
    function getOtherLabName(otherLabId){
        if(otherLabId == "0") return "请选择实验室";
        var labName = "";
        <c:forEach items="${otherLabInfo}" var="otherLabPojo">
            if(otherLabId == ${otherLabPojo.labId}){
                labName = "${otherLabPojo.labName}";
            }
        </c:forEach>
        return labName;
    }

</script>
<!-- end Edit otherSchedule -->

<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/shards.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.sharrre.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.loading.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/holder.min.js"></script>

<script src="${pageContext.request.contextPath}/views/admin/scripts/extras.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/shards-dashboards.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/app/app-blog-overview.1.1.0.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/weekly-schedule.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>

