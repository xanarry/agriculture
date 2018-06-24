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

    <script>
        function postData(formName, tbodyName, modal) {
            var distForm = $("#" + formName);
            var tbody = $("#" + tbodyName);

            var inputs = []
            var trs = [];
            var data = {};

            var tdCount = $("#" + tbodyName + " tr").length;

            trs.push("<td>" + (tdCount + 1) + "</td>");

            $("form#" + formName + " :input").each(function () {
                inputs.push($(this));
            });

            for (var i = 0; i < inputs.length; ++i) {
                var input = inputs[i]; // This is the jquery object of the input, do what you will
                var name = input.attr("name");
                var value = input.val();
                var alt = input.attr("alt");

                if (alt != null && alt.length > 0 && value.length == 0) {
                    alert(alt + "不能为空");
                    return;
                }

                data[name] = value;
                if (name != 'produceTaskID') {
                    trs.push("<td>" + value + "</td>");
                }
                console.log(name + " " + value + " " + alt);
            }


            console.log(tdCount);
            console.log(distForm.attr("action"));
            console.log(data);
            console.log('<tr>' + trs.join("") + '</tr>')


            $.ajax({
                method: 'POST',
                url: distForm.attr("action"),
                data: data,
                dataType: "text",

                success: function (result) {
                    console.log(result);
                    if (result == "success") {
                        tbody.append('<tr>' + trs.join("") + '</tr>');
                        $("form#" + formName + " :input").each(function () {
                            if ($(this).attr("name") != "produceTaskID") {
                                $(this).val("");
                            }
                        });
                        $("#" + modal).modal('hide')
                    } else {
                        alert(result);
                    }
                },
                error: function (result) {
                    console.log(result);
                    alert("服务器请求出错");
                }
            })
        }
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
                    采摘信息
                </h5>
                <div class="card-body">
                    <table class="table table-sm">
                        <thead>
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">采摘方式</th>
                            <th scope="col">采摘数量</th>
                            <th scope="col">单位</th>
                            <th scope="col">操作人</th>
                            <th scope="col">日期</th>
                        </tr>
                        </thead>
                        <tbody id="productPickTbody">
                        <c:forEach items="${productPickList}" var="productPick" varStatus="pos">
                            <tr>
                                <th scope="row">${pos.count}</th>
                                <td>${productPick.method}</td>
                                <td>${productPick.pickCount}</td>
                                <td>${productPick.unit}</td>
                                <td>${productPick.operator}</td>
                                <jsp:useBean id="productPickTime" class="java.util.Date"/>
                                <c:set target="${productPickTime}" property="time"
                                       value="${productPick.operateTime}"/>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${productPickTime}"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="text-left">
                        <button class="btn btn-sm btn-primary" data-toggle="modal"
                                data-target="#productPickModal">新增记录
                        </button>
                    </div>

                    <div class="modal fade" id="productPickModal" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">新增记录</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="productPickForm" action="/produce-task/addProductPick">
                                        <input type="text" value="${task.ID}" name="produceTaskID">
                                        <div class="form-group">
                                            <label class="col-form-label">采摘方式:</label>
                                            <input type="text" class="form-control" name="method">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">采摘数量:</label>
                                            <input type="text" class="form-control" name="pickCount">
                                        </div>

                                        <div class="form-group">
                                            <label class="col-form-label">单位:</label>
                                            <input type="text" class="form-control" name="unit">
                                        </div>

                                        <div class="form-group">
                                            <label class="col-form-label">单位:</label>
                                            <input type="text" class="form-control" name="unit">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">操作人:</label>
                                            <input type="text" class="form-control" alt="操作人" name="operator">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">日期:</label>
                                            <input type="text" class="form-control" alt="日期" name="operateTime">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                    </button>
                                    <button type="button" class="btn btn-primary"
                                            onclick="postData('productPickForm', 'productPickTbody', 'productPickModal')">
                                        添加
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

            </div>

        </main>
    </div>
</div>
</body>
</html>