<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-24
  Time: 下午8:13
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

    <script src="/js/util.js"></script>


    <script>
        $(document).ready(function () {
            $('#sellDate').datetimepicker({
                locale: 'zh-cn',
                format: "YYYY-MM-DD"
            });
        });
    </script>

</head>
<body>

<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="leftMenu.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <div class="card">
                <h5 class="card-header">
                    销售流向信息
                </h5>
                <div class="card-body">

                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">产品名称</th>
                                    <th scope="col">销往单位</th>
                                    <th scope="col">数量</th>
                                    <th scope="col">单位</th>
                                    <th scope="col">包装方式</th>
                                    <th scope="col">运输方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">销售日期</th>
                                </tr>
                                </thead>
                                <tbody id="sellInfoTbody">
                                <c:forEach items="${sellInfoList}" var="sellInfo" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${sellInfo.productName}</td>
                                        <td>${sellInfo.sellTo}</td>
                                        <td>${sellInfo.amount}</td>
                                        <td>${sellInfo.unit}</td>
                                        <td>${sellInfo.wrapMethod}</td>
                                        <td>${sellInfo.conveyMethod}</td>
                                        <td>${sellInfo.operator}</td>
                                        <td>${sellInfo.sellDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sellInfoModal">
                                    新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="sellInfoModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">新增记录</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="sellInfoForm" action="/produce-task/addSellInfo">
                                                <input type="text" value="${param.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">产品名称:</label>
                                                    <input type="text" class="form-control" alt="产品名称" name="productName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">销往单位:</label>
                                                    <input type="text" class="form-control" name="sellTo">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">数量:</label>
                                                    <input type="text" class="form-control" name="amount">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">单位:</label>
                                                    <input type="text" class="form-control" name="unit">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">包装方式:</label>
                                                    <input type="text" class="form-control" name="wrapMethod">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">运输方式:</label>
                                                    <input type="text" class="form-control" name="conveyMethod">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="sellDate" id="sellDate" data-toggle="datetimepicker"
                                                           data-target="#sellDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postProduceTaskData('sellInfoForm', 'sellInfoTbody', 'sellInfoModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>





            </div>
            <br>
        </main>
    </div>
</div>
</body>
</html>