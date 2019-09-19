<%@ page language="java" contentType="text/html; charset=utf-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>备课平台</title>
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
                                <a href="${pageContext.request.contextPath}/teacher/PrepareClass"
                                   class="nav-link active">
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
                                <a href="${pageContext.request.contextPath}/teacher/TeachingAdvice" class="nav-link">
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
            <h2>备课</h2>

                <div class="row">

                    <div class="col-md-12">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#home" role="tab"
                                   aria-controls="home">电工电子实验基础I</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#profile" role="tab"
                                   aria-controls="profile">电工电子实验基础B</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#messages" role="tab"
                                   aria-controls="messages">电子程序设计</a>
                            </li>
                        </ul>

                        <div class="tab-content">

                            <div class="tab-pane active" id="home" role="tabpanel">
                                <h4>班级:B180206     B180104</h4>
                                <div class="row">
                                    <div class="col-md-8">

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        教案
                                                    </div>
                                                    <div class="card-body">
                                                        word列表
                                                        <ul>
                                                            <li>教案1</li>
                                                            <li>教案2</li>
                                                            <li>教案3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        PPT
                                                    </div>
                                                    <div class="card-body">
                                                        PPT列表
                                                        <ul>
                                                            <li>PPT1</li>
                                                            <li>PPT2</li>
                                                            <li>PPT3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        Mooc
                                                    </div>
                                                    <div class="card-body">
                                                        Mooc列表
                                                        <ul>
                                                            <li>Mooc1</li>
                                                            <li>Mooc2</li>
                                                            <li>Mooc3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        预习要求
                                                    </div>
                                                    <div class="card-body">
                                                        word列表
                                                        <ul>
                                                            <li>教案1</li>
                                                            <li>教案2</li>
                                                            <li>教案3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        报告要求
                                                    </div>
                                                    <div class="card-body">
                                                        PPT列表
                                                        <ul>
                                                            <li>PPT1</li>
                                                            <li>PPT2</li>
                                                            <li>PPT3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        期末总结
                                                    </div>
                                                    <div class="card-body">
                                                        Mooc列表
                                                        <ul>
                                                            <li>Mooc1</li>
                                                            <li>Mooc2</li>
                                                            <li>Mooc3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-header bg-light">
                                                教学大纲
                                            </div>
                                            <div class="card-body">
                                                列表
                                                <ul>
                                                    <li>大纲1</li>
                                                    <li>大纲2</li>
                                                    <li>大纲3</li>
                                                    <li>大纲4</li>
                                                    <li>大纲5</li>
                                                    <li>大纲6</li>
                                                    <li>大纲7</li>
                                                    <li>大纲8</li>
                                                    <li>大纲9</li>
                                                    <li>大纲10</li>
                                                    <li>大纲11</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="profile" role="tabpanel">
                                <h4>班级:B180207     B180107</h4>
                                <div class="row">
                                    <div class="col-md-8">

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        教案
                                                    </div>
                                                    <div class="card-body">
                                                        word列表
                                                        <ul>
                                                            <li>教案1</li>
                                                            <li>教案2</li>
                                                            <li>教案3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        PPT
                                                    </div>
                                                    <div class="card-body">
                                                        PPT列表
                                                        <ul>
                                                            <li>PPT1</li>
                                                            <li>PPT2</li>
                                                            <li>PPT3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        Mooc
                                                    </div>
                                                    <div class="card-body">
                                                        Mooc列表
                                                        <ul>
                                                            <li>Mooc1</li>
                                                            <li>Mooc2</li>
                                                            <li>Mooc3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        预习要求
                                                    </div>
                                                    <div class="card-body">
                                                        word列表
                                                        <ul>
                                                            <li>教案1</li>
                                                            <li>教案2</li>
                                                            <li>教案3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        报告要求
                                                    </div>
                                                    <div class="card-body">
                                                        PPT列表
                                                        <ul>
                                                            <li>PPT1</li>
                                                            <li>PPT2</li>
                                                            <li>PPT3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        期末总结
                                                    </div>
                                                    <div class="card-body">
                                                        Mooc列表
                                                        <ul>
                                                            <li>Mooc1</li>
                                                            <li>Mooc2</li>
                                                            <li>Mooc3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-header bg-light">
                                                教学大纲
                                            </div>
                                            <div class="card-body">
                                                列表
                                                <ul>
                                                    <li>大纲1</li>
                                                    <li>大纲2</li>
                                                    <li>大纲3</li>
                                                    <li>大纲4</li>
                                                    <li>大纲5</li>
                                                    <li>大纲6</li>
                                                    <li>大纲7</li>
                                                    <li>大纲8</li>
                                                    <li>大纲9</li>
                                                    <li>大纲10</li>
                                                    <li>大纲11</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="messages" role="tabpanel">
                                <h4>班级:B180205     B180105</h4>
                                <div class="row">
                                    <div class="col-md-8">

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        教案
                                                    </div>
                                                    <div class="card-body">
                                                        word列表
                                                        <ul>
                                                            <li>教案1</li>
                                                            <li>教案2</li>
                                                            <li>教案3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        PPT
                                                    </div>
                                                    <div class="card-body">
                                                        PPT列表
                                                        <ul>
                                                            <li>PPT1</li>
                                                            <li>PPT2</li>
                                                            <li>PPT3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        Mooc
                                                    </div>
                                                    <div class="card-body">
                                                        Mooc列表
                                                        <ul>
                                                            <li>Mooc1</li>
                                                            <li>Mooc2</li>
                                                            <li>Mooc3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        预习要求
                                                    </div>
                                                    <div class="card-body">
                                                        word列表
                                                        <ul>
                                                            <li>教案1</li>
                                                            <li>教案2</li>
                                                            <li>教案3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        报告要求
                                                    </div>
                                                    <div class="card-body">
                                                        PPT列表
                                                        <ul>
                                                            <li>PPT1</li>
                                                            <li>PPT2</li>
                                                            <li>PPT3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-4">
                                                <div class="card">
                                                    <div class="card-header bg-light">
                                                        期末总结
                                                    </div>
                                                    <div class="card-body">
                                                        Mooc列表
                                                        <ul>
                                                            <li>Mooc1</li>
                                                            <li>Mooc2</li>
                                                            <li>Mooc3</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="col-md-4">
                                        <div class="card">
                                            <div class="card-header bg-light">
                                                教学大纲
                                            </div>
                                            <div class="card-body">
                                                列表
                                                <ul>
                                                    <li>大纲1</li>
                                                    <li>大纲2</li>
                                                    <li>大纲3</li>
                                                    <li>大纲4</li>
                                                    <li>大纲5</li>
                                                    <li>大纲6</li>
                                                    <li>大纲7</li>
                                                    <li>大纲8</li>
                                                    <li>大纲9</li>
                                                    <li>大纲10</li>
                                                    <li>大纲11</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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
<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js" type="text/javascript"
        charset="utf-8"></script>


</body>
</html>
