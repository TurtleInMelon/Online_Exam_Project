<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-27
  Time: 上午10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>提交成功</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>
<input type="checkbox" id="1">
<input type="checkbox" id="2">
<input type="checkbox" id="3">
<input type="checkbox" id="4">
<script type="text/javascript">
    $("input").click(function () {
        if($(this).prop("checked")==true)
        {
            alert("dd");
            $(this).siblings("input").prop("checked",false);
        }
        else {
            this.checked=false;
        }
    })
</script>
</body>
</html>
