<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-9
  Time: 下午9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>各班级总人数</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <script src="${APP_PATH}/static/echarts/echarts.js"></script>
    <script src="${APP_PATH}/static/echarts/shine.js"></script>
    <style type="text/css">
        li {list-style: none;}
        a{text-decoration:none;}
        a:HOVER{text-decoration: none;}
        a:link{text-decoration:none; }
        a:visited{text-decoration:none; }
        a:active{text-decoration:none;}
        li a {cursor: pointer;}
    </style>
</head>
<body>
    <div style="width: 100%; height: 100%;">
        <div>
            <c:forEach items="${grades }" var="grade">
                <button type="button" class="btn btn-info btn-sm" onclick="load_Count_Line(${grade.gradeId })">${grade.gradeName }</button>
            </c:forEach>
            <button type="button" class="btn btn-info btn-sm" onclick="load_Count_Line(-1)">全部</button>
        </div>
        <div id="student_count_chart" style="width:1000px; height: 400px; float: left; border: 1px solid #E5E5E5;"></div>
    </div>


    <script type="text/javascript">

        var studentCountChart=echarts.init(document.getElementById("student_count_chart"),"shine");

        load_Count_Line(-1);

        function load_Count_Line(gradeId){
            studentCountChart.clear();
            studentCountChart.showLoading({text: "图表正在努力加载中..."});
            $(function () {
                $.ajax({
                    url:"${APP_PATH}/getEachGradeCount",
                    data:"gradeId="+(gradeId===-1?"":gradeId),
                    success:function (result) {
                        //记得使用JSON.parse否则会报错
                        studentCountChart.setOption(JSON.parse(result.extend.JSON),true);
                        studentCountChart.hideLoading();
                    }
                })
            });
        }

    </script>

</body>
</html>
