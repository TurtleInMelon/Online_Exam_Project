<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 20-3-15
  Time: 下午7:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>系统返回的关键字</title>
    <title>个性化推荐</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <script src="${APP_PATH}/static/echarts/echarts.js"></script>
    <script src="${APP_PATH}/static/echarts/shine.js"></script>
</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <form id="PPT_Import" class="form-horizontal" role="form" action="${APP_PATH}/dispatcherUploadPPT" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <b>系统识别的关键词如下所示：</b>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <p class="text-success" id="keyWordsWithNoPageInfo">${keyWordsWithNoPageInfo}</p>
                            <p>${test}</p>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">选择PPT相应的课程名</label>
                        <div class="col-sm-10">
                            <div class="col-sm-10">
                                <select class="form-control" name="courseName" id="course_select">

                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-10">
                            <b>请输入额外关键词保证推荐准确率，若为空表示使用系统识别的关键词进行推荐：</b>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">关键词知识点：</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="extraKeyWords" id="extraKeyWords" type="text" placeholder="请输入要识别的关键词，以，分开" />或者从已有的知识点中选取增加

                            <div class="col-sm-10">
                                <select class="form-control" name="existedKeyWords" id="keyWords_select">

                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-success" id="recommend" href="${APP_PATH}/admin/showRecommendSubjects.jsp">个性化推荐题目</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script type="text/javascript">

        $("#course_select").empty();
        $.ajax({
            url:"${APP_PATH}/getAllCourseNames",
            type:"GET",
            success:function (result) {
                // console.log(result);
                var courses=result.extend.list;
                $.each(courses, function (index,item) {
                    var optionEle=$("<option></option>").append(item.courseName).attr("value",item.courseId);
                    optionEle.appendTo("#course_select");
                })
            }
        });


        $("#course_select").change(function () {
            $("#keyWords_select").empty();
            var courseId = $("#course_select").val();
            // alert(courseId);
            $.ajax({
                url:"${APP_PATH}/getAllKeyWords",
                data:"courseId="+courseId,
                type: "GET",
                success:function (result) {
                    console.log(result);
                    var keyWords=result.extend.keyWordsList;
                    $.each(keyWords, function (index,item) {
                        var optionEle=$("<option></option>").append(item.keyName).attr("value",item.keyId);
                        optionEle.appendTo("#keyWords_select");
                    })
                }
            })
        });




        $("#recommend").click(function () {
           var keyWordsWithNoPageInfo = $("#keyWordsWithNoPageInfo").text();
           var extraKeyWords = $("#extraKeyWords").val();
           var teacherId = ${sessionScope.loginTeacher.teacherId};
           var courseId = $("#course_select").val();
           // alert(extraKeyWords);
           // alert(courseId);
           // alert(keyWordsWithNoPageInfo);
            //１．判断输入的额外知识点是否存在,若不存在，将关键字信息存入keyinfo
            $.ajax({
                url:"${APP_PATH}/checkKeyWords",
                data:{"extraKeyWords": extraKeyWords,"courseId":courseId},
                type:"POST",
                success:function (result) {
                    console.log(result)
                }
            });
            //2.根据keyName获取相应的keyId
            var keyWords = extraKeyWords + "," + keyWordsWithNoPageInfo + "," + $("#keyWords_select").children('option:selected').text();
            alert(keyWords);
            $.ajax({
                url:"${APP_PATH}/getKeyIdByKeyName",
                data:"keyWords="+keyWords,
                type:"POST",
                success:function (result) {
                    // console.log(result);
                    var ids = result.extend.keyIds.toString();
                    alert(ids);
                    $.ajax({
                        url:"${APP_PATH}/getSubjectsByKeyIds",
                        data:"ids="+ids,
                        type:"GET",
                        success:function (result) {
                            console.log(result);
                            window.location.href="${APP_PATH}/admin/showRecommendSubjects.jsp";
                        }
                    })

                }
            });



        });
    </script>
</body>
</html>
