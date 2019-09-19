<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">

    <title>教师端首页</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/boxx.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/calendar.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/admin/newresource/vendor/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/views/admin/newresource/vendor/font-awesome/css/fontawesome-all.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/css/styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/layui/css/layui.css"
          media="all">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/views/teacher/dist/css/jquery.notebook.css">
    <script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>
    <%--校历的样式--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/teacher/dist/css/calendar-table.css">


    <%--图标--%>
    <link href="${pageContext.request.contextPath}/views/admin/vendor/MaterialDesign/css/materialdesignicons.min.css"
          rel="stylesheet">
    <link rel="icon" type="image/png" sizes="96x96"
          href="${pageContext.request.contextPath}/views/admin/newresource/imgs/management.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/stamp.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropperImg.css">--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropper.min.css">--%>

    <style type="text/css">

        #user-photo {
            width: 100%;
            height: 100%;
        }

        #photo {
            max-width: 100%;
            max-height: 350px;
        }

        .img-preview-box {
            text-align: center;
        }

        .img-preview-box > div {
            display: inline-block;;
            margin-right: 10px;
        }

        .img-preview {
            overflow: hidden;
        }

        .img-preview-box .img-preview-lg {
            width: 150px;
            height: 150px;
        }

        .img-preview-box .img-preview-md {
            width: 100px;
            height: 100px;
        }

        .img-preview-box .img-preview-sm {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
    </style>

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
                        <a href="${pageContext.request.contextPath}/teacher/TeachingActivity?userId=${sessionScope.get("userId")}" class="nav-link active">
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

                <div class="row">

                    <div class="col-md-12">
                        <ul class="wrap">
                            <li class="stamp">
                                <div class="stamp_inner stamp_left">

                                    <div class="calendarYuno">
                                        <p id="fulldate"></p>
                                        <div class="contentYuno">
                                            <span id="lunaryear"></span>
                                            <span id="weeky"></span>
                                        </div>
                                        <div class="contentYuno">
                                            <span id="nowdate"></span>
                                        </div>
                                        <div class="contentYuno">
                                            <span id="lunardate"></span>
                                            <span id="weekyEn"></span>
                                        </div>


                                    </div>


                                </div><div class="stamp_inner stamp_middle">
                                    <ul class="circle_list circle_list1">
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>

                                    </ul>
                                </div><div class="stamp_inner stamp_right"
                                     style="background-image:url(${pageContext.request.contextPath}/views/admin/newresource/imgs/sky.jpg)">


                                    <ul class="circle_list circle_list1">
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>

                                    </ul>

                                    <img id="user-photo" src="" width="100%">


                                </div>
                            </li>


                        </ul>
                    </div>


                </div>

                <br>
                <br>

                <div class="row">


                    <div class="col-md-6">
                        <div class="card p-4">
                            <div class="card-header">
                                <div class="col-md-5" style="float: left"><h3>工作标签</h3></div>
                                <div class="col-md-7" style="float: right;">
                                    <a class="btn btn-primary"
                                       href="${pageContext.request.contextPath}/teacher/getNoteById?userId=${sessionScope.get("userId")}">查看工作标签</a>
                                    <button class="btn btn-primary" onclick="saveNote()">保存</button>
                                </div>
                            </div>
                            <div class="card-body" style="border: 1px solid gray">
                                <div class="editor" id="note"></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <%--<div class="box12">--%>
                            <div class="card p-4">
                                <div class="card-header bg-light">
                                    <span class="h4 d-block font-weight-normal mb-2">通知</span>
                                </div>
                                <div class="card-body">
                                    <div class="layui-collapse">
                                        <c:forEach items="${pageInfo.list}" var="notice">
                                            <div class="layui-colla-item">
                                                <h2 class="layui-colla-title">${notice.notice_content}</h2>
                                                <div class="layui-colla-content ">${notice.notice_details}</div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link"
                                                                 href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=1&size=${pageInfo.pageSize}&userId=${sessionScope.get("userId")}">首页</a>
                                        </li>
                                        <li class="page-item"><a class="page-link"
                                                                 href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}&userId=${sessionScope.get("userId")}">上一页</a>
                                        </li>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                            <li class="page-item"><a class="page-link"
                                                                     href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageNum}&size=${pageInfo.pageSize}&userId=${sessionScope.get("userId")}">${pageNum}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link"
                                                                 href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}&userId=${sessionScope.get("userId")}">下一页</a>
                                        </li>
                                        <li class="page-item"><a class="page-link"
                                                                 href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageInfo.pages}&size=${pageInfo.pageSize}&userId=${sessionScope.get("userId")}">尾页</a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        <%--</div>--%>
                    </div>


                </div>


                <div class="row">

                    <div class=" col-md-12">
                        <div class="card">
                            <div class="card-header ">
                                <div class="col-md-2" style="float: left"><h3>校历</h3></div>
                                <div class="col-md-2" style="float: right;">
                                    <button class="btn btn-primary" onclick="saveCalendar()">更改校历</button>
                                </div>
                            </div>

                            <div class="card-body">
                                <div class="table-responsive">
                                    <div>
                                        <table id="SchoolCalendar" class="col-md-12 gradable"></table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="row" >


                    <div class="col-md-6">
                        <div class="card p-4">
                            <img src="${pageContext.request.contextPath}/views/teacher/imgs/time.png" width="100%"
                                 height="80%">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-md-3">
                        <!-- Single button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                邮箱
                            </button>
                            <ul class="dropdown-menu">
                                <div class="dropdown-item"><a style="display:block;" href="http://mail.njupt.edu.cn"
                                                              target="_blank">学校邮箱</a>
                                </div>
                                <div class="dropdown-item"><a style="display:block;" href="https://mail.126.com/"
                                                              target="_blank">126邮箱</a>
                                </div>
                                <div class="dropdown-item"><a style="display:block;" href="https://mail.sina.com.cn/"
                                                              target="_blank">新浪邮箱</a>
                                </div>
                                <div class="dropdown-item"><a style="display:block;" href="https://mail.qq.com/"
                                                              target="_blank">QQ邮箱</a>
                                </div>
                            </ul>
                        </div>
                        <a href="http://wx.qq.com/" target="_blank" class="btn btn-primary">微信</a>
                        <a href="tencent://message/?Menu=yes&uin=123456&Site=80fans&Service=300&sigT=45a1e5847943b64c6ff3990f8a9e644d2b31356cb0b4ac6b24663a3c8dd0f8aa12a545b1714f9d45"
                           class="btn btn-success">QQ</a>
                    </div>

                </div>


            </div>


        </div>


    </div>
