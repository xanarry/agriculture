<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-2
  Time: 上午10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>首页</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="css/dashboard.css">

    <link rel="stylesheet" href="/css/fontawesome/fontawesome-all.min.css">


    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap/popper.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/bootstrap/bootstrap.bundle.min.js"></script>


    <style>
        .navbar-font {
            font-size: 1.2em;
            color: white;
            margin-right: 40px;
            text-decoration: none;
        }
    </style>

</head>


<body>


<nav class="navbar bg-dark sticky-top">
    <div class="container-fluid row">
        <div class="col-2">
            <div class="d-flex flex-row">
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white; font-size: 1.2em" href="#">圣寿源</a></div>
            </div>
        </div>

        <div class="col-8">
            <div class="d-flex flex-row">
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单1</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单2</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单3</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单4</a></div>
                <div class="p-2 navbar-font"><a style="text-decoration: none; color: white" href="#">菜单5</a></div>
            </div>
        </div>

        <div class="col-2">
            <div class="d-flex flex-row flex-row-reverse">
                <div class="p-2" style="font-size: 1.2em; color: white">${index}</div>
                <div class="p-2" style="font-size: 1.2em; color: white">${index}</div>
            </div>
        </div>

    </div>
</nav>


<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">

                <%----------------------左侧菜单栏分割(结束)----------------------%>
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>机构管理</span>
                </h6>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link" href="/user"><i class="fa-fw fas fa-spinner fa-spin fa-3x"></i> 管理1</a></li>
                    <li class="nav-item"><a class="nav-link" href="/role"><i class="fa-fw fas fa-neuter"></i> 管理2</a></li>
                </ul>
                <%----------------------左侧菜单栏分割(结束)----------------------%>




                <%----------------------左侧菜单栏分割----------------------%>
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>生产管理</span>
                </h6>

                <ul class="nav flex-column mb-2">
                    <li class="nav-item"><a class="nav-link" href="/user"><i class="fa-fw fas fa-user"></i> 管理1</a></li>

                    <li class="nav-item">
                        <a class="nav-link" href="#homeSubmenu" data-toggle="collapse" aria-expanded="false"><i class="fas fa-align-justify fa-fw"></i><b> 采购管理</b></i> </a>
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
                    <li class="nav-item"><a class="nav-link" href="/user"><i class="fa-fw fas fa-user"></i> 管理2</a></li>
                </ul>
                <%----------------------左侧菜单栏分割(结束)----------------------%>



                <%----------------------左侧菜单栏分割(用户管理)----------------------%>
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>用户管理</span>
                </h6>
                <ul class="nav flex-column">
                    <li class="nav-item"><a class="nav-link" href="/user"><i class="fa-fw fas fa-user"></i> 用户管理</a></li>
                    <li class="nav-item"><a class="nav-link" href="/role"><i class="fa-fw fas fa-neuter"></i> 角色管理</a></li>
                </ul>
                <%----------------------左侧菜单栏分割(用户管理结束)----------------------%>
            </div>
        </nav>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">


            <h2>Section title</h2>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
            <hr>

            <div class="alert alert-primary" role="alert">
                This is a primary alert—check it out!
            </div>
            <div class="alert alert-secondary" role="alert">
                This is a secondary alert—check it out!
            </div>
            <div class="alert alert-success" role="alert">
                This is a success alert—check it out!
            </div>
            <div class="alert alert-danger" role="alert">
                This is a danger alert—check it out!
            </div>
            <div class="alert alert-warning" role="alert">
                This is a warning alert—check it out!
            </div>
            <div class="alert alert-info" role="alert">
                This is a info alert—check it out!
            </div>
            <div class="alert alert-light" role="alert">
                This is a light alert—check it out!
            </div>
            <div class="alert alert-dark" role="alert">
                This is a dark alert—check it out!
            </div>


            <h2>Section title</h2>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
            <hr>

            <div class="alert alert-primary" role="alert">
                This is a primary alert—check it out!
            </div>
            <div class="alert alert-secondary" role="alert">
                This is a secondary alert—check it out!
            </div>
            <div class="alert alert-success" role="alert">
                This is a success alert—check it out!
            </div>
            <div class="alert alert-danger" role="alert">
                This is a danger alert—check it out!
            </div>
            <div class="alert alert-warning" role="alert">
                This is a warning alert—check it out!
            </div>
            <div class="alert alert-info" role="alert">
                This is a info alert—check it out!
            </div>
            <div class="alert alert-light" role="alert">
                This is a light alert—check it out!
            </div>
            <div class="alert alert-dark" role="alert">
                This is a dark alert—check it out!
            </div>


        </main>
    </div>
</div>

</body>

</html>