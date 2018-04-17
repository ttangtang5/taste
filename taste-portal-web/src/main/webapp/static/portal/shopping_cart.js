/**
 * 购物车js实现
 */
var ShoppingCart = function() {

    /**
     * 首页初始化购物车
     */
    var init = function(){
        //获取cookie中原有的商品列表
        var strCookie = document.cookie;
        var arrCookie = strCookie.split(";");
        var names = new Array();
        var prices = new Array();
        var num = new Array();
        for(var i = 0; i < arrCookie.length; i++){
            var arr = arrCookie[i].split("=");
            if(arr[1] != undefined && arr[1].indexOf(':') != -1){
                names.push(arr[0].trim());
                //prices.push(arr[1].split(':')[1].substr(0,arr[1].split(':')[1].length-1));
                num.push(arr[1].split(':')[0].substr(1));
            }
        }
        $.ajax({
            type : 'post',
            url : ctx+'/shoppingCart/initCart',
            dataType : 'json',
            traditional : true,
            data : {
                goods : names
            },
            success : function (msg){
                if(msg != null){
                    var total = 0;
                    var countNum = 0;
                    for(var i = 0;i < msg.length; i++) {
                        for(var m = 0;m < names.length; m++){
                            if(msg[i].dishesName == names[m]){
                                var html = $('<li' +
                                    '                       <a href="shop-item.html"><img src="'+rootPathStatic+msg[i].picture+'" alt="Rolex Classic Watch" width="37" height="34"></a>' +
                                    '                       <span class="cart-content-count goodsNum" >x ' + num[m] + '</span>' +
                                    '                       <strong><a href="shop-item.html" class="goodsName">' + msg[i].dishesName + '</a></strong>' +
                                    '                       <em>￥' + msg[i].dishesPrice + '</em>' +
                                    '                       <a href="javascript:void(0);" class="del-goods" onclick="ShoppingCart.initClick();">&nbsp;</a>' +
                                    '         </li>');
                                $(".scroller").append(html);
                                countNum = Number(num[m]) + countNum;
                                total = Number(num[m])*Number(msg[i].dishesPrice) + total;
                                break;
                            }
                        }
                    }
                    //更改头购物车的显示
                    $("#top-cart-info-value").html(total);
                    $("#top-cart-info-count").html(countNum);
                }
            }
        });
    }
    /**
     * 首页购物车移除物品
     */
    $(".del-goods").click(function() {
        delClick();
    });

    /**
     * 首页删除事件处理
     */
    var delClick = function (){
        var target = event.target;
        var li = $(target).parent();
        var price = li.find("em").html().substr(1);
        var name = li.find(".goodsName").html().trim();
        console.info($.cookie(name));
        var nums = $.cookie(name).split(":")[0];
        $.cookie(name,'');
        li.remove();
        //$(this).parent()等同$(target).parent()
        var num = $("#top-cart-info-count").html();
        num = Number(num) - Number(nums);
        var value = $("#top-cart-info-value").html();
        value = Number(value) - Number(price)*Number(nums);
        $("#top-cart-info-count").html(num);
        $("#top-cart-info-value").html(value);
    };

    /**
     * 添加购物车方法一
     */
    /*$(".add2cart").click(function(){
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
                '         </li>');
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
    });*/
    $(".add2cart").click(function(obj){
        var target = event.target;
        var goodsName ;
        if($(target).parent().find(".aNewProduct").length != 0){
            goodsName = $(target).parent().find(".aNewProduct").html().trim();
        }else{
            goodsName = $(target).parent().find(".aRecommend").html().trim();
        }
        var price = $(target).parent().find(".pi-price").html().substr(1);
        var image = $(target).parent().find("img")[0].src;
        //将商品id传入后太加入购物车
        $.ajax({
            type : 'post',
            url : ctx+'/shoppingCart/add',
            dataType : 'json',
            data : {
                goodsName : goodsName,
                goodsPrice : price
            },
            success : function (msg){
                var goods = $.cookie(goodsName).split("=");
                //判断该商品cookie中是否存在
                if(msg.isflag == 0){
                    var html = $('<li' +
                        '                       <a href="shop-item.html"><img src="'+image+'" alt="Rolex Classic Watch" width="37" height="34"></a>' +
                        '                       <span class="cart-content-count goodsNum" >x 1</span>' +
                        '                       <strong><a href="shop-item.html" class="goodsName">'+goodsName+'</a></strong>' +
                        '                       <em>￥'+price+'</em>' +
                        '                       <a href="javascript:void(0);" class="del-goods" onclick="ShoppingCart.initClick();">&nbsp;</a>' +
                        '         </li>');
                    $(".scroller").append(html);
                }else{
                    var names= $(".goodsName");
                    //修改存在商品数量
                    for(var i = 0; i < names.length; i++){
                        if(names[i].innerHTML == goodsName){
                            $(".goodsNum")[i].innerHTML = 'x '+goods[0].split(":")[0];
                            break;
                        }
                    }
                    var num = $("#top-cart-info-count").html();
                    $("#top-cart-info-count").html(num);
                }
                //更改头购物车的显示
                var count = $("#top-cart-info-count").html().trim();
                count = Number(count) + 1 ;
                var value = $("#top-cart-info-value").html().trim();
                $("#top-cart-info-count").html(count);
                $("#top-cart-info-value").html(Number(value)+Number(price));
            }
        });
    });

    var initCart = function(){
        $.ajax({
            type : 'post',
            url : ctx+'/shoppingCart/cartDetailShow',
            dataType : 'json',
            success : function(data){
                console.info(data);
                var html = '<tr> ' +
                    '            <td > ' +
                    '                <input type="checkbox"> ' +
                    '            </td> ' +
                    '            <td class="goods-page-image"> ' +
                    '                <a href="javascript:;"><img src="${ctxStatic}/assets/frontend/pages/img/products/model3.jpg" alt="Berry Lace Dress"></a> ' +
                    '            </td> ' +
                    '            <td class="goods-page-ref-no"> ' +
                    '                javc2133 ' +
                    '            </td> ' +
                    '            <td class="goods-page-quantity"> ' +
                    '                <div class="product-quantity"> ' +
                    '                    <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm"> ' +
                    '                </div> ' +
                    '            </td> ' +
                    '            <td class="goods-page-price"> ' +
                    '                <strong><span>$</span>47.00</strong> ' +
                    '            </td> ' +
                    '            <td class="goods-page-total"> ' +
                    '                <strong><span>$</span>47.00</strong> ' +
                    '            </td> ' +
                    '            <td class="del-goods-col"> ' +
                    '                <a class="del-goods" href="javascript:;">&nbsp;</a> ' +
                    '            </td> ' +
                    '        </tr>';
                $("#tableTbody").append(html);
            }
        });
    }


    return {
        init : function(){
            init();
        },
        initClick : function(){
            delClick();
        },
        initCart : function () {
            initCart();
        }
    };



}();