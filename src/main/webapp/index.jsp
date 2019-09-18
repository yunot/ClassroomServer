<%@ page language="java" contentType="text/html; charset=utf-8"%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>首页</title>

    <!-- Bootstrap Core CSS -->
    <link href="views/index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href='views/index/css/Roboto.css' rel='stylesheet' type='text/css'>
    <!-- Theme CSS -->
    <link href="views/index/css/agency.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="page-top" class="index">

<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-custom navbar-fixed-top">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> 菜单 <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top">Fly</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <li>
                    <a class="page-scroll" href="#about">关于</a>
                </li>
                <li>
                    <a class="page-scroll" href="#overview">概览</a>
                </li>
                <li>
                    <a class="page-scroll" href="#connect">联系</a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="${pageContext.request.contextPath}/GoInto">进入系统</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->

    </div>
    <!-- /.container-fluid -->
</nav>

<!-- Header -->
<header>
    <div class="container">
        <div class="intro-text">
            <div class="intro-lead-in">智慧实验室</div>
            <div class="intro-heading">smartLab 实验室管家</div>
            <a href="#about" class="page-scroll btn btn-xl">了解更多</a>
        </div>
    </div>
</header>

<!-- Services Section -->
<section id="about">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h2 class="section-heading">smartLab<br>实验室管家</h2>
            </div>
            <div class="col-md-6">
                <p class="p-about">该系统以触摸平板电脑为教师、学生的主要操作界面，配备强大的后台服务器以及微信移动终端，集成丰富的日常实验教学、开放、监控等管理功能，极大提高教学管理效率，促进先进教学管理模式的规范化和信息化。</p>
                <p class="span-about"></p>
            </div>
        </div>
    </div>
</section>

<!-- Portfolio Grid Section -->
<section id="overview" class="bg-light-gray">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">概览</h2>
                <h3 class="section-subheading text-muted">部分研发成果展示</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="views/index/img/portfolio/01.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Android管理终端</h4>
                    <p class="text-muted">交互中心 一触即达</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="views/index/img/portfolio/02.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>RFID射频识别</h4>
                    <p class="text-muted">考勤无忧 智慧日志</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="views/index/img/portfolio/03.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>ZigBee无线传感网络</h4>
                    <p class="text-muted">小小芯片 万物互联</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="views/index/img/portfolio/04.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>课桌电源管理</h4>
                    <p class="text-muted">无线控制 节约能源</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="views/index/img/portfolio/05.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>Web管理系统</h4>
                    <p class="text-muted">多人访问 简洁高效</p>
                </div>
            </div>
            <div class="col-md-4 col-sm-6 portfolio-item">
                <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal">
                    <div class="portfolio-hover">
                        <div class="portfolio-hover-content">
                            <i class="fa fa-plus fa-3x"></i>
                        </div>
                    </div>
                    <img src="views/index/img/portfolio/06.jpg" class="img-responsive" alt="">
                </a>
                <div class="portfolio-caption">
                    <h4>微信小程序</h4>
                    <p class="text-muted">远程预约 灵活实验</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section id="connect">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">联系我们</h2>
                <h3 class="section-subheading text-muted bottom-margin-sm">南京邮电大学 @fly工作室</h3>
                <%--<a target="_blank" href="https://www.ilearning5.top" class="btn btn-xl">关于更多</a>--%>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <div class="row">
            <div class="col">
                <span class="copyright">Copyright &copy; 2017-2019 iLearning. All rights reserved.</span>
            </div>
        </div>
    </div>
</footer>

<!-- Portfolio Modals -->
<!-- Use the modals below to showcase details about your portfolio projects! -->

<!-- Portfolio Modal 1 -->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Android管理终端</h2>
                            <img class="img-responsive img-centered" src="views/index/img/portfolio/01x.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> 返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 2 -->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>RFID射频识别</h2>
                            <img class="img-responsive img-centered" src="views/index/img/portfolio/02x.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> 返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 3 -->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>ZigBee无线传感网络</h2>
                            <img class="img-responsive img-centered" src="views/index/img/portfolio/03x.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> 返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 4 -->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>课桌电源管理</h2>
                            <img class="img-responsive img-centered" src="views/index/img/portfolio/04x.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> 返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 5 -->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>Web管理系统</h2>
                            <img class="img-responsive img-centered" src="views/index/img/portfolio/05x.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> 返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Portfolio Modal 6 -->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <!-- Project Details Go Here -->
                            <h2>微信小程序</h2>
                            <img class="img-responsive img-centered" src="views/index/img/portfolio/06x.jpg" alt="">
                            <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-times"></i> 返回</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jQuery -->
<script src="views/index/vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="views/index/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="views/index/js/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="views/index/js/jqBootstrapValidation.js"></script>
<script src="views/index/js/contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="views/index/js/agency.min.js"></script>


</body>
</html>