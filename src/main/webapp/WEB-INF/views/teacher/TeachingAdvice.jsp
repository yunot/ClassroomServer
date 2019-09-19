<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>教学建议</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/admin/newresource/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/admin/newresource/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/css/styles.css">
    <%--图标--%>
    <link href="${pageContext.request.contextPath}/views/admin/vendor/MaterialDesign/css/materialdesignicons.min.css"
          rel="stylesheet">
</head>
<body class="sidebar-fixed header-fixed" id="myBody">





<!-- Message Dialog 提示信息-->
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


<div class="page-wrapper">
    <%--上面的导航栏--%>
    <nav class="navbar page-header">
        <h3>电工电子实验教学云端工作台</h3>
        <%--导航栏的自适应--%>
        <a href="#" class="btn btn-link sidebar-mobile-toggle d-md-none mr-auto">
            <i class="fa fa-bars"></i>
        </a>
        <a href="#" class="btn btn-link sidebar-toggle d-md-down-none">
            <i class="fa fa-bars"></i>
        </a>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item d-md-down-none">
                <a href="#">
                    <i class="fa fa-bell"></i>
                    <span class="badge badge-pill badge-danger">5</span>
                </a>
            </li>

            <li class="nav-item d-md-down-none">
                <a href="#">
                    <i class="fa fa-envelope-open"></i>
                    <span class="badge badge-pill badge-danger">5</span>
                </a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
                   aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/views/admin/newresource/imgs/avatar-1.png"
                         class="avatar avatar-sm" alt="logo">
                    <span class="small ml-1 d-md-down-none">${sessionScope.get("userName")}</span>
                </a>

                <div class="dropdown-menu dropdown-menu-right">
                    <div class="dropdown-header">账户信息</div>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-user"></i> 个人信息
                    </a>

                    <a href="#" class="dropdown-item">
                        <i class="fa fa-bell"></i>通知
                    </a>

                    <a class="dropdown-item" onclick="goQuit()">
                        <i class="fa fa-lock"></i>注销
                    </a>
                </div>
            </li>
        </ul>
    </nav>

    <div class="main-container">

        <%--侧边导航栏--%>
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul class="nav">

                    <li class="nav-title"><br></li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/teacher/TeachingActivity?userId=${sessionScope.get("userId")}" class="nav-link">
                            <i class="icon icon-speedometer"></i> 教学活动
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-target"></i> 任课教学<i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/teacher/PrepareClass" class="nav-link">
                                    <i class="icon icon-target"></i> 备课平台
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/teacher/GradeEvaluation" class="nav-link">
                                    <i class="icon icon-target"></i> 成绩评定
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/teacher/OpenProject" class="nav-link">
                                    <i class="icon icon-target"></i> 开放项目
                                </a>
                            </li>

                        </ul>
                    </li>

                    <li class="nav-item ">
                        <a href="${pageContext.request.contextPath}/teacher/QusBank" class="nav-link ">
                            <i class="icon icon-energy"></i> 题库建设
                        </a>
                    </li>

                    <li class="nav-item nav-dropdown">
                        <a href="#" class="nav-link nav-dropdown-toggle">
                            <i class="icon icon-umbrella"></i> 教学事务<i class="fa fa-caret-left"></i>
                        </a>

                        <ul class="nav-dropdown-items">
                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/teacher/TeachingLog" class="nav-link">
                                    <i class="icon icon-umbrella"></i> 教学日志
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/teacher/DeviceManage" class="nav-link">
                                    <i class="icon icon-umbrella"></i> 设备管理
                                </a>
                            </li>

                            <li class="nav-item">
                                <a href="${pageContext.request.contextPath}/teacher/TeachingAdvice" class="nav-link active">
                                    <i class="icon icon-umbrella"></i> 教学建议
                                </a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="content">

            <div class="container-fluid">

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">教学建议反馈</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <form role="form" action="${pageContext.request.contextPath}/teacher/advice" method="post">
                            <!-- text input -->
                            <div class="form-group">
                                <label>姓名</label>
                                <input id="userName" type="text" class="form-control" name="teacher_name" value=${sessionScope.get("userName")} >
                            </div>
                            <div class="form-group">
                                <label>工号</label>
                                <input id="userId" type="text" class="form-control" name="teachId" value=${sessionScope.get("userId")} >
                            </div>

                            <!-- select -->
                            <div class="form-group">
                                <label>反馈类型</label>
                                <select class="form-control" name="feedback_type">
                                    <option>教学建议</option>
                                    <option>开课建议</option>
                                    <option>其他建议</option>
                                </select>
                            </div>

                            <!-- textarea -->
                            <div class="form-group">
                                <label>反馈内容</label>
                                <textarea id="feedback" class="form-control" rows="5" placeholder="请输入内容(不超过五百字)" name="feedback" maxlength="500"></textarea>
                            </div>

                            <div class="row">
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">提交</button>
                            </div>
                            <div class="card-footer">
                                <a href="${pageContext.request.contextPath}/teacher/viewAdvice" class="btn btn-primary">查看教学建议</a>
                            </div>
                            </div>
                        </form>


                    </div>
                    <!-- /.card-body -->
                </div>


            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/popper.js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/js/carbon.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js" type="text/javascript" charset="utf-8"></script>


</body>
</html>
