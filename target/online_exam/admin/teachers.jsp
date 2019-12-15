<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-11
  Time: 下午8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>教师信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>

</head>
<body>

<!--教师编辑模态框-->
    <div class="modal fade" id="teacher_Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="teacherId-edit">教师 编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">教师编号</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="teacherId_update_edit">  </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">后台权限：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="adminPower" id="adminPower_edit_select">
                                    <option value="0">普通教职员工</option>
                                    <option value="1">管理员</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">教师姓名</label>
                            <div class="col-sm-5">
                                <input type="text" name="teacherName" class="form-control" id="teacherName_edit_input" placeholder="教师姓名">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">教师账户</label>
                            <div class="col-sm-5">
                                <input type="text" name="teacherAccount" class="form-control" id="teacherAccount_edit_input" placeholder="教师账户">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">登录密码</label>
                            <div class="col-sm-5">
                                <input type="password" name="teacherPwd" class="form-control" id="teacherPwd_edit_input" placeholder="登录密码">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="teacher_edit_btn">更新</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


<!--教师添加添加模态框-->
    <div class="modal fade" id="teacher_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">教师 添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">后台权限：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="adminPower" id="subject_add_select">
                                    <option value="0">普通教职员工</option>
                                    <option value="1">管理员</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">教师姓名</label>
                            <div class="col-sm-5">
                                <input type="text" name="teacherName" class="form-control" id="teacherName_add_input" placeholder="教师姓名">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">教师账户</label>
                            <div class="col-sm-5">
                                <input type="text" name="teacherAccount" class="form-control" id="teacherAccount_add_input" placeholder="教师账户">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">登录密码</label>
                            <div class="col-sm-5">
                                <input type="password" name="teacherPwd" class="form-control" id="teacherPwd_add_input" placeholder="登录密码">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="teacher_add_btn">添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

