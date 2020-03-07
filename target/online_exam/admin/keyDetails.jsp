<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 20-1-9
  Time: 下午9:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>知识点</title>
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
<div class="modal fade" id="key-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >知识点</h4>
            </div>
            <div class="modal-body">
                <p id="Name">
                    <span>知识点名称</span>
                    <span><input id="keyName" type="text"></span>
                </p>
                <p id="unit">
                    <span>所属单元号</span>
                    <span><input id="priority" type="text">

                    </span>
                </p>
                <p>
                    <button class="btn btn-info sure_btn">保存</button>
                    <button class="btn btn-info cancel_btn">取消</button>
                </p>
            </div>
        </div>
    </div>
</div>


<div >
    <p>
        <button class="btn btn-success btn-sm " id="btn-add">新增</button>
        <button class="btn btn-sm btn-info" id="btn-refresh">刷新</button>
    </p>
    <ul id="keyList">

    </ul>
</div>
<script type="text/javascript">

    $(function () {
       init();
    });
    var courseId;
    function init() {
        var keyList=JSON.parse('${keyInfos}');
        console.log(keyList);
        $.each(keyList,function (i,obj) {
            courseId=obj.courseInfo.courseId;
            var key=$("<li id="+obj.keyName+"><input name='text1'type=\"text\" readonly value="+obj.keyName+">\n" +
                "<input name='text2' type='text' readonly value="+obj.priority+"></span>\n"+
                "        <button id='btn-edit' class=\"glyphicon glyphicon-pencil btn\">编辑</button>\n" +
                "        <button id='btn-del' class=\"glyphicon glyphicon-trash btn\">删除</button></li>" );
            $("#keyList").append(key);
        });
    }


    $("#btn-add").click(function () {
        $("#priority").val("");
        $("#keyName").val("");
        $("#key-edit").modal("show");
    });

    $("#keyList").delegate("#btn-edit","click",function () {
        //console.log($(this).siblings("input[name='text1']").val());
        $("#priority").val($(this).siblings("input[name='text2']").val());
        $("#keyName").val($(this).siblings("input[name='text1']").val());
        $("#key-edit").modal("show");
    });

    $("#keyList").delegate("#btn-del","click",function () {
        var keyName=$(this).parents("li").attr("id");
        $.ajax({
            url:"${APP_PATH}/deleteOneKey",
            data:{"keyName":keyName},
            dataType:"JSON",
            tye:"GET",
            success:function(result){
                alert("删除成功！");
            }
        });
    });

    $(".sure_btn").click(function () {
        var keyName=$("#keyName").val();
        var priority=$("#priority").val();
        $.ajax({
            url:"${APP_PATH}/addOneKey",
            data:{"courseId":courseId,"priority":priority,"keyName":keyName},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                alert("成功！");
            }
        });
        $("#key-edit").modal("hide");

    });

    $(".cancel_btn").click(function () {
        $("#key-edit").modal("hide");
    });

    $("#btn-refresh").click(function () {
        $.ajax({
            url:"${APP_PATH}/refreshDB/"+courseId,
            data:{},
            dataType:"JSON",
            type:"POST",
            success:function (result) {
                $("#keyList").empty();
                var keyList=result.extend.reKeyInfos;
                //console.log(keyList);
                $.each(keyList,function (i,obj) {
                    courseId=obj.courseInfo.courseId;
                    var key=$("<li id="+obj.keyName+"><span><input type=\"text\" readonly value="+obj.keyName+"></span>\n" +
                        "<span><input type='text' readonly value="+obj.priority+"></span>\n"+
                        "        <span><button id='btn-edit' class=\"glyphicon glyphicon-pencil btn\">编辑</button></span>\n" +
                        "        <span><button id='btn-del' class=\"glyphicon glyphicon-trash btn\">删除</button></span></li>");
                    $("#keyList").append(key);
                });
            }
        });
    });

</script>
</body>
</html>
