$(document).ready(function(){
	var reg_e = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	$("#back_psd").click(function(){
		var email = $("#email").val();
		if (email==""||!reg_e.test(email)) {
			$("#email_msg").html("请正确输入邮箱");
		}else{
			$("#email_msg").html("邮件发送中...");
			eBack(email);
		}
	});
	
});

function eBack(e){
	$.ajax( {
		type : 'post',
		url : './mh/login_ajax!emailBack.action',
		dataType : 'json',
		data : 'email='+e,
		success : function(data){
			if(data.msg=="1"){
				$("#email_msg").html("邮箱不存在");
			}else if(data.msg=="-1"){
				$("#email_msg").html("网络异常，请稍后再试...");
			}else if(data.msg=="0"){
				$("#email_msg").html("邮件已发送，请注意查收");
			}
		}
	});
}