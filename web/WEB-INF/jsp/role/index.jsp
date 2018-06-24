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
    <title>用户管理</title>
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
        function prepareDelete(roleName) {
            $("#deleteLink").attr("href", "/role/delete?roleName=" + roleName);
        }

        function prepareEdit(roleName, remark) {
            $("#roleName").val(roleName);
            $("#remark").val(remark);
        }
    </script>
</head>

<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="../common/nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">序号</th>
                    <th class="text-center">角色名</th>
                    <th class="text-center">备注</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${roleList}" var="role" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle">${pos.count}</td>
                        <td class="text-center" style="vertical-align: middle">${role.roleName}</td>
                        <td class="text-center" style="vertical-align: middle">${role.remark}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" class="badge badge-danger" data-toggle="modal" data-target="#deleteModal"
                               onclick="prepareDelete('${role.roleName}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="text-right">
                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#addRoleModal">新增角色</a>
            </div>


            <div class="modal fade" id="deleteModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">重要提示</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>与该用户相关的所有信息即将永久性删除, 是否继续?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
                            <a id="deleteLink" href="/" class="btn btn-danger">继续删除</a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="addRoleModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">重要提示</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body">
                            <form method="post" action="/role/add" style="margin-bottom: 0em">
                                <div class="input-group">
                                    <span class="input-group-addon">名称</span>
                                    <input type="text" name="roleName" id="name" class="form-control">
                                </div>
                                <br>

                                <div class="input-group">
                                    <span class="input-group-addon">备注</span>
                                    <input type="text" name="remark" id="email" class="form-control">
                                </div>
                                <br>
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