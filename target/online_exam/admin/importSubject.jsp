<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 19-11-15
  Time: 下午3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>导入试题</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <style type="text/css">
        .dropdown-toggle {
            height: 30px;
        }
        #examPaperChoose {
            display: none;
        }
        .importToNewPaper {
            display: none;
        }
        .tips {color: #205AA7;}
    </style>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <form id="subjects_Import" class="form-horizontal" role="form" action="${APP_PATH}/dispatcherUpload" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="division" class="col-sm-2 control-label">是否分科</label>
                        <div class="col-sm-10">
                            <select class="form-control" id="division" name="division"  data-live-search="true">
                                <option value="0">不分科</option>
                                <option value="1">文科</option>
                                <option value="2">理科</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="belong_subject">
                        <label class="col-sm-2 control-label">所属科目</label>
                        <div class="col-sm-10">
                            <select id="courseId" class="form-control" name="courseId"  data-live-search="true">
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="belong_grade">
                        <label class="col-sm-2 control-label">所属年级</label>
                        <div class="col-sm-10">
                            <select id="gradeId" class="form-control" name="gradeId" data-live-search="true">
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">选项</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="importOption" id="only-subject" value="0" checked="checked" /> 只导入试题
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="importOption" id="radio-exists" value="1" /> 导入到已有试卷
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="importOption" id="radio-new" value="2" /> 导入到新建试卷
                            </label>
                            <input class="from-control" style="display: none;" />
                            <span class="help-block" id="alltips">注意: 导入 Excel 文件中的第一行必须是包含
                            <b class="tips">题目</b>|<b class="tips">答案A-D</b>|<b class="tips">正确答案</b>|<b class="tips">分值</b>|<b class="tips">试题类型</b>|<b class="tips">难易程度</b>
                            与其列对应, 第一行标题名不得有误, 否则将无法解析; 如果是导入到新建试卷, 试卷和试题同用 分科、科目、年级信息。</span>
                        </div>
                    </div>
                    <div class="form-group" id="examPaperChoose">
                        <label  class="col-sm-2 control-label">试卷选择</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="examPaperId" id="examPaper_select" data-live-search="true">
                            </select>
                        </div>
                    </div>
                    <div class="form-group importToNewPaper">
                        <label for="examPaperEasy" class="col-sm-2 control-label">难易程度</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="examPaperEasy" id="examPaperEasy" data-live-search="true">
                                <option value="0">简单</option>
                                <option value="1">普通</option>
                                <option value="2">困难</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group importToNewPaper">
                        <label for="examPaperName" class="col-sm-2 control-label">试卷名称</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="examPaperName" id="examPaperName" type="text" placeholder="新建试卷名称" />
                        </div>
                    </div>
                    <div class="form-group importToNewPaper">
                        <label for="examPaperTime" class="col-sm-2 control-label">考试时长</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="examPaperTime" id="examPaperTime" type="text" placeholder="新建试卷考试时长" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputfile" class="col-sm-2 control-label">选择文件</label>
                        <div class="col-sm-10">
                            <input class="btn btn-default" name="inputfile" id="inputfile" type="file" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">添加试题</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-4 column">
            </div>
        </div>
    </div>


    <script type="text/javascript">
        $(function () {
           $.ajax({
               url:"${APP_PATH}/importSubject",
               success:function (result) {
                   //console.log(result);
                   var grades=result.extend.grades;
                   var courses=result.extend.courses;
                   var examPapers=result.extend.examPapers;
                   //构造option所属科目
                   $.each(courses,function (index,item) {
                       //alert(item.courseName);
                       $("#belong_subject select").append($("<option></option>").append(item.courseName).attr("value",item.courseId));
                   })
                   $.each(grades,function (index,item) {
                       $("#belong_grade select").append($("<option></option>").append(item.gradeName).attr("value",item.gradeId));
                   })
               }
           });

           $.ajax({
               url:"${APP_PATH}/getAllExamPaperNames",
               type:"GET",
               success:function (result) {
                   console.log(result);
                   var examPapers=result.extend.examPapers;
                   $.each(examPapers,function (index,item) {
                       $("#examPaper_select").append($("<option></option>").append(item.examPaperName).attr("value",item.examPaperId));
                   })
               }
           });

            var option=$("#subjects_Import input[name='importOption'][checked]").val();
            $(function() {
                $("#alltips").css("font-size", "12px");
                $("#only-subject").click(function() {
                    $("#examPaperChoose").hide();
                    $(".importToNewPaper").hide();
                });
                $("#radio-exists").click(function() {
                    $("#examPaperChoose").show("slow");
                    $(".importToNewPaper").hide();
                });
                $("#radio-new").click(function() {
                    $("#examPaperChoose").hide();
                    $(".importToNewPaper").show("slow");
                });
            });
        });

    </script>


</body>
</html>
