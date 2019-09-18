<%--
  Created by IntelliJ IDEA.
  User: Vic_Hoo
  Date: 2019/4/29
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Template by FreeHTML5.co"/>
    <meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive"/>

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/login/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/login/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/login/css/style.css">


    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/views/login/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/views/login/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="style-3">


<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <!-- Start Sign In Form -->
            <form action="" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInRight">
                <h2>登录</h2>
                <div class="form-group">
                    <label for="userId" class="sr-only">用户名</label>
                    <input type="text" class="form-control" id="userId" placeholder="用户名" autocomplete="off">
                </div>
                <div class="form-group">
                    <label for="password" class="sr-only">密　码</label>
                    <input type="password" class="form-control" id="password" placeholder="密码" autocomplete="off">
                </div>
                <div class="form-group" style="text-align: left">
                    <label class="radio-inline" >
                        <input type="radio" name="userIdentity" id="teacher"> 教师
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userIdentity" id="student"> 学生
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userIdentity" id="admin"> 管理员
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="userIdentity" id="safeguard"> 维护
                    </label>
                </div>
                <div class="form-group" style="padding: 20px" >
                    <input type="button" value="登录" class="btn btn-primary" style="float: left" onclick="goLogin()">
                    <input type="button" value="返回" class="btn btn-primary" style="float: right" onclick="location.href='index.jsp'">
                </div>


            </form>
            <!-- END Sign In Form -->
        </div>
    </div>
    <div class="row" style="padding-top: 100px">
        <div class="col-md-12 text-center">
            <p>
                <small>Copyright &copy; 2017-2019 iLearning. All rights reserved.</small>
            </p>
        </div>
    </div>
</div>


<!-- Modal  -->
<div class="modal fade" id="msgDialog" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">提示</h4>
      </div>
      <div class="modal-body">
        <p id="msgContent"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    var userId = document.getElementById("userId");
    var password = document.getElementById("password");
    var teacher = document.getElementById("teacher");
    var student = document.getElementById("student");
    var admin = document.getElementById("admin");
    var safeguard = document.getElementById("safeguard")
    var msg = document.getElementById("msgContent");
    var userIdentity = 0;


    function goLogin() {
        if (isInvalid(userId.value)) {
            msg.innerHTML = "输你的用户名呗(oﾟ▽ﾟ)o  ";
            $('#msgDialog').modal('show');
            return;
        }

        if (isInvalid(password.value)) {
            msg.innerHTML = "记得输入密码啊!!!∑(ﾟДﾟノ)ノ";
            $('#msgDialog').modal('show');
            return;
        }

        if (teacher.checked == true) {
            userIdentity = 1;
        } else if (student.checked == true) {
            userIdentity = 2;
        } else if (admin.checked == true) {
            userIdentity = 3;
        } else if (safeguard.checked == true) {
            userIdentity = 4
        } else {
            userIdentity = 0;
            msg.innerHTML = "快选择一个用户类型─=≡Σ(((つ•̀ω•́)つ";
            $('#msgDialog').modal('show');
            return;
        }



        $.ajax({
            url: "${pageContext.request.contextPath}/Login",
            type: "POST",
            data: {
                userId: userId.value,
                password: password.value,
                userIdentity: userIdentity
            },
            success: function (data) {
                if (data == "login_success") {
                    window.location.href = "${pageContext.request.contextPath}/GoInto";
                } else {
                    msg.innerHTML = "用户名或者密码错误!!!∑(ﾟДﾟノ)ノ";
                    $('#msgDialog').modal('show');
                }

            },
            error: function () {

            }
        })
    }

    function isInvalid(val) {
        var str = val.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
        if (str == null || str == '' || str == undefined) {
            return true;
        } else return false;
    }

</script>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/views/login/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/views/login/js/bootstrap.min.js"></script>
<!-- Placeholder -->
<script src="${pageContext.request.contextPath}/views/login/js/jquery.placeholder.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.request.contextPath}/views/login/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="${pageContext.request.contextPath}/views/login/js/main.js"></script>

</body>
</html>
