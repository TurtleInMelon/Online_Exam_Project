<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-7
  Time: 上午10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>后台登录</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style type="text/css">
        body {
            background: url("${APP_PATH}/static/images/admin/login_bg.jpg")
            transparent;
            background-size: 100%;
        }
        .container {
            width: 300px;
            height: 200px;
            margin-top: 100px;
        }
        .error-msg {
            color: red;
            font-size: 12px;
            display: none;
        }
    </style>

</head>
<body>

    <div class="container">
        <form class="form-signin" action="${APP_PATH}/teacherlogin" method="post" id="adminLogin">
            <h2 class="form-signin-heading" style="color:white;" align="center">后台登录</h2>
            <label class="sr-only">Email address</label>
            <input type=text id="teacherAccount" name="teacherAccount" class="form-control" placeholder="用户名" required autofocus />
            <span id="helpBlock_account" class="help-block"></span>
            <br />
            <label class="sr-only">Password</label>
            <input type="password" id="password" name="teacherPwd" class="form-control" placeholder="密  码" required />
            <span id="helpBlock_password" class="help-block"></span>
            <br />
            <button class="btn btn-lg btn-primary btn-block" type="submit" id="adminSign">登录</button>
        </form>
    </div>

    <script type="text/javascript">
        //点击登录按钮
        $("#adminSign").click(function () {
            var teacherAccount=$("#teacherAccount").val();
            var inputpassword=$("#password").val();
            //发起异步请求，判断teacheraccount是否存在
            $.ajax({
                url:"${APP_PATH}/teacherAccount/"+teacherAccount,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    //alert(result.msg);
                    var code=result.code;
                    if(code==100){//找得到该教师
                        $("#helpBlock_account").text("存在该用户信息");
                        var realpassword=result.extend.teachInfo.teacherPwd;
                        if(inputpassword==realpassword){
                            alert("密码正确！！");
                        }
                        else{
                            alert("密码错误,请重新输入！！！");
                        }
                    }
                    else{//找不到该教师
                        $("#helpBlock_account").text("不存该用户信息,请重新输入！！")
                    }
                }
            })

            //alert(teacherAccount+password);
        });




    </script>

</body>
</html>
