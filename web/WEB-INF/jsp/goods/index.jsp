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
        function editGoods(goodsID) {
            $.ajax({
                method: "POST",
                url: "/goods/json",
                data: {goodsID: goodsID},
                dataType: "json",
                success: function (goods) {
                    console.log(JSON.stringify(goods));
                    $("#goodsID").val(goods.ID);
                    $("#name").val(goods.name);
                    $("#NO").val(goods.NO);
                    $("#model").val(goods.model);
                    $("#type").val(goods.type);
                    $("#producer").val(goods.producer);
                    $("#remain").val(goods.remain);
                    $("#purchaseTime").val(goods.purchaseTime);
                    $("#unit").val(goods.unit);
                    $("#priceAllocRate").val(goods.priceAllocRate);
                    $("#amountAllocRate").val(goods.amountAllocRate);

                    $("#editForm").attr('action', '/goods/update');
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
        <jsp:include page="../common/nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <h3>物资(${count})</h3>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">ID</th>
                    <th class="text-center">物资名</th>
                    <th class="text-center">分类</th>
                    <th class="text-center">编号</th>
                    <th class="text-center">型号</th>
                    <th class="text-center">剩余量</th>
                    <th class="text-center">最近采购</th>
                    <th class="text-center">是否调配</th>
                    <th class="text-center">价格调配</th>
                    <th class="text-center">数量调配</th>
                    <th class="text-center">采购记录</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${goodsList}" var="goods" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle"><a href="/goods/${goods.ID}">${goods.ID}</a></td>
                        <td class="text-center" style="vertical-align: middle">${goods.name}</td>
                        <td class="text-center" style="vertical-align: middle">${goods.type}</td>
                        <td class="text-center" style="vertical-align: middle">${goods.NO}</td>
                        <td class="text-center" style="vertical-align: middle">${goods.model}</td>
                        <td class="text-center" style="vertical-align: middle">${goods.remain}${goods.unit}</td>
                        <jsp:useBean id="purchaseTime" class="java.util.Date"/>
                        <c:set target="${purchaseTime}" property="time" value="${goods.purchaseTime}"/>
                        <td class="text-center" style="vertical-align: middle">
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${purchaseTime}"/>
                        </td>
                        <td class="text-center" style="vertical-align: middle">
                            <c:choose>
                                <c:when test="${goods.amountAllocRate > 0}">是</c:when>
                                <c:otherwise>否</c:otherwise>
                            </c:choose>
                        </td>
                        <td class="text-center" style="vertical-align: middle">${goods.priceAllocRate}</td>
                        <td class="text-center" style="vertical-align: middle">${goods.amountAllocRate}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="/purchase/list?goodsID=${goods.ID}">采购记录</a>
                        </td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" onclick="editGoods('${goods.ID}')">编辑</a>
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="text-right">
                <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#addModal">新增物资</a>
            </div>

            <div class="modal fade" id="addModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">新增物资</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="editForm" method="post" action="/goods/add" style="margin-bottom: 0em">
                                <input type="text" id="goodsID" name="ID" value="1">
                                <input type="text" id="remain"  name="remain" value="1">
                                <input type="text" id="purchaseTime" name="purchaseTime" value="1">
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">物资名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="物资名, 不允许为空">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">分类</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="type" id="type">
                                            <option selected>请选择</option>
                                            <c:forEach items="${unitList}" var="unit" varStatus="pos">
                                                <option value="${unit.name}">${unit.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">编号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="NO" name="NO" placeholder="编号">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">型号</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="model" name="model" placeholder="型号">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">生产商</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="producer" name="producer" placeholder="生产商">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">单位</label>
                                    <div class="col-sm-10">
                                        <select class="form-control" name="unit" id="unit">
                                            <option selected>请选择</option>
                                            <c:forEach items="${unitList}" var="unit" varStatus="pos">
                                                <option value="${unit.name}">${unit.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">价调配率</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="priceAllocRate" name="priceAllocRate" placeholder="输入调配比率设置为可调配,20%请输入0.2">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-2 col-form-label text-right">量调配率</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="amountAllocRate" name="amountAllocRate" placeholder="输入调配比率设置为可调配,20%请输入0.2">
                                    </div>
                                </div>

                                <div class="text-right">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">保存</button>
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