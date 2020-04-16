<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-7
  Time: 下午7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>后台主页中的左侧导航栏</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style type="text/css">
        body{margin:0;padding:0;overflow-x:hidden;}
        html, body{height:100%;}
        img{border:none;}
        *{font-family:'微软雅黑';font-size:12px;color:#626262;}
        dl,dt,dd{display:block;margin:0;}
        a{text-decoration:none;}
        a:HOVER{text-decoration: none;}
        a:link{text-decoration:none; }
        a:visited{text-decoration:none; }
        a:active{text-decoration:none;}

        #bg{background-image:url(${APP_PATH }/static/images/content/dotted.png);}
        .container{width:100%;height:100%;margin:auto;}

        /*left*/
        .leftsidebar_box{width:205px;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:#F9F9F9;margin-left: -15px;border-right: 2px solid #E5E5E5;}
        .line{height:2px;width:100%;background-image:url(${APP_PATH }/static/images/left/line_bg.png);background-repeat:repeat-x;}
        .leftsidebar_box dl{border-bottom: 1px solid #E5E5E5; border-color: #FCFCFC -moz-use-text-color #E5E5E5;}
        .leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#585858;font-size:14px;position:relative;line-height:48px;cursor:pointer;}
        .leftsidebar_box dd{background-color:#FFFFFF;padding-left:40px;}
        .leftsidebar_box dd a{color:#585858;line-height:20px;font-size: 14px;}
        .leftsidebar_box dt img{position:absolute;right:10px;top:20px;}
        .home dt{background-image:url(${APP_PATH }/static/images/left/home.png)}
        .system_log dt{background-image:url(${APP_PATH }/static/images/left/system.png)}
        .custom dt{background-image:url(${APP_PATH }/static/images/left/p1.png)}
        .channel dt{background-image:url(${APP_PATH }/static/images/left/p2.png)}
        .app dt{background-image:url(${APP_PATH }/static/images/left/paper.png)}
        .cloud dt{background-image:url(${APP_PATH }/static/images/left/subject.png)}
        .syetem_management dt{background-image:url(${APP_PATH }/static/images/left/plan.png)}
        .source dt{background-image:url(${APP_PATH }/static/images/left/clock.png)}
        .statistics dt{background-image:url(${APP_PATH }/static/images/left/statistics.png)}
        .leftsidebar_box dl dd:last-child{padding-bottom:10px;}
    </style>
</head>
<body>
<div class="container">
    <div class="leftsidebar_box">
        <div class="line"></div>
        <dl class="home">
            <a href="index.jsp" target="_top">
                <dt>系统首页</dt>
            </a>
        </dl>
        <dl class="system_log">
            <dt onClick="changeImage()">基本信息<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/grades" target="right" id="1" class="handle-view">
                &emsp;年级管理&emsp;&emsp;&emsp;</a></dd>
            <dd><a href="${APP_PATH}/courses" target="right" id="2" class="handle-view">&emsp;科目管理&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="custom">
            <dt onClick="changeImage()">班级管理<img src="${APP_PATH }/static/images/left/select_xl01.png" alt="" /></dt>
            <dd><a href="${APP_PATH}/classes" target="right" id="3" class="handle-view">&emsp;班级管理&emsp;&emsp;&emsp;</a></dd>
            <dd><a href="${APP_PATH}/preStudentCount" target="right" id="11" class="handle-view">&emsp;各班级总人数&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="custom">
            <dt onClick="changeImage()">教师管理<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/teachers" target="right" id="4" class="handle-view">&emsp;所有教师&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="channel">
            <dt>学生管理<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/students" target="right" id="5" class="handle-view">&emsp;所有学生&emsp;&emsp;&emsp;</a></dd>
            <dd class="first_dd"><a href="${APP_PATH}/admin/charts/studentExamCount.jsp" target="right" id="12" class="handle-view">&emsp;学生考试信息&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="app">
            <dt onClick="changeImage()">试卷管理<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/examPapers" target="right" id="6" class="handle-view">&emsp;所有试卷&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="cloud">
            <dt>试题管理<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/subjects" target="right" id="7" class="handle-view">&emsp;所有试题&emsp;&emsp;&emsp;</a></dd>
            <dd class="first_dd"><a href="${APP_PATH}/initImport" target="right" id="8" class="handle-view">&emsp;导入试题&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="syetem_management">
            <dt>考试安排管理<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/examPlan" target="right" id="9" class="handle-view">&emsp;待考信息&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="source">
            <dt>以往考试信息<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/historys" target="right" id="10" class="handle-view">&emsp;所有记录&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="cloud">
            <dt onClick="changeImage()">知识点管理<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/showKeyDB" target="right" id="11" class="handle-view">&emsp;知识点库&emsp;&emsp;&emsp;</a></dd>
            <dd class="first_dd"><a href="${APP_PATH}/admin/viewway.jsp" target="right" id="12" class="handle-view">&emsp;掌握情况&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="source">
            <dt>知识图谱<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/admin/charts/knowledgeMap.jsp" target="right" id="10" class="handle-view">&emsp;所有记录&emsp;&emsp;&emsp;</a></dd>
        </dl>

        <dl class="source">
            <dt>个性化推荐<img src="${APP_PATH}/static/images/left/select_xl01.png" /></dt>
            <dd class="first_dd"><a href="${APP_PATH}/admin/personalRecommendation.jsp" target="right" id="10" class="handle-view">&emsp;详细信息&emsp;&emsp;&emsp;</a></dd>
        </dl>

    </div>

    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/dropdown.js"></script>
    <script src="${APP_PATH}/static/zeroModal/zeroModal.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $(".dropdown-toggle").dropdown();
        });

        $(".leftsidebar_box dt").css({"background-color":"#F2F2F2"});
        $(".leftsidebar_box dt img").attr("src","${APP_PATH}/static/images/left/select_xl01.png");
        $(function () {
            $(".handle-view").click(function () {
                var nowId=$(this).attr("id");
                //获取到头部iframe中div
                var headDoc=parent.frames["nav"].document.getElementById("head-nav-show");
                //判断当前点击操作是否已经存在
                var headDivs=$(headDoc).children();
                var flag = true;
                for(var i=0; i<headDivs.length; i++) {
                    var div = headDivs[i];
                    $(div).css("background-color", "#FFF");
                    $(div).attr("show", "f");
                    var divId = $(div).attr("id").substring(2);
                    //当前操作已经存在
                    if(nowId == divId) {
                        $(div).css("background-color", "#CAE5E8");
                        $(div).attr("show", "t");
                        flag = false;
                    }
                }
                //向头部div中添加模块
                if(flag) {
                    if(headDivs.length >= 11) {
                        $(headDoc).children().first().remove();
                    }
                    $(headDoc).append("<div show='t' class='index_title' id='it"+nowId+"' style='float: left;background-color: #CAE5E8;'><a href="+$(this).attr('href')+" target='right' style='color: #707070;margin-left:5px;' onclick='changeShow("+$(this).attr('id')+")'>"+$(this).text().trim()+"</a>&emsp;<sup onclick='removeParent("+$(this).attr('id')+")'>×</sup></div>");
                }
            });

            $(".leftsidebar_box dd").hide();
            $(".leftsidebar_box dt").click(function(){
                $(".leftsidebar_box dt").css({"background-color":"#F9F9F9"})
                $(this).css({"background-color": "#E5E5E5"});
                $(this).parent().find('dd').removeClass("menu_chioce");
                $(".leftsidebar_box dt img").attr("src","${APP_PATH}/static/images/left/select_xl01.png");
                $(this).parent().find('img').attr("src","${APP_PATH}/static/images/left/select_xl.png");
                $(".menu_chioce").slideUp();
                $(this).parent().find('dd').slideToggle();
                $(this).parent().find('dd').addClass("menu_chioce");
            });
        });

        function removeParent(i) {
            //当前页处于显示状态，无法删除
            if ($("#it"+i).attr("show") == "t") {
                return;
            }
            $("#it"+i).remove();
        }

        function changeShow(i) {
            $(".index_title").css("background-color", "#FFF").attr("show", "f");
            $("#it"+i).css("background-color", "#CAE5E8").attr("show", "t");
        }

        function changeImage(){}


    </script>
</div>
</body>
</html>
