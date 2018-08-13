<%--
  Created by IntelliJ IDEA.
  User: xanarry
  Date: 2018/7/16
  Time: 16:32
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
            width: 100%;
            height: 92%;
            overflow: hidden;
            margin:0;
            font-family:"微软雅黑";
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=kwRr3s6Wwam0MhvYItjsv4qiQm900eUO"></script>
    <script>
        function savePoints() {
            var postData = [];
            $('#pointList div.list-group-item').each(function () {
                var valList = $(this).find(".val");
                if (valList.length != 3) {
                    alert("名称不能为空");
                    return
                } else {
                    postData.push({
                        "longitude": valList[0].innerText.replace("经度:", "").trim(),
                        "latitude": valList[1].innerText.replace("纬度:", "").trim(),
                        "areaBlock": valList[2].innerText.trim()
                    })
                }
            });

            $.ajax({
                url: "/area-block/add",
                data: JSON.stringify(postData),
                contentType: "application/json; charset=utf-8",
                method: "POST",
                dataType: "json",
                success: function (res) {
                    console.log(res);
                    if (res.result == "success") {
                        alert("保存成功");
                    } else {
                        alert(res.result);
                    }
                    window.location.href="/area-block";
                },
                error: function (res) {
                    
                }
            });
            console.log(postData);
        }
    </script>
</head>
<body>

<jsp:include page="../common/nav-top.jsp"/>

<div class="container-fluid">
    <div class="row">
        <jsp:include page="leftMenu.jsp"/>
        <main class="offset-2 col" style="padding: 0px">
            <div id="allmap"></div>
        </main>

        <div class="col-2" style="padding: 0px">
            <ul id="pointList" class="list-group list-group-flush">
                <li class="list-group-item active">新增生产区列表</li>

               <%--
               js动态添加的列表项目
               <div class="list-group-item flex-column align-items-start">
                    <h6 class="mb-1 val">经度: 112.2456155</h6>
                    <h6 class="mb-1 val">纬度: 45.4525512</h6>
                    <h6 class="mb-1 val">
                        <div class="form-inline">
                            <div class="form-group">
                                <label>名称:&nbsp;</label>
                                <input placeholder="请输入地点名称">
                            </div>
                        </div>
                    </h6>
                </div>
                --%>

                <li id="saveBtn" class="list-group-item">
                    <div class="text-center">
                        <button class="btn btn-primary" onclick="savePoints()">保存以上地点</button>
                    </div>
                </li>

            </ul>
        </div>
    </div>
    </div>
</div>

</body>
</html>

<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    var points = [];
    map.addEventListener("click",function(e){
        if(Object.keys(points).length < 5) {
            marker = new BMap.Marker(e.point, {
                enableDragging: true,
                raiseOnDrag: true
            }); // 创建标注

            marker.addEventListener('dragend', function(e){
                var oldKey = e.currentTarget.LA.lng + "" + e.currentTarget.LA.lat;

                var item = points[oldKey];
                delete points[oldKey];
                var newKey = e.point.lng + "" + e.point.lat;
                points[newKey] = item;

                $("#" + item.ID + " .mb-1").each(function () {
                    if ($(this).html().indexOf("经度") != -1) {
                        $(this).html("经度: " + e.point.lng);
                    }
                    if ($(this).html().indexOf("纬度") != -1) {
                        $(this).html("纬度: " + e.point.lat);
                    }

                });
            });


            map.addOverlay(marker);// 将标注添加到地图中

            //将点放到数组中
            var pkey = "point" + Object.keys(points).length;
            points[e.point.lng + "" + e.point.lat] = {"ID": pkey, "point": e.point};
            //添加元素到html中
            $('#saveBtn').before("<div id=\"" + pkey + "\" class=\"list-group-item flex-column align-items-start\">\n" +
                "<h6 class=\"mb-1 val\">经度: " + e.point.lng + "</h6>\n" +
                "<h6 class=\"mb-1 val\">纬度: " + e.point.lat + "</h6>\n" +
                "<h6 class=\"mb-1\">\n" +
                "<div class=\"form-inline\">\n" +
                "<div class=\"form-group\"><label>名称:&nbsp;</label><input placeholder=\"请输入地点名称\"></div>\n" +
                "</div>\n" +
                "</h6>\n" +
                "</div>");

            $('#pointList').on('keydown', 'input', function(e) {
                if (e.keyCode == 13) {
                    $(this).parent().html("<label>名称:&nbsp;</label><lable  class=\"val\" onclick=\"changeLabelToInput(this)\">" + $(this).val() + "</lable>");
                }
            });
        }
    });




    var cdPoint = new BMap.Point(104.063707,30.678633);

    /* var marker = new BMap.Marker(cdPoint);  // 创建标注
     map.addOverlay(marker);              // 将标注添加到地图中
     var opts = {
         width : 200,     // 信息窗口宽度
         height: 100,     // 信息窗口高度
         title : "海底捞王店"  // 信息窗口标题
     };
     var cdinfoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
     marker.addEventListener("click", function(){
         map.openInfoWindow(cdinfoWindow,cdPoint); //开启信息窗口
     });



     var cqPoint = new BMap.Point(106.482952,29.59523);
     var marker = new BMap.Marker(cqPoint);  // 创建标注
     map.addOverlay(marker);              // 将标注添加到地图中

     var opts = {
         width : 200,     // 信息窗口宽度
         height: 100,     // 信息窗口高度
         title : "海底捞王店"  // 信息窗口标题
     };
     var cqinfoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
     marker.addEventListener("click", function(){
         map.openInfoWindow(cqinfoWindow,cqPoint); //开启信息窗口
     });




 */

    map.centerAndZoom(cdPoint, 7);

    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放







    function changeLabelToInput(that) {
        $(that).parent().html("<label>名称:&nbsp;</label><input value=\"" + $(that).html() + "\">");
        $('#pointList').on('keydown', 'input', function(e) {
            if (e.keyCode == 13) {
                $(this).parent().html("<label>名称:&nbsp;</label><lable  class=\"val\" onclick=\"changeLabelToInput(this)\">" + $(this).val() + "</lable>");
            }
        })
    }
   
   $('input').keydown(function (e) {
       if (e.keyCode == 13) {
           $(this).parent().html("<label>名称:&nbsp;</label><lable class=\"val\" onclick=\"changeLabelToInput(this)\">" + $(this).val() + "</lable>");
       }
   })
    
    
</script>
