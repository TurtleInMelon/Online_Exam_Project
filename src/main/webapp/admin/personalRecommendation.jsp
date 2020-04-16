<%--
  Created by IntelliJ IDEA.
  User: xzq
  Date: 20-3-13
  Time: 下午8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
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
                            <b>上传PPT文件，系统根据PPT文件识别关键词</b>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPPTFile" class="col-sm-2 control-label">选择文件</label>
                        <div class="col-sm-10">
                            <input class="btn btn-default" name="inputPPTFile" id="inputPPTFile" type="file" />
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <div class="col-sm-10">
                            <b>输入要识别关键词的PPT页号，若为空，默认识别全部页面</b>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">输入页数</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="PPTPageNums" id="PPTPageNums" type="text" placeholder="请输入要识别的PPT页数，以，分开" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success" id="keyWordExact">关键字识别</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        $(function () {
            // var PPTPageNums = $("#PPTPageNums").val();
            // alert(PPTPageNums);
            $.ajax({
                url:"${APP_PATH}/dispatcherUploadPPT",
                success:function (result) {
                    console.log(result);

                }
            })
        });

    </script>

</body>
</html>
