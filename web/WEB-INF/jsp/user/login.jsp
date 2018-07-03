<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-8
  Time: 下午2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统-登录</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <script src="/js/jquery-3.2.1.min.js"></script>
</head>

<body>

<div class="container">
    <div class="text-center"  style="padding: 5%">
        <h1 style="font-size: 3em">智能可追溯绿色蔬菜生产管理系统</h1>
    </div>
    <div class="row">
        <div class="col-md-4 offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">登录系统</h3>
                </div>
                <div class="panel-body">
                    <form action="/user/login" method="post">
                        <div class="form-group">
                            <input class="form-control" placeholder="登录名" name="loginName" type="text">
                        </div>

                        <div class="form-group">
                            <input class="form-control" placeholder="登录密码" name="password" type="password">
                        </div>

                        <div class="form-group">
                            <select class="form-control">
                                <option>系统管理员</option>
                                <option>系统操作员</option>
                                <option>操作员</option>
                            </select>
                        </div>

                        <c:choose>
                            <c:when test="${param.error == 'pass'}">
                                <label style="float: right; color: red">登录名或者密码不对,请检查!</label>
                            </c:when>
                            <c:when test="${param.error == 'auth'}">
                                <label style="float: right; color: red">您目前没有权限,联系系统管理员!</label>
                            </c:when>
                        </c:choose>
                        <div class="checkbox">
                            <label><input type="checkbox" name="rememberme"> 记住我24小时</label>
                        </div>
                        <input class="btn btn-primary btn-block" type="submit" value="登录">
                    </form>
                    <div class="text-center">
                        <div class="list-inline">
                            <div class="list-inline-item"><a style="font-size: .9rem" href="/user/register">注册用户</a></div>
                            <div class="list-inline-item"><a style="font-size: .9rem" href="/user/forget-password">忘记密码</a></div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
