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
<!--题目编辑模态框-->
<div class="modal fade" id="subject_Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >试题 编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label>题目描述:</label>
                        <div>
                            <textarea name="subjectName" class="form-control" rows="3" id="subjectName_edit"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>题目类型：</label>
                        <div>
                            <select class="form-control" name="subjectType" id="subjectType_edit_select">
                                <option value="0">单选</option>
                                <option value="1">多选</option>
                                <option value="2">简答</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label >选项A：</label>
                        <div>
                            <input name="optionA" type="text" class="form-control" placeholder="Text input" id="optionA_edit">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label >选项B：</label>
                        <div>
                            <input name="optionB" type="text" class="form-control" placeholder="Text input" id="optionB_edit">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label >选项C：</label>
                        <div>
                            <input name="optionC" type="text" class="form-control" placeholder="Text input" id="optionC_edit">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label>选项D：</label>
                        <div>
                            <input name="optionD" type="text" class="form-control" placeholder="Text input" id="optionD_edit">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label>正确答案：</label>
                        <div>
                            <input name="rightResult" type="text" class="form-control" placeholder="Text input" id="rightResult_edit">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>难易程度：</label>
                        <div>
                            <select class="form-control" name="subjectEasy" id="subjectEasy_edit_select">
                                <option value="0">简单</option>
                                <option value="1">中等</option>
                                <option value="2">困难</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>分科情况：</label>
                        <div>
                            <select class="form-control" name="division" id="division_edit_select">
                                <option value="0">未分科</option>
                                <option value="1">文科</option>
                                <option value="2">理科</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >所属科目：</label>
                        <div >
                            <select class="form-control" name="course.courseId" id="course_edit_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >所属年级：</label>
                        <div >
                            <select class="form-control" name="grade.gradeId" id="grade_edit_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label>题目分数：</label>
                        <div>
                            <input name="subjectScore" type="text" class="form-control" placeholder="Text input" id="subjectScore_edit">
                        </div>
                    </div>
                    <div class="form-group">
                        <label >知识点：</label>
                        <div >
                            <select class="form-control" name="keyInfo.keyId" id="keyName_edit_select">
                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="subject_edit_btn">编辑</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<!--题目添加模态框-->
