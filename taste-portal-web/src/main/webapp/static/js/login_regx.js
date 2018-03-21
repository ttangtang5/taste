$('#login-button').click(function sub(event) {
		var regun=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		var un=$("form input:first").val();
		if(regun.test(un)){
		}else{
				$("form p:first").html("<font color='red'>手机号码错误!</font>");
				$("form input:first").val("");
				$("form input:first").focus();
				return false;
		}
	});