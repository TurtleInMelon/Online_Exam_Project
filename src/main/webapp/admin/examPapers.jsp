<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-12
  Time: 下午4:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>所有试卷信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>

    <!--表格信息-->
    <div>
        <table class="table table-hover" id="examPapers_table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all">
                </th>
                <th>试卷编号</th>
                <th>试卷名称</th>
                <th>题目数量</th>
                <th>总分</th>
                <th>考试时长</th>
                <th>分科情况</th>
                <th>难易程度</th>
                <th>所属年级</th>
                <th>操作
                    <button type="button" id="examPapers_add_model_btn" class="btn btn-success btn-sm">新增</button>
                    <button type="button" id="examPapers_del_model_btn" class="btn btn-danger btn-sm">删除</button>
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
        <div class="col-md-6" id="examPapers_record">

        </div>

        <div class="col-md-6" id="examPapers_nav">


        </div>
    </div>


    <script type="text/javascript">

        $(function () {
            to_Page(1);
        });

        function to_Page(pg) {
            $.ajax({
                url:"${APP_PATH}/getAllExamPapers",
                data:"pn="+pg,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    build_examPapers_table(result);
                    examPapers_page_record(result);
                    build_page_nav(result);
                }
            })
        }

        //构建表格
        function build_examPapers_table(result) {
            $("#examPapers_table tbody").empty();
            var grades=result.extend.pageInfo.list;
            $.each(grades,function (index,item) {
                var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
                var examPaperIdTd=$("<td></td>").append(item.examPaperId);
                var examPaperNameTd=$("<td></td>").append(item.examPaperName);
                var subjectNumTd=$("<td></td>").append(item.subjectNum);
                var examPaperTimeTd=$("<td></td>").append(item.examPaperTime);
                var examPaperScoreTd=$("<td></td>").append(item.examPaperScore);
                var divisionTd=$("<td></td>").append(item.division);
                var examPaperEasyTd=$("<td></td>").append(item.examPaperEasy);
                var gradeNameTd=$("<td></td>").append(item.grade.gradeName);


                var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.gradeId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("del-id",item.gradeId);
                var lookBtn=$("<button></button>").addClass("btn btn-info btn-sm look_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-search")).append("查看试题");
                lookBtn.attr("edit-id",item.gradeId);
                var addBtn=$("<button></button>").addClass("btn btn-info btn-sm add_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-plus")).append("添加试题");
                addBtn.attr("edit-id",item.gradeId);
                var createBtn=$("<button></button>").addClass("btn btn-info btn-sm create_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-ok")).append("生成试题");
                createBtn.attr("edit-id",item.gradeId);
                var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn)
                    .append(" ").append(lookBtn).append(" ").append(addBtn).append(" ").append(createBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(examPaperIdTd).append(examPaperNameTd).append(subjectNumTd).append(examPaperScoreTd)
                    .append(examPaperTimeTd).append(divisionTd).append(examPaperEasyTd).append(gradeNameTd).append(tdTd)
                    .appendTo("#examPapers_table tbody");

            })

        }

        //构建记录数
        function examPapers_page_record(result) {
            $("#examPapers_record").empty();
            $("#examPapers_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
                + result.extend.pageInfo.pages +"页,总共"+
                result.extend.pageInfo.total+"条记录");
            lastpage=result.extend.pageInfo.pages;
            curpage=result.extend.pageInfo.pageNum;
        }

        //构建页框
        function build_page_nav(result) {

            $("#examPapers_nav").empty();
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
            navEle.appendTo("#examPapers_nav");
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
