<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-9
  Time: 下午2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>科目管理</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>
    <!--科目添加模态框-->
    <div class="modal fade" id="course_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">课程 添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">分科情况：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="dId" id="subject_add_select">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">所属年级：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="dId" id="grade_add_select">

                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">学科名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="email" class="form-control" id="course_add_input" placeholder="学科名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="emp_add_btn">添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <!--表格信息-->
    <div>
        <table class="table table-hover" id="courses_table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all">
                </th>
                <th>科目编号</th>
                <th>科目名称</th>
                <th>分科情况</th>
                <th>所属年级</th>
                <th>操作
                    <button type="button" id="course_add_model_btn" class="btn btn-success btn-sm">新增</button>
                    <button type="button" id="course_del_model_btn" class="btn btn-danger btn-sm">删除</button>
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
        <div class="col-md-6" id="courses_record">

        </div>

        <div class="col-md-6" id="courses_nav">


        </div>
    </div>

    <script type="text/javascript">

        $(function () {
            to_Page(1);
        });

        function to_Page(pg) {
            $.ajax({
                url:"${APP_PATH}/getAllCourses",
                data:"pn="+pg,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    build_courses_table(result);
                    courses_page_record(result);
                    build_page_nav(result);
                }
            })
        }

        //构建表格
        function build_courses_table(result) {
            $("#courses_table tbody").empty();
            var grades=result.extend.pageInfo.list;
            $.each(grades,function (index,item) {
                var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
                var courseIdTd=$("<td></td>").append(item.courseId);
                var courseNameTd=$("<td></td>").append(item.courseName);
                var divisionTd;
                if(item.division==0){
                    divisionTd=$("<td></td>").append("未分科");
                }
                else if(item.division==1){
                    divisionTd=$("<td></td>").append("文科");
                }
                else{
                    divisionTd=$("<td></td>").append("理科");
                }
                var gradeNameTd=$("<td></td>").append(item.gradeInfo.gradeName);

                var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.gradeId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("del-id",item.gradeId);
                var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(courseIdTd).append(courseNameTd).append(divisionTd).append(gradeNameTd)
                    .append(tdTd)
                    .appendTo("#courses_table tbody");

            })

        }

        //构建记录数
        function courses_page_record(result) {
            $("#courses_record").empty();
            $("#courses_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
                + result.extend.pageInfo.pages +"页,总共"+
                result.extend.pageInfo.total+"条记录");
            lastpage=result.extend.pageInfo.pages;
            curpage=result.extend.pageInfo.pageNum;
        }

        //构建页框
        function build_page_nav(result) {

            $("#courses_nav").empty();
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
            navEle.appendTo("#courses_nav");
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


        $("#course_add_model_btn").click(function () {
            $('#course_Add').modal('show');
        });
    </script>
</body>
</html>
