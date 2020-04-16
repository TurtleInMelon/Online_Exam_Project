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
<!--添加试题模态框-->
<div class="modal fade bs-example-modal-lg" id="examPapers_Add_Hand" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">手动添加试题</h4>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table table-hover" id="examPaper_add_table">
                        <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="examPaper_add_check_all">
                            </th>
                            <th>试题编号</th>
                            <th>试题描述</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>正确答案</th>
                            <th>分值</th>
                            <th>知识点</th>
                            <th>难易程度</th>
                            <th>所属科目</th>
                            <th>所属年级</th>
                            <th>操作
                                <button type="button" id="examPapers_add_hand_model_btn" class="btn btn-success btn-sm">批量添加</button>
                            </th>
                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                    <div class="row">
                        <div class="col-md-6" id="examPapers_add_record">

                        </div>

                        <div class="col-md-6" id="examPapers_add_nav">


                        </div>
                    </div>
                    <form action="class" method="post">
                        <input type="hidden" value="DELETE" name="_method" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<!--查看试题模态框-->
<div class="modal fade bs-example-modal-lg" id="examPaper_Look" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="head_lookup"></h4>
            </div>
            <div class="modal-body">
                <div>
                    <table class="table table-hover" id="examPaper_look_table">
                        <thead>
                        <tr>
                            <th>试题描述</th>
                            <th>选项A</th>
                            <th>选项B</th>
                            <th>选项C</th>
                            <th>选项D</th>
                            <th>分值</th>
                            <th>难易程度</th>
                            <th>知识点</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>


                        </tbody>
                    </table>
                    <form action="class" method="post">
                        <input type="hidden" value="DELETE" name="_method" />
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>


<!--试题编辑模态框-->
    <div class="modal fade" id="examPaper_Edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >试卷 编辑</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">试卷编号</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="examPaperId_edit" >  </p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">分科情况：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="division" id="subject_examPaper_edit_select">
                                    <option value="0">未分科</option>
                                    <option value="1">文科</option>
                                    <option value="2">理科</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">难易程度：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="examPaperEasy" id="examPaperEasy_examPaper_edit_select">
                                    <option value="0">困难</option>
                                    <option value="1">简单</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">所属年级：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="grade.gradeId" id="grade_examPaper_edit_select">


                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试卷名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="examPaperName" class="form-control" id="examPaperName_edit_input" placeholder="试卷名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试题数量</label>
                            <div class="col-sm-5">
                                <input type="text" name="subjectNum" class="form-control" id="examPaperCount_edit_input" placeholder="试题数量">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试卷总分</label>
                            <div class="col-sm-5">
                                <input type="text" name="examPaperScore" class="form-control" id="examPaperScore_edit_input" placeholder="试卷总分">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">考试时长</label>
                            <div class="col-sm-5">
                                <input type="text" name="examPaperTime" class="form-control" id="examPaperTime_edit_input" placeholder="试卷总分">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="examPaper_edit_btn">更新</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


<!--试题添加模态框-->
    <div class="modal fade" id="exampaper_Add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >试卷 添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">分科情况：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="division" id="subject_exampaper_add_select">
                                    <option value="0">未分科</option>
                                    <option value="1">文科</option>
                                    <option value="2">理科</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">难易程度：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="examPaperEasy" id="exampepereasy_exampaper_add_select">
                                    <option value="0">困难</option>
                                    <option value="1">简单</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">所属年级：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="grade.gradeId" id="grade_exampaper_add_select">


                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试卷名称</label>
                            <div class="col-sm-5">
                                <input type="text" name="examPaperName" class="form-control" id="exampapername_add_input" placeholder="试卷名称">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试题数量</label>
                            <div class="col-sm-5">
                                <input type="text" name="subjectNum" class="form-control" id="exampapercount_add_input" placeholder="试题数量">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试卷总分</label>
                            <div class="col-sm-5">
                                <input type="text" name="examPaperScore" class="form-control" id="exampaperscore_add_input" placeholder="试卷总分">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">考试时长</label>
                            <div class="col-sm-5">
                                <input type="text" name="examPaperTime" class="form-control" id="exampapertime_add_input" placeholder="试卷总分">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="exampaper_add_btn">添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


