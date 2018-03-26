$(document).ready(function(){
	var reg_psd = /^\w+$/;
	$("#password").focusout(function(){
		var pwd = $("#password").val();
		if(pwd==""){
			$("#pwd_msg").html("不能为空");
		}else if(!reg_psd.test(pwd)){
			$("#pwd_msg").html("由数字、字母或下划线组成");
		}else if(pwd.length<5||pwd.length>25){
			$("#pwd_msg").html("6-16个字符");
		}else{
			$("#pwd_msg").html("");
		}
	});
	
	$("#ck_password").focusout(function(){
		var pwd = $("#password").val();
		var ckPwd = $("#ck_password").val();
		if(ckPwd==""){
			$("#ck_pwd_msg").html("再次输入密码");
		}else if(pwd!=ckPwd){
			$("#ck_pwd_msg").html("两次密码输入不一致");
		}else{
			$("#ck_pwd_msg").html("");
		}
	});
	
	$("#sure_btn").click(function(){
		var pwd = $("#password").val();
		var ckPwd = $("#ck_password").val();
		if(pwd==""){
			$("#pwd_msg").html("不能为空");
			return false;
		}else if(!reg_psd.test(pwd)){
			$("#pwd_msg").html("由数字、字母或下划线组成");
			return false;
		}else if(pwd.length<5||pwd.length>25){
			$("#pwd_msg").html("6-16个字符");
			return false;
		}else{
			$("#pwd_msg").html("");
		}
		if(ckPwd==""){
			$("#ck_pwd_msg").html("再次输入密码");
			return false;
		}else if(pwd!=ckPwd){
			$("#ck_pwd_msg").html("两次密码输入不一致");
			return false;
		}else{
			$("#ck_pwd_msg").html("");
		}
		var code = $("#code").val();
		eBack(code,pwd);
		return false;
	});
});

function eBack(c,p){
	$.ajax( {
		type : 'post',
		url : 'login_ajax!emailPwd.action',
		dataType : 'json',
		data : 'code='+c+'&password='+p,
		success : function(data){
			if(data.msg=="0"){
				$("#res_msg").html("密码设置成功");
			}else if(data.msg=="-1"){
				$("#res_msg").html("密码设置失败");
			}else if(data.msg=="2"){
				$("#res_msg").html("链接已过期");
			}
		}
	});
}