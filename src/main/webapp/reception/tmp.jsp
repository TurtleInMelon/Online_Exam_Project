<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-12-1
  Time: 下午4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${APP_PATH}/static/js/jquery.time-to.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="module" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <link href="${APP_PATH}/static/css/timeTo.css" type="text/css" rel="stylesheet">
    <style>
        pre {
            margin-bottom: 10px;
            padding-left: 10px;
            border-left: 3px #DDD solid;
        }
    </style>

</head>
<body>


<div id="countdown-1"></div>

<script type="text/javascript">
    $('#countdown-1').timeTo(120, function() { alert('Countdown finished'); });
</script>
</body>
</html>
