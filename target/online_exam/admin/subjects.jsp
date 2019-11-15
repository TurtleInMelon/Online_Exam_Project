<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-14
  Time: 下午12:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>所有试题信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>

    <div>
        <table class="table table-hover" id="subjects_table">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="check_all">
                </th>
                <th>试题编号</th>
                <th>题目</th>
                <th>选项A</th>
                <th>选项B</th>
                <th>选项C</th>
                <th>选项D</th>
                <th>正确答案</th>
                <th>分值</th>
                <th>试题类型</th>
                <th>难易程度</th>
                <th>所属科目</th>
                <th>所属年级</th>
                <th>操作
                    <button type="button" id="subjects_model_btn" class="btn btn-success btn-sm">新增</button>
                    <button type="button" id="subjects_del_model_btn" class="btn btn-danger btn-sm">删除</button>
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
        <div class="col-md-6" id="subjects_record">

        </div>

        <div class="col-md-6" id="subjects_nav">


        </div>
    </div>



<script type="text/javascript">

    var islookup=true;
    $(function () {
        to_Page(1);
    });

    function to_Page(pg) {
        $.ajax({
            url:"${APP_PATH}/getAllSubjects",
            data:"pn="+pg,
            type:"GET",
            success:function (result) {
                console.log(result);
                build_subjects_table(result);
                subject_page_record(result)
                build_page_nav(result)
            }
        })
    }

    //构建表格
    function build_subjects_table(result) {
        $("#subjects_table tbody").empty();
        var subjects=result.extend.pageInfo.list;
        $.each(subjects,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var subjectIdTd=$("<td></td>").append(item.subjectId);
            if((item.subjectName.length)<=8){
                var subjectNameTd=$("<td></td>").append(item.subjectName);
            }
            else{
                var subjectNameTd=$("<td></td>").append($("<p></p>").append(item.subjectName.substring(0,8)))
                    .append($("<button type=\"button\" class=\"btn btn-default btn-sm lookup\">查看</button>").attr("subjectName",item.subjectName));
            }
            var optionATd=$("<td></td>").append(item.optionA);
            var optionBTd=$("<td></td>").append(item.optionB);
            var optionCTd=$("<td></td>").append(item.optionC);
            var optionDTd=$("<td></td>").append(item.optionD);
            var rightResultTd=$("<td></td>").append(item.rightResult);
            var subjectScoreTd=$("<td></td>").append(item.subjectScore);
            var subjectTypeTd=$("<td></td>").append(item.subjectType);
            var subjectEasyTd=$("<td></td>").append(item.subjectEasy);
            var courseNameTd=$("<td></td>").append(item.course.courseName);
            var gradeNameTd=$("<td></td>").append(item.grade.gradeName);

            var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.gradeId);
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id",item.gradeId);
            var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(subjectIdTd).append(subjectNameTd).append(optionATd).append(optionBTd).append(optionCTd)
                .append(optionDTd).append(rightResultTd).append(subjectScoreTd).append(subjectTypeTd)
                .append(subjectEasyTd).append(courseNameTd).append(gradeNameTd).append(tdTd)
                .appendTo("#subjects_table tbody");

        })

    }

    //构建记录数
    function subject_page_record(result) {
        $("#subjects_record").empty();
        $("#subjects_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
            + result.extend.pageInfo.pages +"页,总共"+
            result.extend.pageInfo.total+"条记录");
        lastpage=result.extend.pageInfo.pages;
        curpage=result.extend.pageInfo.pageNum;
    }

    //构建页框
    function build_page_nav(result) {

        $("#subjects_nav").empty();
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
        navEle.appendTo("#subjects_nav");
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

    $(document).on("click",".lookup",function () {
        if(islookup==true){
            var TDName=$(this).parents("tr").find("td:eq(2) button").attr("subjectName");
            //alert(TDName);
            $(this).parents("tr").find("td:eq(2) p").text(TDName);
            islookup=!islookup;
        }
        else{
            var TDName=$(this).parents("tr").find("td:eq(2) button").attr("subjectName").substring(0,8);
            //alert(TDName);
            $(this).parents("tr").find("td:eq(2) p").text(TDName);
            islookup=!islookup;
        }

    });

</script>

</body>
</html>
