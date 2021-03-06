<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>日志</title>
    <meta name="description" content="A high-quality &amp; free Bootstrap admin dashboard template pack that comes with lots of templates and components.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/all.css" rel="stylesheet">
    <!--Material+Icons-->
    <link href="${pageContext.request.contextPath}/views/admin/vendor/MaterialDesign/css/materialdesignicons.min.css" rel="stylesheet">
    <!--Bootstrap CSS-->
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/views/admin/styles/shards-dashboards.1.1.0.min.css" rel="stylesheet" id="main-stylesheet" data-version="1.1.0">
    <link href="${pageContext.request.contextPath}/views/admin/styles/extras.1.1.0.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/views/admin/styles/global.css" rel="stylesheet">
    <script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/WeeklySchedule.css">
    <link href="${pageContext.request.contextPath}/views/admin/vendor/css/jquery.dataTables.css" rel="stylesheet">
</head>
<body class="h-100">
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
                <button id="msgBtn" type="button" class="btn btn-primary" data-dismiss="modal" onclick="">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- end Message Dialog -->
<div class="container-fluid">
    <div class="row">
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
                            <span class="mdi mdi-18px mdi-remote"></span>  环境状况
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/TotalSchedule">
                            <span class="mdi mdi-18px mdi-table"></span> 总课表管理
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/TeachingLog">
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
                            <span class="mdi mdi-18px mdi-bookmark-check"></span> 开放预约
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
                                    <span class="badge badge-pill badge-danger"></span>
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
                        <h3 class="page-title">教学日志</h3>
                        <span class="text-uppercase page-subtitle">Teaching Log</span>
                    </div>
                </div>
                <!-- End Page Header -->
                <!-- Info Card -->
                <div class="card card-small mb-4" style="height: 70%;">
                    <div class="card-header">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-6 col-md-6 text-left">
                                    <h5>日志列表</h5>
                                </div>
                                <div class="col-6 col-md-6 text-right">
                                    <button type="button" class="btn btn-white" >日志登记</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0 pb-3 text-center">

                        <div class="container-fluid">
                            <div class="row">
                                <div class="table-responsive p-2" style="overflow: auto;">
                                    <table id="logTable" class="table table-sm table-hover table-thead-sticky">
                                        <thead class="bg-light">
                                        <tr>
                                            <th>日期</th>
                                            <th>时间</th>
                                            <th>实验室</th>
                                            <th>课程名称</th>
                                            <th>学时</th>
                                            <th>班级</th>
                                            <th>人数</th>
                                            <th>安全</th>
                                            <th>环境</th>
                                            <th>任课教师</th>
                                        </tr>
                                        </thead>
                                        <tbody id="TeachingLogBody"></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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


<!-- more info -->
<div class="modal fade" tabindex="-1" role="dialog" id="ViewTeachingLog">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">日志详情</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">日期</h6></div>
                                <div class="col-lg-8"><h5 id="LogDate"></h5></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">周次</h6></div>
                                <div class="col-lg-8"><h5 id="LogWeek"></h5></div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">星期</h6></div>
                                <div class="col-lg-8"><h5 id="LogDayOfWeek"></h5></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">时间</h6></div>
                                <div class="col-lg-8"><h5 id="LogTimeOfDay"></h5></div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">实验室</h6></div>
                                <div class="col-lg-8"><h5 id="LogLabName"></h5></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">课程名称</h6></div>
                                <div class="col-lg-8"><h5 id="LogCourseName"></h5></div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">学时</h6></div>
                                <div class="col-lg-8"><h5 id="LogCourseHour"></h5></div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">教师账号</h6></div>
                                <div class="col-lg-8"><h5 id="LogTeacherId"></h5></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">教师姓名</h6></div>
                                <div class="col-lg-8"><h5 id="LogTeacherName"></h5></div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">班级</h6></div>
                                <div class="col-lg-8"><h5 id="LogClassId"></h5></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">组数</h6></div>
                                <div class="col-lg-8"><input id="LogClassUser" class="form-control"></input></div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">安全</h6></div>
                                <div class="col-lg-8">
                                    <select id="LogSafe" class="form-control">
                                        <option value="安全">安全</option>
                                        <option value="不安全">不安全</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-4"><h6 class="text-primary">环境</h6></div>
                                <div class="col-lg-8">
                                    <select id="LogEnv" class="form-control">
                                        <option value="良好">良好</option>
                                        <option value="较差">较差</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-1">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-12"><h6 class="text-primary">实验内容</h6> </div>
                                <div class="col-lg-12"><textarea id="LogContent" class="form-control" rows="5"></textarea></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-12"><h6 class="text-primary">备注</h6> </div>
                                <div class="col-lg-12"><textarea id="LogRemark" class="form-control" rows="5"></textarea></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="saveBtn" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ more info -->



<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/shards.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.sharrre.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/holder.min.js"></script>

<script src="${pageContext.request.contextPath}/views/admin/scripts/extras.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/shards-dashboards.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/app/app-blog-overview.1.1.0.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/teaching-log.js"></script>


<script type="text/javascript">
    $(function(){
        teachingLogShow('${TeachingLogInfo}');
    });

    $(document).ready(function() {
        var table = $('#logTable').DataTable();

        $('#logTable tbody').on( 'click', 'tr', function () {
            //$(this).toggleClass('selected');
            getLogDetail(table.row(this).id(), 3);
            $('#ViewTeachingLog').modal('show');
        } );

    } );
</script>


</body>
</html>

