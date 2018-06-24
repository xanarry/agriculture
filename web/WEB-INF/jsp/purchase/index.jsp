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
        $(document).ready(function () {
            //监听单价和输入数量的输入状体
            $('#unitPrice').bind('input propertychange', function () {

                if (isNaN($("#unitPrice").val())) {
                    alert("您输入的不是合法数字");
                    $('#unitPrice').val("");
                    $('#totalPrice').val("");
                } else if (!isNaN($('#amount').val())) {
                    $('#totalPrice').val(new Number($('#amount').val() * $('#unitPrice').val()).toFixed(3));
                } else {
                    $('#unitPrice').val("");
                    $('#totalPrice').val("");
                }
            });

            $('#amount').bind('input propertychange', function () {
                if (isNaN($('#amount').val())) {
                    alert("您输入的不是合法数字");
                    $('#amount').val("");
                    $('#totalPrice').val("");
                } else if (!isNaN($('#unitPrice').val())) {
                    $('#totalPrice').val(new Number($('#amount').val() * $('#unitPrice').val()).toFixed(3));
                } else {
                    $('#amount').val("");
                    $('#totalPrice').val("");
                }
            });
        });
    </script>

</head>

<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="../common/nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <h3>采购记录(${count})</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">物资名称</th>
                    <th class="text-center">采购量</th>
                    <th class="text-center">单价</th>
                    <th class="text-center">总价</th>
                    <th class="text-center">采购商</th>
                    <th class="text-center">采购时间</th>
                    <th class="text-center">采购人</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${purchaseList}" var="purchase" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle"><a
                                href="/purchase/${purchase.ID}">${purchase.ID}</a></td>
                        <td class="text-center" style="vertical-align: middle">${purchase.goodsName}</td>
                        <td class="text-center" style="vertical-align: middle">${purchase.amount} ${purchase.unit}</td>
                        <td class="text-center" style="vertical-align: middle">${purchase.unitPrice}</td>
                        <td class="text-center" style="vertical-align: middle">${purchase.totalPrice}</td>
                        <td class="text-center" style="vertical-align: middle">${purchase.seller}</td>
                        <jsp:useBean id="purchaseTime" class="java.util.Date"/>
                        <c:set target="${purchaseTime}" property="time" value="${purchase.purchaseTime}"/>
                        <td class="text-center" style="vertical-align: middle">
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${purchaseTime}"/>
                        </td>
                        <td class="text-center" style="vertical-align: middle">${purchase.operator}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="text-right">
                <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#addModal">新增采购</a>
            </div>

            <div class="modal fade" id="addModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">新增采购</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="/purchase/add" style="margin-bottom: 0em">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">物资名</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="goodsID" id="goodsID">
                                            <option selected>请选择采购物资</option>
                                            <c:forEach items="${goodsList}" var="goods" varStatus="pos">
                                                <option value="${goods.ID}">${goods.name} (${goods.unit})</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">采购量</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="amount" name="amount" placeholder="采购量">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">单价</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="unitPrice" name="unitPrice" placeholder="单价">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">总价</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="totalPrice" name="totalPrice" readonly placeholder="采购量">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">采购商</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="seller" name="seller" readonly value="${sessionScope.user.name}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">采购人</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="operator" name="operator" readonly value="${sessionScope.user.name}">
                                    </div>
                                </div>


                                <div class="text-right">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">保存修改</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>
</body>
</html>