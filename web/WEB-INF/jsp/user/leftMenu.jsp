<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 2018/6/26
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}"/>

<nav class="col-md-2 d-none d-md-block bg-light sidebar">

    <div class="sidebar-sticky">
        <%----------------------左侧菜单栏分割(结束)----------------------%>
        <br>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/user'}">active</c:if>" href="/material/user-record"><i class="fa-fw fas fa-neuter"></i> 操作员</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/material/purchase'}">active</c:if>" href="/material/purchase"><i class="fa-fw fas fa-neuter"></i> 系统操作员</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/material'}">active</c:if>" href="/material"><i class="fa-fw fas fa-user"></i> 系统管理员</a></li>
        </ul>
        <%----------------------左侧菜单栏分割(结束)----------------------%>
    </div>
</nav>