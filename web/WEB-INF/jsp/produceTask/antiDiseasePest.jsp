<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-24
  Time: 下午8:12
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
            $('#operateDate').datetimepicker({
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
                    病虫害防治
                </h5>
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
                                    <a href="/material/pesticide/?pesticideID=${antiDiseasePest.pesticideID}">${antiDiseasePest.pesticideName}</a>
                                </td>
                                <td>${antiDiseasePest.aimTo}</td>
                                <td>${antiDiseasePest.operator}</td>
                                <td>${antiDiseasePest.operateDate}</td>
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
                                        <input type="text" value="${param.ID}" name="produceTaskID">
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
                                            <input type="text" class="form-control" alt="日期" name="operateDate" id="operateDate" data-toggle="datetimepicker"
                                                   data-target="#operateDate">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                    </button>
                                    <button type="button" class="btn btn-primary"
                                            onclick="postProduceTaskData('antiDiseasePestForm', 'antiDiseasePestTbody', 'antiDiseasePestModal')">
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