<!--表格信息-->
    <div>
        <table class="table table-hover" id="teachers_table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all">
                </th>
                <th>教师编号</th>
                <th>教师姓名</th>
                <th>后台账户</th>
                <th>后台密码</th>
                <th>后台权限</th>
                <th>班主任</th>
                <th>操作
                    <button type="button" id="teachers_add_model_btn" class="btn btn-success btn-sm">新增</button>
                    <button type="button" id="teachers_del_model_btn" class="btn btn-danger btn-sm">删除</button>
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
        <div class="col-md-6" id="teachers_record">

        </div>

        <div class="col-md-6" id="teachers_nav">


        </div>
    </div>

    <script type="text/javascript">
        var curpage,lastpage;
        $(function () {
            to_Page(1);
            //查看密码
            //需要用on方法监听事件，不能用click
            $(document).on("click",".viewPwd",function() {
                var pwd0 = $(this).siblings("#hidePwd").text();

                if (pwd0.indexOf("*") != -1) {
                    var pwd = $(this).siblings("#showPwd").text();
                    $(this).siblings("#hidePwd").text(pwd);
                    return;
                } else {
                    $(this).siblings("#hidePwd").text("******");
                }
            });

        });

        function to_Page(pg) {
            $.ajax({
                url:"${APP_PATH}/getAllTeachers",
                data:"pn="+pg,
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    build_courses_table(result);
                    teachers_page_record(result);
                    build_page_nav(result);
                }
            })
        }

        //构建表格
        function build_courses_table(result) {
            $("#teachers_table tbody").empty();
            var teachers=result.extend.pageInfo.list;
            $.each(teachers,function (index,item) {
                var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
                var teacherIdTd=$("<td></td>").append(item.teacherId);
                var teacherNameTd=$("<td></td>").append(item.teacherName);
                var teacherAccountTd=$("<td></td>").append(item.teacherAccount);
                var teacherPwdTd=$("<td></td>")
                    .append($("<span id=\"hidePwd\"></span>").append("******"))
                    .append($("<span id=\"showPwd\" style=\"display: none\"></span>").append(item.teacherPwd))
                    .append($("<button type=\"button\" class=\"btn btn-info btn-xs viewPwd\"></button>").append("查看"));


                if(item.adminPower!=1){
                    var adminPowerTd=$("<td></td>").append("普通教职员工");
                }
                else {
                    var adminPowerTd=$("<td></td>").append($("<span style=\"color: red;\"></span>").append("管理员"));
                }
                //var adminPowerTd=
                var className;
                if(item.classInfo==null){
                    className="无";
                }else {
                    className=item.classInfo.className;
                }

                var classNameTd=$("<td></td>").append($("<a href=''></a>").append(className));

                var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.adminPower);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("del-id",item.adminPower);
                var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(teacherIdTd).append(teacherNameTd).append(teacherAccountTd).append(teacherPwdTd)
                    .append(adminPowerTd).append(classNameTd).append(tdTd)
                    .appendTo("#teachers_table tbody");

            })

        }

        //构建记录数
        function teachers_page_record(result) {
            $("#teachers_record").empty();
            $("#teachers_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
                + result.extend.pageInfo.pages +"页,总共"+
                result.extend.pageInfo.total+"条记录");
            lastpage=result.extend.pageInfo.pages;
            curpage=result.extend.pageInfo.pageNum;
        }

        //构建页框
        function build_page_nav(result) {

            $("#teachers_nav").empty();
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
            navEle.appendTo("#teachers_nav");
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

        //校验输入的教师名是否可用
        $("#teacherName_add_input").change(function () {
            var teacherName=this.value;
            alert(teacherName);
            if(teacherName==null){
                return;
            }
            $("#teacher_add_btn").removeClass("disabled");
            $("#teacher_Add form").find(".help-block").text("");
            $.ajax({
                url:"${APP_PATH}/checkTeacherName",
                data:"teacherName="+teacherName,
                type:"POST",
                success:function(result) {
                    //console.log(result);
                    if(result.code==100){
                        show_validate_info("#teacherName_add_input","success","教师名可用")
                        $("#teacher_add_btn").attr("ajax-va","success");
                        $("#teacher_add_btn").removeClass("disabled");
                    }
                    else{
                        show_validate_info("#teacherName_add_input","error",result.extend.va_msg);
                        $("#teacher_add_btn").attr("ajax-va","fail");
                        $("#teacher_add_btn").addClass("disabled");
                    }
                }
            })
        });

        //点击新增
        $("#teachers_add_model_btn").click(function () {
            $("#teacher_Add form")[0].reset();
            $("#teacher_Add form").find(".help-block").text("");
            $('#teacher_Add').modal('show');
        });

        //点击添加按钮
        $("#teacher_add_btn").click(function () {
            alert($("#teacher_Add form").serialize());

            $.ajax({
                url:"${APP_PATH}/teacher",
                type:"POST",
                data:$("#teacher_Add form").serialize(),
                success:function (result) {
                    //console.log(result);
                    if(result.code==100){
                        $("#teacher_Add").modal("hide");
                        to_Page(lastpage);
                    }
                    else{
                        console.log(result);
                    }
                }
            })
        });

        //点击编辑按钮
        $(document).on("click",".edit_btn",function () {
            var teacherId=$(this).parents("tr").find("td:eq(1)").text();
            var teacherName=$(this).parents("tr").find("td:eq(2)").text();
            var teacherAccount=$(this).parents("tr").find("td:eq(3)").text();
            var teacherPwd=$(this).parents("tr").find("td:eq(4)").find("span:eq(1)").text();
            var adminPower=$(this).attr("edit-id");
            //alert(teacherPwd);
            $("#teacher_Edit form")[0].reset();
            $("#teacher_Edit form").find(".help-block").text("");
            $('#teacher_Edit').modal('show');
            $("#teacherId_update_edit").text(teacherId);
            $("#teacherName_edit_input").val(teacherName);
            $("#teacherPwd_edit_input").val(teacherPwd);
            $("#teacherAccount_edit_input").val(teacherAccount);
            $("#adminPower_edit_select").val(adminPower);
        })

        //点击更新按钮
        $("#teacher_edit_btn").click(function () {
            var teacherId=$("#teacherId_update_edit").text();
            //alert(teacherId);
            $.ajax({
                url:"${APP_PATH}/teacher/"+teacherId,
                type:"PUT",
                data:$("#teacher_Edit form").serialize(),
                success:function (result) {
                    //console.log(result);
                    $("#teacher_Edit").modal("hide");
                    to_Page(curpage);
                }
            })
        });

        //点击单个删除
        $(document).on("click",".del_btn",function () {
            var teacherId=$(this).parents("tr").find("td:eq(1)").text();
            var teacherName=$(this).parents("tr").find("td:eq(2)").text();
            //alert(courseId+courseName);
            if(confirm("确认删除【"+teacherName+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/teacher/"+teacherId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_Page(curpage);
                    }
                });
            }
        });

        //批量删除
        $("#teachers_del_model_btn").click(function () {
            var teacherName="";
            var del_strs="";
            $.each($(".check_item:checked"),function () {
                teacherName+=$(this).parents("tr").find("td:eq(2)").text()+",";
                del_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })

            teacherName=teacherName.substring(0,teacherName.length-1);
            del_strs=del_strs.substring(0,del_strs.length-1);
            //alert(courseName+del_strs);
            if(confirm("确认删除【"+teacherName+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/teacher/"+del_strs,
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
