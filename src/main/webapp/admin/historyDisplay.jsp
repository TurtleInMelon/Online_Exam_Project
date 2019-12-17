<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-16
  Time: 下午1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>以往考试信息</title>
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
<div>
    <table class="table table-hover" id="historys_table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="check_all">
            </th>
            <th>试卷名称</th>
            <th>试卷总分</th>
            <th>试题数量</th>
            <th>考试得分</th>
            <th>考试人</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>


        </tbody>
    </table>
    <form action="" method="post">
        <input type="hidden" value="DELETE" name="_method" />
    </form>
</div>
<div class="row">
    <div class="col-md-6" id="historys_record">

    </div>

    <div class="col-md-6" id="historys_nav">


    </div>
</div>
<script type="text/javascript">

    $(function () {
        to_Page(1);
    });

    $("tbody").delegate(".detail_btn","click",function () {
        var studentName=$(this).siblings("td").eq(5).html();
        var examPaperName=$(this).siblings("td").eq(1).html();

        $(".detail_btn").attr("href","${APP_PATH}/Choose/ha/"+studentName+"/"+examPaperName);
    })

    function to_Page(pg) {
        $.ajax({
            url:"${APP_PATH}/getHistory",
            data:"pn="+pg,
            type:"GET",
            success:function (result) {
                console.log(result);
                build_historys_table(result);
                historys_page_record(result);
                build_page_nav(result);
            }
        })
    }
    function build_historys_table(result) {
        $("#historys_table tbody").empty();
        var historys=result.extend.pageInfo.list;
        $.each(historys,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var examPaperNameTd=$("<td></td>").append(item.examPaperInfo.examPaperName);
            var examPaperScoreTd=$("<td></td>").append(item.examPaperInfo.examPaperScore);
            var subjectNumTd=$("<td></td>").append(item.examPaperInfo.subjectNum);
            var examScore=$("<td></td>").append(item.examScore);
            var studentName=$("<td></td>").append(item.studentInfo.studentName);
            var editBtn=$("<a></a>").addClass("btn btn-info btn-sm edit_btn detail_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-pencil ")).append("详情");
            editBtn.attr("edit-id",item.gradeId);
            $("<tr></tr>").append(checkBoxTd)
                .append(examPaperNameTd).append(examPaperScoreTd).append(subjectNumTd).append(examScore).append(studentName)
                .append(editBtn)
                .appendTo("#historys_table tbody");
        });

    }

    //构建记录数
    function historys_page_record(result) {
        $("#historys_record").empty();
        $("#historys_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
            + result.extend.pageInfo.pages +"页,总共"+
            result.extend.pageInfo.total+"条记录");
        lastpage=result.extend.pageInfo.pages;
        curpage=result.extend.pageInfo.pageNum;
    }

    //构建页框
    function build_page_nav(result) {

        $("#historys_nav").empty();
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
        navEle.appendTo("#historys_nav");
    }
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
