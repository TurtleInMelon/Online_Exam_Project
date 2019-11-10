<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-7
  Time: 下午7:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>后台主体部分</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style type="text/css">
        .totalDiv {
            height: 100px;
            border: 1px solid #DDDDDD;
            line-height: 100px;
            margin-left: 65px;
            margin-top: 31px;
            border-radius: 3px;
        }
        .totalTitle {
            float: left;
            width: 40%;
            height: 100%;
            line-height: 100px;
            text-align: center;
            margin-left: -15px;
        }
        .totalValue {
            float: right;
            width: 50%;
            height: 100%;
            line-height: 100px;
            text-align: center;
        }
        .val {
            font-size: 30px;
            font-weight: 700;
        }
        h1 {
            color: #FFF;
        }
    </style>
</head>
<body style="text-align: center">
    <div class="alert alert-block alert-success">
        <button class="close" data-dismiss="alert" type="button" style="text-align: center;">
            <img src="${APP_PATH }/static/images/admin/x.png" />
        </button>
        <i class="icon-ok green"></i>
        欢迎使用
        <strong>
            瓜中有龟题库后台管理系统
            <small>(v1.0)</small>
        </strong>
    </div>
    <div class="state-overview clearfix">
        <div class="col-lg-3 col-sm-5 totalDiv">
            <div class="totalTitle" id="examPaperTotal">
                <h1></h1>
            </div>
            <div class="totalValue">
                <span class="val"></span>
            </div>
        </div>
        <div class="col-lg-3 col-sm-5 totalDiv">
            <div class="totalTitle" id="subjectTotal">
                <h1></h1>
            </div>
            <div class="totalValue">
                <span class="val"></span>
            </div>
        </div>
        <div class="col-lg-3 col-sm-5 totalDiv">
            <div class="totalTitle" id="teacherTotal">
                <h1></h1>
            </div>
            <div class="totalValue">
                <span class="val"></span>
            </div>
        </div>
        <div class="col-lg-3 col-sm-5 totalDiv">
            <div class="totalTitle" id="studentTotal">
                <h1></h1>
            </div>
            <div class="totalValue">
                <span class="val"></span>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $.ajax({
                url:"${APP_PATH}/homeInfo",
                success:function (result) {
                    //console.log(result);
                    //试卷数量
                    $("#examPaperTotal").css("background-color","#6CCAC9");
                    $("#examPaperTotal").children("h1").text("试卷数量");
                    $("#examPaperTotal").siblings(".totalValue").children("span").text(result.extend.homeInfo.examPaperTotal+"套");
                    //题目数量
                    $("#subjectTotal").css("background-color", "#FF6C60");
                    $("#subjectTotal").children("h1").text("题目数量");
                    $("#subjectTotal").siblings(".totalValue").children("span").text(result.extend.homeInfo.subjectTotal+"道");
                    //教师数量
                    $("#teacherTotal").css("background-color", "#F8D347");
                    $("#teacherTotal").children("h1").text("教师人数");
                    $("#teacherTotal").siblings(".totalValue").children("span").text(result.extend.homeInfo.studentTotal+"人");
                    //学生数量
                    $("#studentTotal").css("background-color", "#57C8F2");
                    $("#studentTotal").children("h1").text("学生人数");
                    $("#studentTotal").siblings(".totalValue").children("span").text(result.extend.homeInfo.studentTotal+"人");


                }
            })

        });



    </script>


</body>
</html>
