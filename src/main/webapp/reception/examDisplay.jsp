<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-25
  Time: 下午3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>考试信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="module" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style>
        .examList{
            width: 100%;
        }
        .subTable{
            height: 300px;
            width: 300px;
        }
        .pic{
            height: 200px;
            width: 300px;
            background: url("${APP_PATH}/img/gua.jpg") no-repeat;
            background-size: cover;
            background-position: center center;
        }
        .btn_big{
            height: 50px;
            width: 150px;
            float: right;
            font-size: 150%;
        }
    </style>
</head>
<body>
    <h2 style="margin-top: 150px"></h2>
    <div class="examList">

    </div>
    <div style="margin-right: 20%; margin-top: 50px">
        <a id="autoExam" class="btn btn-info btn_big text-center" href="${APP_PATH}/autoShow">自动出题</a>

    </div>

<script type="text/javascript">
    $(function () {

        <c:forEach items="${exams}" var="t" varStatus="status">
        var index=status.index;
        var table=$("<ul class=\"subTable\"></ul>");
        var pic=$("<li class='pic'></li>");
        var title=$("<li></li>").append("${t.examPaperInfo.examPaperName}");
        var id="${t.examPaperInfo.examPaperId}";
        var time="${t.examPaperInfo.examPaperTime}";
        var btn=$("<a>进入考试</a>").attr("href","${APP_PATH}/eachExam/"+id+"/"+time).addClass("btn btn-default");
        var btnTr=$("<li></li>").append(btn);
        var detail=$("<li></li>");
        detail.append("考试时长"+"${t.examPaperInfo.examPaperTime}").append("  题目数量"+"${t.examPaperInfo.subjectNum}").append("  总分"+"${t.examPaperInfo.examPaperScore}")
            .append("  难易程度"+judgeEasy("${t.examPaperInfo.examPaperEasy}")).append("  开始时间"+"${t.beginTime}");
        table.append(pic).append(title).append(detail).append(btnTr);
        var newTd=$("<th></th>").append(table);
        $(".examList").append(newTd);

        </c:forEach>
    })
    function judgeEasy(examPaperEasy) {
        if(examPaperEasy==1)
            return "普通";
        else if(examPaperEasy==2)
            return "中等";
        else
            return "困难";
    }
    $("#autoExam").click(function () {
       $.ajax({
           url:"${APP_PATH}/autoShow",
           dataType:"JSON",
           data:{},
           type:"POST",
           success:function (result) {

           }
       })
    });
</script>

</body>
</html>
