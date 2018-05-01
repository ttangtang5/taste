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
var flag;
function bdGEO(){
    adds = [];
    adds.push($("#suggestId").val());
    var add = adds[index];
    geocodeSearch(add);
    if(flag){
        return true;
    }
    return false;
}
function geocodeSearch(add){
    myGeo.getPoint(add,function(point){
        if (point) {
            var address = new BMap.Point(point.lng, point.lat);
            var pointB = new BMap.Point(point.lng,point.lat);  // 创建点坐标B 地址逆解析的地址
            var  distance = (map.getDistance(pointA,pointB)).toFixed(2);//两点距离
            console.info('distance '+Number(distance));
            if(Number(distance) > 1500){
                flag = false;
                console.info('1:'+flag);
            }
            addMarker(address,new BMap.Label(index+":"+add,{offset:new BMap.Size(20,-10)}));
            flag = true;
            console.info('2:'+flag);
        }
    }, "长沙市");
}
// 编写自定义函数,创建标注
function addMarker(point,label){
    var marker = new BMap.Marker(point);
    map.addOverlay(marker);
    marker.setLabel(label);
}