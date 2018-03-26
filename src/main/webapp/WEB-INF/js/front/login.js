$(document).ready(function(){
	$("#user_name").focusout(function(){
		if($("#user_name").val()!=""){
			$("#name_msg").html("");
		}
	});

	$("#password").focusout(function(){
		if($("#password").val()!=""){
			$("#pwd_msg").html("");
		}
	});

	$("#code").focusout(function(){
		if($("#code").val()!=""){
			$("#code_msg").html("");
		}
	});
	
	$("#login_form").submit(function(){
		var name = $("#user_name").val();
		var pwd = $("#password").val();
		var code = $("#code").val();
		if(name==""){
			$("#name_msg").html("请输入您的用户名");
			return false;
		}
		if(pwd==""){
			$("#pwd_msg").html("请输入您的密码");
			return false;
		}
		if(code==""){
			$("#code_msg").html("请输入验证码");
			return false;
		}
		$("#l_btn").attr("disabled","disbaled");
		$("#res_msg").html("登录中，请稍后...");
		var url = $("#red_url").val();
		login(name,pwd,code,url);
		return false;
	});
	
});

function login(n,p,c,u){
	$.ajax( {
		type : 'post',
		url : './login_space.html',
		dataType : 'json',
		data : 'userName='+n+'&password='+p+'&code='+c,
		success : function(data){
			if(data.map.msg=="-2"){
				$("#l_btn").removeAttr("disabled");
				$("#res_msg").html("验证码错误");
			}else if(data.map.msg=="-1"){
				$("#l_btn").removeAttr("disabled");
				$("#res_msg").html("网络异常，请稍后再试...");
			}else if(data.map.msg=="0"){
				$("#l_btn").removeAttr("disabled");
				$("#res_msg").html("用户名或密码错误");
			}else if(data.map.msg=="1"){
				$("#res_msg").html("登录成功，正在跳转请稍后...");
				if(null!=data.map.ost&&data.map.ost!=""){
					alert(data.map.ost);
				}
				if (u==""||u==null) {
					$("#jump").attr("action","space/my_space.html");
					$("#sp").val(data.map.res);
					$("#jump").submit();
				}else{
					$("#jump_url").html(data.map.res);
					window.setTimeout(function(){
						window.location=u;
					},2000);
				}
			}
		}
	});
}