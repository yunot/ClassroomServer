<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html class="no-js h-100" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>管理</title>
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
    <%--<script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>--%>
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
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="msgBtn" onclick="">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- end Message Dialog -->
<!-- checkModify dialog -->
<div class="modal fade" tabindex="-1" role="dialog" id="checkModify">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>是否修改实验室信息</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveModify()">确认</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="notModify()">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- checkModify dialog end -->

<!-- Update dialog -->
<div class="modal fade" tabindex="-1" role="dialog" id="updateDialog">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="updateDialogMsg"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
            </div>
        </div>
    </div>
</div>
<!-- Update dialog end -->

<!-- Waiting dialog -->
<div class="modal" tabindex="-1" role="dialog" id="waitingDialog">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="waitingDialogMsg"></p>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- end Waiting dialog -->

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
                            <span class="mdi mdi-18px mdi-remote"></span>环境状况
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="${pageContext.request.contextPath}/admin/LabManagement">
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
                        <h3 class="page-title">实验室信息</h3>
                        <span class="text-uppercase page-subtitle">Laboratory Infomation</span>
                    </div>
                </div>
                <!-- End Page Header -->
                <div class="row">
                    <div class="col-lg-9 col-md-10 col-12">
                        <div class="card card-small mb-4">
                            <div class="card-header border-bottom">
                                <h6>实验室基本信息</h6>
                            </div>
                            <div class="card-body p-0 pb-3 text-center">
                                <div class="table-responsive">
                                    <table class="table mb-0">
                                        <thead class="bg-light">
                                            <tr>
                                                <th scope="col" class="border-0 text-nowrap">实验室ID</th>
                                                <th scope="col" class="border-0 text-nowrap">    实验室名称  </th><!-- 用空格撑起表格宽度 -->
                                                <th scope="col" class="border-0 text-nowrap">    类型(主要/开放/其他)  </th>
                                                <th scope="col" class="border-0 text-nowrap">  桌数  </th>
                                                <th scope="col" class="border-0 text-nowrap">锁定</th>
                                                <th scope="col" class="border-0 text-nowrap"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${labManagementList}" var="labManagement">
                                            <tr>
                                                <th scope="row">${labManagement.labId}</th>
                                                <td>
                                                    <input type="text" class="form-control" id="inputLabName${labManagement.labId}" value="${labManagement.labName}" disabled="disabled">
                                                </td>
                                                <td>
                                                    <div class="row">
                                                        <div class="col-4">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="mainLabCheckbox${labManagement.labId}" disabled="disabled">
                                                                <label class="custom-control-label" for="mainLabCheckbox${labManagement.labId}"></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="openLabCheckbox${labManagement.labId}" disabled="disabled">
                                                                <label class="custom-control-label" for="openLabCheckbox${labManagement.labId}"></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-4">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="otherLabCheckbox${labManagement.labId}" disabled="disabled">
                                                                <label class="custom-control-label" for="otherLabCheckbox${labManagement.labId}"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" id="inputTableNum${labManagement.labId}" value="${labManagement.tableNum}" disabled="disabled">
                                                </td>
                                                <td>
                                                    <div class="custom-control custom-toggle custom-toggle-sm mb-1">
                                                        <input type="checkbox" id="${labManagement.labId}" class="custom-control-input" checked="checked" onclick="toggleOnClick(event)">
                                                        <label class="custom-control-label" for="${labManagement.labId}"></label>
                                                    </div>
                                                </td>
                                                <td style="cursor: pointer;" onclick="viewLabDevices(${labManagement.labId})">
                                                    <a><span class="mdi mdi-18px mdi-dark mdi-inactive mdi-arrow-right-drop-circle-outline"></span></a></td>
                                            </tr>
                                            <script type="text/javascript">
                                                var mainlab = ${labManagement.mainLab};
                                                var openlab = ${labManagement.openLab};
                                                var otherlab = ${labManagement.otherLab};

                                                var mainCheck = document.getElementById("mainLabCheckbox${labManagement.labId}");
                                                if( true == mainlab)    mainCheck.checked = true;
                                                else                    mainCheck.checked = false;

                                                var openCheck = document.getElementById("openLabCheckbox${labManagement.labId}");
                                                if( true == openlab)    openCheck.checked = true;
                                                else                    openCheck.checked = false;

                                                var otherCheck = document.getElementById("otherLabCheckbox${labManagement.labId}");
                                                if( true == otherlab)   otherCheck.checked = true;
                                                else                    otherCheck.checked = false;
                                            </script>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-2 col-6">
                        <div class="row" style="position: sticky; top: 80px;">
                            <div class="col-12">
                                <div class="card card-small mb-4">
                                    <div class="card-header border-bottom">
                                        <h6><span id="deviceLabName" class="text-primary"></span>教学设备</h6>
                                    </div>
                                    <div class="card-body p-0 pb-3 text-center">
                                        <div id="listDevicesParent" style="width: 100%;height: 350px; overflow-y: scroll;">
                                            <ul id="listDevices" class="list-group list-group-flush"></ul>
                                        </div>
                                    </div>
                                    <button id="addDeviceBtn" class="btn btn-primary" disabled="disabled">添加设备</button>
                                </div>
                            </div>
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

<!-- add Device -->
<div class="modal fade" tabindex="-1" role="dialog" id="addDevice">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">添加设备</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-5"><h5 class="text-primary">设备名称</h5></div>
                        <div class="col-7"><input id="addDeviceName" type="text" class="form-control"></div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-5"><h5 class="text-primary">设备信息</h5></div><div class="col-8"></div>
                        <div class="col-5"><h6>名称</h6></div>
                        <div class="col-6"><h6>内容</h6></div>
                    </div>
                    <div id="deviceInfo"></div>
                    <div class="row pt-2"><div class="col-12 text-center"><a id="addDeviceInfoBtn"><h4><span class="mdi mdi-pencil-plus-outline"></span></h4></a></div></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveAddDeviceBtn" onclick="">确定</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal" id="deleteDeviceBtn" onclick="">删除</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>
<!-- ./ end add Device -->


<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/shards.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/jquery.sharrre.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/vendor/js/holder.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/extras.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/shards-dashboards.1.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/app/app-blog-overview.1.1.0.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/lab-management.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>

