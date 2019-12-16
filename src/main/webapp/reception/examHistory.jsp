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
<div style="margin-top: 100px" class="myExamList">
</div>

<script type="text/javascript">
    <c:forEach items="${examInfo}" var="t" varStatus="status">
    var paper=$("<ul>\n" +
        "        <h5>"+"${t.examPaperInfo.examPaperName}"+"</h5>\n" +
        "        <li>题目数量"+"${t.examPaperInfo.subjectNum}"+"</li>\n" +
        "        <li>总分"+"${t.examPaperInfo.examPaperScore}"+"</li>\n" +
        "        <li>考试得分"+"${t.examScore}"+"</li>\n" +
        "        <li>考试时间"+"${t.examPaperInfo.examPaperTime}"+"</li>\n" +
        "        <li>难易程度"+"${t.examPaperInfo.examPaperEasy}"+"</li>\n" +
        "        <a type='button' class='btn btn-lg btn_detail' id="+"${t.examPaperInfo.examPaperId}"+">查看详情</a>\n"+
        "    </ul>");
    $(".myExamList").append(paper);
    </c:forEach>
    
    $(".btn_detail").click(function () {
        var examPaperName=$(this).siblings().eq(0).html();
        var address="${APP_PATH}/Choose/ha/"+"${sessionScope.studentName}"+"/"+examPaperName;

        $(this).attr("href",address);

    });
</script>
</body>
</html>