<!--试题自动生成模态框-->
    <div class="modal fade" id="examPaper_autoAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >自动生成试题</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">试题数量：</label>
                            <div class="col-sm-5">
                                <input type="text" name="subjectNum" class="form-control" id="num_auto_add_input" placeholder="试题数量">
                                <span  class="help-block">    </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">科目：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="division" id="subject_auto_add_select">
                                    <option value="0">未分科</option>
                                    <option value="1">文科</option>
                                    <option value="2">理科</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">年级：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="gradeId" id="grade_auto_add_select">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">难易程度：</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="subjectEasy" id="easy_auto_add_select">
                                    <option value="0">困难</option>
                                    <option value="1">中等</option>
                                    <option value="2">困难</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" id="subject_auto_add_btn">自动添加</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>


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
        var curpage,lastpage;
        var islookup=true;
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
                var division;
                if(item.division==0){
                    division="不分科"
                }else if(item.division==1){
                    division="文科";
                }else{
                    division="理科";
                }
                var divisionTd=$("<td></td>").append(division);
                var examPaperEasy;
                if(item.examPaperEasy==0){
                    examPaperEasy="困难";
                }else{
                    examPaperEasy="简单";
                }
                var examPaperEasyTd=$("<td></td>").append(examPaperEasy);
                var gradeNameTd=$("<td></td>").append(item.grade.gradeName);

                var editBtn=$("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("division",item.division).attr("examPaperEasy",item.examPaperEasy).attr("gradeId",item.grade.gradeId);
                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("division",item.division).attr("examPaperEasy",item.examPaperEasy).attr("gradeId",item.grade.gradeId);
                var lookBtn=$("<button></button>").addClass("btn btn-info btn-sm look_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-search")).append("查看试题");
                lookBtn.attr("division",item.division).attr("examPaperEasy",item.examPaperEasy).attr("gradeId",item.grade.gradeId);
                var addBtn=$("<button></button>").addClass("btn btn-info btn-sm add_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-plus")).append("添加试题");
                addBtn.attr("division",item.division).attr("examPaperEasy",item.examPaperEasy).attr("gradeId",item.grade.gradeId);
                var createBtn=$("<button></button>").addClass("btn btn-info btn-sm create_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-ok")).append("生成试题");
                createBtn.attr("division",item.division).attr("examPaperEasy",item.examPaperEasy).attr("gradeId",item.grade.gradeId).attr("examPaperId",item.examPaperId);
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
            });

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

        });

        //打开新增模态框
        $("#examPapers_add_model_btn").click(function () {
            $("#exampaper_Add form")[0].reset();
            $("#exampaper_Add form").find(".help-block").text("");
            $("#grade_exampaper_add_select").empty();
            $.ajax({
                url:"${APP_PATH}/getAllGradeNames",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var grades=result.extend.list;
                    $.each(grades,function (index,item) {
                        var optionEle=$("<option></option>").append(item.gradeName).attr("value",item.gradeId);
                        optionEle.appendTo("#grade_exampaper_add_select");
                    })
                }
            })

            $('#exampaper_Add').modal('show');
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

        //校验输入的试卷名称名是否可用
        $("#exampapername_add_input").change(function () {
            var examPaperName=this.value;
            // alert(examPaperName);
            if(examPaperName==null){
                return;
            }
            $("#exampaper_add_btn").removeClass("disabled");
            $("#exampaper_Add form").find(".help-block").text("");
            $.ajax({
                url:"${APP_PATH}/checkExamPaperName",
                data:"examPaperName="+examPaperName,
                type:"POST",
                success:function(result) {
                    //console.log(result);
                    if(result.code==100){
                        show_validate_info("#exampapername_add_input","success","用户名可用")
                        $("#exampaper_add_btn").attr("ajax-va","success");
                        $("#exampaper_add_btn").removeClass("disabled");
                    }
                    else{
                        show_validate_info("#exampapername_add_input","error",result.extend.va_msg);
                        $("#exampaper_add_btn").attr("ajax-va","fail");
                        $("#exampaper_add_btn").addClass("disabled");
                    }
                }
            })
        });

        //点击新增按钮
        $("#exampaper_add_btn").click(function () {
            // alert($("#exampaper_Add form").serialize());
            /**if($("#course_Add form").serialize()=="gradeName="){
                show_validate_info("#course_add_input","error","用户名不能为空");
                return false;
            }**/

            $.ajax({
                url:"${APP_PATH}/examPaper",
                type:"POST",
                data:$("#exampaper_Add form").serialize(),
                success:function (result) {
                    //console.log(result);
                    if(result.code==100){
                        $("#exampaper_Add").modal("hide");
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
            var examPaperId=$(this).parents("tr").find("td:eq(1)").text();
            var examPaperName=$(this).parents("tr").find("td:eq(2)").text();
            var subjectNum=$(this).parents("tr").find("td:eq(3)").text();
            var examPaperTime=$(this).parents("tr").find("td:eq(5)").text();
            var examPaperScore=$(this).parents("tr").find("td:eq(4)").text();
            var gradeId=$(this).attr("gradeId");
            var division=$(this).attr("division");
            var examPaperEasy=$(this).attr("examPaperEasy");
            //alert(division);
            $("#examPaper_Edit form")[0].reset();
            $("#examPaper_Edit form").find(".help-block").text("");
            $('#examPaper_Edit').modal('show');
            //寻找所有的年级
            $("#grade_examPaper_edit_select").empty();
            $.ajax({
                url:"${APP_PATH}/getAllGradeNames",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var grades=result.extend.list;
                    $.each(grades,function (index,item) {
                        var optionEle=$("<option></option>").append(item.gradeName).attr("value",item.gradeId);
                        optionEle.appendTo("#grade_examPaper_edit_select");
                    });
                    $("#examPaperId_edit").text(examPaperId);
                    $("#subject_examPaper_edit_select").val(division);
                    $("#examPaperEasy_examPaper_edit_select").val(examPaperEasy);
                    $("#grade_examPaper_edit_select").val(gradeId);
                    $("#examPaperName_edit_input").val(examPaperName);
                    $("#examPaperCount_edit_input").val(subjectNum);
                    $("#examPaperScore_edit_input").val(examPaperScore);
                    $("#examPaperTime_edit_input").val(examPaperTime);
                }
            });


            //alert(gradeName);


        })

        //校验输入的试卷名称名是否可用
        $("#examPaperName_edit_input").change(function () {
            var examPaperName=this.value;
            //alert(examPaperName);
            if(examPaperName==null){
                return;
            }
            $("#examPaper_edit_btn").removeClass("disabled");
            $("#examPaper_Edit form").find(".help-block").text("");
            $.ajax({
                url:"${APP_PATH}/checkExamPaperName",
                data:"examPaperName="+examPaperName,
                type:"POST",
                success:function(result) {
                    //console.log(result);
                    if(result.code==100){
                        show_validate_info("#examPaperName_edit_input","success","试卷名名可用")
                        $("#examPaper_edit_btn").attr("ajax-va","success");
                        $("#examPaper_edit_btn").removeClass("disabled");
                    }
                    else{
                        show_validate_info("#examPaperName_edit_input","error",result.extend.va_msg);
                        $("#examPaper_edit_btn").attr("ajax-va","fail");
                        $("#examPaper_edit_btn").addClass("disabled");
                    }
                }
            })
        });

        //点击更新按钮
        $("#examPaper_edit_btn").click(function () {
            var examPaperId=$("#examPaperId_edit").text();
            //alert(courseId);
            $.ajax({
                url:"${APP_PATH}/examPaper/"+examPaperId,
                type:"PUT",
                data:$("#examPaper_Edit form").serialize(),
                success:function (result) {
                    //console.log(result);
                    $("#examPaper_Edit").modal("hide");
                    to_Page(curpage);
                }
            })
        });

        //点击单个删除按钮
        $(document).on("click",".del_btn",function () {
            var examPaperId=$(this).parents("tr").find("td:eq(1)").text();
            var examPaperName=$(this).parents("tr").find("td:eq(2)").text();
            //alert(examPaperId+examPaperName);
            if(confirm("确认删除【"+examPaperName+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/examPaper/"+examPaperId,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_Page(curpage);
                    }
                });
            }
        });

        //批量删除
        $("#examPapers_del_model_btn").click(function () {
            var examPaperName="";
            var del_strs="";
            $.each($(".check_item:checked"),function () {
                examPaperName+=$(this).parents("tr").find("td:eq(2)").text()+",";
                del_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            })

            examPaperName=examPaperName.substring(0,examPaperName.length-1);
            del_strs=del_strs.substring(0,del_strs.length-1);
            //alert(courseName+del_strs);
            if(confirm("确认删除【"+examPaperName+"】吗？")){
                $.ajax({
                    url:"${APP_PATH}/examPaper/"+del_strs,
                    type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        to_Page(curpage);
                    }
                })
            }
        });

        //点击查看试题
        $(document).on("click",".look_btn",function () {
            var examPaperId=$(this).parents("tr").find("td:eq(1)").text();
            var examPaperName=$(this).parents("tr").find("td:eq(2)").text();
            $('#examPaper_Look').modal('show');
            $.ajax({
                url:"${APP_PATH}/getAllESMByExamPaperId",
                data:"examPaperId="+examPaperId,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    $("#head_lookup").text(examPaperName);
                    build_examPaper_look_table(result);
                }
            });
        })


        //构建查看试卷表格
        function build_examPaper_look_table(result) {
            // console.log(result);
            $("#examPaper_look_table tbody").empty();
            var examPapers=result.extend.list;
            $.each(examPapers,function (index,item) {
                //alert(item.subject.subjectName);
                 var examPaperId=item.examPaper.examPaperId;
                 var subjectId=item.subject.subjectId;
                if((item.subject.subjectName.length)<=8){
                    var examPaperDsbTd=$("<td></td>").append(item.subject.subjectName);
                }
                else{
                    var examPaperDsbTd=$("<td></td>").append($("<p></p>").append(item.subject.subjectName.substring(0,8)))
                        .append($("<button type=\"button\" class=\"btn btn-default btn-sm lookup\">查看</button>").attr("subjectName",item.subject.subjectName));
                }

                var optionATd=$("<td></td>").append(item.subject.optionA);
                var optionBTd=$("<td></td>").append(item.subject.optionB);
                var optionCTd=$("<td></td>").append(item.subject.optionC);
                var optionDTd=$("<td></td>").append(item.subject.optionD);
                var subjectScoreTd=$("<td></td>").append(item.subject.subjectScore);
                var examPaperEasy;
                if(item.subject.examPaperEasy==0){
                    examPaperEasy="困难";
                }else{
                    examPaperEasy="简单";
                }
                var examPaperEasyTd=$("<td></td>").append(examPaperEasy);
                var keyNameTd = $("<td></td>").append(item.subject.keyInfo.keyName);
                var keyId = item.subject.keyInfo.keyId;

                var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm remove_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("移除");
                delBtn.attr("examPaperEasy",item.subject.examPaperEasy)
                    .attr("examPaperId",examPaperId).attr("subjectId",subjectId)
                    .attr("keyId",keyId);

                var tdTd=$("<td></td>").append(delBtn);

                $("<tr></tr>").append(examPaperDsbTd)
                    .append(optionATd).append(optionBTd).append(optionCTd).append(optionDTd)
                    .append(subjectScoreTd).append(examPaperEasyTd).append(keyNameTd).append(tdTd)
                    .appendTo("#examPaper_look_table tbody");

            })

        };

        //点击查看按钮
        $(document).on("click",".lookup",function () {
            if(islookup==true){
                var TDName=$(this).parents("tr").find("td:eq(0) button").attr("subjectname");
                //alert(TDName);
                $(this).parents("tr").find("td:eq(0) p").text(TDName);
                islookup=!islookup;
            }
            else{
                var TDName=$(this).parents("tr").find("td:eq(0) button").attr("subjectname").substring(0,8);
                //alert(TDName);
                $(this).parents("tr").find("td:eq(0) p").text(TDName);
                islookup=!islookup;
            }

        });
        
        //点击移除按钮
        $(document).on("click",".remove_btn",function () {
            var examPaperId=$(this).attr("examPaperId");
            var subjectId=$(this).attr("subjectId");
            var examName=$("#head_lookup").text();
            //alert(examPaperId+subjectId);
            if(confirm("确认删除该题目吗？")){
                $("#examPaper_look_table tbody").empty();
                $.ajax({
                    url:"${APP_PATH}/removeSubjectByExamPaperIdAndSubjectId",
                    data:{"subjectId":subjectId,"examPaperId":examPaperId},
                    success:function (result) {
                        //console.log(result);
                        alert(result.msg);
                        $.ajax({
                            url:"${APP_PATH}/getAllESMByExamPaperId",
                            data:"examPaperId="+examPaperId,
                            type:"GET",
                            success:function (result) {
                                //console.log(result);
                                $("#head_lookup").text(examName);
                                build_examPaper_look_table(result);
                            }
                        });
                    }
                });
            }

        });

        //手动添加试题
        var examPaperId;
        $(document).on("click",".add_btn",function () {
            examPaperId=$(this).parents("tr").find("td:eq(1)").text();
            $('#examPapers_Add_Hand').modal('show');
            getAllSubject(1);
        });

        //获取所有试题
        function getAllSubject(pg) {
            //获取所有试题
            $.ajax({
                url:"${APP_PATH}/getAllSubjects",
                data:"pn="+pg,
                type:"GET",
                success:function (result) {
                    console.log(result);
                    build_subjects_table(result);
                    subject_page_record(result);
                    build_add_page_nav(result);
                }
            });
        }

        //构建表格
        function build_subjects_table(result) {
            $("#examPaper_add_table tbody").empty();
            var subjects=result.extend.pageInfo.list;
            $.each(subjects,function (index,item) {
                var checkBoxTd=$("<td><input type='checkbox' class='check_item add_check_item'/></td>");
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
                var subjectTypeTd=$("<td></td>").append(item.keyInfo.keyName);
                var isEasy = "";
                if(item.subjectEasy ==0){
                    isEasy = "简单";
                }else{
                    isEasy = "困难";
                }
                var subjectEasyTd=$("<td></td>").append(isEasy);
                var courseNameTd=$("<td></td>").append(item.course.courseName);
                var gradeNameTd=$("<td></td>").append(item.grade.gradeName);

                var addBtn=$("<button></button>").addClass("btn btn-info btn-sm subjectAdd_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("添加");
                addBtn.attr("examPaperId",examPaperId).attr("subjectId",item.subjectId);
                var tdTd=$("<td></td>").append(addBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(subjectIdTd).append(subjectNameTd).append(optionATd).append(optionBTd).append(optionCTd)
                    .append(optionDTd).append(rightResultTd).append(subjectScoreTd).append(subjectTypeTd)
                    .append(subjectEasyTd).append(courseNameTd).append(gradeNameTd).append(tdTd)
                    .appendTo("#examPaper_add_table tbody");

            })

        }

        //构建记录数
        function subject_page_record(result) {
            $("#examPapers_add_record").empty();
            $("#examPapers_add_record").append("当前为"+result.extend.pageInfo.pageNum+"页，总共"
                + result.extend.pageInfo.pages +"页,总共"+
                result.extend.pageInfo.total+"条记录");
            lastpage=result.extend.pageInfo.pages;
            curpage=result.extend.pageInfo.pageNum;
        }

        //构建页框
        function build_add_page_nav(result) {

            $("#examPapers_add_nav").empty();
            var ul=$("<ul></ur>").addClass("pagination");
            var firstPage=$("<li></li>").append($("<a></a>").append("首页"));
            var prePage=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));


            if(result.extend.pageInfo.hasPreviousPage==false){
                prePage.addClass("disabled");
                firstPage.addClass("disabled");

            }else{
                firstPage.click(function () {
                    getAllSubject(1);
                });

                prePage.click(function () {
                    getAllSubject(result.extend.pageInfo.pageNum-1);
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
                    getAllSubject(result.extend.pageInfo.pages+1000);
                });
                nextPage.click(function () {
                    getAllSubject(result.extend.pageInfo.pageNum+1);
                });
            }

            $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
                var numli=$("<li></li>").append($("<a></a>").append(item));
                if(item==result.extend.pageInfo.pageNum){
                    numli.addClass("active");
                }
                numli.click(function () {
                    getAllSubject(item);
                });
                ul.append(numli);
            })

            ul.append(nextPage).append(lastPage);
            var navEle=$("<nav></nav>").append(ul)
            navEle.appendTo("#examPapers_add_nav");
        }

        //点击添加按钮   单个添加
        $(document).on("click",".subjectAdd_btn",function () {
            var examPaperId=$(this).attr("examPaperId");
            $("#subject_auto_add_btn").attr("examPaperId",examPaperId);
            $("#examPapers_add_hand_model_btn").attr("examPaperId",examPaperId);
            var subjectId=$(this).attr("subjectId");
            //alert(examPaperId+" "+subjectId);
            $.ajax({
               url:"${APP_PATH}/addESMByOne",
               data:{"examPaperId":examPaperId,"subjectId":subjectId},
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    alert(result.msg);
                }
            });
        });

        //全选全不选的功能
        $("#examPaper_add_check_all").click(function () {
            //alert($(this).prop("checked"));
            $(".add_check_item").prop("checked",$(this).prop("checked"));

        });
        //全选全不选的功能
        $(document).on("click",".check_item",function () {

            var flag=$(".add_check_item:checked").length == $(".add_check_item").length;
            //alert(flag)

            $("#examPaper_add_check_all").prop("checked",flag);

        });

        //批量添加
        $("#examPapers_add_hand_model_btn").click(function () {
            var add_strs="";
            var examPaperid=$(this).attr("examPaperId");
            $.each($(".check_item:checked"),function () {
                add_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            add_strs=add_strs.substring(0,add_strs.length-1);
            //alert(add_strs);
            if(confirm("确认添加这些题目吗？")){
                $.ajax({
                    url:"${APP_PATH}/addESMBatch",
                    data:{"addStrs":add_strs,"examPaperId":examPaperId},
                    type:"GET",
                    success:function (result) {
                        alert(result.msg);
                    }
                })
            }
        });

        //试题自动添加点击事件
        $(document).on("click",".create_btn",function () {
            var examPaperId=$(this).attr("examPaperId")
            $('#examPaper_autoAdd').modal('show');
            $("#examPaper_autoAdd form")[0].reset();
            $("#examPaper_autoAdd form").find(".help-block").text("");
            $("#grade_auto_add_select").empty();
            $("#subject_auto_add_btn").attr("examPaperId",examPaperId);
            // 获取所有年级名
            $.ajax({
                url:"${APP_PATH}/getAllGradeNames",
                type:"GET",
                success:function (result) {
                    //console.log(result);
                    var grades=result.extend.list;
                    $.each(grades,function (index,item) {
                        var optionEle=$("<option></option>").append(item.gradeName).attr("value",item.gradeId);
                        optionEle.appendTo("#grade_auto_add_select");
                    })
                }
            })
        });

        //点击自动生成按钮
        $("#subject_auto_add_btn").click(function () {
            var result=$("#examPaper_autoAdd form").serialize();
            //console.log(result);
            $.ajax({
                url:"${APP_PATH}/autoAddSubjects",
                data:$("#examPaper_autoAdd form").serialize()+"&&examPaperId="+$(this).attr("examPaperId"),
                type:"POST",
                success:function (result) {
                    alert(result.msg);
                    $('#examPaper_autoAdd').modal('hide');
                }
            });
        });



    </script>


</body>
</html>
