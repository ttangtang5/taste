<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../decorators/taglib.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/login.css"/>
    <link href="${ctxStatic}/js/common/bootstrap/3.3.5/css/bootstrap.min.css?2017-12-08 00:12:03" rel="stylesheet"/>
</head>
<body>
<div id="login">
    <h1>Login</h1>
    <form method="post" action="/login">
        <input type="text" id="username" class="form-control" style="background-color: black;margin-top: 10px" required="required" placeholder="用户名" name="username"/>
        <input type="password" id="password" class="form-control" style="background-color: black;margin-top: 10px"  required="required" placeholder="密码" name="password"/>
        <button class="but" style="margin-top: 10px" type="submit" onclick="return validate()" >登录</button>
    </form>
</div>

<script>
    // 手机号码验证
    function isMobileMethod(phone){
        var regPhone = /^(13[0-9]|15[0-9]|18[0-9]|147|145|17[0-9])\d{8}$/;
        if(regPhone.test(phone)){
            return true;
        }else{
            alert("手机号码格式错误！请输入正确格式！");
            return false;
        }
    }

       function validate(){
           var username = $("#username").val();
           if(isMobileMethod(username)){
               return true;
           }
           return false;
       }
</script>
</body>
</html>
