<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-6
  Time: 下午2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>主页</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body >

<div class="jumbotron" style="height: 630px;padding-top: 100px; padding-bottom: 0px; margin-bottom: 0px;">
    <div style="padding: 20px;">
        <img src="${APP_PATH}/static/images/home-bg.png" width="100%"/>
        <p style="margin-top:20px;">
            <a type="button" class="btn btn-info" href="http://cs.cumt.edu.cn/">了解更多</a>
        </p>
    </div>
</div>



</body>
</html>
