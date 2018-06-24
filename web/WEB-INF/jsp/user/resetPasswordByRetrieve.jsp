<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-21
  Time: 上午11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码-重新设定密码</title>

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">

    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>

    <script>
        function retrievePassword() {
            var loginName = $("#loginName").val();
            var email = $("#email").val();
            var password = $("#newPassword").val();
            var confirmPassword = $("#confirmPassword").val();

            if (password == undefined || password.length < 8) {
                $("#errorMsg").html("密码长度不能少于8位");
                $("#errorModal").modal('show');
            } else if (password == confirmPassword) {
                $("#errorModal").modal('hide');
                $.ajax({
                    type: 'POST',
                    url: "/user/retrieve-password",
                    data: {
                        "loginName": loginName,
                        "password": password
                    },
                    dataType: "text",
                    success: function (data) {
                        console.log(data);
                        if (data == "success") {
                            $("#messageModal").modal('show');
                        }
                    },

                    error: function (data) {
                        console.log(data);
                        $("#errorMsg").html("向服务器请求数据出错");
                        $("#errorModal").modal('show');
                    }
                });
            } else {
                $("#errorMsg").html("两次输入的密码不匹配!");
                $("#errorModal").modal('show');
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
                        <label class="col-sm-4 col-form-label text-right">用户名 :</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="loginName" placeholder="登录名" disabled value="${loginName}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right">邮箱 :</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="email" placeholder="邮箱" disabled value="${email}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right">新密码 :</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="newPassword" placeholder="输入新密码">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right">确认密码 :</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="confirmPassword" placeholder="确认以上密码">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-sm-4 col-form-label text-right"> </label>
                        <div class="col-sm-6">
                            <button onclick="retrievePassword()" class="form-control btn btn-primary">提交</button>
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
                    <p id="message">密码设置成功, 请返回主页登录!</p>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-success" href="/user/login">去登录</a>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="errorModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">重要提示</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p id="errorMsg"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">知道了</button>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
