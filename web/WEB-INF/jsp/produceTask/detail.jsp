<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-24
  Time: 下午8:21
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
                    任务信息
                </h5>

                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>产品名:</b></label>
                                <label class="col-8 text-left">${task.productName}(${task.productType})</label>
                            </div>
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>状态:</b></label>
                                <label class="col-8 text-left">${task.state}</label>
                            </div>
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>创建人:</b></label>
                                <label class="col-8 text-left">${task.operator}</label>
                            </div>
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>产品介绍:</b></label>
                                <label class="col-8 text-left">${task.productDetail}</label>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>任务ID:</b></label>
                                <label class="col-8 text-left">${task.ID}</label>
                            </div>
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>创建时间:</b></label>
                                <jsp:useBean id="createTime" class="java.util.Date"/>
                                <c:set target="${createTime}" property="time" value="${task.createTime}"/>
                                <label class="col-8 text-left"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                               value="${createTime}"/></label>
                            </div>
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>生产区:</b></label>
                                <label class="col-8 text-left">${task.area}</label>
                            </div>
                            <div class="form-group row" style="margin-bottom: .3rem;">
                                <label class="col-3 text-right"><b>生产区块:</b></label>
                                <label class="col-8 text-left">
                                    <c:forEach items="${selectedAreaBlock}" var="areaBlock">
                                        <button class="btn badge badge-secondary">${areaBlock}</button>
                                    </c:forEach>
                                    <button class="btn badge btn-primary" data-toggle="modal"
                                            data-target="#areaBlockModal">新增
                                    </button>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="areaBlockModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">

                    <form action="/produce-task/addAreaBlock" method="post">
                        <input type="text" name="produceTaskID" value="${task.ID}" hidden>
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">新增区块</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label class="col-form-label">选择已有:</label>
                                    <select type="text" class="form-control" name="selectedAreaBlock">
                                        <option value="" selected>请选择</option>
                                        <c:forEach items="${selectableAreaBlock}" var="areaBlock">
                                            <option value="${areaBlock}">${areaBlock}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="col-form-label">手动输入:</label>
                                    <input type="text" class="form-control" name="inputAreaBlock">
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">保存</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>


        </main>
    </div>
</div>
</body>
</html>
