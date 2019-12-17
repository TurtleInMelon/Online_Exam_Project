<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-11-12
  Time: 下午2:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>学生管理</title>
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
            height:800px;
            position: relative;
            margin: 100px auto;
            background: center center;
        }
    </style>
</head>
<body>
<!--表格信息-->
<div>
    <table class="table table-hover" id="students_table">
        <thead>
        <tr>
            <th>
                <input type="checkbox" id="check_all">
            </th>
            <th>学生编号</th>
            <th>学生姓名</th>
            <th>学生账户</th>
            <th>学生密码</th>
            <th>就读班级</th>
            <th>就读年级</th>
            <th>操作
                <button type="button" id="students_add_model_btn" class="btn btn-success btn-sm add_btn">新增</button>
                <button type="button" id="students_del_model_btn" class="btn btn-danger btn-sm del_sel_btn">删除</button>
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
    <div class="col-md-6" id="students_record">

    </div>

    <div class="col-md-6" id="students_nav">


    </div>
</div>


<script type="text/javascript">

    var flag=true;
    $(function () {
        to_Page(1);
    });

    $("tbody").delegate(".edit_btn","click",function () {
        var $stu=$(
            "<div class='mask'>\n"+
                "<div class='login'>\n"+
            "<div class='modal-dialog'>\n"+
            "<div class=\"modal-content\">\n"+
                "<div class=\"modal-body\">\n"+
            "        <div>\n" +
            "            <label>学生编号</label><input style='width: 100%' type=\"text\" name=\"sId\" readonly=\"readonly\" value="+$(this).siblings("td").eq(1).html()+">\n" +
            "            <label>学生姓名</label><input style='width: 100%' type=\"text\" name=\"sName\" value="+$(this).siblings("td").eq(2).html()+">\n" +
            "            <label>学生账户</label><input style='width: 100%' type=\"text\" name=\"sAccount\"value="+$(this).siblings("td").eq(3).html()+">\n" +
            "            <label>学生密码</label><input style='width: 100%' type=\"text\" name=\"sPassword\"value="+$(this).siblings("td").eq(4).attr("pwd")+">\n" +
            "            <label>就读班级</label>"+
            "             <select class=\"form-control\" id=\"class_selector\">\n" +
            "            </select>" +
            "            <label>就读年级</label>" +
            "             <select class=\"form-control\" id=\"grade_selector\">\n" +
            "            </select>" +
            "        </div>\n" +
            "        <button class=\"btn btn-info sure_btn\">保存</button>\n" +
            "        <button class=\"btn btn-info cancel_btn\">取消</button>\n" +
            "    </div>\n"+
        "</div></div></div></div>");
        var thisClass=$(this).siblings("td").eq(5).html();
        var thisGrade=$(this).siblings("td").eq(6).html()
        $("body").append($stu);
        $.ajax({
            url:"${APP_PATH}/getAllClass",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.classes).each(function (i,obj) {
                    var className=$("<option>"+obj.className+"</option>");
                    $("#class_selector").append(className);
                    $("#class_selector").val(thisClass);
                })
            }
        });
        $.ajax({
            url:"${APP_PATH}/getAllGrades",
            data:{},
            dataType:"JSON",
            type:"GET",
            success:function (result) {
                $(result.extend.grades).each(function (i,obj) {
                    var gradeName=$("<option>"+obj.gradeName+"</option>");
                    $("#grade_selector").append(gradeName);
                    $("#grade_selector").val(thisGrade);
                })
            }
        });
        $(".cancel_btn").click(function () {
            $(this).parents(".mask").remove();
        })
        $(".sure_btn").click(function () {
            $.ajax({
                    url:"${APP_PATH}/updateOneStudent",
                    type:"GET",
                    data:{"studentId":$("input[name='sId']").val(),"studentName":$("input[name='sName']").val(),"studentAccount":$("input[name='sAccount']").val(),"studentPwd":$("input[name='sPassword']").val(),"classId":$("input[name='sClass']").val(),"gradeId":$("input[name='sGrade']").val()},
                    dataType:"json",
                    success:function (result) {
                        alert("更新成功！");
                },
                    error:function () {
                        alert("请重新填写！");
                    }
            })
        })

    })
    $("tbody").delegate(".btnCheck","click",function () {
        var $parent=$(this).parent();
        var pwd=$parent.attr("pwd")
        if("*******"==($(this).siblings().text()))
            $(this).siblings().text(pwd);
        else
            $(this).siblings().text("*******");
    })

    $("tbody").delegate(".del_btn","click",function () {
        var id=$(this).parents("tr").find("td.id").html();
        $.ajax({
            url:"${APP_PATH}/deleteOneStudent",
            data:"id="+id,
            type:"GET",
            success:function (result) {
                alert("删除成功！");
            }
        })
        $(this).parents("tr").remove();
    })

    $(".add_btn").click(function () {
        var $stu=$("<div class=\"mask\">\n" +
            "    <div class=\"login\">\n" +
            "        <div>\n" +
            "            <label>学生编号</label><input type=\"text\" name=\"sId\" readonly=\"readonly\">\n" +
            "            <label>学生姓名</label><input type=\"text\" name=\"sName\">\n" +
            "            <label>学生账户</label><input type=\"text\" name=\"sAccount\">\n" +
            "            <label>学生密码</label><input type=\"text\" name=\"sPassword\">\n" +
            "            <label>就读班级</label><input type=\"text\" name=\"sClass\">\n" +
            "            <label>就读年级</label><input type=\"text\" name=\"sGrade\">\n" +
            "        </div>\n" +
            "        <button class=\"btn btn-info sure_btn\">确认</button>\n" +
            "        <button class=\"btn btn-info cancel_btn\">取消</button>\n" +
            "    </div>\n" +
            "</div>");
        $("body").append($stu);
        $(".sure_btn").click(function () {
            var id=$("input[name='sId']").val();
            var name=$("input[name='sName']").val();
            var account=$("input[name='sAccount']").val();
            var pwd=$("input[name='sPassword']").val();
            var cls=$("input[name='sClass']").val();
            var grade=$("input[name='sGrade']").val();
            console.log(id+name+account+pwd+cls+grade);
            $.ajax({
                url:"${APP_PATH}/addOneStudent",
                type:"GET",
                data:{"studentId":id,"studentName":name,"studentAccount":account,"studentPwd":pwd,"classId":cls,"gradeId":grade},
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

    $(".del_sel_btn").click(function () {
        $(".check_item:checked").each(function () {
            var id=$(this).parents("tr").find("td.id").html();
            $.ajax({
                url:"${APP_PATH}/deleteOneStudent",
                data:"id="+id,
                type:"GET",
                success:function (result) {
                    alert("删除成功！");
                }
            })
            $(this).parents("tr").remove();
        })
    })

    function to_Page(pg) {
        $.ajax({
            url:"${APP_PATH}/getAllStudents",
            data:"pn="+pg,
            type:"GET",
            success:function (result) {
                console.log(result);
                build_students_table(result);
                students_page_record(result);
                build_page_nav(result);
                if($("#check_all").prop("checked")==true)
                    $(".check_item").prop("checked",true);
                else
                    $(".check_item").prop("checked",false);
                $("#check_all").click(function () {
                    if($("#check_all").prop("checked")==true)
                        $(".check_item").prop("checked",true);
                    else
                        $(".check_item").prop("checked",false);
                })
            }
        })
    }

//构建表格
    //var pwd;
    function build_students_table(result) {
        $("#students_table tbody").empty();
        var students=result.extend.pageInfo.list;
        $.each(students,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'/></td>");
            var studentIdTd=$("<td></td>").append(item.studentId).addClass("id");
            var studentNameTd=$("<td></td>").append(item.studentName);
            var studentAccountTd=$("<td></td>").append(item.studentAccount);
            var pwdCheck=$("<button></button>").addClass("btn btnCheck btn-info btn-sm").text("查看");
            var studentPwdTd=$("<td></td>").append("<p>*******</p>").attr("pwd",item.studentPwd).attr("name","pwd").append(pwdCheck);
            var classNameTd=$("<td></td>").append(item.classInfo.className);
            var gradeNameTd=$("<td></td>").append(item.classInfo.gradeInfo.gradeName);
            var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id",item.studentId);
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id",item.studentId);
            var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(studentIdTd).append(studentNameTd).append(studentAccountTd).append(studentPwdTd).append(classNameTd).append(gradeNameTd)
                .append(editBtn).append(delBtn).appendTo("#students_table tbody");

        })
    }


    //构建记录数eq
    function students_page_record(result) {
        $("#students_record").empty();
        $("#students_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
            + result.extend.pageInfo.pages +"页,总共"+
            result.extend.pageInfo.total+"条记录");
        lastpage=result.extend.pageInfo.pages;
        curpage=result.extend.pageInfo.pageNum;
    }

    //构建页框
    function build_page_nav(result) {

        $("#students_nav").empty();
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
        navEle.appendTo("#students_nav");
    }
</script>
</body>
</html>
