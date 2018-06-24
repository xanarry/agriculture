<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-2
  Time: 上午10:05
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/fontawesome/fontawesome-all.min.css">
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">

        <%----------------------左侧菜单栏分割(结束)----------------------%>
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>机构管理</span>
        </h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="/user"><i class="fa-fw fas fa-user"></i> 人员管理</a></li>
            <li class="nav-item"><a class="nav-link" href="/role"><i class="fa-fw fas fa-neuter"></i> 设备管理</a></li>
            <li class="nav-item"><a class="nav-link" href="/role"><i class="fa-fw fas fa-neuter"></i> 财务管理</a></li>
        </ul>
        <%----------------------左侧菜单栏分割(结束)----------------------%>


            <%----------------------左侧菜单栏分割(结束)----------------------%>
            <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                <span>生产管理</span>
            </h6>
            <ul class="nav flex-column">
                <li class="nav-item"><a class="nav-link" href="/purchase/pesticide"><i class="fa-fw fas fa-user"></i> 任务下达</a></li>
                <li class="nav-item"><a class="nav-link" href="/purchase/seed"><i class="fa-fw fas fa-neuter"></i> 数据采集</a></li>
                <li class="nav-item"><a class="nav-link" href="/task"><i class="fa-fw fas fa-neuter"></i> 质量追踪</a></li>
            </ul>
            <%----------------------左侧菜单栏分割(结束)----------------------%>




        <%----------------------左侧菜单栏分割----------------------%>
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>采购管理</span>
        </h6>

        <ul class="nav flex-column mb-2">
            <li class="nav-item"><a class="nav-link" href="/goods"><i class="fa-fw fas fa-user"></i> 种子</a></li>
            <li class="nav-item"><a class="nav-link" href="/goods"><i class="fa-fw fas fa-user"></i> 农药</a></li>
            <li class="nav-item"><a class="nav-link" href="/goods"><i class="fa-fw fas fa-user"></i> 化肥</a></li>
            <li class="nav-item"><a class="nav-link" href="/goods"><i class="fa-fw fas fa-user"></i> 设备</a></li>


            <li class="nav-item"><a class="nav-link" href="/goods"><i class="fa-fw fas fa-user"></i> 物资管理</a></li>

            <li class="nav-item"><a class="nav-link" href="/purchase"><i class="fa-fw fas fa-user"></i> 采购管理</a></li>

            <li class="nav-item">
                <a class="nav-link" href="#homeSubmenu" data-toggle="collapse" aria-expanded="false"><i class="fas fa-align-justify fa-fw"></i><b> lala</b></i> </a>
                <div class="collapse" id="homeSubmenu">
                    <ul style="background-color: #e4e4e4">
                        <li style="position:relative;display:block;margin-bottom:-1px;">
                            <a class="nav-link" href="#">农药</a>
                        </li>
                        <li style="position:relative;display:block;margin-bottom:-1px;">
                            <a class="nav-link" href="#">农药</a>
                        </li>
                        <li style="position:relative;display:block;margin-bottom:-1px;">
                            <a class="nav-link" href="#">农药</a>
                        </li>
                        <li style="position:relative;display:block;margin-bottom:-1px;">
                            <a class="nav-link" href="#">农药</a>
                        </li>
                    </ul>
                </div>
            </li>

        </ul>
        <%----------------------左侧菜单栏分割(结束)----------------------%>



        <%----------------------左侧菜单栏分割(用户管理)----------------------%>
        <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
            <span>销售管理</span>
        </h6>
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="/user"><i class="fa-fw fas fa-user"></i> 市场营销</a></li>
            <li class="nav-item"><a class="nav-link" href="/role"><i class="fa-fw fas fa-neuter"></i> 客户管理</a></li>
            <li class="nav-item"><a class="nav-link" href="/role"><i class="fa-fw fas fa-neuter"></i> 订单管理</a></li>
        </ul>
        <%----------------------左侧菜单栏分割(用户管理结束)----------------------%>
    </div>
</nav>