/**
 * 个人中心页面js
 */
var Account = function (){

    var captcha;

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

    /**
     * 中心内容的显示
     * @param target
     */
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
            /*$("#person").hide();
            $("#alertPwd").hide();
            $("#address2").hide();
            $("#order").show();*/
        }
    };

    /**
     * 手机校验
     * @param phone
     * @returns {boolean}
     */
    function isMobileMethod(phone){
        var regPhone = /^(13[0-9]|15[0-9]|18[0-9]|147|145|17[0-9])\d{8}$/;
        if(regPhone.test(phone)){
            return true;
        }else{
            if(phone == "" || phone == null){
                $("#regMsg").empty();
                $("#regDiv").show();
                $("#regMsg").html("手机号码必填字段！");
                return false;
            }else{
                $("#regMsg").empty();
                $("#regDiv").show();
                $("#regMsg").html("手机号码格式错误！请输入正确格式！");
                return false;
            }
        }
    }
    /**
     * 个人信息修改保存
     */
    $("#save").click(function(){
        var username = $("#username").html().trim();
        var firstname = $("#firstname").html().trim();
        var phone = $("#phone").html().trim();
        if(username ==null || username =="" ||  firstname ==null || firstname =="" && !isMobileMethod(phone)){
            $("#message").empty();
            $("#messageDiv").show();
            $("#message").html("修改失败！");
            return;
        }
        $.ajax({
            type : 'post',
            url : '/taste/saveUserMsg',
            dataType : 'json',
            data : {
                username : username,
                firstname : firstname,
                phone : phone
            },
            success : function(data){
                if(data == "200"){
                    $("#message").empty();
                    $("#messageDiv").show();
                    $("#message").html("修改成功！");
                }else{
                    $("#message").empty();
                    $("#messageDiv").show();
                    $("#message").html("修改失败！");
                }
            }
        });
    });

    //重置密码校验
    var isForgetPwdMethod =function isForgetPwdMethod(word,rword){
        if(pwdReg.test(word)){
            if(word == rword){
                return true;
            }else{
                $("#message").empty();
                $("#messageDiv").show();
                $("#message").html("两次密码不匹配！请重新输入！");
                return false;
            }
        }else {
            if(word == "" || word == null || rword == "" || rword == null){
                $("#message").empty();
                $("#messageDiv").show();
                $("#message").html("密码不能为空！");
                return false;
            }else{
                $("#message").empty();
                $("#messageDiv").show();
                $("#message").html("密码格式错误！密码8到16位数字与字母组合！");
                return false;
            }
        }
    }

    //校验重置密码验证码
    var forgetCode = $("#forgetCaptcha").keyup(function(){
        var code = $("#forgetCaptcha").val();
        var codeReg = /^\d{6}$/;
        if(code.length == 6){
            if(codeReg.test(code)){
                if(code == captcha){
                    return true;
                }
                $("#message").empty();
                $("#messageDiv").show();
                $("#message").html("验证码错误！");
                return false;
            }
        }else{
            $("#message").empty();
            $("#messageDiv").show();
            $("#message").html("验证码错误！");
            return false;
        }
    });

    //重置密码获取验证码
    $("#captcha").click(function(){
        var num = $("#forgetPhone").val();
        $.ajax({
            type : "post",
            url : "taste/getCaptcha",
            data : {
                phoneNum : num,
                type : 2
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

    //重置密码提交
    $("#forgetBtn").click(function(){
        var forPassword = $("#password").val();
        var forRPassword = $("#password2").val();
        var captcha = $("#forgetCaptcha").val();
        if(isForgetPwdMethod(forPassword,forRPassword) && forgetCode){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "taste/forgetPassword",
                data: $(".forget-form").serialize(),
                success : function (result) {
                    if (result == "200") {
                        $("#message").empty();
                        $("#messageDiv").show();
                        $("#message").html("重置密码成功！3秒后自动跳转登录页面。。。");
                        setTimeout(function () {
                            window.location.href="/toLogin";
                        }, 3000);
                    } else {
                        $("#message").empty();
                        $("#messageDiv").show();
                        $("#message").html("重置密码失败！请重试！");
                    }
                }
            });
        }else{
            $("#message").empty();
            $("#messageDiv").show();
            $("#message").html("重置密码失败！请重试！");
        }
    });


    return {

    };
}();