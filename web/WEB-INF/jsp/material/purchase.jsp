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
                <c:forEach items="${purchaseRecordList}" var="material" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle">${material.materialNO}</td>
                        <td class="text-center" style="vertical-align: middle">${material.materialName}</td>
                        <td class="text-center" style="vertical-align: middle">${material.materialType}</td>
                        <td class="text-center" style="vertical-align: middle">${material.model}</td>
                        <td class="text-center" style="vertical-align: middle">${material.specification}</td>
                        <td class="text-center" style="vertical-align: middle">${material.amount}</td>
                        <td class="text-center" style="vertical-align: middle">${material.unit}</td>
                        <td class="text-center" style="vertical-align: middle">${material.unit}</td>
                        <td class="text-center" style="vertical-align: middle">${material.unit}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" onclick="editmaterial('${material.materialNO}')">编辑</a>
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
                    <th class="text-center">供应商</th>
                    <th class="text-center">生产商</th>
                    <th class="text-center">数量</th>
                    <th class="text-center">购买日期</th>
                    <th class="text-center">生产日期</th>
                    <th class="text-center">采购人</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${purchaseRecordList}" var="material" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle"><a href="#">${material.materialNO}</a></td>
                        <td class="text-center" style="vertical-align: middle">${material.materialName}</td>
                        <td class="text-center" style="vertical-align: middle">${material.provider}</td>
                        <td class="text-center" style="vertical-align: middle">${material.producer}</td>
                        <td class="text-center" style="vertical-align: middle">${material.purchaseCount}</td>
                        <td class="text-center" style="vertical-align: middle">${material.purchaseDate}</td>
                        <td class="text-center" style="vertical-align: middle">${material.produceDate}</td>
                        <td class="text-center" style="vertical-align: middle">${material.operator}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" onclick="editmaterial('${material.materialNO}')">编辑</a>
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>



            <div class="modal fade" id="addPurchaseModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <form method="post" action="/material/purchase/add">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">新增采购记录</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <%--表单实际开始处--%>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">投入品编号:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="materialNO" name="materialNO">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">投入品名称:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="materialName" name="materialName" readonly>
                                    </div>
                                </div>

                                    <script>
                                        $('#materialNO').autocomplete({
                                            /*lookup: countries,*/
                                            serviceUrl: '/material/purchase/add/complete' + $("#materialNO").val(),
                                            noCache: true,
                                            onSearchComplete: function (query, suggestions) {
                                                console.log("onSearchComplete");
                                                if (suggestions.length == 0) {
                                                    $("#materialNO").val("");
                                                    $("#materialName").val("");
                                                    alert("未搜索到选项")
                                                }
                                            },
                                            onSelect: function (suggestion) {
                                                console.log("onSelect");
                                                $("#materialNO").val(suggestion.value.split(" ")[0]);
                                                $("#materialName").val(suggestion.value.split(" ")[1]);
                                            }
                                        });
                                    </script>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">采购订单编号:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="orderNO" name="orderNO">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">供应商:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="provider" name="provider">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">生产商:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="producer" name="producer">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">生产日期:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="produceDate" name="produceDate"
                                               data-toggle="datetimepicker"
                                               data-target="#produceDate">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">有效期至:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="validDate" name="validDate"
                                               data-toggle="datetimepicker"
                                               data-target="#validDate">
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">采购数量:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="purchaseCount" name="purchaseCount">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3 form-label">采购日期:</label>
                                    <div class="col-sm-9" style="padding-left: 0px">
                                        <input type="text" class="form-control" id="purchaseDate" name="purchaseDate"
                                               data-toggle="datetimepicker"
                                               data-target="#purchaseDate">
                                    </div>
                                </div>

                                <%--表单实际结束处--%>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">添加</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </main>
    </div>
</div>
</body>
</html>