</div>
</div>

<%--更改校历--%>
<div class="modal fade" tabindex="-1" role="dialog" id="CalendarView">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">更改校历</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4"><h6 class="text-primary">学期名称</h6></div>
                        <div class="col-md-8"><input class="form-control" id="SemesterName" placeholder="学期名称"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"><h6 class="text-primary">开学日期</h6></div>
                        <div class="col-md-8"><input class="form-control" id="StartDate" type="date"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"><h6 class="text-primary">学期周数</h6></div>
                        <div class="col-md-8"><input class="form-control" id="Weeks" placeholder="学期周数(例如:20)"></div>
                        <div class="col-md-12"><br></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveBtn">保存</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal" id="deleteBtn">删除</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="">取消</button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/views/admin/vendor/js/showDay.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/popper.js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/vendor/chart.js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/js/carbon.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/js/demo.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/scripts/system-content.js" type="text/javascript"
        charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/views/teacher/script/calendar.js"></script>


<script type="text/javascript"
        <%--src="${pageContext.request.contextPath}/views/teacher/dist/js/ajaxfileupload.js"></script>--%>
<script>
    //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function () {
        var element = layui.element;

        //…
    });
</script>

<%--<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/jquery.min.js"></script>--%>
<!-- cropper  -->
<%--<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropper.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropperImg.min.js"></script>--%>
<script type="text/javascript">
    function savePic() {
        var formData = new FormData($("#uploadPic")[0]);
        var ajaxUrl = "${pageContext.request.contextPath}/saveHeaderPic";
        //alert(ajaxUrl);
        //$('#uploadPic').serialize() 无法序列化二进制文件，这里采用formData上传
        //需要浏览器支持：Chrome 7+、Firefox 4+、IE 10+、Opera 12+、Safari 5+。
        $.ajax({
            type: "POST",
            //dataType: "text",
            url: ajaxUrl,
            data: formData,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
                alert(data);
            },
            error: function (data) {
                alert("error:" + data.responseText);

            }
        });
        return false;
    }
