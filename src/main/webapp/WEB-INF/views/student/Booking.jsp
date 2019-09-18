<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>学生预约</title>
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
    <link href="${pageContext.request.contextPath}/views/student/styles/booking.css" rel="stylesheet">
    <script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>

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
                        <a class="nav-link" href="${pageContext.request.contextPath}/student/WeeklySchedule">
                            <span class="mdi mdi-18px mdi-numeric-7-box-multiple-outline"></span> 周课表>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/student/Booking">
                            <span class="mdi mdi-18px mdi-bookmark-check"></span> 学生预约
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">
                            <span class="mdi mdi-18px mdi-account-clock"></span> 学生出勤
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
            <div class="main-content-container container px-4">
                <!-- Page Header -->
                <div class="page-header row no-gutters py-4">
                    <div class="col-12 col-sm-4 text-center text-sm-left mb-0">
                        <h3 class="page-title">开放信息</h3>
                        <span class="text-uppercase page-subtitle">Open Infomation</span>
                    </div>
                </div>
                <!-- End Page Header -->
                <!-- Info Cards -->
                <div class="row col-components-same-height">
                    <div class="col-12 col-lg-6 col-xl-5">
                        <div class="card card-small mb-4">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-2 col-sm-1">
                                        <div class="bg-danger rounded-circle text-white text-center p-1" style="height: 30px;width: 30px;">
                                            <h5 style="color: #ffffff;">1</h5>
                                        </div>
                                    </div>
                                    <div class="col-10 col-sm-11">
                                        <h5 class="card-title">开放实验规定</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-3 text-center">
                                <div class="row">
                                    <div class="col-12 text-left">
                                        <p class="text-muted">1.每人开放实验3次，总次数不少于6学时</p>
                                        <p class="text-muted">2.预约实验完成后提交报告</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6 col-xl-7">
                        <div class="card card-small mb-4">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-2 col-sm-1">
                                        <div class="bg-info rounded-circle text-white text-center p-1" style="height: 30px;width: 30px;">
                                            <h5 style="color: #ffffff;">2</h5>
                                        </div>
                                    </div>
                                    <div class="col-10 co-sm-11">
                                        <h5 class="card-title">预约通知</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-3 text-center">
                                <div class="row">
                                    <div class="col-12"><p class="text-muted">本学期开放实验时间第4周开始，第17周结束。预约采用网上预约的方式进行，预约成功后系统会自动安排座位号。请按预约的时间段到实验室完成计划的实验内容。务必带上校园卡，在实验室教学终端上进行预约考勤后方可获取实验桌电源。届时，管理员会通知各个院教师将开放信息传达给学生，欢迎广大学生预约实验，提高动手能力。</p></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Info Card -->
                <!-- Book Card -->
                <div class="row col-components-same-height">
                    <div class="col-12 col-lg-10 col-xl-8">
                        <div class="card card-small mb-4">
                            <div class="card-header border-bottom">
                                <div class="row">
                                    <div class="col-2 col-sm-1">
                                        <div class="bg-success rounded-circle text-white text-center p-1" style="height: 30px;width: 30px;">
                                            <h5 style="color: #ffffff;">3</h5>
                                        </div>
                                    </div>
                                    <div class="col-10 col-sm-11">
                                        <h5 class="card-title">可选预约</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-3 pb-4 text-center">
                                <div style="overflow-y: auto;">
                                    <table id="openLabTable" class="table table-hover">
                                        <tbody id="openLabBody">

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="BookingDetail" class="col-12 col-sm-6 col-lg-6 col-xl-4">
                        <div  class="card card-small mb-4">
                            <div class="card-header border-bottom">
                                <div class="row">
                                    <div class="col-2">
                                        <div class="bg-primary rounded-circle text-white text-center p-1" style="height: 30px;width: 30px;">
                                            <h5 style="color: #ffffff;">4</h5>
                                        </div>
                                    </div>
                                    <div class="col-10">
                                        <h5 class="card-title">我要预约</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-3 text-center">
                                <div class="row">
                                    <div class="col-12 text-left" id="bookDate"><h5><small class="text-muted">日期：</small></h5></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-left" id="bookWeek"><h5><small class="text-muted">周次：</small></h5></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-left" id="bookTime"><h5><small class="text-muted">时间：</small></h5></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-left" id="bookTeacher"><h5><small class="text-muted">教师：</small></h5></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-left" id="bookNum"><h5><small class="text-muted">已预约：</small></h5></div>
                                </div>
                                <div class="row">
                                    <div class="col-12 text-left" id="NotBookNum"><h5><small class="text-muted">可预约：</small></h5></div>
                                </div>
                                <div class="row pt-2">
                                    <div class="col-12 text-left"><label for="experimentContent" class="text-muted" >实验内容</label></div>
                                    <div class="col-12"><textarea class="form-control" id="experimentContent" rows="5" placeholder="请填写实验内容"></textarea></div>
                                </div>
                                <div class="row pt-2 pb-2 text-right"><div class="col-12">
                                    <button id="iBooking" class="btn btn-white" type="button" onclick="goBooking()">
                                        <span class="mdi mdi-check-bold text-success"></span> 我要预约</button>
                                </div></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Book Card -->
                <!-- history Card -->
                <div class="row">
                    <div class="col-12">
                        <div class="card card-small mb-4">
                            <div class="card-header border-bottom">
                                <div class="row">
                                    <div class="col-2 col-sm-1">
                                        <div class="bg-warning rounded-circle text-white text-center p-1" style="height: 30px;width: 30px;">
                                            <h5 style="color: #ffffff;">5</h5>
                                        </div>
                                    </div>
                                    <div class="col-5 col-sm-7">
                                        <h5 class="card-title">预约记录</h5>
                                    </div>
                                    <div class="col-5 col-sm-4 text-right">
                                        <button id="viewHistoryAll" class="btn btn-white" type="button" onclick="showHistoryAll()">
                                            <span class="mdi mdi-eye text-primary"></span> 全部记录</button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-3 text-center">
                                <div class="row col-components-same-height">
                                    <div class="col-12 col-lg-6 col-xl-5">
                                        <div style="overflow-y: auto;">
                                            <table id="historyTable" class="table table-hover">
                                                <tbody id="historyBody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="col-12 d-lg-none"><hr></div>
                                    <div class="col-12 col-lg-6 col-xl-7">
                                        <div id="historyDetail" class="row">
                                            <div class="col-12 col-sm-6 text-left" id="historyDate"><h5><small class="text-muted">日期：</small></h5></div>
                                            <div class="col-12 col-sm-6 text-left" id="historyWeek"><h5><small class="text-muted">周次：</small></h5></div>
                                            <div class="col-12 col-sm-6 text-left" id="historyTime"><h5><small class="text-muted">时间：</small></h5></div>
                                            <div class="col-12 col-sm-6 text-left" id="historyTeacherName"><h5><small class="text-muted">教师：</small></h5></div>
                                            <div class="col-12 col-sm-6 text-left" id="historyLabName"><h5><small class="text-muted">实验室：</small></h5></div>
                                            <div class="col-12 col-sm-6 text-left" id="historyTableId"><h5><small class="text-muted">实验桌：</small></h5></div>
                                            <div class="col-12 col-sm-12 col-md-12 col-xl-6 text-left" id="historyStartTime"><h5><small class="text-muted">实验时间：</small></h5></div>
                                            <div class="col-12 col-sm-12 col-md-12 col-xl-6 text-left" id="historyStopTime"><h5><small class="text-muted">离开时间：</small></h5></div>
                                            <div class="col-12 col-sm-6 col-md-12 col-xl-6 text-left" id="historyTotalTime"><h5><small class="text-muted">实验时长：</small></h5></div>
                                            <div class="col-12 col-sm-6 col-md-12 col-xl-6 text-left" id="historyAttendance"><h5><small class="text-muted">考勤状况：</small></h5></div>
                                            <div class="col-12 text-left"><label class="text-muted">实验内容:</label></div>
                                            <div class="col-12 pl-3 pr-3 pb-3">
                                                <div class="border border-light rounded p-3 pb-5 text-left" id="historyExperimentContent"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End history Card -->
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

<script type="text/javascript">
    window.onload = function(){
        showOpenLabList(${openLabInfo});
        showHistory('${bookHistory}');
        getUserInfo('${sessionScope.get("userId")}');
    }
    
</script>



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
<script src="${pageContext.request.contextPath}/views/student/scripts/booking.js" type="text/javascript" charset="utf-8"></script>


</body>
</html>

