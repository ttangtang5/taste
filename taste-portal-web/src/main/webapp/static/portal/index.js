/**
 * 首页内容加载
 */
var IndexContent = function (){

    /**
     * 初始化首页大轮播图内容
     */
    var initIndexContent = function (){
        $.ajax({
            type : 'post',
            url : ctx+'/content/IndexsLideshow',
            dataType : 'json',
            success : function(data){
                for(var i = 0; i < data.length; i++){
                    $(".ls-bg")[i].src = rootPathStatic+data[i].picture;
                }
            }
        });
    };

    /**
     * 初始化新品内容
     */
    var initIndexNewProduct = function(){
        $.ajax({
            type : 'post',
            url : ctx+'/content/NewProduct',
            dataType : 'json',
            success : function(data){
                for(var i = 0; i < data.length; i++){
                    if(data[i].dishes.dishesName == undefined){
                        continue;
                    }
                    $(".imgNewProduct")[i].src = rootPathStatic+data[i].picture;
                    $(".newProductZoom")[i].href=rootPathStatic+data[i].picture;
                    $(".aNewProduct")[i].innerHTML = data[i].dishes.dishesName;
                    $(".priceNewProduct")[i].innerHTML = '￥'+ data[i].dishes.dishesPrice;
                }
            }
        });
    }

    /**
     * 初始化推荐内容
     */
    var initIndexRecommend = function(){
        $.ajax({
            type : 'post',
            url : ctx+'/content/Recommend',
            dataType : 'json',
            success : function(data){
                for(var i = 0; i < data.length; i++){
                    $(".imgRecommend")[i].src = rootPathStatic+data[i].picture;
                    if(i > 2){
                        $(".aRecommend")[i-3].innerHTML = data[i].dishes.dishesName;
                        $(".priceRecommend")[i-3].innerHTML = '￥'+ data[i].dishes.dishesPrice;
                        $(".recommendZoom")[i-3].href = rootPathStatic+data[i].picture;
                    }
                }
            }
        });
    }

    /**
     * 搜索框
     */
    $("#search").click(function(){
        var url = ctx+"/search?word=" + encodeURIComponent(document.getElementById("keyWord").value);
        //var url = ctx+"/search/addDishesIndex";
        window.location.href = url;
    });

    return {
        init : function (){
            initIndexContent();
            initIndexNewProduct();
            initIndexRecommend();
        }
    };
}();