</script>
<%--<script src="https://cdn.bootcss.com/cropper/3.1.3/cropper.min.js"></script>--%>
<%--<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>


<script type="text/javascript">

    //获取用户页面信息
    function getUserInfo(userId) {
        $.ajax({
            url: getProjectName() + "/student/GetUserInfo",
            type: "GET",
            data: {
                userId: userId
            },
            success: function (data) {
                //userInfo = eval('('+data+')');
            },
            error: function () {

            }
        })
    }

    $(function () {
        getUserInfo('${sessionScope.get("userId")}');
    });
</script>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/views/teacher/script/jquery.notebook.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.editor').notebook({
            autoFocus: true,
            placeholder: ''
        });
    });
</script>

<script>

    function dateFtt(fmt, date) {
        var o = {
            "M+": date.getMonth() + 1, //月份
            "d+": date.getDate(), //日
            "h+": date.getHours(), //小时
            "m+": date.getMinutes(), //分
            "s+": date.getSeconds(), //秒
            "q+": Math.floor((date.getMonth() + 3) / 3), //季度
            "S": date.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k])
                    .length)));
        return fmt;
    }


    function saveNote() {
        var note = document.getElementById("note");
        var noteContent = note.innerText;
        var now = new Date();
        var time = dateFtt("yyyy-MM-dd hh:mm:ss", now);
        if (noteContent == null || noteContent === '' || noteContent === undefined) {
            showMsgDialog("请输入内容后再保存");
        } else {
            $.ajax({
                url: getProjectName() + "/teacher/saveNote",
                type: "POST",
                data: {
                    note: noteContent,
                    create_date: time,
                    user_id: '${sessionScope.get("userId")}'
                },
                success: function () {
                    showMsgDialog("保存成功!");
                },
                error: function () {
                    showMsgDialog("失败");
                }
            });
        }
    }
</script>

<script>
    //获取数据，生成校历
    var weeks = "${weeks}";
    var start_date = "${startDay}";
    var semName = "${semName}";
    loadCalendar(weeks, start_date, semName);
</script>

<script>
    var StartDate = document.getElementById("StartDate");
    var SemesterName = document.getElementById("SemesterName");
    var Weeks = document.getElementById("Weeks");


    function saveCalendar() {
        deleteBtn.style.display = "none";
        saveBtn.onclick = saveChangeCalendar;
        $('#CalendarView').modal('show');
    }

    function saveChangeCalendar() {
        if (checkCalendarInput() === false) {
        } else {
            $.ajax({
                url: getProjectName() + "/teacher/saveCalendar",
                type: "POST",
                data: {
                    start_day: StartDate.value,
                    semester_name: SemesterName.value.replace(/\s*/g, ""),
                    total_weeks: Weeks.value,
                    user_id: '${sessionScope.get("userId")}'
                },
                success: function (data) {
                    // location.reload();//刷新当前页面
                    showMsgDialog(data);
                },
                error: function () {
                    showMsgDialog("数据不合法!");
                }
            });
        }

    }

    function isInvalid(val) {
        var str = val.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
        return str == null || str === '' || str === undefined;
    }

    //输入判断
    function checkCalendarInput() {
        if (isInvalid(SemesterName.value)) {
            showMsgDialog("请输入学期名称");
            return false;
        }
        if (isInvalid(StartDate.value)) {
            showMsgDialog("请输入开学日期");
            return false;
        }
        if (isInvalid(Weeks.value)) {
            showMsgDialog("请输入学期周数");
            return false;
        }
    }
</script>


</body>
</html>
