$(document).ready(function(){
	var reg_psd = /^\w+$/;
	$("#send_btn").click(function(){
		var tel =$("#tel").val();
		if(tel.replace(/(^\s*)|(\s*$)/g, "")==""){
			$("#tel_msg").html("请输入手机号码");
			return;
		}
		$(this).attr("disabled","disabled");
		$("#tel_msg").html("验证码发送中...");
		telCode(tel);
	});
	
	$("#back_btn").click(function(){
		var tel =$("#tel").val();
		var code = $("#code").val();
		var pwd = $("#password").val();
		if (tel=="") {
			$("#res_msg").html("请输入手机号");
			return;
		}
		if(code==""){
			$("#res_msg").html("请输入验证码");
			return;
		}
		if (pwd=="") {
			$("#res_msg").html("请输入密码");
			return;
		}else if(!reg_psd.test(pwd)) {
			$("#res_msg").html("密码由数字、字母或下划线组成");
			return;
		}else if (pwd.length<5||pwd.length>16) {
			$("#res_msg").html("6-16个字符");
			return;
		}
		$("#res_msg").html("提交中，请稍后...");
		pBack(tel,code,pwd);
	});
});

function telCode(t){
	$.ajax( {
		type : 'post',
		url : './mh/login_ajax!phoneBack.action',
		dataType : 'json',
		data : 'tel='+t,
		success : function(data){
			if (data.msg=="2") {
				$("#tel_msg").html("手机号不存在");
				$("#send_btn").removeAttr("disabled");
			}else if(data.msg=="0"){
				$("#tel_msg").html("发送失败");
				$("#send_btn").removeAttr("disabled");
			}else if(data.msg=="-1"){
				$("#tel_msg").html("系统忙！请稍后再试...");
				$("#send_btn").removeAttr("disabled");
			}else if(data.msg=="1"){
				$("#tel_msg").html("发送成功");
				$("#send_btn").removeAttr("disabled");
			}
		}
	});
}

function pBack(t,c,p){
	$.ajax( {
		type : 'post',
		url : './mh/login_ajax!phonePwd.action',
		dataType : 'json',
		data : 'tel='+t+'&code='+c+'&password='+p,
		success : function(data){
			if (data.msg=="2") {
				$("#res_msg").html("验证码不正确");
			}else if(data.msg=="0"){
				$("#res_msg").html("请输入手机号、验证码和密码");
			}else if(data.msg=="-1"){
				$("#res_msg").html("系统忙！请稍后再试...");
			}else if(data.msg=="1"){
				$("#res_msg").html("密码修改成功");
			}
		}
	});
}