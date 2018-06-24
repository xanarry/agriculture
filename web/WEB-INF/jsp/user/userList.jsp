<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-21
  Time: 上午9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">


    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
</head>

<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="../common/nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">姓名</th>
                    <th class="text-center">身份</th>
                    <th class="text-center">邮箱</th>
                    <th class="text-center">电话</th>
                    <th class="text-center">创建时间</th>
                    <th class="text-center">最近登录</th>
                    <th class="text-center">登录次数</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle">${user.name}</td>
                        <td class="text-center" style="vertical-align: middle">${user.role}</td>
                        <td class="text-center" style="vertical-align: middle">${user.email}</td>
                        <td class="text-center" style="vertical-align: middle">${user.phone}</td>
                        <jsp:useBean id="createTime" class="java.util.Date"/>
                        <c:set target="${createTime}" property="time" value="${user.createTime}"/>
                        <td class="text-center" style="vertical-align: middle"><fmt:formatDate
                                pattern="yyyy-MM-dd HH:mm:ss" value="${createTime}"/></td>
                        <jsp:useBean id="lastLoginTime" class="java.util.Date"/>
                        <c:set target="${lastLoginTime}" property="time" value="${user.lastLoginTime}"/>
                        <td class="text-center" style="vertical-align: middle"><fmt:formatDate
                                pattern="yyyy-MM-dd HH:mm:ss" value="${lastLoginTime}"/></td>
                        <td class="text-center" style="vertical-align: middle">${user.loginCount}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="/user/delete/${user.name}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </main>
    </div>
</div>
</body>
</html>