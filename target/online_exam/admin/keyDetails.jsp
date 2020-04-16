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
<div>


    <!--年级关键字编辑模态框-->
    <div class="modal fade" id="keyWord_Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">知识点 编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="grade_edit_form">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">知识点</label>
                            <div class="col-sm-5">
                                <input type="text" name="keyName" class="form-control" id="keyName_input" placeholder="知识点">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">关联知识点Id</label>
                            <div class="col-sm-5">
                                <input type="text" name="priority" class="form-control" id="priority_edit_input" placeholder="知识点">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="keyWord_edit_btn">更新</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--关键字添加模态框-->
    <div class="modal fade" id="keyWords_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">关键字 添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="grade_add_form">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">知识点</label>
                            <div class="col-sm-5">
                                <input type="text" name="keyName" class="form-control" id="keyWord_add_input" placeholder="知识点">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label  class="col-sm-2 control-label">课程名：</label>
                            <div class="col-sm-5">
                                <input class="form-control" name="courseInfo.courseId" id="course_add_select">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">关联知识点</label>
                            <div class="col-sm-5">
                                <input type="text" name="priority" class="form-control" id="priority_add_input" placeholder="关联知识点">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="keyWord_add_btn">添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>



    <table class="table table-hover" id="keyWords_table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="check_all">
            </th>
            <th>知识点Id</th>
            <th>知识点</th>
            <th>对应课程</th>
            <th>关联知识点Id</th>
            <th>操作
                <button type="button" id="keyWords_model_btn" class="btn btn-success btn-sm">新增</button>
                <button type="button" id="keyWords_del_model_btn" class="btn btn-danger btn-sm">删除</button>
            </th>
        </tr>
        </thead>
        <tbody>


        </tbody>
    </table>
    <form action="class" method="post">
        <input type="hidden" value="DELETE" name="_method" />
    </form>
</div>
<div class="row">
    <div class="col-md-6" id="grades_record">

    </div>

    <div class="col-md-6" id="grades_nav">


    </div>
</div>


<%--<div class="modal fade" id="key-edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">--%>
<%--    <div class="modal-dialog" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
<%--                <h4 class="modal-title" >知识点</h4>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <p id="keyId">--%>
<%--                    <span>知识点序号</span>--%>
<%--                    <span><input id="keyId" type="text"></span>--%>
<%--                </p>--%>
<%--                <p id="Name">--%>
<%--                    <span>知识点名称</span>--%>
<%--                    <span><input id="keyName" type="text"></span>--%>
<%--                </p>--%>
<%--                <p id="unit">--%>
<%--                    <span>所属单元号</span>--%>
<%--                    <span><input id="priority" type="text">--%>

<%--                    </span>--%>
<%--                </p>--%>
<%--                <p>--%>
<%--                    <button class="btn btn-info sure_btn">保存</button>--%>
<%--                    <button class="btn btn-info cancel_btn">取消</button>--%>
<%--                </p>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<div >--%>
<%--    <p>--%>
<%--        <button class="btn btn-success btn-sm " id="btn-add">新增</button>--%>
<%--        <button class="btn btn-sm btn-info" id="btn-refresh">刷新</button>--%>
<%--    </p>--%>
<%--    <ul id="keyList">--%>

