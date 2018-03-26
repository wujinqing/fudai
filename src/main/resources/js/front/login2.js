function doSubmit() {
			var name = $("#user_name").val();
			var pwd = $("#password").val();
			var code = $("#code").val();
			if(name==""){
				alert("请输入您的用户名");
				//$("#name_msg").html("请输入您的用户名");
				
				return false;
			}
			if(pwd==""){
				alert("请输入您的密码");
				//$("#pwd_msg").html("请输入您的密码");
				return false;
			}
			if(code==""){
				alert("请输入验证码");
				//$("#code_msg").html("请输入验证码");
				return false;
			}
			$("#l_btn").attr("disabled","disbaled");
			login(name,pwd,code);
			return false;
}

function login(n,p,c){
	$.ajax( {
		type : 'post',
		url : './login_space.html',
		dataType : 'json',
		data : 'userName='+n+'&password='+p+'&code='+c,
		success : function(data){
			if(data.map.msg=="-2"){
				$("#l_btn").removeAttr("disabled");
				alert("验证码错误");
			}else if(data.map.msg=="-1"){
				$("#l_btn").removeAttr("disabled");
				alert("网络异常，请稍后再试...");
			}else if(data.map.msg=="0"){
				$("#l_btn").removeAttr("disabled");
				alert("用户名或密码错误");
			}else if(data.map.msg=="1"){
				//alert(data.map.res)
				$("#script").html(data.map.res);
				//window.location="mh/space!index.action";
				var con="";
				 con+="<div class=\"case-sdb-bt color_fff marg-top7\">";
				 con+="<span class=\"hao14\">欢迎来到个人空间</span></div>";
				 con+="<div class=\"dass-right1-img\"><div class=\"img\">"	; 
				 con+= "<a href=\"space/my_space.html\" title=\"进入自己的空间\"> <img src="+data.map.pic+" /> </a>";
			     con+="</div></div>";
				 con+="<div class=\"dass-right1-tm\"><a href=\"space/my_space.html\" title=\"进入自己的空间\">"+data.map.name+"</a></div>";
	           $("#member_info").html(con);
			}
		}
	});
}