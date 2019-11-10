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

        $(function () {
            to_Page(1);
        });

        function to_Page(pg) {
            $.ajax({
                url:"${APP_PATH}/getAllClasses",
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
                editBtn.attr("edit-id",item.gradeId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("del-id",item.gradeId);
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
            lastpage=result.extend.pageInfo.pages;
            curpage=result.extend.pageInfo.pageNum;
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
    </script>

</body>
</html>
