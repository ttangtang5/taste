var captcha;
//注册获取验证码
$("#register-captcha").click(function(){
    var num = $("#regPhoneNum").val();
    if(num == null || num == ""){
        $("#regMsg").empty();
        $("#regDiv").show();
        $("#regMsg").html("请输入手机号！");
        return;
    }
    $.ajax({
        type : "post",
        url : "taste/getCaptcha",
        data : {
            phoneNum : num,
            type : 1
        },
        dataType : "json",
        success : function(data){
            setTime();
            $("#regDiv").hide();
            captcha = data;
        }
    });
    //setTime();
});

//重置密码获取验证码
$("#forget-captcha").click(function(){
    var num = $("#forget-phone").val();
    if(num == null || num == ""){
        $("#forgetMsg").empty();
        $("#forgetDiv").show();
        $("#forgetMsg").html("请输入手机号！");
        return;
    }
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
            $("#forgetDiv").hide();
        }
    });
    //setTime();
});

//设置注册验证码一分钟获取一次
var countdown=60;
var obj = $(".captcha");
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
}

//设置登录验证码刷新
$("#code").click(function(){
    $("#code").attr("src","taste/getGIFCode?"+Math.random());
    setTimeout(function(){
        getCode();
    },500);
});

//注册校验提交
// 手机号码验证
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

var pwdReg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;//6到16位数字与字母组合
//注册密码校验
function isPassWordMethod(word,rword){
    if(pwdReg.test(word)){
        if(word == rword){
            return true;
        }else{
            $("#regMsg").empty();
            $("#regDiv").show();
            $("#regMsg").html("两次密码不匹配！请重新输入！");
            return false;
        }
    }else {
        if(word == "" || word == null || rword == "" || rword == null){
            $("#regMsg").empty();
            $("#regDiv").show();
            $("#regMsg").html("密码不能为空！");
            return false;
        }else{
            $("#regMsg").empty();
            $("#regDiv").show();
            $("#regMsg").html("密码格式错误！密码8到16位数字与字母组合！");
            return false;
        }
    }
}

//重置密码校验
function isForgetPwdMethod(word,rword){
    if(pwdReg.test(word)){
        if(word == rword){
            return true;
        }else{
            $("#forgetMsg").empty();
            $("#forgetDiv").show();
            $("#forgetMsg").html("两次密码不匹配！请重新输入！");
            return false;
        }
    }else {
        if(word == "" || word == null || rword == "" || rword == null){
            $("#forgetMsg").empty();
            $("#forgetDiv").show();
            $("#forgetMsg").html("密码不能为空！");
            return false;
        }else{
            $("#forgetMsg").empty();
            $("#forgetDiv").show();
            $("#forgetMsg").html("密码格式错误！密码8到16位数字与字母组合！");
            return false;
        }
    }
}

//校验注册验证码
var regCode = $("#captcha").keyup(function(){
    var code = $("#captcha").val();
    var codeReg = /^\d{6}$/;
    if(code.length == 6){
        if(codeReg.test(code)){
            if(code == captcha){
                return true;
            }
            $("#regMsg").empty();
            $("#regDiv").show();
            $("#regMsg").html("验证码错误！请重新输入！");
            return false;
        }
    }else{
        $("#regDiv").hide();
    }
});

//校验重置密码验证码
var forgetCode = $("#forgetCaptcha").keyup(function(){
    var code = $("#forgetCaptcha").val();
    var codeReg = /^\d{6}$/;
    if(code.length == 6){
        if(codeReg.test(code)){
            if(code == captcha){
                $("#forgetMsg").empty();
                $("#forgetDiv").show();
                $("#forgetMsg").html("身份校验成功！请输入新密码！");
                $(".forgetPssword").show();
                return true;
            }
            $("#forgetMsg").empty();
            $("#forgetDiv").show();
            $("#forgetMsg").html("验证码错误！请重新输入！");
            return false;
        }
    }else{
        $("#regDiv").hide();
    }
});

//重置密码提交
$("#forgetBtn").click(function(){
    var forPhoneNum = $("#forget-phone").val();
    var forPassword = $("#forPassword").val();
    var forRPassword = $("#forRpassword").val();
    var captcha = $("#forgetCaptcha").val();
    if(isMobileMethod(forPhoneNum) && isForgetPwdMethod(forPassword,forRPassword) && forgetCode){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "taste/forgetPassword",
            data: $(".forget-form").serialize(),
            success : function (result) {
                if (result == "200") {
                    $("#forgetMsg").empty();
                    $("#forgetDiv").show();
                    $("#forgetMsg").html("重置密码成功！3秒后自动跳转登录页面。。。");
                    setTimeout(function () {
                        location.reload();
                    }, 3000);
                } else {
                    $("#forgetMsg").empty();
                    $("#forgetDiv").show();
                    $("#forgetMsg").html("重置密码失败！请重试！");
                }
            }
        });
    }else{
        return false;
    }
});

//校验登录验证码
var logCode = $("#gifCaptcha").keyup(function(){
    var code = $("#gifCaptcha").val();
    if(code.length == 4){
    var serverCode = $("#serverCode").val();
        if(code == serverCode){
            return true;
        }
        $("#logMsg").empty();
        $("#logDiv").show();
        $("#logMsg").html("验证码错误！请重新输入！");
        return false;
    }else{
        $("#logDiv").hide();
    }
});

//注册提交
$("#register-submit-btn").click(function(){
    var phone = $("#regPhoneNum").val();
    var word = $("#regPassword").val();
    var rword = $("#regRpassword").val();
    if(isMobileMethod(phone) && isPassWordMethod(word,rword) && regCode ){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "taste/register",
            data: $(".register-form").serialize(),
            success : function (result) {
                if (result == "200") {
                    $("#regMsg").empty();
                    $("#regDiv").show();
                    $("#regMsg").html("注册成功！3秒后自动跳转登录页面。。。");
                    setTimeout(function () {
                        location.reload();
                    }, 3000);
                } else {
                    if (result == "2") {
                        $("#regMsg").empty();
                        $("#regDiv").show();
                        $("#regMsg").html("注册失败！手机已绑定！");
                    } else {
                        $("#regMsg").empty();
                        $("#regDiv").show();
                        $("#regMsg").html("注册失败！请重新注册");
                    }
                }
            }
        });
    }else{
        return false;
    }
});

//登录
$("#loginBtn").click(function (){
    var phone = $("#logPhoneNum").val();
    var word = $("#logPassword").val();
    var code = $("#gifCaptcha").val();
    if(isMobileMethod(phone) && logCode ){
        $.ajax({
            type: "POST",
            dataType: "json",
            url: "taste/login",
            data: $(".login-form").serialize(),
            success : function (result) {
                if (result == "200") {
                    window.location.href = "/toIndex";
                } else {
                        $("#logMsg").empty();
                        $("#logDiv").show();
                        $("#logMsg").html("登录失败！请重新登录！");
                }
            }
        });
    }else{
        $("#logMsg").empty();
        $("#logDiv").show();
        $("#logMsg").html("手机号、密码错误！请重新登录！");
        return false;
    }
});

//将登录验证码获取至页面
function getCode(){
    $.ajax({
        type : "post",
        url : "taste/getGIFCodeServer",
        dataType : "json",
        success : function (data) {
            $("#serverCode").val(data.serverCode);
        }
    });
}

