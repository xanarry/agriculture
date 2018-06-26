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

            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">生产任务ID</th>
                    <th class="text-center">产品名称</th>
                    <th class="text-center">生产区</th>
                    <th class="text-center">投入品编号</th>
                    <th class="text-center">投入品名称</th>
                    <th class="text-center">投入品类型</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">单位</th>
                    <th class="text-center">使用时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${useRecordList}" var="useRecord" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle"><a href="#">${useRecord.useRecordNO}</a></td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.useRecordName}</td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.provider}</td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.producer}</td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.purchaseCount}</td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.purchaseDate}</td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.produceDate}</td>
                        <td class="text-center" style="vertical-align: middle">${useRecord.operator}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" onclick="edituseRecord('${useRecord.useRecordNO}')">编辑</a>
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


        </main>
    </div>
</div>
</body>
</html>