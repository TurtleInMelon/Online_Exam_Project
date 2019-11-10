<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-7
  Time: 下午5:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>瓜中有龟 后台管理系统</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>

<c:if test="${sessionScope.loginTeacher==null}">
    <%response.sendRedirect("${APP_PATH}/admin/admin_login.jsp");%>
</c:if>
<frameset rows="15%, *" frameborder="0">
    <frame src="${APP_PATH }/admin/head.jsp" name="head" noresize="noresize" />
    <frameset cols="15%, *" frameborder="0">
        <frame src="${APP_PATH }/admin/left.jsp" name="left" noresize="noresize" />
        <frameset rows="7%, *">
            <frame src="${APP_PATH }/admin/nav.jsp" name="nav" noresize="noresize" />
            <frame src="${APP_PATH }/admin/home.jsp" name="right" noresize="noresize" />
        </frameset>
    </frameset>
</frameset>

</html>
