<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-7
  Time: 下午7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>操作记录导航栏</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style type="text/css">
        a{text-decoration:none;}
        a:HOVER{text-decoration: none;}
        a:link{text-decoration:none; }
        a:visited{text-decoration:none; }
        a:active{text-decoration:none;}
        .index_title {
            /*width: 100px;*/
            height: 30px;
            line-height: 30px;
            border: 1px solid green;
            text-align: center;
            margin-left: 9px;
            cursor: pointer;
            border-radius: 3px;
        }
        sup {
            cursor: pointer;
        }
        sup:hover {
            background-color: gray;
            color: red;
        }
    </style>
</head>
<body>
    <div style="width: 100%; height: 30px; border-bottom: 1px solid #E5E5E5;">
        <div id="head-nav-show" style="width: 100%; height: 100%;">

        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $("#loginTeacher").mouseover(function() {
                $(this).css("border-left", "2px solid #EC870E");
            }).mouseout(function() {
                $(this).css("border-left", "0px solid #EC870E");
            });
            $("#head-nav-show").mouseover(function() {
                if($(".index_title").size <= 0) {
                    return false;
                }
                $(this).css("border-bottom", "1px solid orange").css("cursor", "pointer");
            }).mouseout(function() {
                $(this).css("border-bottom", "1px solid #E5E5E5");
            });
        });

        function removeParent(i) {
            //当前页处于显示状态，无法删除
            if ($("#it"+i).attr("show") == "t") {
                return;
            }
            $("#it"+i).remove();
        }



    </script>

</body>
</html>
