<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-21
  Time: 上午10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/fontawesome/fontawesome-all.min.css">

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>

    <script>
        function retrievePassword() {
            var userName = $("#loginName").val();
            var email = $("#email").val();

            if (userName == undefined || userName.length == 0 || email == undefined || email.length == 0) {
                $("#message").html("输入不能包含空值");
                $("#messageModal").modal('show');
            } else {
                $("#message").html("<i class=\"fa-fw fas fa-spinner fa-spin fa-3x\"></i> 正在发送邮件");
                $("#modalFooter").hide();
                $("#messageModal").modal('show');
                $.ajax({
                    type: "POST",
                    url: "/user/forget-password",
                    data: {
                        "loginName": userName,
                        "email": email
                    },
                    dataType: "json",
                    success: function (data) {
                        //{"loginNameExist": true, "emailExist", "sendMail:" true}
                        console.log(JSON.stringify(data));
                        if (data.loginNameExist == true && data.emailExist == true) {
                            if (data.sendMail == true) {
                                $("#inputUserName").val("");
                                $("#inputEmail").val("");
                                $("#modalFooter").show();
                                $("#message").html("找回密码的邮件已经发送到您的邮箱, 请在30分钟内完成重置密码的操作");
                            } else {
                                $("#message").html("发送邮件失败!");
                            }
                        } else {
                            $("#message").html("用户名或者邮箱不存在!");
                        }
                        $("#messageModal").modal('show');
                    },

                    error: function (data) {
                        console.log(data);
                        alert("ajax error occured!");
                    }
                });
            }
        }
    </script>
</head>
<body>

<div class="container">
    <div class="row" style="padding-top: 15%">
        <div class="col-md-6 offset-3">
            <div class="card">
                <h4 class="card-header text-center">找回密码</h4>
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right">登录名 :</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="loginName" name="loginName"
                                   placeholder="登录名">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right">邮箱 :</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email" name="email" placeholder="邮箱">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right"> </label>
                        <div class="col-sm-6">
                            <button onclick="retrievePassword()" class="form-control btn btn-primary">发送找回密码邮件</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="messageModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">重要提示</h5>
                </div>
                <div class="modal-body">
                    <p id="message"></p>
                </div>
                <div id="modalFooter" class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">知道了</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>