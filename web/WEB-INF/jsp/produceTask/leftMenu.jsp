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
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <%----------------------左侧菜单栏分割(结束)----------------------%>
        <br>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/detail'}">active</c:if>" href="/produce-task/detail?ID=${param.ID}"><i class="fa-fw fas fa-user"></i> 任务信息</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/plough'}">active</c:if>" href="/produce-task/plough?ID=${param.ID}"><i class="fa-fw fas fa-user"></i> 土地翻耕</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/sow'}">active</c:if>" href="/produce-task/sow?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 播种信息</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/pruning'}">active</c:if>" href="/produce-task/pruning?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 整枝记录</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/shuguo-record'}">active</c:if>" href="/produce-task/shuguo-record?ID=${param.ID}"><i class="fa-fw fas fa-user"></i> 蔬果记录</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/pollination'}">active</c:if>" href="/produce-task/pollination?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 授粉记录</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/fertilization'}">active</c:if>" href="/produce-task/fertilization?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 施肥信息</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/anti-disease-pest'}">active</c:if>" href="/produce-task/anti-disease-pest?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 病虫害防治</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/weed'}">active</c:if>" href="/produce-task/weed?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 杂草管理</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/irrigation'}">active</c:if>" href="/produce-task/irrigation?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 灌溉信息</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/product-pick'}">active</c:if>" href="/produce-task/product-pick?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 采摘信息</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/product-pack'}">active</c:if>" href="/produce-task/product-pack?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 产品包装</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/product-check'}">active</c:if>" href="/produce-task/product-check?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 产品检测信息</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/check-report'}">active</c:if>" href="/produce-task/check-report?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 检验报告</a></li>
            <li class="nav-item"><a class="nav-link <c:if test="${uri == '/produce-task/sell-info'}">active</c:if>" href="/produce-task/sell-info?ID=${param.ID}"><i class="fa-fw fas fa-neuter"></i> 销售流向信息</a></li>
        </ul>


    </div>
</nav>
