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

    <style type="text/css">
        #allmap {
            width: 99%;
            height: 92%;
            overflow: hidden;
            margin:0;
            font-family:"微软雅黑";
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=kwRr3s6Wwam0MhvYItjsv4qiQm900eUO"></script>

</head>
<body>

<jsp:include page="../common/nav-top.jsp"/>
    <div class="row">
        <jsp:include page="leftMenu.jsp"/>
        <main class="offset-2 col" style="padding: 0px">
            <div id="allmap"></div>
        </main>
    </div>

<div class="modal" id="editModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <form action="/area-block/update" method="post">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">编辑生产区</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="col-form-label">ID:</label>
                    <input type="text" class="form-control"  name="ID" id="abID" readonly>
                </div>
                <div class="form-group">
                    <label class="col-form-label">名称:</label>
                    <input type="text" class="form-control" name="areaBlock" id="abAreaBlock">
                </div>
                <div class="form-group">
                    <label class="col-form-label">面积:</label>
                    <input type="number" class="form-control" name="area" id="abArea">
                </div>
                <div class="form-group">
                    <label class="col-form-label">备注:</label>
                    <input type="text" class="form-control" name="remark" id="abRemark">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">保存修改</button>
            </div>
        </div>
        </form>
    </div>
</div>

</body>
</html>

<script type="text/javascript">

    function editAreaBlock(areaID, areaBlock, area, remark) {
        $('#abID').val(areaID);
        $('#abAreaBlock').val(areaBlock);
        $('#abArea').val(area);
        $('#abRemark').val(remark);
        $('#editModal').modal('show');
    }

    // 百度地图API功能
    var map = new BMap.Map("allmap");

    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放


    $.ajax({
        url: "/area-block/points",
        method: 'GET',
        type: 'json',
        success: function (res) {
            console.log(res);
            var totalLong = 0;
            var totalLat = 0;

            var points = [];
            map.clearOverlays();
            for (var i = 0; i < res.length; i++) {
                (function (x) {
                    //创建标注
                    totalLong += res[i].longitude;
                    totalLat  += res[i].latitude;
                    var pt = new BMap.Point(res[i].longitude, res[i].latitude);
                    points[i] = pt;

                    var marker = new BMap.Marker(pt);
                    map.addOverlay(marker);
                    var label = new BMap.Label(res[i].areaBlock,
                        {
                            offset: new BMap.Size(20, -5)
                        }
                    );

                    marker.setLabel(label);
                    label.setStyle({
                        color: "Black",
                        fontSize: "14px",
                        backgroundColor: "#eeeeee",
                        border: "0"
                    });


                    //创建信息窗口
                    var opts = {
                        width: 150,     // 信息窗口宽度
                        height: 120,     // 信息窗口高度
                        title: "<strong style=\"font-size:16px;font-weight:bold\">" + res[i].areaBlock + "</strong>", // 信息窗口标题
                        enableMessage: true, //设置允许信息窗发送短息
                        message: ""
                    };

                    var deleteLink = "/area-block/delete?areaBlockID=" + res[i].ID;
                    var showInfo =
                        "描述：" + res[i].remark
                        + "<br/>面积：" + res[i].area
                        + "<br/><a href='#' onclick='editAreaBlock(" +  res[i].ID + ", \"" +  res[i].areaBlock + "\", \"" + res[i].area + "\", \"" + res[i].remark + "\")'>编辑</a>&nbsp;&nbsp;<a href='" + deleteLink + "'>刪除</a>"
                    var infoWindow = new BMap.InfoWindow("<div style='height: 100px; overflow-y: scroll'>" + showInfo + "</div>", opts);  // 创建信息窗口对象
                    marker.addEventListener("click", function (e) {
                        marker.openInfoWindow(infoWindow, pt); //开启信息窗口
                    });
                    map.addOverlay(marker);
                })(i);
            }

            var certerLong = totalLong / res.length;
            var certerLat  = totalLat  / res.length;

            var centerPoint = new BMap.Point(certerLong, certerLat);
            map.centerAndZoom(centerPoint, 7);

        },
        error: function (res) {
            alert("请求数据发生错误");
            console.log(res);
        }
        
    });


</script>
