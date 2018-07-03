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

</head>


<body>

<jsp:include page="common/nav-top.jsp"/>

<div class="container-fluid" style="padding-top: 20px">
    <div class="jumbotron jumbotron-fluid" style="background-size: cover; background-image: url('http://food.evo315.cn/djysnlj/Content/img/djysnlj/banner03.png');">
        <div class="container">
            <br>
            <br>
            <h1 class="display-4">智能可追溯绿色蔬菜生产管理系统</h1>
            <br>
            <br>
            <br>
            <br>
        </div>
    </div>


    <h3>最近生产任务</h3>
    <div class="card">
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
    </div>
    <br>

</div>

</body>

</html>