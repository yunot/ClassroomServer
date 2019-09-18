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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/styles/WeeklySchedule.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/layui/css/layui.css"  media="all">
    <script async defer src="${pageContext.request.contextPath}/views/admin/vendor/js/bottons.js"></script>



    <%--图标--%>
    <link href="${pageContext.request.contextPath}/views/admin/vendor/MaterialDesign/css/materialdesignicons.min.css"
          rel="stylesheet">
    <link rel="icon" type="image/png" sizes="96x96" href="${pageContext.request.contextPath}/views/admin/newresource/imgs/management.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/stamp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropperImg.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropper.min.css">

    <style type="text/css">
        body{
            text-align: center;
        }
        #user-photo {
            width:100%;
            height:100%;
        }
        #photo {
            max-width:100%;
            max-height:350px;
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
                        <a href="${pageContext.request.contextPath}/teacher/TeachingActivity" class="nav-link active">
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

            <div class="container-fluid" >

                <div class="row">

                    <div class="col-md-12">
                        <ul class="wrap">
                            <li class="stamp" >
                                <div class="stamp_inner stamp_left" >

                                    <div class="calendarYuno" >
                                        <p id="fulldate"></p>
                                        <div class="contentYuno" >
                                            <span id="lunaryear" ></span>
                                            <span id="weeky" ></span>
                                        </div>
                                        <div class="contentYuno">
                                            <span id="nowdate" ></span>
                                        </div>
                                        <div class="contentYuno">
                                            <span id="lunardate" ></span>
                                            <span id="weekyEn" ></span>
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
                                </div><div class="stamp_inner stamp_right" style="background-image:url(${pageContext.request.contextPath}/views/admin/newresource/imgs/sky.jpg)">




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













                <div class="row">
                    <div class="col-md-6">
                        <form id="uploadPic" action="#" enctype="multipart/form-data">
                            <input type="file" name="file">
                            <a href="javascript:savePic();" class="btn green"> 提交 </a>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <div class="box12">
                            <div class="card">
                                <div class="card-header bg-light">
                                    <span class="h4 d-block font-weight-normal mb-2">通知</span>
                                </div>


                                <div class="card-body">
                                    <div class="layui-collapse">
                                        <c:forEach items="${pageInfo.list}" var="notice">
                                            <div class="layui-colla-item">
                                                <h2 class="layui-colla-title" >${notice.notice_content}</h2>
                                                <div class="layui-colla-content ">${notice.notice_details}</div>
                                            </div>
                                        </c:forEach>
                                    </div>

                                </div>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=1&size=${pageInfo.pageSize}">首页</a></li>
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
                                        <c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
                                            <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                                        </c:forEach>
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/teacher/TeachingActivity?page=${pageInfo.pages}&size=${pageInfo.pageSize}">尾页</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>


                </div>





             </div>





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

<script type="text/javascript" src="${pageContext.request.contextPath}/views/teacher/dist/js/ajaxfileupload.js"></script>
<script>
    //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>

<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/jquery.min.js"></script>
<!-- cropper  -->
<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropperImg.min.js"></script>
<script type="text/javascript">
    function savePic(){
        var formData = new FormData($( "#uploadPic" )[0]);
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
            contentType:false,
            processData: false,
            success: function (data) {
                alert(data);
            },
            error: function(data) {
                alert("error:"+data.responseText);

            }
        });
        return false;
    }
</script>
<script src="https://cdn.bootcss.com/cropper/3.1.3/cropper.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</body>
</html>
