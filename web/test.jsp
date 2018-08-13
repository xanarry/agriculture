<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/css/bootstrap/bootstrap-reboot.min.css">


    <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=kwRr3s6Wwam0MhvYItjsv4qiQm900eUO"></script>
    <title>地图展示</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="offset-2 col-8">
            <div id="allmap"></div>
        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");


    var cdPoint = new BMap.Point(104.063707,30.678633);

    var marker = new BMap.Marker(cdPoint);  // 创建标注
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






    map.centerAndZoom(cdPoint, 7);

    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));
    map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
</script>
