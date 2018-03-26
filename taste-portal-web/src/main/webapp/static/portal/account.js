/**
 * 个人中心页面js
 */
var Account = function (){

    /**
     * 个人中心左侧菜单选择显示
     */
    $(".list-group-item").click(function(){
        var target = event.target;
        $('.list-group-item').removeClass("active");
        if(target.tagName == 'LI'){
            $(target).addClass("active");
            contentForm($(target));
        }else if(target.tagName == 'A'){
            $(target).parent().addClass("active");
            contentForm($(target));
        }else{
            $(target).parent().parent().addClass("active");
            contentForm($(target).parent());
        }
    });

    var contentForm = function(target){
        if(target.html().indexOf("个人信息")>0){
            $("#alertPwd").hide();
            $("#address2").hide();
            $("#order").hide();
            $("#person").show();
        }else if(target.html().indexOf("修改密码")>0){
            $("#person").hide();
            $("#address2").hide();
            $("#order").hide();
            $("#alertPwd").show();
        }else if(target.html().indexOf("收货地址")>0){
            $("#person").hide();
            $("#order").hide();
            $("#alertPwd").hide();
            $("#address2").show();
        }else{
            $("#person").hide();
            $("#alertPwd").hide();
            $("#address2").hide();
            $("#order").show();
        }
    };

    return {

    };
}();