<%--    </ul>--%>
<%--</div>--%>
<script type="text/javascript">

    var lastPage;
    $(function () {
        to_Page(1);
    });

    function to_Page(pg) {
        var keyWordsList=JSON.parse('${keyInfos}');
        build_keyWords_table(keyWordsList);
    }

    //构建表格
    var courseName,global_courseId;
    function build_keyWords_table(result) {
        $("#keyWords_table tbody").empty();
        var keyWords=result;
        global_courseId = keyWords[0].courseInfo.courseId;
        $.each(keyWords, function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var keyIdTd=$("<td></td>").append(item.keyId);
            var courseId = item.courseInfo.courseId;
            // var courseName;
            $.ajax({
                url:"${APP_PATH}/getCourseNameById",
                data:"courseId="+courseId,
                type:"GET",
                success:function (result) {
                    // console.log(result);
                    courseName = result.extend.courseName;
                    $("#keyWords_model_btn").attr("courseName",courseName).attr("courseId", courseId);
                    // alert(courseName);
                    var courseNameTd= $("<td></td>").append(courseName);
                    var keyNameTd=$("<td></td>").append(item.keyName);
                    var priorityTd = $("<td></td>").append(item.priority);
                    var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                        .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                    editBtn.attr("keyId",item.keyId).attr("courseId", courseId);
                    var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                        .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                    delBtn.attr("keyId",item.keyId).attr("courseId", courseId);
                    var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                    $("<tr></tr>").append(checkBoxTd)
                        .append(keyIdTd).append(keyNameTd).append(courseNameTd).append(priorityTd)
                        .append(tdTd)
                        .appendTo("#keyWords_table tbody");
                }
            });
            // alert(courseName)


        })

    }

    //全选全不选的功能
    $("#check_all").click(function () {
        //alert($(this).prop("checked"));
        $(".check_item").prop("checked",$(this).prop("checked"));

    });
    //全选全不选的功能
    $(document).on("click",".check_item",function () {

        var flag=$(".check_item:checked").length == $(".check_item").length;
        //alert(flag)

        $("#check_all").prop("checked",flag);

    });

    //点击新增按钮
    $("#keyWords_model_btn").click(function () {
        // alert(global_courseId);
        $("#keyWords_Add form")[0].reset();
        $("#keyWords_Add form").find(".help-block").text("");
        $("#course_add_select").empty();
        $('#keyWords_Add').modal('show');
        $("#keyWord_add_btn").attr("courseId",$(this).attr("courseId"));
        $("#course_add_select").val($(this).attr("courseName"));

    });

    //点击添加按钮
    $("#keyWord_add_btn").click(function () {
        // alert($("#keyWords_Add form").serialize());
        var courseId = $("#keyWord_add_btn").attr("courseId");
        var keyName = $("#keyWord_add_input").val();
        var priority = $("#priority_add_input").val();
        alert(courseId+keyName+priority);
        $.ajax({
            url:"${APP_PATH}/addOneKey",
            data:{"courseId":courseId,"priority":priority,"keyName":keyName},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                alert("成功！");
                $("#keyWords_Add").modal("hide");
                to_Page(1);
            }
        });
    });


    //点击编辑
    $(document).on("click",".edit_btn",function () {

        // var classId=$(this).parents("tr").find("td:eq(1)").text();
        var keyName = $(this).parents("tr").find("td:eq(2)").text();
        var priority = $(this).parents("tr").find("td:eq(4)").text();
        var courseId = $(this).attr("courseid");
        var keyId = $(this).attr("keyId");
        // alert(courseId+keyName+priority+keyId);
        $("#keyWord_Edit form")[0].reset();
        $("#keyWord_Edit form").find(".help-block").text("");
        $('#keyWord_Edit').modal('show');
        $("#keyName_input").val(keyName);
        $("#priority_edit_input").val(priority);
        $("#keyWord_edit_btn").attr("keyId", keyId);
        $("#keyWord_edit_btn").attr("courseId", courseId);
    });

    //点击更新按钮
    $("#keyWord_edit_btn").click(function () {
       var keyId = $(this).attr("keyId");
       var keyName = $("#keyName_input").val();
       var priority = $("#priority_edit_input").val();
       var courseId = $(this).attr("courseId");
       alert("keyId"+keyId+ "keyName"+keyName+ "priority"+priority+ "courseId"+courseId);
       $.ajax({
           url:"${APP_PATH}/updateKeyWordById",
           type:"GET",
           data:{"keyId":keyId, "keyName":keyName, "priority":priority, "courseId":courseId},
           success:function (result) {
               // console.log(result);
               $("#keyWord_Edit").modal("hide");
               to_Page(1);
           }

       })
    });

    //单个删除课程信息
    $(document).on("click",".del_btn",function () {
        var keyId=$(this).parents("tr").find("td:eq(1)").text();
        var keyName=$(this).parents("tr").find("td:eq(2)").text();
        //alert(courseId+courseName);
        if(confirm("确认删除知识点【"+keyName+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/deleteOneKey",
                data:{"keyName":keyName},
                dataType:"JSON",
                type:"GET",
                success:function(result){
                    alert("删除成功！");
                    to_Page(1);
                }
            });
        }
    })

    //批量删除
    $("#keyWords_del_model_btn").click(function () {
        var keyNames="";
        var del_strs="";
        $.each($(".check_item:checked"),function () {
            keyNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
            del_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        })

        keyNames=keyNames.substring(0,keyNames.length-1);
        del_strs=del_strs.substring(0,del_strs.length-1);
        //alert(courseName+del_strs);
        if(confirm("确认删除【"+keyNames+"】吗？")){
            $.ajax({
                url:"${APP_PATH}/deleteBatch",
                type:"GET",
                data:"keyNames="+keyNames,
                success:function (result) {
                    alert(result.msg);
                    to_Page(1);
                }
            })
        }
    });









    $(function () {
       init();
    });
    var courseId,keyId;
    function init() {
        var keyList=JSON.parse('${keyInfos}');
        console.log(keyList);
        $.each(keyList,function (i,obj) {
            keyId = obj.keyId
            courseId=obj.courseInfo.courseId;
            var key=$("<li id="+keyId+"><input name='text1'type=\"text\" readonly value="+keyId+">"+
                "<li id="+obj.keyName+"><input name='text2'type=\"text\" readonly value="+obj.keyName+">\n" +
                "<input name='text3' type='text' readonly value="+obj.priority+"></span>\n"+
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
            type:"GET",
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
