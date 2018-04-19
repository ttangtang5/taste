var map = new BMap.Map("gmap_geocoding");
//浏览器定位
var point = new BMap.Point(116.331398,39.897445);
map.centerAndZoom(point,12);

var geoc = new BMap.Geocoder();
var geolocation = new BMap.Geolocation();
geolocation.getCurrentPosition(function(r){
    if(this.getStatus() == BMAP_STATUS_SUCCESS){
        var mk = new BMap.Marker(r.point);
        map.addOverlay(mk);
        map.panTo(r.point);
        geoc.getLocation(r.point, function(rs){
            var addComp = rs.addressComponents;
            $("#suggestId").val(addComp.province + "" + addComp.city + "" + addComp.district + "" + addComp.street + "" + addComp.streetNumber);
        });
    }
    else {
        alert('failed'+this.getStatus());
    }
},{enableHighAccuracy: true})
map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
map.enableContinuousZoom();

//地址解析
map.addEventListener("click", function(e){
    var pt = e.point;
    map.clearOverlays();
    map.centerAndZoom(pt, 18);
    var marker = new BMap.Marker(e.point);        // 创建标注
    map.addOverlay(marker);
    geoc.getLocation(pt, function(rs){
        var addComp = rs.addressComponents;
        $("#suggestId").val(addComp.province + "" + addComp.city + "" + addComp.district + "" + addComp.street + "" + addComp.streetNumber);
    });
});

//搜索
// 百度地图API功能
function G(id) {
    return document.getElementById(id);
}


map.addControl(new BMap.NavigationControl());
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
    str = "FromItem<br/>index = " + e.fromitem.index + "<br/>value = " + value;

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