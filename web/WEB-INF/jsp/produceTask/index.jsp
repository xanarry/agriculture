<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>

<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">

    <br>

    <ul class="list-inline">
        <li class="list-inline-item">
            <a class="btn btn-primary" href="#" data-toggle="modal" data-target="#addModal">新增任务</a>
        </li>
    </ul>



    <div class="card">
        <table class="table table-striped">
            <thead>
            <tr>
                <th class="text-center">任务ID</th>
                <th class="text-center">产品名</th>
                <th class="text-center">产品类型</th>
                <th class="text-center">生产区</th>
                <th class="text-center">状态</th>
                <th class="text-center">创建人</th>
                <td class="text-center">创建时间</td>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${produceTaskList}" var="task" varStatus="pos">
                <tr>
                    <td class="text-center" style="vertical-align: middle"><a
                            href="/produce-task/detail?ID=${task.ID}">${task.ID}</a></td>
                    <td class="text-center" style="vertical-align: middle">${task.productName}</td>
                    <td class="text-center" style="vertical-align: middle">${task.productType}</td>
                    <td class="text-center" style="vertical-align: middle">${task.area}</td>
                    <td class="text-center" style="vertical-align: middle">${task.state}</td>
                    <td class="text-center" style="vertical-align: middle">${task.operator}</td>
                    <jsp:useBean id="createTime" class="java.util.Date"/>
                    <c:set target="${createTime}" property="time" value="${task.createTime}"/>
                    <td class="text-center" style="vertical-align: middle">
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${createTime}"/>
                    </td>
                    <td class="text-center" style="vertical-align: middle">
                        <a href="/purchase/list?taskID=${task.ID}">编辑</a>
                        <a href="#">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="modal fade" id="addModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">新增任务</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="editForm" method="post" action="/produce-task/add" style="margin-bottom: 0em">
                        <input type="text" id="creator" name="creator" value="${sessionScope.user.name}">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label text-right">产品名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="productName" name="productName"
                                       placeholder="任务名, 不允许为空">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label text-right">产品类别</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="productType" name="productType">
                                    <option value="水果">水果</option>
                                    <option value="蔬菜">蔬菜</option>
                                </select>
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label text-right">生产区</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="area" name="area" placeholder="任务名, 不允许为空">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label text-right">生产区块</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="productionAreaBlock" id="productionAreaBlock"
                                        multiple>
                                    <c:forEach items="${produceAreaBlockList}" var="areaBlock" varStatus="pos">
                                        <option value="${areaBlock}">${areaBlock}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label text-right">产品介绍</label>
                            <div class="col-sm-10">
                                <textarea type="text" class="form-control" id="productDetail" name="productDetail"
                                          placeholder="任务名, 不允许为空"></textarea>
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


</div>
</body>

</html>
