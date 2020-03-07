<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-30
  Time: 下午2:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>训练历史</title>
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
<div style="margin-top: 100px">
    <ul class="myExamList" style='width: 400px'>

    </ul>
</div>

<script type="text/javascript">
    <c:forEach items="${examInfo}" var="t" varStatus="status">
    var paper=$("<li style='width: 400px' id='${t.examPaperInfo.examPaperName}'>\n" +
        "        <p class='lead text-center'>"+"${t.examPaperInfo.examPaperName}"+"</p>\n" +
        "        <p><em>题目数量&nbsp;&nbsp;"+"${t.examPaperInfo.subjectNum}"+"</em></p>\n" +
        "        <p><em>总分&nbsp;&nbsp;"+"${t.examPaperInfo.examPaperScore}"+"</em></p>\n" +
        "        <p><em>考试得分&nbsp;&nbsp;"+"${t.examScore}"+"</em></p>\n" +
        "        <p><em>考试时间&nbsp;&nbsp;"+"${t.examPaperInfo.examPaperTime}"+"</em></p>\n" +
        "        <p><em>难易程度&nbsp;&nbsp;"+"${t.examPaperInfo.examPaperEasy}"+"</em></p>\n" +
        "        <p><a type='button' class='btn btn-info btn-primary btn-block btn_detail' id="+"${t.examPaperInfo.examPaperId}"+">查看详情</a></p>\n"+
        "    </li>");
    $(".myExamList").append(paper);
    </c:forEach>
    
    $(".btn_detail").click(function () {
        var examPaperName=$(this).parents("li").prop("id");
        var address="${APP_PATH}/Choose/ha/"+"${sessionScope.studentName}"+"/"+examPaperName;

        $(this).attr("href",address);

    });
</script>
</body>
</html>
