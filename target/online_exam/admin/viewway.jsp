<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 20-1-11
  Time: 下午6:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>查看</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        //System.out.println(session.getAttribute("adminPower"));
    %>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="module" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/zeroModal/zeroModal.css"/>
</head>
<body>

<div class="modal fade" id="class-choose" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >选择班级/课程</h4>
            </div>
            <div class="modal-body">
                <p>
                    <span>选择任课班级</span>
                    <select id="class-selector"></select>
                </p>
                <p>
                    <button class="btn btn-sm btn-info" id="btn-sure">确定</button>
                </p>
            </div>
        </div>
    </div>
</div>

<div>
    <table class="table table-hover" id="checkList">
        <thead>
        <tr>
            <th>编号</th>
            <th>知识点</th>
            <th>学生姓名</th>
            <th>错误次数</th>
        </tr>
        </thead>
    </table>
</div>

<script type="text/javascript">
$(function () {
   $.ajax({
       url:"${APP_PATH}/getAllClassesByTeacherId",
       data:{},
       dataType:"JSON",
       type:"GET",
       success:function (result) {
           var teachingList=result.extend.teachingList;
           console.log(teachingList);
           $.each(teachingList,function (i,obj) {
               var option=$("<option>"+obj.classInfo.className+"--"+obj.courseInfo.courseName+"</option>").attr("id",obj.classInfo.classId).attr("subject",obj.courseInfo.courseId);
               $("#class-selector").append(option);
           });
           $("#class-choose").modal("show");
       }
   });
});
var courseId;
$("#btn-sure").click(function () {
    var classId=$("#class-selector").find("option:selected").attr("id");
    courseId=$("#class-selector").find("option:selected").attr("subject");
    //alert(id);
    $.ajax({
        url:"${APP_PATH}/getAllStudentsWithTheThirdKeys",
        data:{"courseId":courseId,"classId":classId},
        dataType:"JSON",
        type:"GET",
        success:function (result) {
            $("#class-choose").modal("hide");
            var recordList=result.extend.studentKeys;
            var studentList="";
            var keyName="";
            var times=0;
            var index;
            var no=1;
            $.each(recordList,function (i,obj) {
                index=parseInt(i)+1;
                if(index==1)
                {
                    keyName=obj.keyInfo.keyName;
                    studentList=obj.studentInfo.studentName;
                    times=obj.times;
                }
                else if(keyName==obj.keyInfo.keyName)
                {
                    studentList=studentList+","+obj.studentInfo.studentName;
                    times=times+","+obj.times;
                }
                else {
                    var tr=$("<tr><td>"+no+"</td><td>"+keyName+"</td><td>"+studentList+"</td><td>"+times+"</td></tr>");
                    $("#checkList").append(tr);
                    studentList=obj.studentInfo.studentName;
                    keyName=obj.keyInfo.keyName;
                    times=obj.times;
                    no=no+1;
                }
            });
            var tr=$("<tr><td>"+no+"</td><td>"+keyName+"</td><td>"+studentList+"</td><td>"+times+"</td></tr>");
            $("#checkList").append(tr);
        }
    })
});

</script>
</body>
</html>
