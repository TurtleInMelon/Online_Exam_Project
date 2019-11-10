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
                    <h4 class="modal-title" id="myModalLabel">登录</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label >个人 账号：</label>
                            <input class="form-control" id="username" placeholder="请输出账号">
                        </div>
                        <div class="form-group">
                            <label >个人 密码：</label>
                            <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> 记住 密码
                            </label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
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
                            <label >登录账户：</label>
                            <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label >登录密码：</label>
                            <input type="password" class="form-control" id="password" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label >就读班级：</label>
                            <select class="form-control" >
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>

                        </div>
                        <button type="submit" class="btn btn-primary btn-lg btn-block">注册</button>
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
                                <a id="examCenter-link" target="home" style="cursor: pointer;" href="">题库训练中心</a>
                            </li>
                            <li>
                                <a id="mineCenter-link" target="home" style="cursor: pointer;" href="">训练历史</a>
                            </li>
                        </ul>
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



    $("#student_Login_btn").click(function () {
        $('#login_modal').modal('show');
    });

    //
    $("#student_Register_btn").click(function () {
        $('#register_modal').modal('show');
    });

</script>






</body>
</html>
