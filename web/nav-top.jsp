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
        margin-right: 40px;
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
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单1</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单2</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单3</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单4</a></div>
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

