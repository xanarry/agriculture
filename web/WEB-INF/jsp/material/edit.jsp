<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 18-6-21
  Time: 上午11:46
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
        function postForm(form) {
            var inputs = $('#' + form).serializeArray();
            var data = {};
            for (var i = 0; i < inputs.length; i++) {
                console.log(inputs[i]);
                data[inputs[i].name] = inputs[i].value;
            }
            console.log($('#' + form).attr('action'));
            console.log(data);
            $.ajax({
                url: $('#' + form).attr('action'),
                method: 'post',
                data: data,
                dataType: 'text',
                success: function (res) {
                    if (res=='success') {
                        $('#' + form + " input").each(function () {
                            $(this).val("");
                        });
                        $('#msgModal').modal('show');
                    } else {
                        $('#msg').html(res);
                        $('#msgModal').modal('show');
                    }
                },
                error: function (res) {
                    console.log(res.responseText);
                    alert("连接服务器发生错误");
                }
                
            })
        }
    </script>
</head>
<body>
<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="nav-left.jsp"/>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="text-center">
                <h4>新增投入品</h4>
            </div>
            <!--标签-->
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="#tab-nongyao" data-toggle="tab">农药</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#tab-feiliao" role="tab" data-toggle="tab">肥料</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#tab-zhongzi" role="tab" data-toggle="tab">种子</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#tab-shouyao" role="tab" data-toggle="tab">兽药</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#tab-siliao" role="tab" data-toggle="tab">饲料</a>
                </li>
            </ul>


            <!--标签的内容-->
            <div class="tab-content">

                <%--农药--%>
                <div class="tab-pane active" id="tab-nongyao">

                    <form class="col-md-8 offset-2" id="pesticideForm" method="post" action="/material/pesticide/add">
                        <br>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">类型:</label>
                            <div class="col-lg-8"><input class="form-control" type="text" value="农药" readonly></div>
                        </div>

                        <jsp:include page="basicFormContent.jsp"/>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">针对病害:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="aimTo"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">推荐稀释倍数:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="recommendDilute"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">剂型:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="preparation"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">亩用量:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="recommendUseAmount">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">农药登记证号:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">停药期:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="stopdays"></div>
                        </div>

                        <div class="text-center">
                            <input type="button" class="btn btn-primary" onclick="postForm('pesticideForm')" value="保存">
                        </div>
                    </form>


                </div>


                <%--肥料--%>
                <div class="tab-pane" id="tab-feiliao">
                    <form class="col-md-8 offset-2" id="fertilizerForm" method="post" action="/material/fertilizer/add">
                        <br>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">类型:</label>
                            <div class="col-lg-8"><input class="form-control" type="text" value="肥料" readonly></div>
                        </div>

                        <jsp:include page="basicFormContent.jsp"/>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">推荐稀释倍数:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="recommendDilute"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">推荐亩用量:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="recommendUseAmount">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">肥料登记证号:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">备注:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="remark"></div>
                        </div>

                        <div class="text-center">
                            <input type="button" class="btn btn-primary" onclick="postForm('fertilizerForm')" value="保存">
                        </div>
                    </form>

                </div>


                <%--种子--%>
                <div class="tab-pane" id="tab-zhongzi">

                    <form class="col-md-8 offset-2" id="seedForm" method="post" action="/material/seed/add">
                        <br>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">类型:</label>
                            <div class="col-lg-8"><input class="form-control" type="text" value="种子" readonly></div>
                        </div>

                        <jsp:include page="basicFormContent.jsp"/>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">备注:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="remark"></div>
                        </div>

                        <div class="text-center">
                            <input type="button" class="btn btn-primary" onclick="postForm('seedForm')" value="保存">
                        </div>
                    </form>
                </div>


                <%--兽药--%>
                <div class="tab-pane" id="tab-shouyao">

                    <form class="col-md-8 offset-2" id="veterinaryDrugForm" method="post" action="/material/veterinary-drug/add">
                        <br>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">类型:</label>
                            <div class="col-lg-8"><input class="form-control" type="text" value="兽药" readonly></div>
                        </div>

                        <jsp:include page="basicFormContent.jsp"/>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">批准文号:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">针对病害:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="aimTo"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">备注:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="remark"></div>
                        </div>

                        <div class="text-center">
                            <input type="button" class="btn btn-primary" onclick="postForm('veterinaryDrugForm')" value="保存">
                        </div>
                    </form>
                </div>


                <%--饲料--%>
                <div class="tab-pane" id="tab-siliao">
                    <form class="col-md-8 offset-2" id="forageForm" method="post" action="/material/forage/add">
                        <br>
                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">类型:</label>
                            <div class="col-lg-8"><input class="form-control" type="text" value="饲料" readonly></div>
                        </div>

                        <jsp:include page="basicFormContent.jsp"/>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">批准文号:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                        </div>

                        <div class="form-group row">
                            <label class="col-2 col-form-label text-right" style="font-weight: bold;">备注:</label>
                            <div class="col-md-8"><input class="form-control" type="text" name="remark"></div>
                        </div>

                        <div class="text-center">
                            <input type="button" class="btn btn-primary" onclick="postForm('forageForm')" value="保存">
                        </div>

                    </form>
                </div>

            </div>



            <%--信息提示modal--%>
            <div class="modal" id="msgModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">提示信息</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="msg">数据保存成功</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">了解</button>
                        </div>
                    </div>
                </div>
            </div>



        </main>
    </div>
</div>
</html>
