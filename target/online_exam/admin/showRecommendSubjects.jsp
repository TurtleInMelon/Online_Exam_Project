<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 20-4-15
  Time: 上午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>推荐的试题信息</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());

    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>

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

    <div>
        <h1 class="text-center">系统个性化推荐的题目</h1>

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
                <th>知识点</th>
                <th>操作
                    <button type="button" id="examPapers_add_model_btn" class="btn btn-success btn-sm">新增试卷并添加试题</button>
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


    <script type="text/javascript">
        var keyName;
        var islookup=true;
        $(function () {
            <%--var subjects = ${recommendSubjects};--%>
            var subjects = JSON.parse('<%=session.getAttribute("subjects")%>');
            console.log(subjects);
            $("#subjects_table tbody").empty();
            $.each(subjects,function (index,item) {
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
                var subjectIdTd = $("<td></td>").append(item.subjectId);
                if ((item.subjectName.length) <= 8) {
                    var subjectNameTd = $("<td></td>").append(item.subjectName);
                } else {
                    var subjectNameTd = $("<td></td>").append($("<p></p>").append(item.subjectName.substring(0, 8)))
                        .append($("<button type=\"button\" class=\"btn btn-default btn-sm lookup\">查看</button>").attr("subjectName", item.subjectName));
                }
                var optionATd = $("<td></td>").append(item.optionA);
                var optionBTd = $("<td></td>").append(item.optionB);
                var optionCTd = $("<td></td>").append(item.optionC);
                var optionDTd = $("<td></td>").append(item.optionD);
                var rightResultTd = $("<td></td>").append(item.rightResult);
                var subjectScoreTd = $("<td></td>").append(item.subjectScore);
                var subjectType;
                if (item.subjectType == 0) {
                    subjectType = "单选";
                } else if (item.subjectType == 1) {
                    subjectType = "多选";
                } else {
                    subjectType = "简答";
                }
                var subjectTypeTd = $("<td></td>").append(subjectType);
                var subjectEasy;
                if (item.subjectEasy == 0) {
                    subjectEasy = "简单";
                } else if (item.subjectEasy == 1) {
                    subjectEasy = "中等";
                } else {
                    subjectEasy = "困难";
                }
                var subjectEasyTd = $("<td></td>").append(subjectEasy);
                //获取keyName

                $.ajax({
                    url:"${APP_PATH}/geyKeyNameByKeyId",
                    data:"keyId="+item.keyInfo.keyId,
                    type:"POST",
                    async:false,
                    success:function (result) {

                        keyName = result.extend.keyName;
                        // console.log(keyName);
                    }
                });
                // console.log(keyName);
                var keyNameTd = $("<td></td>").append(keyName);

                var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("gradeId", item.grade.gradeId).attr("courseId", item.course.courseId)
                    .attr("subjectEasy", item.subjectEasy).attr("subjectType", item.subjectType)
                    .attr("keyId", item.keyInfo.keyId);
                var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_btn")
                    .append($("<span><span>").addClass("glyphicon glyphicon-trash")).append("删除");
                delBtn.attr("gradeId", item.grade.gradeId).attr("courseId", item.course.courseId)
                    .attr("subjectEasy", item.subjectEasy).attr("subjectType", item.subjectType);
                var tdTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                    .append(subjectIdTd).append(subjectNameTd).append(optionATd).append(optionBTd).append(optionCTd)
                    .append(optionDTd).append(rightResultTd).append(subjectScoreTd).append(subjectTypeTd)
                    .append(subjectEasyTd).append(keyNameTd).append(tdTd)
                    .appendTo("#subjects_table tbody");
            });
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
                    // alert(TDName);
                    $(this).parents("tr").find("td:eq(2) p").text(TDName);
                    islookup=!islookup;
                }
                else{
                    var TDName=$(this).parents("tr").find("td:eq(2) button").attr("subjectName").substring(0,8);
                    // alert(TDName);
                    $(this).parents("tr").find("td:eq(2) p").text(TDName);
                    islookup=!islookup;
                }

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
            var examPaperId;
            $("#exampaper_add_btn").click(function () {
                var add_strs="";
                $.each($(".check_item:checked"),function () {
                    add_strs+=$(this).parents("tr").find("td:eq(1)").text()+"-";
                });


                add_strs=add_strs.substring(0,add_strs.length-1);
                alert(add_strs);
                $.ajax({
                    url:"${APP_PATH}/examPaper",
                    type:"POST",
                    data:$("#exampaper_Add form").serialize(),
                    success:function (result) {
                        //console.log(result);
                        if(result.code==100){

                            //查找examPaperId
                            var examPaperName = $("#exampapername_add_input").val();
                            // alert(examPaperName);

                            $.ajax({
                                url:"${APP_PATH}/getExamPaperIdByExamPaperName",
                                data:"examPaperName="+examPaperName,
                                type:"GET",
                                async:false,
                                success:function (result) {
                                    examPaperId = result.extend.examPaperId;
                                }
                            });
                            
                            if(confirm("创建试卷成功，确认添加这些题目吗？")){
                                $.ajax({
                                    url:"${APP_PATH}/addESMBatch",
                                    data:{"addStrs":add_strs,"examPaperId":examPaperId},
                                    type:"GET",
                                    success:function (result) {
                                        alert(result.msg);
                                    }
                                })
                            }
                            $("#exampaper_Add").modal("hide");
                        }
                        else{
                            console.log(result);
                        }
                    }
                })
            });




        })




    </script>

</body>
</html>
