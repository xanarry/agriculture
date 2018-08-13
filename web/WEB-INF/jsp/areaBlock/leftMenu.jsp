<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-24
  Time: 下午5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="uri" value="${requestScope['javax.servlet.forward.request_uri']}"/>
<nav class="col-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <%----------------------左侧菜单栏分割(结束)----------------------%>
        <br>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/area-block/index-of-add'}">active</c:if>" href="/area-block/index-of-add?ID=${param.ID}"><i class="fa-fw fas fa-user"></i> 新增生产区块</a></li>
        </ul>
    </div>
</nav>
