<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 20-1-6
  Time: 下午8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>自动出题</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <script src="${APP_PATH}/static/js/jquery.time-to.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="module" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
    <link href="${APP_PATH}/static/css/timeTo.css" type="text/css" rel="stylesheet">

    <style type="text/css">
        .showExam {
            list-style: none;
            width:35px; height: 35px; float: left; background-color: orangered; margin-left: 10px; margin-top: 3px; color: #FFF; font-size: 14px; text-align: center;
            line-height: 35px; cursor: pointer;
            border-radius: 3px;
        }
        .aswer-p {
            width: 100%;
            height: 30px;
            line-height: 30px;
            cursor: pointer;
        }
        .aswer-p:hover {
            background-color: #FFFF99;
        }
        input {
        }
        .subjectOption {
            padding-top: 0px;
        }
        .hidden_info {
            display: none;
        }
    </style>
</head>
<body>
<div class="container" style="margin-top: 150px">
    <div style="width: 60%; height: 100%; float: left;">
        <div style="width: 100%; height: 80%;" >
            <dl subject="1" style="width:100%;">
                <div id="exam">

                </div>
            </dl>
            <div style="width:100%; height:20%; margin-top: 170px;">
                <button style="float: left;" id="preSubject" type="button" class="btn btn-default btn-lg btn_last">上一题</button>
                <button style="float: left;margin-left: 10px;" id="nextSubject" type="button" class="btn btn-default btn-lg btn_next">下一题</button>
            </div>
        </div>
    </div>


    <div class="answerSheet">
        <div style="width: 38%; float: right;margin-top: -61px;">
            <div style="width:100%; height:63px;text-align: center;">
                <div style="float: right;width: 55%;height: 100%;line-height: 63px;text-align: left;">
                    <h2>答题卡</h2>
                </div>

                <div style="float: right; width: 55%;height: 100%;line-height: 63px; text-align: left;">
                    <a type="button" class="btn btn-default btn-sm" id="submit">提交</a>
                    <form action="submit" method="post" style="display: none">
                        <input type="hidden" name="studentId"/>
                        <input type="hidden" name="examPaperId"/>
                        <input type="hidden" name="classId"/>
                        <input type="hidden" name="gradeId"/>
                    </form>
                    <ul id="testInfo">
                    </ul>
                    <dd subject=""></dd>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        find();
        $("dd[id="+(1).toString()+"]").css("display","block");
        $("li[id="+(1).toString()+"]").css("background-color","yellow");

    });

    $(".btn_next").click(function () {
        var now=parseInt($("dl").attr("subject"));
        var count=parseInt($("#exam").children("dd").length);
        if(now>=count)  return ;
        $("dl").attr("subject",now+1);
        $("dd[id="+(now+1).toString()+"]").css("display","block");
        $("li[id="+(now+1).toString()+"]").css("background-color","yellow");
        $("li[id="+(now).toString()+"]").css("background-color","green");
        $("dd[id="+(now+1).toString()+"]").siblings().css("display","none");
    });
    $(".btn_last").click(function () {
        var now=parseInt($("dl").attr("subject"));
        if(now<=1)  return ;
        $("dl").attr("subject",now-1);
        $("dd[id="+(now-1).toString()+"]").css("display","block");
        $("dd[id="+(now-1).toString()+"]").siblings().css("display","none");
        $("li[id="+(now-1).toString()+"]").css("background-color","yellow");
        $("li[id="+(now).toString()+"]").css("background-color","green");
    });

    $(".NonNumPattern").click(function () {
        if($(this).prop("checked")==true)
            $(this).prop("checked",true);
        else
        {
            $(this).prop("checked",false);
        }
    });

    $("body").delegate(".singlePattern","click",(function () {
            if($(this).prop("checked")==true){
                $(this).parents("p").siblings("p").children("span").children("input").prop("checked",false);
            }
            else
            {
                $(this).prop("checked",false);
            }
        })
    );

    $("#submit").click(function () {
        $.ajax({
            url:"${APP_PATH}/initScore",
            data:{},
            dataType:"JSON",
            type:"POST",
            success:function () {

            }
        });
        $(".question").each(function () {
            var subjectId=$(this).attr("id");
            var type=$(this).attr("subType");
            var answer="";
            if("2"==type)
            {
                answer+=$(this).siblings("textarea").val();
            }
            else{
                if($(this).siblings("#opA").children("span").children("#optionA").prop("checked")){
                    answer+="A";
                }
                if($(this).siblings("#opB").children("span").children("#optionB").prop("checked"))
                    answer+="B";
                if($(this).siblings("#opC").children("span").children("#optionC").prop("checked"))
                    answer+="C";
                if($(this).siblings("#opD").children("span").children("#optionD").prop("checked"))
                    answer+="D";
            }
            console.log(answer);
            $.ajax({
                url:"${APP_PATH}/Ha/submitResult",
                data:{"subjectId":subjectId,"answer":answer,"studentId":${sessionScope.studentId},"examPaperId":"10"},
                dataType:"JSON",
                type:"POST",
                success:function (result) {
                    console.log(result);
                    examScore=result.extend.examScore;
                }
            })
        });
        $(this).attr("href","${APP_PATH}/reception/submitSuccess.jsp");
    });

    function find() {
        <c:forEach items="${exam}" var="t" varStatus="status" >
        var subject;
        var index="${status.index+1}";
        <c:if test="${t.subjectType==0}">
        subject=$("<dd id="+index+" style=\"float: left;display: none; width: 100%;\">\n" +
            "            <p id=${t.subjectId} subType=${t.subjectType} class=\"question\">"+index+"${t.subjectName}"+"</p>\n" +
            "            <p id=\"opA\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionA\" class=\"singlePattern\">\n" +
            "                    <span>"+"${t.optionA}"+"</span>\n" +
            "                </span>\n" +
            "            </p>\n" +
            "            <p id=\"opB\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionB\" class=\"singlePattern\">\n" +
            "                    <span>"+"${t.optionB}"+"</span>\n" +
            "                </span>\n" +
            "            </p>\n" +
            "            <p id=\"opC\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionC\" class=\"singlePattern\">\n" +
            "                    <span>"+"${t.optionC}"+"</span>\n" +
            "                </span>\n" +
            "            </p>\n" +
            "            <p id=\"opD\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionD\" class=\"singlePattern\">\n" +
            "                    <span>"+"${t.optionD}"+"</span>\n" +
            "                </span>\n" +
            "            </p></div>\n"+
            "            </dd>");
        </c:if>

        <c:if test="${t.subjectType==1}">
        subject=$("<dd id="+index+" style=\"float: left;display: none; width: 100%;\">\n" +
            "            <p id=${t.subjectId} subType=${t.subjectType} class=\"question\">"+index+"${t.subjectName}"+"</p>\n" +
            "            <p id=\"opA\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionA\" class=\"NonNumPattern\">\n" +
            "                    <span>"+"${t.optionA}"+"</span>\n" +
            "                </span>\n" +
            "            </p>\n" +
            "            <p id=\"opB\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionB\" class=\"NonNumPattern\">\n" +
            "                    <span>"+"${t.optionB}"+"</span>\n" +
            "                </span>\n" +
            "            </p>\n" +
            "            <p id=\"opC\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionC\" class=\"NonNumPattern\">\n" +
            "                    <span>"+"${t.optionC}"+"</span>\n" +
            "                </span>\n" +
            "            </p>\n" +
            "            <p id=\"opD\">\n" +
            "                <span class=\"aswer-p\">\n" +
            "                    <input type=\"checkbox\" id=\"optionD\" class=\"NonNumPattern\">\n" +
            "                    <span>"+"${t.optionD}"+"</span>\n" +
            "                </span>\n" +
            "            </p></div>\n"+
            "            </dd>");
        </c:if>
        <c:if test="${t.subjectType==2}">
        subject=$("<dd id="+index+" style=\"float: left;display: none; width: 100%;\">\n" +
            "     <p id=${t.subjectId} subType=${t.subjectType} class=\"question\">"+index+"${t.subjectName}"+"</p>\n" +
            "<textarea></textarea>");
        </c:if>
        $("#exam").append(subject);
        var show=$("<li class='showExam'></li>").append(index).attr("id",index);
        $("#testInfo").append(show);
        </c:forEach>
    }

</script>
</body>
</html>
