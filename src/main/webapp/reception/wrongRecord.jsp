<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 19-12-28
  Time: 下午7:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>错题记录</title>
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
<div class="modal fade" id="record_check" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">错题详情</h4>
            </div>
            <div class="modal-body">
                    <p class="text-center"><strong><u>试卷信息</u></strong></p>
                    <p>
                        <span>试卷名称</span>
                        <span id="examPaperName"></span>
                    </p>
                    <p>
                        <span>试卷分数</span>
                        <span id="examPaperScore"></span>
                    </p>
                    <p>
                        <span>试卷难度</span>
                        <span id="examPaperEasy"></span>
                    </p>
                    <p class="text-center"><strong><u>试题信息</u></strong></p>
                    <p>
                        <span>题目</span>
                        <span id="subjectName"></span>
                    </p>
                    <div id="option"></div>
                    <p id="answer" class="text-center"><strong><u>作答情况</u></strong></p>
                    <p>
                        <span>正确答案</span>
                        <span id="rightResult"></span>
                    </p>
                    <p>
                        <span>你的答案</span>
                        <span id="chooseResult"></span>
                    </p>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="margin-top: 50px">
    <table class="table table-hover" id="record_table">
        <thead>
        <tr>
            <th>序号</th>
            <th>试卷名称</th>
            <th>题目名称</th>
            <th>题目类型</th>
            <th>题目难度</th>
            <th>知识点</th>
            <th></th>
        </tr>
        </thead>
        <tbody>


        </tbody>
    </table>
</div>

<script type="text/javascript">
    $(function () {
        init();
    });
    function init() {
        $.ajax({
            url:"${APP_PATH}/showAllRecord",
            type:"POST",
            dataType:"JSON",
            data:{},
            success:function (result) {
                var recordList=result.extend.record;
                console.log(recordList);
                if(recordList[0]==null) {
                    var log=$("<p class='text-center'></p>").append("无错题记录～");
                    $("#record_table > tbody").append(log);
                }
                else {
                    $.each(recordList,function (index,item) {
                        var idx=$("<td>"+(index+1)+"</td>");
                        var examPaperName=$("<td>"+item.examPaperInfo.examPaperName+"</td>").attr("id",item.examPaperInfo.examPaperId);
                        var subjectName=$("<td>"+item.subjectInfo.subjectName+"</td>").attr("id",item.subjectInfo.subjectId);
                        var subjectEasy=$("<td>"+judgeEasy(item.subjectInfo.subjectEasy)+"</td>");
                        var subjectType=$("<td>"+judgeType(item.subjectInfo.subjectType)+"</td>");
                        var point=$("<td></td>");
                        var btn=$("<button>"+"查看详情"+"</button>").addClass("btn btn-info btn-sm detail_btn");
                        var line=$("<tr></tr>").append(idx).append(examPaperName).append(subjectName).append(subjectType).append(subjectEasy).append(point).append(btn);
                        $("#record_table > tbody").append(line);
                    });
                }
            }
        });
    }
    function judgeType(subjectEasy) {
        if(subjectEasy==0)
            return "单选题";
        else if(subjectEasy==1)
            return "多选题";
        else
            return "简答题";
    }
    function judgeEasy(examPaperEasy) {
        if(examPaperEasy==1)
            return "普通";
        else if(examPaperEasy==2)
            return "中等";
        else
            return "困难";
    }

    $(document).on("click",".detail_btn",function () {

        var examId=$(this).siblings("td").eq(1).attr("id");
        var subjectId=$(this).siblings("td").eq(2).attr("id");

        $.ajax({
            url:"${APP_PATH}/Choose/recordDetail",
            type:"POST",
            dataType:"JSON",
            data:{"examPaperId":examId,"subjectId":subjectId},
            success:function (result) {
                var detail=result.extend.details;
                console.log(detail);
                $("#examPaperName").html(detail.examPaperInfo.examPaperName);
                $("#examPaperScore").html(detail.examPaperInfo.examPaperScore);
                $("#examPaperEasy").html(judgeEasy(detail.examPaperInfo.examPaperEasy));
                $("#subjectName").html(detail.subjectInfo.subjectName);
                $("#chooseResult").html(detail.chooseResult);
                $("#rightResult").html(detail.subjectInfo.rightResult);

                if(detail.subjectInfo.subjectType==2)
                {

                }
                else {
                    $("#option").empty();
                    var info=$("<p>\n" +
                        "                        <span>选项A</span>\n" +
                        "                        <span id=\"subjectOptionA\"></span>\n" +
                        "                    </p>\n" +
                        "                    <p>\n" +
                        "                        <span>选项B</span>\n" +
                        "                        <span id=\"subjectOptionB\"></span>\n" +
                        "                    </p>\n" +
                        "                    <p>\n" +
                        "                        <span>选项C</span>\n" +
                        "                        <span id=\"subjectOptionC\"></span>\n" +
                        "                    </p>\n" +
                        "                    <p>\n" +
                        "                        <span>选项D</span>\n" +
                        "                        <span id=\"subjectOptionD\"></span>\n" +
                        "                    </p>");
                    $("#option").append(info);
                    $("#subjectOptionA").html(detail.subjectInfo.optionA);
                    $("#subjectOptionB").html(detail.subjectInfo.optionB);
                    $("#subjectOptionC").html(detail.subjectInfo.optionC);
                    $("#subjectOptionD").html(detail.subjectInfo.optionD);
                }
            }
        });

        $("#record_check").modal('show');
    });

</script>
</body>
</html>
