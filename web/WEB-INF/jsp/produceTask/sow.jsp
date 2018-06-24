<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-24
  Time: 下午8:11
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
                    播种信息
                </h5>
                <div class="card-body">

                    <table class="table table-sm">
                        <thead>
                        <tr>
                            <th scope="col">序号</th>
                            <th scope="col">种子</th>
                            <th scope="col">种子来源</th>
                            <th scope="col">种子处理</th>
                            <th scope="col">亩用量</th>
                            <th scope="col">播种密度</th>
                            <th scope="col">播种方式</th>
                            <th scope="col">定植日期</th>
                            <th scope="col">定植信息</th>
                            <th scope="col">操作人</th>
                            <th scope="col">播种时间</th>
                        </tr>
                        </thead>
                        <tbody id="sowTbody">
                        <c:forEach items="${sowList}" var="sow" varStatus="pos">
                            <tr>
                                <th scope="row">${pos.count}</th>
                                <td>${sow.seed}</td>
                                <td>${sow.source}</td>
                                <td>${sow.handle}</td>
                                <td>${sow.amountPerMu}</td>
                                <td>${sow.sowingDensity}</td>
                                <td>${sow.sowingMethod}</td>
                                <td>${sow.colonizationTime}</td>
                                <td>${sow.colonizationInfo}</td>
                                <td>${sow.operator}</td>
                                <jsp:useBean id="sowTime" class="java.util.Date"/>
                                <c:set target="${sowTime}" property="time" value="${sow.sowingDate}"/>
                                <td>
                                    <fmt:formatDate pattern="yyyy-MM-dd" value="${sowTime}"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <div class="text-left">
                        <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#sowModal">
                            新增记录
                        </button>
                    </div>

                    <div class="modal fade" id="sowModal" tabindex="-1" role="dialog"
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
                                    <form id="sowForm" action="/produce-task/addSow">
                                        <input name="produceTaskID" value="${param.ID}"/>
                                        <div class="form-group">
                                            <label class="col-form-label">种子:</label>
                                            <input type="text" class="form-control" alt="种子" name="seed">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">种子来源:</label>
                                            <select class="form-control" name="source">
                                                <option value="外购" selected>外购</option>
                                                <option value="自种">自种</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">种子处理:</label>
                                            <input type="text" class="form-control" name="handle">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">亩用量:</label>
                                            <input type="text" class="form-control" name="amountPerMu">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">播种密度:</label>
                                            <input type="text" class="form-control" name="sowingDensity">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">播种方式:</label>
                                            <input type="text" class="form-control" name="sowingMethod">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">定植日期:</label>
                                            <input type="text" class="form-control" name="colonizationTime">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">定植信息:</label>
                                            <input type="text" class="form-control" name="colonizationInfo">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">操作人:</label>
                                            <input class="form-control" name="operator" alt="操作人">
                                        </div>
                                        <div class="form-group">
                                            <label class="col-form-label">日期:</label>
                                            <input class="form-control" name="sowingDate" alt="日期">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                    </button>
                                    <button type="button" class="btn btn-primary"
                                            onclick="postData('sowForm', 'sowTbody', 'sowModal')">保存
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