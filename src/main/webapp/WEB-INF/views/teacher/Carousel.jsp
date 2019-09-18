
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>calendar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/boxx.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/vendor/css/calendar.css">

</head>
<body>
<div class="wrap">
    <div class="calendarYuno">
        <p id="fulldate"></p>
        <div class="content">
            <span id="lunaryear"></span>
            <span id="weeky"></span>
        </div>
        <div class="content">
            <span id="nowdate"></span>
        </div>
        <div class="content">
            <span id="lunardate"></span>
            <span id="weekyEn"></span>
        </div>
        <!-- <strong id="hllo"></strong>
        <span>----- 今天的余额 -----</span>
        <div id="time"></div> -->
    </div>
</div>


<script src="${pageContext.request.contextPath}/views/admin/vendor/js/showDay.js"></script>
</body>
</html>
