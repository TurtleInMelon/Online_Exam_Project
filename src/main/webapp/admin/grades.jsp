<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-8
  Time: 下午4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>年级管理</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>

    <!--年级编辑模态框-->
    <div class="modal fade" id="grade_Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">年级 编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="grade_edit_form">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年级编号</label>
                            <div class="col-sm-5">
                                <input type="text" name="gradeId" class="form-control" id="grade_Id_input" placeholder="年级编号">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年级名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="gradeName" class="form-control" id="grade_edit_input" placeholder="年级名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="grade_edit_btn">更新</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--年级添加模态框-->
    <div class="modal fade" id="grade_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">年级 添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="grade_add_form">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年级名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="gradeName" class="form-control" id="course_add_input" placeholder="年级名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="grade_add_btn">添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>



    <!---->
    <div>
        <table class="table table-hover" id="grades_table">
            <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>年级编号</th>
                    <th>年级名称</th>
                    <th>操作
                        <button type="button" id="grades_model_btn" class="btn btn-success btn-sm">新增</button>
                        <button type="button" id="grades_del_model_btn" class="btn btn-danger btn-sm">删除</button>
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

    <script type="text/javascript">

        var lastPage;
        $(function () {
           to_Page(1);
        });

        function to_Page(pg) {
           $.ajax({
               url:"${APP_PATH}/getGrades",
               data:"pg="+pg,
               type:"GET",
               success:function (result) {
                   //console.log(result);
                   build_grades_table(result);
                   emp_page_record(result)
                   build_page_nav(result)
               }
           })
        }

        //构建表格
        function build_grades_table(result) {
            $("#grades_table tbody").empty();
            var grades=result.extend.pageInfo.list;
            $.each(grades,function (index,item) {
                var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
                var gradeIdTd=$("<td></td>").append(item.gradeId);
                var gradeNameTd=$("<td></td>").append(item.gradeName);
                var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.gradeId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("del-id",item.gradeId);
                var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(gradeIdTd).append(gradeNameTd)
                    .append(tdTd)
                    .appendTo("#grades_table tbody");

            })

        }

        //构建记录数
        function emp_page_record(result) {
            $("#grades_record").empty();
            $("#grades_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
                + result.extend.pageInfo.pages +"页,总共"+
                result.extend.pageInfo.total+"条记录");
            lastpage=result.extend.pageInfo.pages;
            curpage=result.extend.pageInfo.pageNum;
            lastPage=result.extend.pageInfo.pages;
        }

        //构建页框
        function build_page_nav(result) {

            $("#grades_nav").empty();
            var ul=$("<ul></ur>").addClass("pagination");
            var firstPage=$("<li></li>").append($("<a></a>").append("首页"));
            var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));


            if(result.extend.pageInfo.hasPreviousPage==false){
                prePage.addClass("disabled");
                firstPage.addClass("disabled");

            }else{
                firstPage.click(function () {
                    to_Page(1);
                });

                prePage.click(function () {
                    to_Page(result.extend.pageInfo.pageNum-1);
                });
            }

            ul.append(firstPage).append(prePage);
            var nextPage=$("<li></li>").append($("<a></a>").append("&raquo;"));

            var lastPage=$("<li></li>").append($("<a></a>").append("末页"));



            if(result.extend.pageInfo.hasNextPage==false){
                nextPage.addClass("disabled");
                lastPage.addClass("disabled");
            }
            else{
                lastPage.click(function () {
                    to_Page(result.extend.pageInfo.pages+1000);
                });
                nextPage.click(function () {
                    to_Page(result.extend.pageInfo.pageNum+1);
                });
            }

            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numli=$("<li></li>").append($("<a></a>").append(item));
                if(item==result.extend.pageInfo.pageNum){
                    numli.addClass("active");
                }
                numli.click(function () {
                    to_Page(item);
                });
                ul.append(numli);
            })

            ul.append(nextPage).append(lastPage);
            var navEle=$("<nav></nav>").append(ul)
            navEle.appendTo("#grades_nav");
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

        })

        //点击新增按钮
        $("#grades_model_btn").click(function () {
            $("#grade_Add form")[0].reset();
            $("#grade_Add form").find(".help-block").text("");
            $('#grade_Add').modal('show');
        });


        //显示校验信息
        function show_validate_info(ele,status,message){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if(status=="success"){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(message);
            }
            else{
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(message);
            }
        }

        //校验输入的用户名是否可用
        $("#course_add_input").change(function () {
            var gradeName=this.value;
            alert(gradeName);
            if(gradeName==null){
                return;
            }
            $("#grade_add_btn").removeClass("disabled");
            $("#grade_Add form").find(".help-block").text("");
            $.ajax({
                url:"${APP_PATH}/checkGrade",
                data:"gradeName="+gradeName,
                type:"POST",
                success:function(result) {
                    if(result.code==100){
                        show_validate_info("#course_add_input","success","用户名可用")
                        $("#grade_add_btn").attr("ajax-va","success");
                        $("#grade_add_btn").removeClass("disabled");
                    }
                    else{
                        show_validate_info("#course_add_input","error",result.extend.va_msg);
                        $("#grade_add_btn").attr("ajax-va","fail");
                        $("#grade_add_btn").addClass("disabled");
                    }
                }
            })
        });

        //年级增加功能
        $("#grade_add_btn").click(function () {
            if($("#grade_add_form").serialize()=="gradeName="){
                show_validate_info("#course_add_input","error","用户名不能为空");
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/grade",
                type:"POST",
                data:$("#grade_add_form").serialize(),
                success:function (result) {
                    if(result.code==100){
                        $("#grade_Add").modal("hide");
                        to_Page(lastPage);
                    }
                    else{
                        console.log(result);
                    }
                }
            })
        });


        //点击编辑按钮
        $(document).on("click",".edit_btn",function () {
            var gradeId=$(this).parents("tr").find("td:eq(1)").text();
            var gradeName=$(this).parents("tr").find("td:eq(2)").text();
            //alert(gradeName+gradeId);
            $("#grade_Edit form")[0].reset();
            $("#grade_Edit form").find(".help-block").text("");
            $('#grade_Edit').modal('show');
            $("#grade_Id_input").val(gradeId);
            $("#grade_edit_input").val(gradeName);
        });

        //更新年级
        $("#grade_edit_btn").click(function () {
            var gradeId=$("#grade_Id_input").val();
            var gradeName=$("#grade_edit_input").val();
            //alert($("#grade_edit_form").serialize());
            $.ajax({
                url:"${APP_PATH}/grade/"+gradeId,
                type:"POST",
                data:$("#grade_edit_form").serialize()+"&_method=PUT",
                success:function (result) {
                    $("#grade_Edit").modal("hide");
                    to_Page(curpage);
                }
            })
        });

        //点击单个删除按钮
        $(document).on("click",".del_btn",function () {
            var gradeId=$(this).parents("tr").find("td:eq(1)").text();
            var gradeName=$(this).parents("tr").find("td:eq(2)").text();
            //alert(gradeId+gradeName);
            if(confirm("确认删除【"+gradeName+"】吗？")){
                $.ajax({
                   url:"${APP_PATH}/grade/"+gradeId,
                   type:"DELETE",
                   success:function (result) {
                       alert(result.msg);
                       to_Page(curpage);
                   }
                });
            }
        });

        //批量删除
        $("#grades_del_model_btn").click(function () {
            var gradeName="";
            var del_strs="";
            $.each($(".check_item:checked"),function () {
                gradeName+=$(this).parents("tr").find("td:eq(2)").text()+",";
                del_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })
            alert(gradeName+del_strs);
            gradeName=gradeName.substring(0,gradeName.length-1);
            del_strs=del_strs.substring(0,del_strs.length-1);
            if(confirm("确认删除【"+gradeName+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/grade/"+del_strs,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_Page(curpage);
                    }
                })
            }
        });






    </script>

</body>
</html>
