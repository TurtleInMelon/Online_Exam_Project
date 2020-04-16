<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 20-1-9
  Time: 下午8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>知识点库</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="module" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>
<div id="keyList">

</div>
<script type="text/javascript">

    <c:forEach items="${keyDB}" var="t" varStatus="status">
        var key=$("<p><a class='btn btn-lg btn-det'>"+"${t.courseName}"+"</a></p>").attr("id",${t.courseId});
        $("#keyList").append(key);
    </c:forEach>
    $(".btn-det").click(function () {
        var id=$(this).parents("p").attr("id");
        $(this).attr("href","${APP_PATH}/detailKeyDB/"+id);
    })
</script>

</body>
</html>
