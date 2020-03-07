<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-15
  Time: 下午9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>考试安排管理</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style>
        .mask{
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            position: fixed;
            top: 0;
            left: 0;
        }
        .login{
            width:522px;
            height:290px;
            position: absolute;
            margin: 100px auto;
        }
        .login > span{
            width: 50px;
            height: 50px;
            background: red;
            position: absolute;
            top: 0;
            right: 0;
        }
    </style>
</head>
<body>
<div>
    <table class="table table-hover" id="plans_table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="check_all">
            </th>
            <th>编号</th>
            <th>考试班级</th>
            <th>考试科目</th>
            <th>试卷名称</th>
            <th>题目数量</th>
            <th>开考时间</th>
            <th>操作
                <button type="button" id="classes_add_model_btn" class="btn btn-success btn-sm  add_btn">新增</button>
            </th>
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
    <div class="col-md-6" id="plans_record">

    </div>

    <div class="col-md-6" id="plans_nav">


    </div>
</div>

<script type="text/javascript">

    $(function () {
        to_Page(1);
    });

    function to_Page(pg) {
        $.ajax({
            url:"${APP_PATH}/getExamPlans",
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
    function build_courses_table(result) {
        $("#plans_table tbody").empty();
        var plans=result.extend.pageInfo.list;
        console.log(plans);
        $.each(plans,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var planIdTd=$("<td></td>").append(item.examPlanId).addClass("id");
            var classNameTd=$("<td></td>").append(item.classInfo.className);
            var examSubject=$("<td></td>").append(item.courseInfo.courseName);
            var examNameTd=$("<td></td>").append(item.examPaperInfo.examPaperName);
            var subjectNum=$("<td></td>").append(item.examPaperInfo.subjectNum);
            var beginTimeTd=$("<td></td>").append(item.beginTime);
            var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.gradeId);
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id",item.gradeId);
            var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(planIdTd).append(classNameTd).append(examSubject).append(examNameTd).append(subjectNum).append(beginTimeTd)
                .append(editBtn).append(delBtn)
                .appendTo("#plans_table tbody");
        });
    }

    //构建记录数
    function courses_page_record(result) {
        $("#plans_record").empty();
        $("#plans_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
            + result.extend.pageInfo.pages +"页,总共"+
            result.extend.pageInfo.total+"条记录");
        lastpage=result.extend.pageInfo.pages;
        curpage=result.extend.pageInfo.pageNum;
    }

    //构建页框
    function build_page_nav(result) {

        $("#plans_nav").empty();
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
        navEle.appendTo("#plans_nav");
    }

    $("tbody").delegate(".del_btn","click",function () {
        var id=$(this).parents("tr").find("td.id").html();
        $.ajax({
            url:"${APP_PATH}/deleteOneRecord",
            type:"GET",
            data:{"id":id},
            dataType:"JSON",
            success:function (result) {
                alert("删除成功！");
            }
        })
        $(this).parents("tr").remove();
    })

    $("tbody").delegate(".edit_btn","click",function () {
        var $plan=$("<div class=\"mask\">\n" +
            "    <div class=\"login\" style='position: center;'>\n" +
            "<div class='modal-dialog'>\n"+
            "<div class=\"modal-content\">\n"+
            "<div class=\"modal-header\">\n" +
            "                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "                    <h4 class=\"modal-title\" id=\"teacherId-edit\">记录 编辑</h4>\n" +
            "                </div>\n"+
            "<div class=\"modal-body\">\n"+
            "        <div>\n" +
            "            <label>编号</label><input type=\"text\" name=\"id\"  style='width: 100%'readonly='true' value="+$(this).siblings("td").eq(1).html()+">\n" +
            "            <label>考试班级</label><select id='class_selector' style='width: 100%; height: 30px'></select>\n" +
            "            <label>考试科目</label><select id='course_selector' style='width: 100%; height: 30px'></select>\n" +
            "            <label>试卷名称</label><select id='paper_selector' style='width: 100%; height: 30px'></select>" +
                "        "+
            "        </div>\n" +
            "        <button class=\"btn btn-info sure_btn\">保存</button>\n" +
            "        <button class=\"btn btn-info cancel_btn\">取消</button>\n" +
            "    </div>\n" +
            "</div></div></div></div>");
        $("body").append($plan);
        var thisclass=$(this).siblings("td").eq(2).html();
        var thiscourse=$(this).siblings("td").eq(3).html();
        var thispaper=$(this).siblings("td").eq(4).html();
        $.ajax({
            url:"${APP_PATH}/getAllClass",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.classes).each(function (i,obj) {
                    var className=$("<option>"+obj.className+"</option>");
                    $("#class_selector").append(className);
                    $("#class_selector").val(thisclass);
                })
            }
        });
        $.ajax({
            url:"${APP_PATH}/getAllCourseNames",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.list).each(function (i,obj) {
                    var courseName=$("<option>"+obj.courseName+"</option>");
                    $("#course_selector").append(courseName);
                    $("#course_selector").val(thiscourse);
                })
            }
        });
        $.ajax({
            url:"${APP_PATH}/getAllPaperNames",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.papers).each(function (i,obj) {
                    var paperName=$("<option>"+obj+"</option>");
                    $("#paper_selector").append(paperName);
                    $("#paper_selector").val(thispaper);
                })
            }
        });
        $(".close").click(function () {
            $(this).parents(".mask").remove();
        })
        $(".cancel_btn").click(function () {
            $(this).parents(".mask").remove();
        })
        $(".sure_btn").click(function () {
            $.ajax({
                url:"${APP_PATH}/updateOneRecord",
                type:"GET",
                data:{"id":$("input[name='id']").val(),"className":$("#class_selector").val(),"courseName":$("#course_selector").val(),"examPaperName":$("#paper_selector").val()},
                dataType:"json",
                success:function (result) {
                    alert("更新成功！");
                },
                error:function () {
                    alert("请重新填写！");
                }
            })
            $(this).parents(".mask").remove();
        })

    });

    $(".add_btn").click(function () {
        var $plan=$("<div class=\"mask\">\n" +
            "    <div class=\"login\">\n" +
            "<div class='modal-dialog'>\n"+
            "<div class=\"modal-content\">\n"+
                "<div class=\"modal-header\">\n" +
            "                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
            "                    <h4 class=\"modal-title\" id=\"teacherId-edit\">记录 新增</h4>\n" +
            "                </div>\n"+
            "<div class=\"modal-body\">\n"+
            "        <div>\n" +
            "            <label>考试班级</label><select id='class_selector' style='width: 100%; height: 30px'></select>\n" +
            "            <label>考试科目</label><select id='course_selector' style='width: 100%; height: 30px'></select>\n" +
            "            <label>试卷名称</label><select id='paper_selector' style='width: 100%; height: 30px'></select>\n" +
            "            <label>开考时间</label><input type=\"text\" name=\"beginTime\" style='width: 100%; height: 30px'>\n" +
            "        </div>\n" +
            "        <button class=\"btn btn-info sure_btn\">确认</button>\n" +
            "        <button class=\"btn btn-info cancel_btn\">取消</button>\n" +
            "    </div>\n" +
            "</div></div></div></div>");
        $("body").append($plan);
        $.ajax({
            url:"${APP_PATH}/getAllClass",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.classes).each(function (i,obj) {
                    var className=$("<option>"+obj.className+"</option>");
                    $("#class_selector").append(className);
                })
            }
        });
        $.ajax({
            url:"${APP_PATH}/getAllCourseNames",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.list).each(function (i,obj) {
                    var courseName=$("<option>"+obj.courseName+"</option>");
                    $("#course_selector").append(courseName);
                })
            }
        });
        $.ajax({
            url:"${APP_PATH}/getAllPaperNames",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.papers).each(function (i,obj) {
                    var paperName=$("<option>"+obj+"</option>");
                    $("#paper_selector").append(paperName);
                })
            }
        });
        $(".close").click(function () {
            $(this).parents(".mask").remove();
        })
        $(".sure_btn").click(function () {
            var name=$("#class_selector").val();
            var courseName=$("#course_selector").val();
            var examPaperName=$("#paper_selector").val();
            var beginTime=$("input[name='beginTime']").val();
            //alert(id+name+courseName+subjectNum+examPaperName+beginTime);
            $.ajax({
                url:"${APP_PATH}/addOneRecord",
                type:"GET",
                data:{"className":name,"courseName":courseName,"examPaperName":examPaperName,"beginTime":beginTime},
                dataType:"json",
                success:function (result) {
                    alert("添加成功！");
                },
                error:function () {
                    alert("请重新填写！");
                }
            })
        })
        $(".cancel_btn").click(function () {
            $(this).parents(".mask").remove();
        })
    })

</script>


</body>
</html>
