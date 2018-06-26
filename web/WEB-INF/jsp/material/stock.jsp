<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-25
  Time: 上午9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">

    <link rel="stylesheet" href="/css/fontawesome/fontawesome-all.min.css">
    <link rel="stylesheet" href="/plugin/datetimepicker/css/tempusdominus-bootstrap-4.min.css"/>
    <link rel="stylesheet" href="/plugin/jQuery-Autocomplete/css/autocomplete.css"/>


    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/bootstrap/bootstrap.bundle.min.js"></script>

    <script src="/plugin/datetimepicker/js/moment-with-locales.min.js"></script>
    <script src="/plugin/datetimepicker/js/tempusdominus-bootstrap-4.min.js"></script>

    <script src="/plugin/jQuery-Autocomplete/js/jquery.autocomplete.min.js"></script>


    <script>
        $(document).ready(function () {
            $('#produceDate').datetimepicker({
                locale: 'zh-cn',
                format: "YYYY-MM-DD"
            });
            $('#validDate').datetimepicker({
                locale: 'zh-cn',
                format: "YYYY-MM-DD"
            });
            $('#purchaseDate').datetimepicker({
                locale: 'zh-cn',
                format: "YYYY-MM-DD"
            });
        });

    </script>


    <style>
        .form-label {
            font-weight: bold;
            padding-top: 7px;
            margin-bottom: 0;
            text-align: right;
        }
    </style>


</head>

<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addPurchaseModal">新增采购记录
            </button>
            <br><br>


            <%--<table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">投入品编号</th>
                    <th class="text-center">投入品名称</th>
                    <th class="text-center">投入品类型</th>
                    <th class="text-center">型号</th>
                    <th class="text-center">规格</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">单位</th>
                    <th class="text-center">采购时间</th>
                    <th class="text-center">采购人</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${purchaseRecordList}" var="stock" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle">${stock.stockNO}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.stockName}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.stockType}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.model}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.specification}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.amount}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.unit}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.unit}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.unit}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" onclick="editstock('${stock.stockNO}')">编辑</a>
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>--%>



            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">投入品编号</th>
                    <th class="text-center">投入品名称</th>
                    <th class="text-center">投入品类型</th>
                    <th class="text-center">型号</th>
                    <th class="text-center">规格</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">单位</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${stockList}" var="stock" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle"><a href="#">${stock.materialID}</a></td>
                        <td class="text-center" style="vertical-align: middle">${stock.materialName}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.materialType}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.model}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.specification}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.amount}</td>
                        <td class="text-center" style="vertical-align: middle">${stock.unit}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



        </main>
    </div>
</div>
</body>
</html>