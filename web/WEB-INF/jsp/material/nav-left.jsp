<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-2
  Time: 上午10:05
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<nav class="col-md-2 d-none d-md-block bg-light sidebar">

    <div class="sidebar-sticky">
        <%----------------------左侧菜单栏分割(结束)----------------------%>
        <br>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/material'}">active</c:if>" href="/material"><i class="fa-fw fas fa-user"></i> 标准库管理</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/material/purchase'}">active</c:if>" href="/material/purchase"><i class="fa-fw fas fa-neuter"></i> 采购管理</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/material/material-stock'}">active</c:if>" href="/material/stock"><i class="fa-fw fas fa-neuter"></i> 投入品库存</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/material/user-record'}">active</c:if>" href="/material/user-record"><i class="fa-fw fas fa-neuter"></i> 投入品使用记录</a></li>
        </ul>
        <%----------------------左侧菜单栏分割(结束)----------------------%>
    </div>
</nav>