<div class="modal fade" id="subject_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >试题 添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label>题目描述:</label>
                        <div>
                            <textarea name="subjectName" class="form-control" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>题目类型：</label>
                        <div>
                            <select class="form-control" name="subjectType" id="subjectType_add_select">
                                <option value="0">单选</option>
                                <option value="1">多选</option>
                                <option value="2">简答</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label >选项A：</label>
                        <div>
                            <input name="optionA" type="text" class="form-control" placeholder="Text input">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label >选项B：</label>
                        <div>
                            <input name="optionB" type="text" class="form-control" placeholder="Text input">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label >选项C：</label>
                        <div>
                            <input name="optionC" type="text" class="form-control" placeholder="Text input">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label>选项D：</label>
                        <div>
                            <input name="optionD" type="text" class="form-control" placeholder="Text input">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label>正确答案：</label>
                        <div>
                            <input name="rightResult" type="text" class="form-control" placeholder="Text input">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>难易程度：</label>
                        <div>
                            <select class="form-control" name="subjectEasy" id="subjectEasy_add_select">
                                <option value="0">简单</option>
                                <option value="1">中等</option>
                                <option value="2">困难</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>分科情况：</label>
                        <div>
                            <select class="form-control" name="division" id="division_add_select">
                                <option value="0">未分科</option>
                                <option value="1">文科</option>
                                <option value="2">理科</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >所属科目：</label>
                        <div >
                            <select class="form-control" name="course.courseId" id="course_add_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label >所属年级：</label>
                        <div >
                            <select class="form-control" name="grade.gradeId" id="grade_add_select">
                            </select>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label>题目分数：</label>
                        <div>
                            <input name="subjectScore" type="text" class="form-control" placeholder="Text input">
                        </div>
                    </div>
                    <div class="form-group">
                        <label >知识点：</label>
                        <div >
                            <select class="form-control" name="keyInfo.keyId" id="keyName_add_select">
                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="subject_add_btn">添加</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


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
                <th>知识点</th>
                <th>操作
                    <button type="button" id="subjects_add_model_btn" class="btn btn-success btn-sm">新增</button>
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
    var curpage;
    var islookup=true;
    $(function () {
        to_Page(1);
    });

    function to_Page(pg) {
        //获取所有试题
        $.ajax({
            url:"${APP_PATH}/getAllSubjects",
            data:"pn="+pg,
            type:"GET",
            success:function (result) {
                console.log(result);
                build_subjects_table(result);
                subject_page_record(result);
                build_page_nav(result);
            }
        });
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
            var subjectType;
            if(item.subjectType==0){
                subjectType="单选";
            }else if(item.subjectType==1){
                subjectType="多选";
            }else{
                subjectType="简答";
            }
            var subjectTypeTd=$("<td></td>").append(subjectType);
            var subjectEasy;
            if(item.subjectEasy==0){
                subjectEasy="简单";
            }else if(item.subjectEasy==1){
                subjectEasy="中等";
            }else{
                subjectEasy="困难";
            }
            var subjectEasyTd=$("<td></td>").append(subjectEasy);
            var courseNameTd=$("<td></td>").append(item.course.courseName);
            var gradeNameTd=$("<td></td>").append(item.grade.gradeName);
            var keyNameTd=$("<td></td>").append(item.keyInfo.keyName);

            var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("gradeId",item.grade.gradeId).attr("courseId",item.course.courseId)
                .attr("subjectEasy",item.subjectEasy).attr("subjectType",item.subjectType)
                .attr("keyId",item.keyInfo.keyId);
            var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("gradeId",item.grade.gradeId).attr("courseId",item.course.courseId)
                .attr("subjectEasy",item.subjectEasy).attr("subjectType",item.subjectType);
            var tdTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(subjectIdTd).append(subjectNameTd).append(optionATd).append(optionBTd).append(optionCTd)
                .append(optionDTd).append(rightResultTd).append(subjectScoreTd).append(subjectTypeTd)
                .append(subjectEasyTd).append(courseNameTd).append(gradeNameTd).append(keyNameTd).append(tdTd)
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

    });

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

    //点击新增题目按钮
    $("#subjects_add_model_btn").click(function () {
        $('#subject_Add').modal('show');
        $("#grade_add_select").empty();
        $("#keyName_add_select").empty();
        var courseId;
        //获取所有年级
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
        //获取所有科目
        $.ajax({
            url:"${APP_PATH}/getAllCourseNames",
            type:"GET",
            success:function (result) {
                console.log(result);
                var courses=result.extend.list;
                $.each(courses,function (index,item) {
                    var optionEle=$("<option></option>").append(item.courseName).attr("value",item.courseId);
                    optionEle.appendTo("#course_add_select");
                })
            }
        });
        //获取所有知识点
        $.ajax({
            url:"${APP_PATH}/getKeyWords",
            type:"GET",
            success:function (result) {
               console.log(result);
               var keyInfo = result.extend.keyWordsList;
               $.each(keyInfo,function (index,item) {
                   var optionEle = $("<option></option>").append(item.keyName).attr("value",item.keyId);
                   optionEle.appendTo("#keyName_add_select")
               })
           }
        });
    });

    //点击添加按钮
    $("#subject_add_btn").click(function () {
        var data=$("#subject_Add form").serialize();
        //alert(data);
        $.ajax({
            url:"${APP_PATH}/addSubject",
            type:"POST",
            data:$("#subject_Add form").serialize(),
            success:function (result) {
                console.log(result);
                if(result.code==100){
                    alert(result.msg);
                }else{
                    alert(result.msg);
                }
                $("#subject_Add").modal('hide');
            }
        });
    });

    //点击编辑按钮
    $(document).on("click",".edit_btn",function () {
        var subjectId=$(this).parents("tr").find("td:eq(1)").text();
        var subjectName;
        if($(this).parents("tr").find("td:eq(2)").find("button").attr("subjectName")!=null){
            subjectName=$(this).parents("tr").find("td:eq(2)").find("button").attr("subjectName");
        }else{
            subjectName=$(this).parents("tr").find("td:eq(2)").text();
        }
        var optionA=$(this).parents("tr").find("td:eq(3)").text();
        var optionB=$(this).parents("tr").find("td:eq(4)").text();
        var optionC=$(this).parents("tr").find("td:eq(5)").text();
        var optionD=$(this).parents("tr").find("td:eq(6)").text();
        var rightResult=$(this).parents("tr").find("td:eq(7)").text();
        var subjectScore=$(this).parents("tr").find("td:eq(8)").text();
        var subjectType=$(this).attr("subjectType");
        var subjectEasy=$(this).attr("subjectEasy");
        var courseId=$(this).attr("courseId");
        var gradeId=$(this).attr("gradeId");
        var keyId = $(this).attr("keyId");
        //alert(subjectName+" "+optionA+" "+optionB+" "+optionC+" "+optionD+
         //     ""+rightResult+" "+subjectScore+" "+subjectType+" "+subjectEasy+" "+courseId+" "+gradeId);
        //点击新增题目按钮
        $('#subject_Edit').modal('show');
        $("#grade_edit_select").empty();
        $("#course_edit_select").empty();
        $("#keyName_edit_select").empty();
        //获取所有年级
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
                $("#grade_edit_select").val(gradeId);
            }
        });
        //获取所有科目
        $.ajax({
            url:"${APP_PATH}/getAllCourseNames",
            type:"GET",
            success:function (result) {
                //console.log(result);
                var courses=result.extend.list;
                $.each(courses,function (index,item) {
                    var optionEle=$("<option></option>").append(item.courseName).attr("value",item.courseId);
                    optionEle.appendTo("#course_edit_select");
                });
                $("#course_edit_select").val(courseId);
            }
        });
        //获取所有知识点
        //获取所有知识点
        $.ajax({
            url:"${APP_PATH}/getKeyWords",
            type:"GET",
            success:function (result) {
                console.log(result);
                var keyInfo = result.extend.keyWordsList;
                $.each(keyInfo,function (index,item) {
                    var optionEle = $("<option></option>").append(item.keyName).attr("value",item.keyId);
                    optionEle.appendTo("#keyName_edit_select")
                });
                $("#keyName_edit_select").val(keyId);
            }
        });

        $("#subjectName_edit").text(subjectName);
        $("#subjectType_edit_select").val(subjectType);
        $("#optionA_edit").val(optionA);
        $("#optionB_edit").val(optionB);
        $("#optionC_edit").val(optionC);
        $("#optionD_edit").val(optionD);
        $("#rightResult_edit").val(rightResult);
        $("#subjectScore_edit").val(subjectScore);
        $("#subject_edit_btn").attr("subjectId",subjectId);
        $("#subject_edit_btn").attr("keyId", keyId);
    });

    //点击保存按钮
    $("#subject_edit_btn").click(function () {
       // alert($("#subject_Edit form").serialize());
        $.ajax({
            url:"${APP_PATH}/updateSubject",
            type:"POST",
            data:$("#subject_Edit form").serialize()+"&&subjectId="+$(this).attr("subjectId"),
            success:function (result) {
                console.log(result);
                if(result.code==100){
                    alert(result.msg);
                }else{
                    alert(result.msg);
                }
                $("#subject_Edit").modal('hide');
                to_Page(curpage)
            }
        });
    });

    //点击单个删除按钮
    $(document).on("click",".del_btn",function () {
        var subjectId=$(this).parents("tr").find("td:eq(1)").text();
        //alert(subjectId);
        if(confirm("确认删除该题目吗？")){
            $.ajax({
                url:"${APP_PATH}/deleteSubject",
                type:"GET",
                data:"ids="+subjectId,
                success:function (result) {
                    alert(result.msg);
                    to_Page(curpage);
                },
                error:function () {
                    alert("一些试卷存在该题目，无法删除！！！");
                }
            });
        }
    });

    //批量删除
    $("#subjects_del_model_btn").click(function () {
        var del_strs="";
        $.each($(".check_item:checked"),function () {
            del_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        })

        del_strs=del_strs.substring(0,del_strs.length-1);
        alert(del_strs);
        if(confirm("确认删除这些题目吗？")){
            $.ajax({
                url:"${APP_PATH}/deleteSubject",
                type:"GET",
                data:"ids="+del_strs,
                success:function (result) {
                    alert(result.msg);
                    to_Page(curpage);
                },
                error:function () {
                    alert("一些试卷存在该题目，无法删除！！！");
                }
            })
        }
    });

</script>

</body>
</html>
