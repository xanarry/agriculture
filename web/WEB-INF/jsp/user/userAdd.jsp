<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-22
  Time: 下午3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">


    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="/js/util.js"></script>

    <script>
        $(function () {
            $("select#role").change(function () {
                var selectVal = $(this).val();
                console.log(selectVal);
                if (selectVal == "操作员") {
                    $('#type').removeAttr("disabled");
                } else {
                    $('#type').attr("disabled", "disabled")
                    $('#type').val("其他");
                }
            });
        });

        function checkForm() {
            var loginName = $("#loginName").val();
            var name = $("#name").val();
            var email = $("#email").val();
            var phone = $("#phone").val();
            var ID = $("#ID").val();
            var role = $("#role").val();
            var type = $("#type").val();

            var loginNameHint = $("#loginNameHint");
            var nameHint = $("#nameHint");
            var IDHint = $("#IDHint");

            var error = false;


            if (loginName == undefined || loginName.length == 0 || loginName.length > 10) {
                loginNameHint.html("登录名长度应该为2到10个字符");
                loginNameHint.show();
                error = true;
            } else {
                loginNameHint.hide();
            }

            if (ID == undefined || ID.length < 18 || ID.length > 20) {
                IDHint.html("身份证号应为18到20个字符");
                IDHint.show();
                error = true;
            } else {
                IDHint.hide();
            }


            if (name == undefined || name.length == 0 || name.length > 10) {
                nameHint.html("姓名长度应该为2到10个字符");
                nameHint.show();
                error = true;
            } else {
                nameHint.hide();
            }


            if (error) {
                return;
            }

            $.ajax({
                type: 'POST',
                url: "/user/check",
                data: {loginName: loginName},
                dataType: "text",
                success: function (data) {
                    console.log(JSON.stringify(data));
                    var flag = 0;
                    if (data == 'success') {
                        loginNameHint.html("登录名已经存在");
                        loginNameHint.show();
                        flag++;
                    } else {
                        loginNameHint.hide();
                    }

                    if (flag == 0) {
                        $("#userForm").submit();
                    }
                },

                error: function (data) {
                    console.log(data);
                    alert("请求服务器数据出错!");
                }
            });
        }
    </script>
</head>
<body>

<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="../common/nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <h3>新增用户</h3>
            <hr>

            <div class="row">
                <div class="col-6 offset-3">
                    <form method="post" id="userForm" action="/user/add">
                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">登录名</span>
                            <input type="text" name="loginName" id="loginName" class="form-control"
                                   placeholder="登录系统使用的名称">
                        </div>
                        <label class="float-md-right" style="display: none; color: red" id="loginNameHint">登录名已经存在</label>
                        <br>

                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">姓名</span>
                            <input type="text" name="name" id="name" class="form-control" placeholder="系统显示的名称">
                        </div>
                        <label class="float-md-right" style="display: none; color: red" id="nameHint">登录名已经存在</label>
                        <br>

                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">身份证号</span>
                            <input type="text" name="ID" id="ID" class="form-control" placeholder="系统显示的名称">
                        </div>
                        <label class="float-md-right" style="display: none; color: red" id="IDHint">登录名已经存在</label>
                        <br>


                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">邮箱</span>
                            <input type="email" name="email" id="email" class="form-control"
                                   placeholder="邮箱用于找回密码与信息通知">
                        </div>
                        <br>

                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">电话</span>
                            <input type="number" name="phone" id="phone" class="form-control" placeholder="联系电话">
                        </div>
                        <br>

                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">身份</span>
                            <select class="form-control" name="role" id="role">
                                <option selected>请选择</option>
                                <c:forEach items="${roleList}" var="role" varStatus="pos">
                                    <option value="${role}">${role}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>

                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">类型</span>
                            <select class="form-control" name="type" id="type" disabled="disabled">
                                <option selected value="sbsbsbsbs">请选择</option>
                                <c:forEach items="${typeList}" var="type" varStatus="pos">
                                    <option value="${type}">${type}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <br>


                        <div class="input-group">
                            <span class="input-group-addon text-right" style="width: 5.5em">密码</span>
                            <input type="text" name="password" id="password" value="初始密码:12345678" readonly
                                   class="form-control" placeholder="初始化随机密码">
                        </div>
                    </form>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary" onclick="checkForm()">保存用户</button>
                    </div>
                </div>
            </div>


        </main>
    </div>
</div>
</body>
</html>