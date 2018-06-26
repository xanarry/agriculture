<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-8
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    .navbar-font {
        font-size: 1.2em;
        color: white;
        margin-right: 10px;
        text-decoration: none;
    }
</style>
<link rel="stylesheet" href="/css/fontawesome/fontawesome-all.min.css">
<nav class="navbar bg-dark sticky-top">
    <div class="container-fluid row">

        <%--左侧商标--%>
        <div class="col-2">
            <div class="d-flex flex-row">
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white; font-size: 1.2em" href="#">圣寿源</a></div>
            </div>
        </div>

        <%--中间菜单栏--%>
        <div class="col-8">
            <div class="d-flex flex-row">
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="/produce-task/">生产任务</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="/user/">人员管理</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="/material">投入品管理</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="/material">物资管理</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">企业信息</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单5</a></div>
            </div>
        </div>

        <%--有车状态栏--%>
        <div class="col-2">
            <div class="d-flex flex-row flex-row-reverse">
                <div class="p-2"><a style="text-decoration: none; font-size: 1.2em; color: white" href="/user/logout">退出</a></div>
                <div class="p-2"><a style="text-decoration: none; font-size: 1.2em; color: white" href="/user/detail/${sessionScope.user.name}">${sessionScope.user.name}</a></div>
            </div>
        </div>

    </div>
</nav>

