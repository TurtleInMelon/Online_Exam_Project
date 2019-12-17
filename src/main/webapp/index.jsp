<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-6
  Time: 上午9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>

<body style="background-color: #EEEEEE;">

    <!-- 登录的模态框 -->
    <div class="modal fade" id="login_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="login_myModalLabel">登录</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label >个人 账号：</label>
                            <input class="form-control" id="login_username" name="login_username" placeholder="请输出账号">
                        </div>
                        <div class="form-group">
                            <label >个人 密码：</label>
                            <input type="password" class="form-control" id="login_password" name="login_password" placeholder="请输入密码">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 记住 密码
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block" id="login">登录</button>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <!-- 注册的模态框 -->
    <div class="modal fade" id="register_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">注册</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label >真实姓名：</label>
                            <input class="form-control" id="username" placeholder="请输出账号">
                        </div>
                        <div class="form-group">
                            <label >登录账户：</label><sapn id="warn">账户名重复！</sapn>
                            <input type="text" class="form-control" id="account" placeholder="请输入账户">
                        </div>
                        <div class="form-group">
                            <label >登录密码：</label>
                            <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label >就读班级：</label>
                            <select class="form-control" id="class_selector">

                            </select>

                        </div>
                        <button type="submit" id="register_save" class="btn btn-primary btn-lg btn-block">注册</button>
                    </form>

                </div>
            </div>
        </div>
    </div>

<div style="width: 100%; height: 100%;">
    <div class=".container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.jsp">瓜中有龟</a>
                    </div>

                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <a href="index.jsp">首页</a>
                            </li>
                            <li>
                                <a id="examCenter-link" target="home" style="cursor: pointer;" href="${APP_PATH}/getAllExamInfo">题库训练中心</a>
                            </li>
                            <li>
                                <a id="mineCenter-link" target="home" style="cursor: pointer;" href="${APP_PATH}/showHistory">训练历史</a>
                            </li>
                        </ul>
                        <div>
                            <span class="loginStatus"></span>
                        </div>
                        <ul class="nav navbar-nav navbar-right" style="margin-right: 10px;">
                            <li class="dropdown">
                                    <div class="btn-group" style="margin-top: 5px;">
                                        <button type="button" class="btn btn-success btn-sm" id="student_Login_btn">登录</button>
                                        <button type="button" class="btn btn-primary btn-sm" id="student_Register_btn">注册</button>
                                        <a href="${APP_PATH}/admin/admin_login.jsp" target="_blank" class="btn btn-info btn-sm" id="studentLogin">登录后台</a>
                                    </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div style="margin-top: 0px; width: 100%;height:950px;">
        <iframe src="${APP_PATH}/reception/home.jsp" width="100%" height="100%" name="home"></iframe>
    </div>
</div>


<script type="text/javascript">

    if(${sessionScope.studentName==null}){
        $(".loginStatus").text("请先登录！");
    }
    else {
        $(".loginStatus").text("${sessionScope.studentName}"+",已登录");
    }

    $(function () {
       $("#warn").hide();
       $.ajax({
           url:"${APP_PATH}/getAllClass",
           data:{},
           dataType:"JSON",
           type:"GET",
           success:function (result) {
               $(result.extend.classes).each(function (i,obj) {
                   var className=$("<option>"+obj.className+"</option>");
                   $("#class_selector").append(className);
               })
           }
       })
    });
    $("#student_Login_btn").click(function () {
        $('#login_modal').modal('show');
        $("#login").click(function () {
            var stuAccount=$("input[id='login_username']").val();
            var stuPwd=$("input[id='login_password']").val();
            if(stuAccount=="")
            {
                alert("请输入用户名！");
                return ;
            }
            if(stuPwd==""){
                alert("请输入密码！");
                return;
            }
            $.ajax({
                url:"${APP_PATH}/stuLogin",
                data:{"studentAccount":stuAccount,"studentPwd":stuPwd},
                dataType:"JSON",
                type:"GET",
                success:function (result) {
                    alert(result.extend.login_info);
                    if($("checkbox:checked")){
                        sessionStorage.setItem("studentPwd",stuPwd);
                    }
                },
                error:function (result) {
                    alert(result.extend.login_info);
                }
            })
        })
    });

    //实时检测文本输入框
    $("#account").bind('input propertychange',function () {
        var account=$("input[id='account']").val();
        $.ajax({
            url:"${APP_PATH}/checkDulpicateUserName",
            data:{"studentAccount":account},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                if(result.extend.count=="0")
                {
                    $("input[id='account']").css("background-color","#FFFFFF");
                    $("#warn").hide();
                }
                else {
                    $("input[id='account']").css("background-color","#FF9388");
                    $("#warn").show();
                }
            }
        })
    });

    $("#student_Register_btn").click(function () {
        $('#register_modal').modal('show');
        $("#register_save").click(function () {
            var stuName=$("input[id='username']").val();
            if(stuName=="")
            {
                alert("请输入姓名！");
                return ;
            }
            var account=$("input[id='account']").val();
            if(account=="")
            {
                alert("请输入账户！");
                return ;
            }
            var pwd=$("input[id='password']").val();
            if(pwd=="")
            {
                alert("请输入密码！");
                return;
            }
            var classId=$("option:selected").html();
            if(confirm("确定注册"+stuName+"的账户")){
                $.ajax({
                    url:"${APP_PATH}/registerStu",
                    data:{"studentName":stuName,"studentAccount":account,"studentPwd":pwd,"classId":classId},
                    dataType:"JSON",
                    type:"GET",
                    success:function () {
                        alert("注册成功！")
                    }
                })
            }
        })
    });




</script>

</body>
</html>
