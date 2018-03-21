<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="/static/assets/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/admin/pages/css/login3.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="/static/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
    <link href="/static/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="/static/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-md login">
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="index.html">
        <img src="/static/assets/admin/layout/img/logo-big.png" alt=""/>
    </a>
</div>
<!-- END LOGO -->
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" action="index.html" method="post">
        <h3 class="form-title">登录</h3>
        <div class="alert alert-danger display-hide">
            <button class="close" data-close="alert"></button>
            <span>请输入正确的用户名、密码. </span>
        </div>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">手机号码</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="手机号码" name="username"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
            </div>
        </div>
        <div class="form-group">
            <div class="input-icon">
                <i class="fa fa-check"></i>
                <input class="form-control placeholder-no-fix" style="width: 50%" type="text" maxlength="6" autocomplete="off" placeholder="验证码" name="captcha"/>
            </div>
                <img id="code"  alt="请点击刷新验证码" onclick="this.src='taste/getGIFCode'" src="taste/getGIFCode" style="width:88px;">
        </div>
        <div class="form-actions">
            <label class="checkbox">
                <input type="checkbox" name="remember" value="1"/> 自动登录 </label>
            <button type="submit" class="btn green-haze pull-right">
                登录 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
        <div class="forget-password">
            <h4><a href="javascript:;" id="forget-password">忘记密码 ? 重置密码</a></h4>
        </div>
        <div class="create-account">
            <p>
                没有账号 ?&nbsp; <a href="javascript:;" id="register-btn">
                创建 账号 </a>
            </p>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form class="forget-form" action="index.html" method="post">
        <h3>忘记密码 ?</h3>
        <p>
            请输入手机号码重置密码。
        </p>
        <div class="form-group">
            <div class="input-icon">
                <i class="fa fa-envelope"></i>
                <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
            </div>
        </div>
        <div class="form-actions">
            <button type="button" id="back-btn" class="btn">
                <i class="m-icon-swapleft"></i> 返回 </button>
            <button type="submit" class="btn green-haze pull-right">
                提交 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->
    <!-- BEGIN REGISTRATION FORM -->
    <form class="register-form" action="##"  method="post">
        <h3>注册</h3>
        <p>
            请填写以下信息:
        </p>
        <div class="alert alert-danger display-hide" id="regDiv">
            <button class="close" data-close="alert"></button>
            <span id="regMsg"></span>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">手机号码</label>
            <div class="input-icon">
                <i class="fa fa-user"></i>
                <input id="regPhoneNum" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="请输入手机号码" name="regPhoneNum"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <div class="input-icon">
                <i class="fa fa-lock"></i>
                <input class="form-control placeholder-no-fix" type="password" autocomplete="off"  placeholder="请输入密码" id="regPassword" name="regPassword" required/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">再次输入密码</label>
            <div class="controls">
                <div class="input-icon">
                    <i class="fa fa-check"></i>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="请再次输入密码" id="regRpassword" name="regRpassword" required/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="input-icon">
                <button type="button" id="register-captcha" class="btn green-haze pull-right">
                    获取验证码
                </button>
                <i class="fa fa-check"></i>
                <input class="form-control placeholder-no-fix" style="width: 60%" type="text" maxlength="6" autocomplete="off" placeholder="验证码" id="captcha" name="captcha"/>
            </div>
        </div>
        <div class="form-actions">
            <button id="register-back-btn" type="button" class="btn">
                <i class="m-icon-swapleft"></i> 返回 </button>
            <button type="button" id="register-submit-btn" class="btn green-haze pull-right">
                注册 <i class="m-icon-swapright m-icon-white"></i>
            </button>
        </div>
    </form>
    <!-- END REGISTRATION FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<div class="copyright">
    2014 &copy; Metronic. Admin Dashboard Template.
</div>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="/static/assets/global/plugins/respond.min.js"></script>
<script src="/static/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="/static/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="/static/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="/static/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/static/assets/global/plugins/select2/select2.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/static/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="/static/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="/static/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script src="/static/assets/admin/pages/scripts/login.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function() {
        Metronic.init(); // init metronic core components
        Layout.init(); // init current layout
        Login.init();
        Demo.init();
    });

    //注册获取验证码
    $("#register-captcha").click(function(){
        var num = $("#phoneNum").val();
        $.ajax({
            type : "post",
            url : "taste/getCaptcha/"+num,
            dataType : "json",
            success : function(data){
                 setTime();
                console.info(data);
            }
        });
        setTime();
    });

    //设置注册验证码一分钟获取一次
    var countdown=60;
    function setTime() {
        var obj = $("#register-captcha");
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
    $("#code").on("click",function(){
        $.ajax({
            type : "post",
            url : "taste/getGIFCode",
            dataType : "json",
            success : function(data){
                $("#code").val(data);
            }
        });
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
    //密码校验
    function isPassWordMethod(word,rword){
        var pwdReg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;//6到16位数字与字母组合
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
    //校验验证码
    var code = $("#captcha").keyup(function(){
        var code = $("#captcha").val();
        var codeReg = /^\d{6}$/;
        if(code.length == 6){
            if(codeReg.test(code)){
                return true;
            }else{
                $("#regMsg").empty();
                $("#regDiv").show();
                $("#regMsg").html("验证码错误！请重新输入！");
                return false;
            }
        }else{
            $("#regDiv").hide();
        }
    });

    //注册提交
    $("#register-submit-btn").click(function(){
        var phone = $("#regPhoneNum").val();
        var word = $("#regPassword").val();
        var rword = $("#regRpassword").val();
        if(isMobileMethod(phone) && isPassWordMethod(word,rword) && code ){
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "taste/register",
                data: $(".register-form").serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    if (result.resultCode == 200) {
                        alert("SUCCESS");
                    };
                },
                error : function() {
                    alert("异常！");
                }
            });
        }else{
            return false;
        }
    });


</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>