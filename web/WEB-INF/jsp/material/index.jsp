<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-22
  Time: 上午10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">

    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/css/dashboard.css">


    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap/popper.min.js"></script>
    <script src="/js/bootstrap/bootstrap.min.js"></script>
    <script src="/js/bootstrap/bootstrap.bundle.min.js"></script>


    <script>
        function editmaterial(materialNO) {
            $.ajax({
                method: "POST",
                url: "/material/json",
                data: {materialNO: materialNO},
                dataType: "json",
                success: function (material) {
                    console.log(JSON.stringify(material));
                    $("#materialNO").val(material.ID);
                    $("#name").val(material.name);
                    $("#NO").val(material.NO);
                    $("#model").val(material.model);
                    $("#type").val(material.type);
                    $("#producer").val(material.producer);
                    $("#remain").val(material.remain);
                    $("#purchaseTime").val(material.purchaseTime);
                    $("#unit").val(material.unit);
                    $("#priceAllocRate").val(material.priceAllocRate);
                    $("#amountAllocRate").val(material.amountAllocRate);

                    $("#editForm").attr('action', '/material/update');
                    $("#addModal").modal('show');
                },
                error: function (data) {
                    console.log(data);
                    alert("请求服务器数据出错!");
                }
            });
        }
    </script>

</head>

<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
                <div>
                    <a class="btn btn-primary" href="/material/add">新增投入品</a>
                </div>
            <br>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">序号</th>
                    <th class="text-center">投入品编号</th>
                    <th class="text-center">投入品名称</th>
                    <th class="text-center">投入品类型</th>
                    <th class="text-center">型号</th>
                    <th class="text-center">规格</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">单位</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${materialRemainList}" var="material" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle">${pos.count}</td>
                        <td class="text-center" style="vertical-align: middle">${material.materialNO}</td>
                        <td class="text-center" style="vertical-align: middle">${material.materialName}</td>
                        <td class="text-center" style="vertical-align: middle">${material.materialType}</td>
                        <td class="text-center" style="vertical-align: middle">${material.model}</td>
                        <td class="text-center" style="vertical-align: middle">${material.specification}</td>
                        <td class="text-center" style="vertical-align: middle">${material.amount}</td>
                        <td class="text-center" style="vertical-align: middle">${material.unit}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" onclick="editmaterial('${material.materialNO}')">编辑</a>
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