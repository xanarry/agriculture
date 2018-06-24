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
        $(document).ready(function () {
            $('#type').change(function () {
                var selected = $(this).children('option:selected').val();
                console.log(selected);
                $("div.materialType").each(function () {
                    var clz = new String($(this).attr("class"));
                    console.log(clz);
                    if (!clz.endsWith(selected)) {
                        $(this).attr("hidden", "true");
                    } else {
                        $(this).removeAttr("hidden");
                    }

                })
            })
        });

        function postForm() {
            $("div .materialType").each(function () {
                console.log(this);
                $(this).
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
            <h3>新增投入品</h3>
            <hr>

            <div class="form-group row">
                <label class="col-2 col-form-label text-right" style="font-weight: bold;">选择类型:</label>
                <div class="col-lg-8">
                    <select class="form-control mb-2" id="type" name="type">
                        <option value="农药" selected>农药</option>
                        <option value="肥料">肥料</option>
                        <option value="种子">种子</option>
                        <option value="兽药">兽药</option>
                        <option value="饲料">饲料</option>
                    </select>
                </div>
            </div>


            <form id="middlemanForm">

                <div class="basic-form">
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">编号:</label>
                        <div class="col-lg-8"><input class="form-control" type="text" id="ID" name="ID"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">名称:</label>
                        <div class="col-lg-8"><input class="form-control" type="text" id="name" name="name"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">生产厂商:</label>
                        <div class="col-8">
                            <select class="form-control" type="text" id="producer" name="producer">
                                <option value="男" selected>男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">规格:</label>
                        <div class="col-8">
                            <input class="form-control" type="text" name="specification">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">型号:</label>
                        <div class="col-lg-8"><input class="form-control" type="text" name="model"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">单位:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="unit"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">适用行业:</label>
                        <div class="col-md-8">
                            <select class="form-control" name="suitFor">
                                <option value="农作物种植业" selected>农作物种植业</option>
                                <option value="林业">林业</option>
                                <option value="畜牧业">畜牧业</option>
                                <option value="渔业">渔业</option>
                                <option value="农林牧渔服务业">农林牧渔服务业</option>
                            </select>
                        </div>
                    </div>
                </div>


                <div class="materialType 农药">
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">农药等级:</label>
                        <div class="col-md-8">
                            <select class="form-control" id="toxicityLevel" name="toxicityLevel">
                                <option value="高毒" selected>高毒</option>
                                <option value="中毒">中毒</option>
                                <option value="低毒">低毒</option>
                                <option value="微毒">微毒</option>
                                <option value="限用">限用</option>
                            </select>
                        </div>
                    </div>

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
                        <div class="col-md-8"><input class="form-control" type="text" name="recommendUseAmount"></div>
                    </div>


                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">农药登记证号:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">停药期:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="stopdays"></div>
                    </div>
                </div>


                <div class="materialType 肥料" hidden>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">推荐稀释倍数:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="recommendDilute"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">推荐亩用量:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="recommendUseAmount"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">肥料登记证号:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                    </div>
                </div>


                <div class="materialType 种子" hidden>
                </div>


                <div class="materialType 兽药" hidden>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">批准文号:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">针对病害:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="aimTo"></div>
                    </div>
                </div>


                <div class="materialType 饲料" hidden>
                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">批准文号:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="licenseNO"></div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2 col-form-label text-right" style="font-weight: bold;">针对病害:</label>
                        <div class="col-md-8"><input class="form-control" type="text" name="aimTo"></div>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-2 col-form-label text-right" style="font-weight: bold;">备注:</label>
                    <div class="col-md-8"><input class="form-control" type="text" name="remark"></div>
                </div>


                <div class="form-group row">
                    <div class="offset-2 col-md-8">
                        <input type="button" class="btn btn-primary" value="保存" onclick="postForm()">
                    </div>
                </div>
            </form>

        </main>
    </div>
</div>
</html>
