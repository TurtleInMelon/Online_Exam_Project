<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-7
  Time: 下午7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>后台主页头部</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style type="text/css">
        a{text-decoration:none;}
        a:HOVER{text-decoration: none;}
        a:link{text-decoration:none; }
        a:visited{text-decoration:none; }
        a:active{text-decoration:none;}
    </style>
</head>
<body>
    <div style="width: 100%; height: 98px; background-color: #438EB9;">
        <div style="float: left; width: 380px; height: 100%;line-height:80px;margin-left: -40px;">
            <a href="index.jsp" target="_top">
                <img src="${APP_PATH }/static/images/admin/logo_1.png" alt="WiseMan logo" style="width: 95%; height: 100%;" />
            </a>
        </div>
        <div id="head-nav-show" style="float: left; width: 300px; height: 100%;margin-left: 112px;">
            <div style="margin-top: 25px;width: 211px; height: 35px; background-color: #579EC8;line-height: 35px;text-align: center;">
                <span id="date_time" style="color: #FFF;"></span>
            </div>
        </div>
        <div id="loginTeacher" style="float:right; width: 190px; height:100%;line-height: 80px;">
            <c:if test="${sessionScope.loginTeacher != null }">
                <a target="right" class="btn btn-default" href="${APP_PATH}/teachers" style="margin-left: 9px;">
                        ${sessionScope.loginTeacher.teacherName }
                </a>
            </c:if>
            <c:if test="${sessionScope.loginTeacher == null }">
                <a target="right" class="btn btn-default" href="#" style="margin-left: 9px;">
                    未登录
                </a>
            </c:if>
            <a class="btn btn-default" href="../exitTeacher" target="_parent">退出登录</a>
        </div>
    </div>

    <script type="text/javascript">
        show_date_time();
        $(function() {
            $("#loginTeacher").mouseover(function() {
                $(this).css("border-left", "2px solid #EC870E");
            }).mouseout(function() {
                $(this).css("border-left", "0px solid #EC870E");
            });
            $("#head-nav-show").mouseover(function() {
                if($(".index_title").size <= 0) {
                    return false;
                }
                $(this).css("border-left", "2px solid #EC870E");
            }).mouseout(function() {
                $(this).css("border-left", "0px solid #EC870E");
            });
        });
        setInterval("show_date_time()",1000);


        function removeParent(i) {
            //当前页处于显示状态，无法删除
            if ($("#it"+i).attr("show") == "t") {
                return;
            }
            $("#it"+i).remove();
        }



        function show_date_time() {
            var date=new Date();
            var year=date.getFullYear();
            var month=date.getMonth();
            var day=date.getDay();
            var hour=date.getHours();
            var minutes=date.getMinutes();
            var seconds = date.getSeconds();
            if(parseInt(seconds) >= 0 && parseInt(seconds) < 10) {
                seconds = "0"+seconds;
            }
            $("#date_time").text(year+"年"+month+"月"+day+"日"+hour+"时"+minutes+"分"+seconds+"秒");
        }
    </script>

</body>
</html>
