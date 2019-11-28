<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-27
  Time: 上午8:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生考试信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <script src="${APP_PATH}/static/echarts/echarts.js"></script>
    <script src="${APP_PATH}/static/echarts/shine.js"></script>
    <style type="text/css">
        li {list-style: none;float: left;margin-left: 9px;}
        a{text-decoration:none;}
        a:HOVER{text-decoration: none;}
        a:link{text-decoration:none; }
        a:visited{text-decoration:none; }
        a:active{text-decoration:none;}
        li a {cursor: pointer;}
    </style>
</head>
<body>

    <div style="width: 100%; height: 500px;">
        <div style="width: 104px; height: 100%;float: left; margin-left: 10px;">
            <span style="display: none;" id="teacherId">${sessionScope.loginTeacher.teacherId }</span>
            <strong>描述：</strong>
            <p style="font-size: 12px;">当前图表所描述了本班
                所有学生考试信息
            </p>
            <div>
                <strong>班级学生：</strong>
                <ul id="studentsList">
                    <li><a href="#" onclick="loadShopLine()">全部</a></li>
                </ul>
            </div>
        </div>
        <div id="studentExamInfo" style="margin-left: 100px; width:750px; height: 400px; float: left; border: 1px solid #E5E5E5;"></div>
    </div>
    <script type="text/javascript">
        //加载本班学生数据
        function loadStus() {
            $.ajax({
                url:"${APP_PATH}/getAllStudentsWithSameClass",
                data:"teacherId="+$("#teacherId").text().trim(),
                success:function (result) {
                    if(result.extend.fail_msg!=null){
                        $("#studentExamCount").html("<h1>请登录后再查看</h1>");
                        alert("请登录后再查看");
                    }else{
                        var students=result.extend.students;
                        //console.log(result);
                        var lis="";
                        $.each(students,function (index,item) {
                            var li = "<li><a href='#' onclick='loadByStudent("+item.studentId+")'>"+item.studentName+"</a></li>";
                            $("#studentsList").after(li);
                        })
                    }

                }
            });
        }
        loadStus();


        var stuExamInfo = echarts.init(document.getElementById("studentExamInfo"), "shine");

        //加载数据
        function loadShopLine() {
            stuExamInfo.clear();
            stuExamInfo.showLoading({text: "图表正在努力加载中..."});
            
            $.ajax({
                url:"${APP_PATH}/avgcounts",
                data:"teacherId="+$("#teacherId").text().trim(),
                success:function (result) {
                    //console.log(result);
                    if(result.extend.fail_msg!=null){
                        $("#studentExamCount").html("<h1>请登录后再查看</h1>");
                        alert("请登录后再查看");
                    }else{
                        stuExamInfo.setOption(JSON.parse(result.extend.json),true);
                        stuExamInfo.hideLoading();
                    }
                }
            })
            
        }

        //载入折线图
        loadShopLine();

        function loadByStudent(studentId) {
            stuExamInfo.clear();
            stuExamInfo.showLoading({text: "图表正在努力加载中..."});
            $.ajax({
                url:"${APP_PATH}/getStudentExamInfoById",
                data:"studentId="+studentId,
                success:function (result) {
                    stuExamInfo.setOption(JSON.parse(result.extend.json),true);
                    stuExamInfo.hideLoading();
                }
            });
            /**
            $.getJSON("../../stuexam?stuId="+studentId, function(json) {
                if(json == "TID-NULL") {
                    $("#stuExamInfo").html("<h1>请登录后再查看</h1>");
                    alert("请登录后再查看");
                } else {
                    stuExamInfo.setOption(json, true);
                    stuExamInfo.hideLoading();
                }
            });**/
        }
    </script>

</body>
</html>
