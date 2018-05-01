<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="${ctxStatic}/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link id="style_color" href="${ctxStatic}/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css"/>
    <link href="${ctxStatic}/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>

</head>
<body>
<div class="page-container">
    <!-- BEGIN CONTENT -->
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            Widget settings form goes here
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn blue">Save changes</button>
                            <button type="button" class="btn default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                <!-- BEGIN  PORTLET-->
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-gift"></i>地图定位
                        </div>
                    </div>
                    <div class="portlet-body">
                        <%--<form class="form-inline margin-bottom-10" action="#">--%>
                            <div class="input-group">
                                <input type="text"  style="width: 500px;" class="form-control" id="suggestId" placeholder="请输入地址...">
                                <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
                                <span class="input-group-btn">
                                <button class="btn blue" id="gmap_geocoding_btn" onclick="bdGEO()">确定</button>
                                 </span>
                            </div>
                        <%--</form>--%>
                        <div id="gmap_geocoding" class="gmaps" style="height: 500px">

                    </div>
                </div>
                <!-- END GEOCODING PORTLET-->
            </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    <!-- END CONTENT -->
</div>
<!--[if lt IE 9]>
<script src="${ctxStatic}/assets/global/plugins/respond.min.js"></script>
<script src="${ctxStatic}/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${ctxStatic}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${ctxStatic}/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="${ctxStatic}/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${ctxStatic}/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KYFfLcoc56IA3rEv6MFQY7SRLIXirxM9"></script>
<script>
    jQuery(document).ready(function() {
        // initiate layout and plugins
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        QuickSidebar.init(); // init quick sidebar
        Demo.init(); // init demo features
    });

    var map = new BMap.Map("gmap_geocoding",{minZoom:17,maxZoom:20});
    var point = new BMap.Point(113.033449,28.253733);
    map.enableScrollWheelZoom(true);
    map.centerAndZoom(point,6);
    var marker = new BMap.Marker(point);        // 创建标注
    map.addOverlay(marker);
    map.centerAndZoom(point,18);
    var pointA = new BMap.Point(113.033449,28.253733);  // 创建点坐标中心  维智

    //单击获取点击的经纬度
    map.addEventListener("click",function(e){
        var pointB = new BMap.Point(e.point.lng,e.point.lat);  // 创建点坐标B 鼠标点击的地方
        alert('两点距离是：'+(map.getDistance(pointA,pointB)).toFixed(2)+' 米。');
    });

    var geoc = new BMap.Geocoder();

    map.addEventListener("click", function(e){
        var pt = e.point;
        geoc.getLocation(pt, function(rs){
            var addComp = rs.addressComponents;
            alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
        });
    });

    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }
    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "suggestId"
            ,"location" : map
        });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        local.search(myValue);
    }


    // 百度地图API功能
    var myGeo = new BMap.Geocoder();
    var index = 0;
    var adds = [];
    function bdGEO(){
        adds = [];
        adds.push($("#suggestId").val());
        var add = adds[index];
        geocodeSearch(add);
    }
    function geocodeSearch(add){
        myGeo.getPoint(add, function(point){
            if (point) {
                var address = new BMap.Point(point.lng, point.lat);
                addMarker(address,new BMap.Label(index+":"+add,{offset:new BMap.Size(20,-10)}));
                var pointB = new BMap.Point(point.lng,point.lat);  // 创建点坐标B 鼠标点击的地方
                alert('两点距离是：'+(map.getDistance(pointA,pointB)).toFixed(2)+' 米。');
            }
        }, "长沙市开福区长沙大学");
    }
    // 编写自定义函数,创建标注
    function addMarker(point,label){
        var marker = new BMap.Marker(point);
        map.addOverlay(marker);
        marker.setLabel(label);
    }
</script>
</body>
<!-- END BODY -->
</html>