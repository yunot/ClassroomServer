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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/photocut.css">
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropperImg.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropper.min.css">


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
                                    <ul class="circle_list circle_list2">
                                        <p></p>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <p></p>

                                    </ul>

                                    <div class="col-md-11">
                                        <p id="fulldate"></p>
                                        <div class="row">
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
                                        <p id="hllo"></p>



                                    </div>



                                </div><div class="stamp_inner stamp_middle">

                                </div><div class="stamp_inner stamp_right"
                                     <%--style="background-image:url(${pageContext.request.contextPath}/views/admin/newresource/imgs/sky.jpg)"--%>>



                                    <ul class="circle_list circle_list1" >
                                        <p></p>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <li></li>
                                        <p></p>
                                        <p></p>

                                    </ul>

                               <%-- <div class="col-md-11" style="float: right">--%>
                                <img id="userPhoto" src="${pageContext.request.contextPath}/views/teacher/images/a.png" width="100%">
                                    <button style="float:right"  class="btn btn btn-outline-info" data-target="#changeModal" data-toggle="modal">更换图片</button>

                                <%--</div>--%>
                            </div>
                            </li>


                        </ul>


                    </div>




                </div>



                <div class="row">


                    <div class="col-md-6">
                        <div class="box13">
                            <div class="card ">
                                <div class="card-header">
                                    <div class="col-md-5" style="float: left"><h3>备忘录</h3></div>
                                    <div class="col-md-7" style="float: right;">
                                        <a class="btn btn-primary"
                                           href="${pageContext.request.contextPath}/teacher/getNote">历史记录</a>
                                        <button class="btn btn-primary" onclick="saveNote()">保存</button>
                                    </div>
                                </div>
                                <div class="card-body" style="border: 1px solid gray">
                                    <div class="editor" id="note"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <%--<div class="box12">--%>
                            <div class="card" style="margin-top:40px">
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
                                    <div class="card-footer ">
                                        <span class="h3 d-block font-weight-normal mb-2"></span>
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
                        <div class="box10">
                                <div class="col-md-2" style="float: left"><h3>校历</h3></div>
                                <div class="col-md-2" style="float: right;">
                                    <button class="btn btn-primary" onclick="saveCalendar()">更改校历</button>
                                </div>

                            <hr>

                                <div class="table-responsive">
                                    <div>
                                        <table id="SchoolCalendar" class="col-md-12 gradable"></table>
                                    </div>
                                </div>
                        </div>

                    </div>

                </div>

                <div class="row">

                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="box10">
                            <table id="timeTable" class="schedule"></table>
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


<%--Modal窗口--%>
<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <p class="tip-info text-center">
                    未选择图片
                </p>
                <div class="img-container hidden">
                    <img src="" alt="" id="photo">
                </div>
                <div class="img-preview-box hidden">
                    <hr>
                    <span>150*150:</span>
                    <div class="img-preview img-preview-lg">
                    </div>
                    <span>100*100:</span>
                    <div class="img-preview img-preview-md">
                    </div>
                    <span>30*30:</span>
                    <div class="img-preview img-preview-sm">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <label class="btn btn-danger pull-left" for="photoInput">
                    <input type="file" class="sr-only" id="photoInput" accept="image/*">
                    <span>打开图片</span>
                </label>
                <button class="btn btn-primary disabled" disabled="true" onclick="savePic();" data-dismiss="modal">提交</button>
                <button class="btn btn-close" aria-hidden="true" data-dismiss="modal">取消</button>
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


<script>
    //注意：折叠面板 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });
</script>

<!-- cropper  -->
<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropper.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/newresource/cropper/cropperImg.min.js"></script>
<script type="text/javascript">
    var initCropperInModal = function(img, input, modal){
        var $image = img;
        var $inputImage = input;
        var $modal = modal;
        var options = {
            aspectRatio: 1, // 纵横比
            viewMode: 2,
            preview: '.img-preview' // 预览图的class名
        };
        // 模态框隐藏后需要保存的数据对象
        var saveData = {};
        var URL = window.URL || window.webkitURL;
        var blobURL;
        $modal.on('show.bs.modal',function () {
            // 如果打开模态框时没有选择文件就点击“打开图片”按钮
            // if(!$inputImage.val()){
            //    $inputImage.click();
            // }
        }).on('shown.bs.modal', function () {
            // 重新创建
            $image.cropper( $.extend(options, {
                ready: function () {
                    // 当剪切界面就绪后，恢复数据
                    if(saveData.canvasData){
                        $image.cropper('setCanvasData', saveData.canvasData);
                        $image.cropper('setCropBoxData', saveData.cropBoxData);
                    }
                }
            }));
        }).on('hidden.bs.modal', function () {
            // 保存相关数据
            saveData.cropBoxData = $image.cropper('getCropBoxData');
            saveData.canvasData = $image.cropper('getCanvasData');
            // 销毁并将图片保存在img标签
            $image.cropper('destroy').attr('src',blobURL);
        });
        if (URL) {
            $inputImage.change(function() {
                var files = this.files;
                var file;
                if (!$image.data('cropper')) {
                    return;
                }
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/\w+$/.test(file.type)) {

                        if(blobURL) {
                            URL.revokeObjectURL(blobURL);
                        }
                        blobURL = URL.createObjectURL(file);

                        // 重置cropper，将图像替换
                        $image.cropper('reset').cropper('replace', blobURL);

                        // 选择文件后，显示和隐藏相关内容
                        $('.img-container').removeClass('hidden');
                        $('.img-preview-box').removeClass('hidden');
                        $('#changeModal .disabled').removeAttr('disabled').removeClass('disabled');
                        $('#changeModal .tip-info').addClass('hidden');

                    } else {
                        window.alert('请选择一个图像文件！');
                    }
                }
            });
        } else {
            $inputImage.prop('disabled', true).addClass('disabled');
        }
    }


    //转blob
    var savePic= function(){
        var photo = $('#photo').cropper('getCroppedCanvas', {
            width: 300,
            height: 300
        }).toBlob(function (blob) {

            var formData = new FormData();
            formData.append('file', blob,'a.png');
            var ajaxUrl = "${pageContext.request.contextPath}/savePic";
            var imgUrl="${pageContext.request.contextPath}/views/teacher/images/a.png"
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
                mimeType: "multipart/form-data",
                success: function (data) {
                    alert(data);
                    document.getElementById('userPhoto').src="${pageContext.request.contextPath}/views/teacher/images/a.png?t="+Math.random();
                    <%--$('.user-photo').attr('src', '${pageContext.request.contextPath}/images/a.png?t=' + Math.random());--%>
                    $('#changeModal').modal('hide');
                },
                error: function(data) {
                    alert("error:"+data.responseText);

                }
            });
            return false;
        })

    }

    $(function(){
        initCropperInModal($('#photo'),$('#photoInput'),$('#changeModal'));
    });
</script>


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
        var td = document.createElement("th");
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



</body>
</html>
