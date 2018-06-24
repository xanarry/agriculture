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
        function prepareDelete(loginName) {
            console.log(loginName);
            $("#deleteLink").attr("href", "/user/delete?loginName=" + loginName);
        }

        function prepareEdit(loginName, name, email, phone, role, type) {
            $("#name").val(name);
            $("#email").val(email);
            $("#phone").val(phone);
            $("#role").val(role);
            $("#loginName").val(loginName);
            $("#type").val(type);
            if (role != "操作员") {
                $("#typeElement").hide();
            } else {
                $("#typeElement").show();
            }
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
                    <th class="text-center">登录名</th>
                    <th class="text-center">姓名</th>
                    <th class="text-center">角色</th>
                    <th class="text-center">类型</th>
                    <th class="text-center">邮箱</th>
                    <th class="text-center">电话</th>
                    <th class="text-center">隶属</th>
                    <th class="text-center">登录次数</th>
                    <th class="text-center">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userList}" var="user" varStatus="pos">
                    <tr>
                        <td class="text-center" style="vertical-align: middle"><a
                                href="/user/detail/${user.loginName}">${user.loginName}</a></td>
                        <td class="text-center" style="vertical-align: middle">${user.name}</td>
                        <td class="text-center" style="vertical-align: middle">${user.role}</td>
                        <td class="text-center" style="vertical-align: middle">${user.type}</td>
                        <td class="text-center" style="vertical-align: middle">${user.email}</td>
                        <td class="text-center" style="vertical-align: middle">${user.phone}</td>
                        <td class="text-center" style="vertical-align: middle"><a href="/user/detail/${user.ID}">${user.leaderName}</a></td>
                        <td class="text-center" style="vertical-align: middle">${user.loginCount}</td>
                        <td class="text-center" style="vertical-align: middle">
                            <a href="#" class="badge badge-primary" data-toggle="modal" data-target="#editModal"
                               onclick="prepareEdit('${user.loginName}', '${user.name}', '${user.email}','${user.phone}', '${user.role}', '${user.type}')">编辑</a>
                            <a href="#" class="badge badge-danger" data-toggle="modal" data-target="#deleteModal"
                               onclick="prepareDelete('${user.loginName}')">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>


            <div class="text-right">
                <a class="btn btn-primary" href="/user/add">新增用户</a>
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
                            <a id="deleteLink" href="/user/delete" class="btn btn-danger">继续删除</a>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="editModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">用户信息修改</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="/user/update" style="margin-bottom: 0em">
                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">登录名</span>
                                    <div class="col-10">
                                        <input type="text" name="loginName" id="loginName" class="form-control" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">用户名</span>
                                    <div class="col-10">
                                        <input type="text" name="name" id="name" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">电话</span>
                                    <div class="col-10">
                                        <input type="text" name="phone" id="phone" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">邮箱</span>
                                    <div class="col-10">
                                        <input type="text" name="email" id="email" class="form-control">
                                    </div>
                                </div>


                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">身份</span>
                                    <div class="col-10">
                                        <select class="form-control" name="role" id="role">
                                            <option selected>请选择</option>
                                            <c:forEach items="${roleList}" var="role" varStatus="pos">
                                                <option value="${role}">${role}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row" id="typeElement">
                                    <span class="col-2 col-form-label text-right">类型</span>
                                    <div class="col-10">
                                        <select class="form-control" name="type" id="type">
                                            <option selected>请选择</option>
                                            <c:forEach items="${typeList}" var="type" varStatus="pos">
                                                <option value="${type}">${type}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="text-right">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary">保存修改</button>
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