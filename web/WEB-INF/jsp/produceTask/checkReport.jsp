<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-24
  Time: 下午8:13
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
                    检验报告
                </h5>
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
                                        <td>${pos.count}</td>
                                        <td>${checkReport.sampleID}</td>
                                        <td>${checkReport.sampleName}</td>
                                        <td>${checkReport.institution}</td>
                                        <td>${checkReport.checkType}</td>
                                        <td>${checkReport.accordingTo}</td>
                                        <td>${checkReport.result}</td>
                                        <td>${checkReport.operator}</td>
                                        <td>${checkReport.operateDate}</td>
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
                                                <input type="text" value="${param.ID}" name="produceTaskID">
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
                                                    <input type="text" class="form-control" alt="日期" name="operateDate" id="operateDate" data-toggle="datetimepicker"
                                                           data-target="#operateDate">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">取消
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    onclick="postProduceTaskData('checkReportForm', 'checkReportTbody', 'checkReportModal')">
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