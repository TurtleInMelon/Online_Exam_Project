<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-21
  Time: 下午8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Person</title>
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
<h3>
    <span style="color: red; "></span>
</h3>
<div class="List">
    <ul>

    </ul>
</div>
<script type="text/javascript">
    $(function () {
        var easy="${info[0].examPaperInfo.examPaperEasy}";

        var titleP=$("<h1 align='center'></h1>").append("${info[0].examPaperInfo.examPaperName}")
        var paperInfo=$("<h3 align='center'></h3>").append("试卷难度："+"<u>"+judgeEasy(easy)+"</u>"+"    考试时间："+"${info[0].examPaperInfo.examPaperTime}");
        $(".List").prepend(paperInfo).prepend(titleP);
        <c:forEach items="${info}" var="t" varStatus="status">
        var index="${status.index+1}";
        <c:if test="${t.subjectInfo.subjectType==2}">
        var subjectName=$("<p class='lead'>"+index+"&nbsp;${t.subjectInfo.subjectName}"+"</p>");
        var subjectEasy=$("<span>难易程度</span><span style=\"color: green; \"> "+judgeEasy("${t.subjectInfo.subjectEasy}")+"&nbsp;</span>");
        var subjectScore=$("<span>分值</span><span style=\"color: green; \"> "+"${t.subjectInfo.subjectScore}"+"&nbsp;</span>");
        var rightResult=$("<span><strong>正确答案<strong></span><span style=\"color: yellow; \"> "+"${t.subjectInfo.rightResult}"+"&nbsp;</span>");
        var chooseResult=$("<span>选择答案</span><span style=\"color: red; \"> "+"${t.chooseResult}"+"&nbsp;</span>");
        var answer=$("<strong></strong>").append(rightResult).append(chooseResult).append(subjectScore).append(subjectEasy);
        var p=$("<p></p>").append(subjectName).append(answer);
        $("ul").append(p);
        </c:if>
        <c:if test="${t.subjectInfo.subjectType==0||t.subjectInfo.subjectType==1}">
        var subjectName=$("<p class='lead'>"+index+"&nbsp;${t.subjectInfo.subjectName}"+"</p>");
        var optionA=$("<p>"+"A&nbsp;"+"<em>${t.subjectInfo.optionA}</em>"+"</p>");
        var optionB=$("<p>"+"B&nbsp;"+"<em>${t.subjectInfo.optionB}</em>"+"</p>");
        var optionC=$("<p>"+"C&nbsp;"+"<em>${t.subjectInfo.optionC}</em>"+"</p>");
        var optionD=$("<p>"+"D&nbsp;"+"<em>${t.subjectInfo.optionD}</em>"+"</p>");
        var subjectEasy=$("<span>难易程度</span><span style=\"color: green; \"> "+judgeEasy("${t.subjectInfo.subjectScore}")+"&nbsp;</span>");
        var subjectScore=$("<span>分值</span><span style=\"color: green; \"> "+"${t.subjectInfo.subjectEasy}"+"&nbsp;</span>");
        var rightResult=$("<span>正确答案</span><span style=\"color: yellow; \"> "+"${t.subjectInfo.rightResult}"+"&nbsp;</span>");
        var chooseResult=$("<span>选择答案</span><span style=\"color: red; \"> "+"${t.chooseResult}"+"&nbsp;</span>");
        var answer=$("<strong></strong>").append(rightResult).append(chooseResult).append(subjectScore).append(subjectEasy);
        var p=$("<p></p>").append(subjectName).append(optionA).append(optionB).append(optionC).append(optionD).append(answer);
        $("ul").append(p);
        </c:if>

        </c:forEach>
    });
    function judgeEasy(subjectEasy) {
        if(subjectEasy==1)
            return "普通";
        else if(subjectEasy==2)
            return "中等";
        else
            return "简单";
    }
</script>


</body>
</html>
