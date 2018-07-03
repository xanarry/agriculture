<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-29
  Time: 下午3:28
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
            <h3>任务信息</h3>
            <div class="row">
                <div class="col">
                    <table class="table" style="margin-bottom: 0rem">
                        <tbody>
                        <tr>
                            <th class="text-right">产品名:</th>
                            <td colspan="2" style="vertical-align: middle">${task.productName}(${task.productType})</td>
                        </tr>
                        <tr>
                            <th class="text-right">状态:</th>
                            <td colspan="2" style="vertical-align: bottom">
                                ${task.state}
                                <a href="#" class="btn badge badge-primary" data-toggle="modal"
                                   data-target="#stateModal">修改状态</a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-right">创建人:</th>
                            <td colspan="2" style="vertical-align: bottom">${task.operator}</td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="modal fade" id="stateModal" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">


                            <form action="/produce-task/updateTaskState" method="post">
                                <input type="text" name="produceTaskID" value="${param.ID}" hidden>
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">更新任务状态</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <div class="form-group">
                                            <select type="text" class="form-control" name="state">
                                                <option>请选择</option>
                                                <option value="待审核">待审核</option>
                                                <option value="新建">新建</option>
                                                <option value="进行中">进行中</option>
                                                <option value="完成">完成</option>
                                                <option value="作废">作废</option>
                                            </select>
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


                </div>
                <div class="col">
                    <table class="table" style="margin-bottom: 0rem">
                        <tbody>
                        <tr>
                            <th class="text-right">任务ID:</th>
                            <td colspan="2" style="vertical-align: bottom">${task.ID}</td>
                        </tr>
                        <tr>
                            <th class="text-right">创建时间:</th>
                            <jsp:useBean id="createTime" class="java.util.Date"/>
                            <c:set target="${createTime}" property="time" value="${task.createTime}"/>
                            <td colspan="2" style="vertical-align: bottom"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                                           value="${createTime}"
                                                                                           type="both"/></td>
                        </tr>
                        <tr>
                            <th class="text-right">生产区:</th>
                            <td colspan="2" style="vertical-align: bottom">${task.area}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <hr>

            <table>
                <tbody>
                <tr>
                    <th class="text-right">产品介绍:</th>
                    <td style="vertical-align: middle">${task.productDetail}</td>
                </tr>
                <tr>
                    <th class="text-right">生产区块:</th>
                    <td style="vertical-align: bottom">
                        <c:forEach items="${selectedAreaBlock}" var="areaBlock">
                            <button class="btn badge badge-secondary">${areaBlock}</button>
                        </c:forEach>
                        <button class="btn badge btn-primary" data-toggle="modal" data-target="#areaBlockModal">新增
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>

            <div class="modal fade" id="areaBlockModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">


                    <form action="/produce-task/addAreaBlock" method="post">
                        <input type="text" name="produceTaskID" value="${param.ID}" hidden>
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

            <hr>
            <br>

            <h3>任务项</h3>


            <%-----------------------------------------------------------------------------------------------------------------%>


            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#plough" aria-expanded="false" aria-controls="plough">
                                土地翻耕
                            </button>
                        </h5>
                    </div>
                    <div id="plough" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">翻耕方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="plouthTbody">
                                <c:forEach items="${ploughList}" var="plough" varStatus="pos">
                                    <tr>
                                        <th>${pos.count}</th>
                                        <td>${plough.method}</td>
                                        <td>${plough.operator}</td>
                                        <jsp:useBean id="ploughTime" class="java.util.Date"/>
                                        <c:set target="${ploughTime}" property="time" value="${plough.operateDate}"/>
                                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${ploughTime}"/></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#ploughModal">
                                    新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="ploughModal" tabindex="-1" role="dialog"
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
                                            <form id="ploughForm" action="/produce-task/addPlough">
                                                <input type="text" name="produceTaskID" value="${param.ID}" hidden>
                                                <div class="form-group">
                                                    <label class="col-form-label">翻耕方式:</label>
                                                    <input type="text" class="form-control" alt="翻耕方式" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('ploughForm', 'plouthTbody', 'ploughModal')">保存
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>


                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#sow" aria-expanded="false" aria-controls="sow">
                                播种信息
                            </button>
                        </h5>
                    </div>
                    <div id="sow" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
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
                                        <td>${pos.count}</td>
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
                                        <c:set target="${sowTime}" property="time" value="${sow.operateDate}"/>
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
                                                    <input class="form-control" name="operateDate" alt="日期">
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
                </div>


                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#pruning" aria-expanded="false" aria-controls="pruning">
                                整枝记录
                            </button>
                        </h5>
                    </div>
                    <div id="pruning" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">整枝方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="pruningTbody">
                                <c:forEach items="${pruningList}" var="pruning" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${pruning.method}</td>
                                        <td>${pruning.operator}</td>
                                        <jsp:useBean id="pruningTime" class="java.util.Date"/>
                                        <c:set target="${pruningTime}" property="time" value="${pruning.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${pruningTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#pruningModal">
                                    新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="pruningModal" tabindex="-1" role="dialog"
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
                                            <form id="pruningForm" action="/produce-task/addPruning">
                                                <input name="produceTaskID" value="${param.ID}"/>
                                                <div class="form-group">
                                                    <label class="col-form-label">整枝方式:</label>
                                                    <input type="text" class="form-control" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('pruningForm', 'pruningTbody', 'pruningModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>




                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#shuguo" aria-expanded="false" aria-controls="shuguo">
                                疏果记录
                            </button>
                        </h5>
                    </div>
                    <div id="shuguo" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">疏果方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="shuguoTbody">
                                <c:forEach items="${shuguoRecordList}" var="shuguo" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${shuguo.method}</td>
                                        <td>${shuguo.operator}</td>
                                        <jsp:useBean id="shuguoTime" class="java.util.Date"/>
                                        <c:set target="${shuguoTime}" property="time" value="${shuguo.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${shuguoTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#shuguoModal">
                                    新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="shuguoModal" tabindex="-1" role="dialog"
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
                                            <form id="shuguoForm" action="/produce-task/addShuguoRecord">
                                                <input name="produceTaskID" value="${param.ID}"/>
                                                <div class="form-group">
                                                    <label class="col-form-label">蔬果方式:</label>
                                                    <input type="text" class="form-control" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('shuguoForm', 'shuguoTbody', 'shuguoModal')">添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>







                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#pollination" aria-expanded="false" aria-controls="pollination">
                                授粉记录
                            </button>
                        </h5>
                    </div>
                    <div id="pollination" class="collapse" aria-labelledby="<br>headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">授粉方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="pollinationTbody">
                                <c:forEach items="${pollinationList}" var="pollination" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${pollination.method}</td>
                                        <td>${pollination.operator}</td>
                                        <jsp:useBean id="pollinationTime" class="java.util.Date"/>
                                        <c:set target="${pollinationTime}" property="time"
                                               value="${pollination.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${pollinationTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#pollinationModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="pollinationModal" tabindex="-1" role="dialog"
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
                                            <form id="pollinationForm" action="/produce-task/addPollination">
                                                <input name="produceTaskID" value="${param.ID}"/>
                                                <div class="form-group">
                                                    <label class="col-form-label">授粉方式:</label>
                                                    <input type="text" class="form-control" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('pollinationForm', 'pollinationTbody', 'pollinationModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>










                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#fertilization" aria-expanded="false" aria-controls="fertilization">
                                施肥信息
                            </button>
                        </h5>
                    </div>
                    <div id="fertilization" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">使用肥料</th>
                                    <th scope="col">施肥方式</th>
                                    <th scope="col">使用量</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="fertilizationTbody">
                                <c:forEach items="${fertilizationList}" var="fertilization" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>
                                            <a href="/肥料?fertilizerID=${fertilization.fertilizerID}">${fertilization.fertilizerName}</a>
                                        </td>
                                        <td>${fertilization.method}</td>
                                        <td>${fertilization.useAmount}</td>
                                        <td>${fertilization.operator}</td>
                                        <jsp:useBean id="fertilizationTime" class="java.util.Date"/>
                                        <c:set target="${fertilizationTime}" property="time"
                                               value="${fertilization.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${fertilizationTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#fertilizationModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="fertilizationModal" tabindex="-1" role="dialog"
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
                                            <form id="fertilizationForm" action="/produce-task/addShuguoRecord">
                                                <input name="produceTaskID" value="${param.ID}"/>
                                                <div class="form-group">
                                                    <label class="col-form-label">使用肥料:</label>
                                                    <input type="text" class="form-control" alt="使用肥料" name="fertilizerName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">施肥方式:</label>
                                                    <input type="text" class="form-control" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">使用量:</label>
                                                    <input type="text" class="form-control" name="useAmount">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary" onclick="postData('fertilizationForm', 'fertilizationTbody', 'fertilizationModal')">添加</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>













                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#anti_disease_pest" aria-expanded="false"
                                    aria-controls="anti_disease_pest">
                                病虫害防治
                            </button>
                        </h5>
                    </div>
                    <div id="anti_disease_pest" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">病虫害名</th>
                                    <th scope="col">危害级别</th>
                                    <th scope="col">使用农药</th>
                                    <th scope="col">预防目的</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="antiDiseasePestTbody">
                                <c:forEach items="${antiDiseasePestList}" var="antiDiseasePest" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${antiDiseasePest.dpName}</td>
                                        <td>${antiDiseasePest.harmLevel}</td>
                                        <td>
                                            <a href="/农药?pesticideID=${antiDiseasePest.pesticideID}">${antiDiseasePest.pesticideName}</a>
                                        </td>
                                        <td>${antiDiseasePest.aimTo}</td>
                                        <td>${antiDiseasePest.operator}</td>
                                        <jsp:useBean id="antiDiseasePestTime" class="java.util.Date"/>
                                        <c:set target="${antiDiseasePestTime}" property="time"
                                               value="${antiDiseasePest.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${antiDiseasePestTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#antiDiseasePestModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="antiDiseasePestModal" tabindex="-1" role="dialog"
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
                                            <form id="antiDiseasePestForm" action="/produce-task/addAntiDiseasePest">
                                                <input type="text" value="${task.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">病虫害名:</label>
                                                    <input type="text" class="form-control" name="dpName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">危害级别:</label>
                                                    <select class="form-control" name="harmLevel">
                                                        <option value="可忽略">可忽略</option>
                                                        <option value="轻度危害" selected>轻度危害</option>
                                                        <option value="中度危害">中度危害</option>
                                                        <option value="严重危害">严重危害</option>

                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">使用农药:</label>
                                                    <input type="text" class="form-control" name="pesticideID">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">使用农药:</label>
                                                    <input type="text" class="form-control" name="pesticideName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">预防目的:</label>
                                                    <input type="text" class="form-control" name="aimTo">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">预防方式:</label>
                                                    <input type="text" class="form-control" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('antiDiseasePestForm', 'antiDiseasePestTbody', 'antiDiseasePestModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>




                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#weed" aria-expanded="false" aria-controls="weed">
                                杂草管理
                            </button>
                        </h5>
                    </div>
                    <div id="weed" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">杂草</th>
                                    <th scope="col">除草方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="weedTbody">
                                <c:forEach items="${weedList}" var="weed" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${weed.weedName}</td>
                                        <td>${weed.method}</td>
                                        <td>${weed.operator}</td>
                                        <jsp:useBean id="weedTime" class="java.util.Date"/>
                                        <c:set target="${weedTime}" property="time" value="${weed.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${weedTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#weedModal">
                                    新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="weedModal" tabindex="-1" role="dialog"
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
                                            <form id="weedForm" action="/produce-task/addWeed">
                                                <input type="text" value="${task.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">杂草:</label>
                                                    <input type="text" class="form-control" name="weedName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">除草方式:</label>
                                                    <input type="text" class="form-control" alt="除草方式" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('weedForm', 'weedTbody', 'weedModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>










                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#irrigation" aria-expanded="false" aria-controls="irrigation">
                                灌溉信息
                            </button>
                        </h5>
                    </div>
                    <div id="irrigation" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">水源</th>
                                    <th scope="col">灌溉方式</th>
                                    <th scope="col">其他方式</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="irrigationTbody">
                                <c:forEach items="${irrigationList}" var="irrigation" varStatus="pos">
                                    <tr>
                                        <td>${pos.count}</td>
                                        <td>${irrigation.waterSource}</td>
                                        <td>${irrigation.method}</td>
                                        <td>${irrigation.otherWay}</td>
                                        <td>${irrigation.operator}</td>
                                        <jsp:useBean id="irrigationTime" class="java.util.Date"/>
                                        <c:set target="${irrigationTime}" property="time"
                                               value="${irrigation.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${irrigationTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#irrigationModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="irrigationModal" tabindex="-1" role="dialog"
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
                                            <form id="irrigationForm" action="/produce-task/addIrrigation">
                                                <input type="text" value="${task.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">水源:</label>
                                                    <input type="text" class="form-control" name="waterSource">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">灌溉方式:</label>
                                                    <input type="text" class="form-control" name="method">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">其他方式:</label>
                                                    <input type="text" class="form-control" name="otherWay">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('irrigationForm', 'irrigationTbody', 'irrigationModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>










                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#product_pick" aria-expanded="false" aria-controls="product_pick">
                                采摘信息
                            </button>
                        </h5>
                    </div>
                    <div id="product_pick" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
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
                                               value="${productPick.operateDate}"/>
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
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
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
                </div>








                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#product_pack" aria-expanded="false" aria-controls="product_pack">
                                产品包装
                            </button>
                        </h5>
                    </div>
                    <div id="product_pack" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">产品名</th>
                                    <th scope="col">包装号码</th>
                                    <th scope="col">包装数量</th>
                                    <th scope="col">包装材料</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="productPackTbody">
                                <c:forEach items="${productPackList}" var="productPack" varStatus="pos">
                                    <tr>
                                        <th scope="row">${pos.count}</th>
                                        <td>${productPack.productName}</td>
                                        <td>${productPack.packingNO}</td>
                                        <td>${productPack.packingCount}</td>
                                        <td>${productPack.material}</td>
                                        <td>${productPack.operator}</td>
                                        <jsp:useBean id="productPackTime" class="java.util.Date"/>
                                        <c:set target="${productPackTime}" property="time"
                                               value="${productPack.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${productPackTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#productPackModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="productPackModal" tabindex="-1" role="dialog"
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
                                            <form id="productPackForm" action="/produce-task/addProductPack">
                                                <input type="text" value="${task.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">产品名:</label>
                                                    <input type="text" class="form-control" name="productName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">包装号码:</label>
                                                    <input type="text" class="form-control" name="packingNO">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">包装数量:</label>
                                                    <input type="text" class="form-control" name="packingCount">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">包装材料:</label>
                                                    <input type="text" class="form-control" name="material">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('productPackForm', 'productPackTbody', 'productPackModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>










                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#product_check" aria-expanded="false" aria-controls="product_check">
                                产品检测信息
                            </button>
                        </h5>
                    </div>
                    <div id="product_check" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">检测依据/项目</th>
                                    <th scope="col">检测结果</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">日期</th>
                                </tr>
                                </thead>
                                <tbody id="productCheckTbody">
                                <c:forEach items="${productCheckList}" var="productCheck" varStatus="pos">
                                    <tr>
                                        <th scope="row">${pos.count}</th>
                                        <td>${productCheck.item}</td>
                                        <td>${productCheck.result}</td>
                                        <td>${productCheck.operator}</td>
                                        <jsp:useBean id="productCheckTime" class="java.util.Date"/>
                                        <c:set target="${productCheckTime}" property="time"
                                               value="${productCheck.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${productCheckTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#productCheckModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="productCheckModal" tabindex="-1" role="dialog"
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
                                            <form id="productCheckForm" action="/produce-task/addProductCheck">
                                                <input type="text" value="${task.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">检测依据/项目:</label>
                                                    <input type="text" class="form-control" name="sampleID">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">检验结论:</label>
                                                    <input type="text" class="form-control" name="result">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary" onclick="postData('productCheckForm', 'productCheckTbody', 'productCheckModal')">添加</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>









                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#check_report" aria-expanded="false" aria-controls="check_report">
                                检验报告
                            </button>
                        </h5>
                    </div>
                    <div id="check_report" class="collapse" aria-labelledby="headingThree"
                         data-parent="#accordionExample">
                        <div class="card-body">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">序号</th>
                                    <th scope="col">样品编号</th>
                                    <th scope="col">产(样)品名称</th>
                                    <th scope="col">受(送)检单位</th>
                                    <th scope="col">检验类别</th>
                                    <th scope="col">检验依据</th>
                                    <th scope="col">检验结论</th>
                                    <th scope="col">操作人</th>
                                    <th scope="col">时间</th>
                                </tr>
                                </thead>
                                <tbody id="checkReportTbody">
                                <c:forEach items="${checkReportList}" var="checkReport" varStatus="pos">
                                    <tr>
                                        <th scope="row">${pos.count}</th>
                                        <td>${checkReport.sampleID}</td>
                                        <td>${checkReport.sampleName}</td>
                                        <td>${checkReport.institution}</td>
                                        <td>${checkReport.checkType}</td>
                                        <td>${checkReport.accordingTo}</td>
                                        <td>${checkReport.result}</td>
                                        <td>${checkReport.operator}</td>
                                        <jsp:useBean id="checkReportTime" class="java.util.Date"/>
                                        <c:set target="${checkReportTime}" property="time"
                                               value="${checkReport.operateDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${checkReportTime}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="text-left">
                                <button class="btn btn-sm btn-primary" data-toggle="modal"
                                        data-target="#checkReportModal">新增记录
                                </button>
                            </div>

                            <div class="modal fade" id="checkReportModal" tabindex="-1" role="dialog"
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
                                            <form id="checkReportForm" action="/produce-task/addCheckReport">
                                                <input type="text" value="${task.ID}" name="produceTaskID">
                                                <div class="form-group">
                                                    <label class="col-form-label">样品编号:</label>
                                                    <input type="text" class="form-control" alt="样品编号" name="sampleID">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">产(样)品名称:</label>
                                                    <input type="text" class="form-control" name="sampleName">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">受(送)检单位:</label>
                                                    <input type="text" class="form-control" name="institution">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">检验类别:</label>
                                                    <input type="text" class="form-control" name="checkType">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">检验依据:</label>
                                                    <input type="text" class="form-control" name="accordingTo">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">检验结论:</label>
                                                    <input type="text" class="form-control" alt="检验结论" name="result">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">操作人:</label>
                                                    <input type="text" class="form-control" alt="操作人" name="operator">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-form-label">日期:</label>
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('checkReportForm', 'checkReportTbody', 'checkReportModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>







                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0">
                            <button class="btn btn-link collapsed" type="button" data-toggle="collapse"
                                    data-target="#sell_info" aria-expanded="false" aria-controls="sell_info">
                                销售流向信息
                            </button>
                        </h5>
                    </div>
                    <div id="sell_info" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
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
                                        <th scope="row">${pos.count}</th>
                                        <td>${sellInfo.productName}</td>
                                        <td>${sellInfo.sellTo}</td>
                                        <td>${sellInfo.amount}</td>
                                        <td>${sellInfo.unit}</td>
                                        <td>${sellInfo.wrapMethod}</td>
                                        <td>${sellInfo.conveyMethod}</td>
                                        <td>${sellInfo.operator}</td>
                                        <jsp:useBean id="sellInfoTime" class="java.util.Date"/>
                                        <c:set target="${sellInfoTime}" property="time" value="${sellInfo.sellDate}"/>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${sellInfoTime}"/>
                                        </td>
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
                                                <input type="text" value="${task.ID}" name="produceTaskID">
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
                                                    <input type="text" class="form-control" alt="日期" name="operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postData('sellInfoForm', 'sellInfoTbody', 'sellInfoModal')">
                                                添加
                                            </button>
                                        </div>
                                    </div>
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
