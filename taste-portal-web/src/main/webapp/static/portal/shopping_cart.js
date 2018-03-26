/**
 * 购物车js实现
 */
var ShoppingCart = function() {

    /**
     * 购物车移除物品
     */
    $(".del-goods").click(function() {
        delClick();
    });

    /**
     * 删除事件处理
     */
    var delClick = function (){
        var target = event.target;
        var li = $(target).parent();
        var price = li.find("em").html().substr(1);
        li.remove();
        //$(this).parent()等同$(target).parent()
        var num = $("#top-cart-info-count").html();
        var value = $("#top-cart-info-value").html();
        $("#top-cart-info-count").html(""+(--num)+"");
        $("#top-cart-info-value").html(""+(value-price)+"");
    };

    /**
     * 添加购物车方法一
     */
    $("#add2cart").click(function(){
        //获取cookie
        //cookie返回undefined;
        var value = $.cookie('id11');
        //判断该商品cookie中是否存在
        if(value == undefined){
            $.cookie("id11","2",{ expires: 7,path: '/'});
            var html = $('<li' +
                '                       <a href="shop-item.html"><img src="/static/assets/frontend/pages/img/cart-img.jpg" alt="Rolex Classic Watch" width="37" height="34"></a>' +
                '                       <span class="cart-content-count">x 1</span>' +
                '                       <strong><a href="shop-item.html">Rolex Classic Watch</a></strong>' +
                '                       <em>￥1236.00</em>' +
                '                       <a href="javascript:void(0);" class="del-goods" onclick="ShoppingCart.initClick();">&nbsp;</a>' +
                '               </li>');
            $(".scroller").append(html);
        }else{
            $.cookie("id11",(value+1),{ expires: 7 ,path: '/'});
            var num = $("#top-cart-info-count").html();
            $("#top-cart-info-count").html(""+(++num)+"");
        }
        var target =event.target;
        var price = $(target).parent().find(".pi-price").html().substr(1);
        var value = $("#top-cart-info-value").html();
        $("#top-cart-info-value").html(""+(Number(value)+Number(price))+"");
    });

    /**
     * 添加购物车方法二
     */
    $("#addCart").click(function() {

    });

    return {
        init : function(){

        },
        initClick : function(){
            delClick();
        },
    };



}();