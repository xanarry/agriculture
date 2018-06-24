<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-5-21
  Time: 上午9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户详细信息-${user.name}</title>
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
        $(function () {
            $("select#role").change(function () {
                var selectVal = $(this).val();
                console.log(selectVal);
                if (selectVal == "操作员") {
                    $('#type').removeAttr("disabled");
                } else {
                    $('#type').attr("disabled", "disabled")
                    $('#type').val("其他");
                }
            });
        });
    </script>
</head>
<body>

<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="../common/nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="card">
                <div class="card-body" style="padding-bottom: 0rem">
                    <h2>用户信息</h2>
                    <div class="row">
                        <div class="col">
                            <table class="table" style="margin-bottom: 0rem">
                                <tbody>
                                <tr>
                                    <th class="text-right">姓名:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.name}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">登录名:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.loginName}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">邮箱:</th>
                                    <td colspan="2" style="vertical-align: middle">${user.email}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">电话:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.phone}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">身份证号:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.ID}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">角色:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.role}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col">
                            <table class="table" style="margin-bottom: 0rem">
                                <tbody>

                                <tr>
                                    <th class="text-right">创建时间:</th>
                                    <jsp:useBean id="createTime" class="java.util.Date"/>
                                    <c:set target="${createTime}" property="time" value="${user.createTime}"/>
                                    <td colspan="2" style="vertical-align: bottom"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${createTime}" type="both"/></td>
                                </tr>
                                <tr>
                                    <th class="text-right">最后登录:</th>
                                    <jsp:useBean id="lastLoginTime" class="java.util.Date"/>
                                    <c:set target="${lastLoginTime}" property="time" value="${user.lastLoginTime}"/>
                                    <td colspan="2" style="vertical-align: bottom"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${lastLoginTime}"/></td>
                                </tr>
                                <tr>
                                    <th class="text-right">登录次数:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.loginCount}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">登录失败:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.loginCount}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">最后更新:</th>
                                    <jsp:useBean id="lastUpdateTime" class="java.util.Date"/>
                                    <c:set target="${lastUpdateTime}" property="time" value="${user.lastUpdateTime}"/>
                                    <td colspan="2" style="vertical-align: bottom"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${lastUpdateTime}"/></td>
                                </tr>


                                <tr>
                                    <th class="text-right">类型:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.type}</td>
                                </tr>
                                <tr>
                                    <th class="text-right">隶属:</th>
                                    <td colspan="2" style="vertical-align: bottom">${user.leaderName}</td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <br>

            <div class="text-center">
                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">删除</button>
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editModal">修改</button>
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
                            <a id="deleteLink" href="/user/delete?loginName=${user.loginName}" class="btn btn-danger">继续删除</a>
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
                                        <input type="text" name="loginName" id="loginName" value="${user.loginName}" class="form-control" readonly>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">用户名</span>
                                    <div class="col-10">
                                        <input type="text" name="name" id="name" value="${user.name}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">电话</span>
                                    <div class="col-10">
                                        <input type="text" name="phone" id="phone" value="${user.phone}" class="form-control">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <span class="col-2 col-form-label text-right">邮箱</span>
                                    <div class="col-10">
                                        <input type="text" name="email" id="email" value="${user.email}" class="form-control">
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