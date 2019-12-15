<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-9
  Time: 下午7:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>班级管理</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>

<!--科目编辑模态框-->
    <div class="modal fade" id="class_Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >班级 编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="className" class="form-control" id="classname_edit_input" placeholder="班级名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label  class="col-sm-2 control-label">所属年级：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="gradeInfo.gradeId" id="grade_edit_select">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班主任：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="teacherInfo.teacherId" id="teacher_edit_select">

                                </select>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="class_edit_btn">更新</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


<!--科目添加模态框-->
    <div class="modal fade" id="class_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">班级 添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班级名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="className" class="form-control" id="classname_add_input" placeholder="班级名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label  class="col-sm-2 control-label">所属年级：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="gradeInfo.gradeId" id="grade_add_select">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">班主任：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="teacherInfo.teacherId" id="teacher_add_select">

                                </select>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="class_add_btn">添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

<!--表格信息-->
    <div>
        <table class="table table-hover" id="classes_table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all">
                </th>
                <th>班级编号</th>
                <th>班级名称</th>
                <th>所属年级</th>
                <th>班主任</th>
                <th>操作
                    <button type="button" id="classes_add_model_btn" class="btn btn-success btn-sm">新增</button>
                    <button type="button" id="classes_del_model_btn" class="btn btn-danger btn-sm">删除</button>
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
        <div class="col-md-6" id="classes_record">

        </div>

        <div class="col-md-6" id="classes_nav">


        </div>
    </div>

    <script type="text/javascript">
        var curPage,lastPage;
        $(function () {
            to_Page(1);
        });

        function to_Page(pg) {
            $.ajax({
                url:"${APP_PATH}/getAllClasses",
                data:"pn="+pg,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    build_courses_table(result);
                    courses_page_record(result);
                    build_page_nav(result);
                }
            })
        }

        //构建表格
        function build_courses_table(result) {
            $("#classes_table tbody").empty();
            var grades=result.extend.pageInfo.list;
            $.each(grades,function (index,item) {
                var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
                var classIdTd=$("<td></td>").append(item.classId);
                var classNameTd=$("<td></td>").append(item.className);
                var gradeNameTd=$("<td></td>").append(item.gradeInfo.gradeName);
                var teacherName=$("<td></td>").append(item.teacherInfo.teacherName);
                var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("grade-id",item.gradeInfo.gradeId).attr("teacher-id",item.teacherInfo.teacherId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("grade-id",item.gradeInfo.gradeId).attr("teacher-id",item.teacherInfo.teacherId);
                var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(classIdTd).append(classNameTd).append(gradeNameTd).append(teacherName)
                    .append(tdTd)
                    .appendTo("#classes_table tbody");

            })

        }

        //构建记录数
        function courses_page_record(result) {
            $("#classes_record").empty();
            $("#classes_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
                + result.extend.pageInfo.pages +"页,总共"+
                result.extend.pageInfo.total+"条记录");
            lastPage=result.extend.pageInfo.pages;
            curPage=result.extend.pageInfo.pageNum;
        }

        //构建页框
        function build_page_nav(result) {

            $("#classes_nav").empty();
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
                //alert(item);
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
            navEle.appendTo("#classes_nav");
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

        //校验输入的班级名是否可用
        $("#classname_add_input").change(function () {
            var className=this.value;
            //alert(className);
            if(className==null){
                return;
            }
            $("#class_add_btn").removeClass("disabled");
            $("#class_Add form").find(".help-block").text("");
            $.ajax({
                url:"${APP_PATH}/checkClass",
                data:"className="+className,
                type:"POST",
                success:function(result) {
                    //console.log(result);

                    if(result.code==100){
                        show_validate_info("#classname_add_input","success","班级名可用")
                        $("#class_add_btn").attr("ajax-va","success");
                        $("#class_add_btn").removeClass("disabled");
                    }
                    else{
                        show_validate_info("#classname_add_input","error",result.extend.va_msg);
                        $("#class_add_btn").attr("ajax-va","fail");
                        $("#class_add_btn").addClass("disabled");
                    }
                }
            })
        });
        //点击新增
        $("#classes_add_model_btn").click(function () {
            $("#class_Add form")[0].reset();
            $("#class_Add form").find(".help-block").text("");
            $("#grade_add_select").empty();
            $("#teacher_add_select").empty();
            //获取所有年级名称
            $.ajax({
                url:"${APP_PATH}/getAllGradeNames",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var grades=result.extend.list;
                    $.each(grades,function (index,item) {
                        var optionEle=$("<option></option>").append(item.gradeName).attr("value",item.gradeId);
                        optionEle.appendTo("#grade_add_select");
                    })
                }
            });
            //获取所有教师名称
            $.ajax({
                url:"${APP_PATH}/getAllTeacherNames",
                type:"GET",
                success:function (result) {
                    console.log(result);
                    var teachers=result.extend.list;
                    $.each(teachers,function (index,item) {
                        var optionEle=$("<option></option>").append(item.teacherName).attr("value",item.teacherId);
                        optionEle.appendTo("#teacher_add_select");
                    })
                }
            });

            $('#class_Add').modal('show');
        });

        //点击添加按钮
        $("#class_add_btn").click(function () {
            //alert($("#class_Add form").serialize());
            $.ajax({
                url:"${APP_PATH}/class",
                type:"POST",
                data:$("#class_Add form").serialize(),
                success:function (result) {
                    //console.log(result);
                    if(result.code==100){
                        $("#class_Add").modal("hide");
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
            var gradeId=$(this).attr("grade-id");
            var teacherId=$(this).attr("teacher-id");
            var className=$(this).parents("tr").find("td:eq(2)").text();
            var classId=$(this).parents("tr").find("td:eq(1)").text();
            //alert(gradeId+className+teacherId);
            $("#class_Edit form")[0].reset();
            $("#class_Edit form").find(".help-block").text("");
            $('#class_Edit').modal('show');
            //寻找所有的年级
            $("#grade_edit_select").empty();
            $("#teacher_edit_select").empty();
            $.ajax({
                url:"${APP_PATH}/getAllGradeNames",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var grades=result.extend.list;
                    $.each(grades,function (index,item) {
                        var optionEle=$("<option></option>").append(item.gradeName).attr("value",item.gradeId);
                        optionEle.appendTo("#grade_edit_select");
                    })
                    $("#classname_edit_input").val(className);
                    $("#grade_edit_select").val(gradeId);

                }
            });
            //获取所有教师名称
            $.ajax({
                url:"${APP_PATH}/getAllTeacherNames",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var teachers=result.extend.list;
                    $.each(teachers,function (index,item) {
                        var optionEle=$("<option></option>").append(item.teacherName).attr("value",item.teacherId);
                        optionEle.appendTo("#teacher_edit_select");
                    })
                    $("#teacher_edit_select").val(teacherId);
                }
            });
            $("#class_edit_btn").attr("class-id",classId);

        });

        //点击更新按钮
        $("#class_edit_btn").click(function () {
            //alert($("#class_Edit form").serialize());
            var classId=$(this).attr("class-id");
            //alert(classId);
            $.ajax({
                url:"${APP_PATH}/class/"+classId,
                type:"PUT",
                data:$("#class_Edit form").serialize(),
                success:function (result) {
                    //console.log(result);
                    $("#class_Edit").modal("hide");
                    to_Page(curPage);
                }
            })
        });
        //单个删除课程信息
        $(document).on("click",".del_btn",function () {
            var classId=$(this).parents("tr").find("td:eq(1)").text();
            var className=$(this).parents("tr").find("td:eq(2)").text();
            //alert(courseId+courseName);
            if(confirm("确认删除【"+className+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/class/"+classId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_Page(curPage);
                    }
                });
            }
        })

        //批量删除
        $("#classes_del_model_btn").click(function () {
            var className="";
            var del_strs="";
            $.each($(".check_item:checked"),function () {
                className+=$(this).parents("tr").find("td:eq(2)").text()+",";
                del_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })

            className=className.substring(0,className.length-1);
            del_strs=del_strs.substring(0,del_strs.length-1);
            //alert(courseName+del_strs);
            if(confirm("确认删除【"+className+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/class/"+del_strs,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_Page(curPage);
                    }
                })
            }
        });


    </script>

</body>
</html>
