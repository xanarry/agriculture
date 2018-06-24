<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-1
  Time: 下午4:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">


    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/bootstrap/bootstrap.bundle.min.js"></script>

    <script>
        function checkRegisterForm() {
            var postData = {};
            var inputs = $("#registerForm").serializeArray();
            for (var i = 0; i < inputs.length; ++i) {
                //console.log(inputs[i]);
                if (inputs[i].value == null || inputs[i].value == "") {
                    $("#errorMsg").html(inputs[i].name + " is empty. " + "表单中不能有空值!");
                    $("#errorModal").modal('show');
                    return false;
                }

                if (inputs[i].name == "password" && inputs[i].value.length < 8) {
                    $("#errorMsg").html("密码长度至少为8位!");
                    $("#errorModal").modal('show');
                    return false;
                }

                if (inputs[i].name == "conformPassword" && inputs[i - 1].value != inputs[i].value) {
                    $("#errorMsg").html("两次输入的密码不一致!");
                    $("#errorModal").modal('show');
                    return false;
                }
                postData[inputs[i].name] = inputs[i].value;
            }

            console.log(postData);
            var str = JSON.stringify(postData);
            console.log(str);

            $.ajax({
                type: 'POST',
                url: "/user/register",
                data: postData,
                dataType: "text",
                success: function (result) {
                    console.log(result);
                    if (result != "success") {
                        $("#errorMsg").html(result);
                        $("#errorModal").modal('show');
                    } else {
                        $("#messageModal").modal('show');
                    }
                },

                error: function (result) {
                    console.log(result);
                    $("#errorMsg").html("向服务器请求数据出错");
                    $("#errorModal").modal('show');
                }
            });
        }
    </script>

</head>
<body>
<div class="container">
    <div class="row" style="margin-top: 5%">
        <div class="col-8 offset-2">
            <div class="card">
                <div class="card-header text-center"><h3>用户注册</h3></div>
                <div class="card-body">
                    <form id="registerForm" method="post" action="/user/register" style="margin-bottom: 0em">
                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">姓名</b>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="姓名">
                            </div>
                        </div>


                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">登录名</b>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="loginName" name="loginName"
                                       placeholder="登录名">
                            </div>
                        </div>

                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">身份证号</b>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="ID" name="ID" placeholder="姓名">
                            </div>
                        </div>

                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">邮箱</b>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email" name="email" placeholder="邮箱">
                            </div>
                        </div>

                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">电话</b>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="电话">
                            </div>
                        </div>

                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">登录密码</b>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="密码不少于8位, 必须同时包含字母数字">
                            </div>
                        </div>


                        <div class="form-group row">
                            <b class="col-sm-2 col-form-label text-right">确认密码</b>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="conformPassword" name="conformPassword"
                                       placeholder="确认以上密码">
                            </div>
                        </div>
                    </form>
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary" onclick="checkRegisterForm()">提交注册</button>
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
                <p id="message">注册成功, 管理员赋予权限之后可以登录</p>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="/user/login">登录页</a>
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

</body>
</html>
