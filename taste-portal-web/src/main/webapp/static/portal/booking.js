/**
 * 个人中心页面js
 */
var Booking = function (){

    var captcha;


    //校验验证码
    var bookingCode = $("#bookingCaptcha").keyup(function(){
        var code = $("#bookingCaptcha").val();
        var codeReg = /^\d{6}$/;
        if(code.length == 6){
            if(codeReg.test(code)){
                if(code == captcha){
                    return true;
                }
               alert("验证码错误！");
                return false;
            }
        }else{
            alert("验证码错误！");
            return false;
        }
    });

    //重置密码获取验证码
    $("#captcha").click(function(){
        var num = $("#phone").val();
        $.ajax({
            type : "post",
            url : rootPath + "/taste/getCaptcha",
            data : {
                phoneNum : num,
                type : 3
            },
            dataType : "json",
            success : function(data){
                setTime();
                captcha = data;
            }
        });
        //setTime();
    });

    //设置注册验证码一分钟获取一次
    var countdown=60;
    var obj = $("#captcha");
    function setTime() {
        if (countdown == 0) {
            obj.removeAttr("disabled");
            obj.html("获取验证码");
            countdown = 60;
            return;
        } else {
            obj.attr("disabled", true);
            obj.html("重新发送(" + countdown + ")");
            countdown--;
        }
        setTimeout(function () {
            setTime();
        }, 1000);
    };

    /**
     * 提交预订
     */
   var booking = function booking(){
       var phone = $("#phone").val();
       var num = $("#number").val();
       var time = $("#test-limit2").val();
       var time2 = $("#test-limit3").val();
        if(bookingCode){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: rootPath + "/order/booking",
                data: {
                    phone : phone,
                    num : num,
                    time : time,
                    time2 : time2
                },
                success : function (result) {
                    if (result == "200") {
                        location.reload();
                    } else {
                        alert("预订失败！");
                    }
                }
            });
        }else{
            alert("预订失败！");
        }
    };

    var bookingCancel = function booking(){
        var id = $("#id").val();
        $.ajax({
            type: "POST",
            dataType: "json",
            url: rootPath + "/order/bookingCancel",
            data: {
                id : id
            },
            success : function (result) {
                if (result == "200") {
                    location.reload();
                } else {
                    alert("预订取消！");
                }
            }
        });
    };

    return {
        bookingOrder : function(){
            booking();
        },
        bookingCancel : function () {
            bookingCancel();
        }
    };
}();