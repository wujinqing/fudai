String.prototype.Trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
}
var reg_e = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
var reg_psd = /^\w+$/;
var tel_test = /^1[3|4|5|8][0-9]\d{4,8}$/;

$(document).ready(
		function() {
			$("#user_name").focusout( function() {
				var name = $.trim($("#user_name").val());
				if (name.Trim() == "") {
					$("#name_msg").html("不能为空");
				} else if (name.Trim().length < 1 || name.Trim().length > 25) {
					$("#name_msg").html("5-25个字符");
				} else {
					$("#name_msg").html("");
				}
			});

			$("#password").focusout( function() {
				var name = $.trim($("#password").val());
				if (name == "") {
					$("#pwd_msg").html("不能为空");
				} else if (!reg_psd.test(name)) {
					$("#pwd_msg").html("由数字、字母或下划线组成");
				} else if (name.length < 6 || name.length > 16) {
					$("#pwd_msg").html("6-16个字符");
				} else {
					$("#pwd_msg").html("");
				}
			});

			$("#ck_password").focusout( function() {
				var pwd = $.trim($("#password").val());
				var ckPwd = $.trim($("#ck_password").val());
				if (ckPwd == "") {
					$("#ck_pwd_msg").html("再次输入密码");
				} else if (pwd != ckPwd) {
					$("#ck_pwd_msg").html("两次密码输入不一致");
				} else {
					$("#ck_pwd_msg").html("");
				}
			});

			$("#email").focusout( function() {
				var e = $.trim($("#email").val());
				if (e != "" && !reg_e.test(e)) {
					$("#email_msg").html("请正确填写");
				} else {
					$("#email_msg").html("");
				}
			});

			$("#tel").focusout( function() {
				var tel = $.trim($("#tel").val());
				if (tel == "") {
					("#tel_msg").html("请输入手机号码");
				} else {
					$("#tel_msg").html("");
				}
				if (tel != "" && !tel_test.test(tel)) {
					$("#tel_msg").html("请正确的手机号码");
				} else {
					$("#tel_msg").html("");
				}
			});

			$("#send").click( function() {
				$(this).attr("disabled", "disabled");
				$("#tel_msg").html("验证码发送中...");
				// var reg_tel = /^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$/;
					var tel = $("#tel").val();
					$.ajax( {
						type : 'post',
						url : './mh/login_ajax!telcode.action',
						dataType : 'json',
						data : 'tel=' + tel,
						success : function(data) {
							if (data.msg == "-1") {
								$("#tel_msg").html("系统忙，请稍后再试...");
								$("#send").removeAttr("disabled");
							} else if (data.msg == "0") {
								$("#tel_msg").html("验证码发送失败");
								$("#send").removeAttr("disabled");
							} else if (data.msg == "1") {
								$("#tel_msg").html("验证码已发送");
								$("#send").removeAttr("disabled");
							}
						}
					});
				});

			$("#reg_form").submit( function() {
				var flag = $("#flag").val();
				var name = $("#user_name").val().Trim();
				var pwd = $("#password").val().Trim();
				var ckPwd = $("#ck_password").val().Trim();
				var code = $("#code").val().Trim();
				var email = $("#email").val().Trim();
				var pro = $("#s1").val();
				var city = $("#s2").val();
				var cou = $("#s3").val();
				var jzyx = $("#jzyx").val();
				var tel = $("#tel").val();// 手机号码
				var card = "", cardPwd = "";
				if (flag == 1) {
					card = $("#card").val().Trim();
					cardPwd = $("#card_pwd").val().Trim();
				}
				if (name == "") {
					$("#name_msg").html("不能为空");
					return false;
				} else if (name.length < 1 || name.length > 25) {
					$("#name_msg").html("5-25个字符");
					return false;
				} else {
					$("#name_msg").html("");
				}
				if (pwd.Trim() == "") {
					$("#pwd_msg").html("不能为空");
					return false;
				} else if (!reg_psd.test(pwd)) {
					$("#pwd_msg").html("由数字、字母或下划线组成");
					return false;
				} else if (pwd.Trim().length < 6 || pwd.Trim().length > 25) {
					$("#pwd_msg").html("6-16个字符");
					return false;
				} else {
					$("#pwd_msg").html("");
				}
				if (ckPwd == "") {
					$("#ck_pwd_msg").html("再次输入密码");
					return false;
				} else if (pwd != ckPwd) {
					$("#ck_pwd_msg").html("两次密码输入不一致");
					return false;
				} else {
					$("#ck_pwd_msg").html("");
				}
				if (email != "" && !reg_e.test(email)) {
					$("#email_msg").html("请正确填写");
					return false;
				} else {
					$("#email_msg").html("");
				}
				if (city == "") {
					$("#city_msg").html("请选择");
					return false;
				} else {
					$("#city_msg").html("");
				}
				if (tel == "") {
					$("#tel_msg").html("请输入手机号码");
					return false;
				} else {
					$("#tel_msg").html("");
				}
				if (code == "") {
					$("#code_msg").html("请输入验证码");
					return false;
				} else {
					$("#code_msg").html("");
				}
				if (!$("#intro").attr("checked")) {
					$("#intro_msg").html("请阅读服务条款");
					return false;
				} else {
					$("#intro_msg").html("");
				}
				var redUrl = $("#red_url").val();
				$("#r_btn").attr("disabled", "disabled");
				$("#res_msg").html("加载中...");
				regist(name, pwd, code, email, pro, city, cou,
						jzyx, flag, card, cardPwd, tel, redUrl);
				return false;
			});

			$('#clo_tip').click( function() {
				$('#service_tip').hide();
			});

			$('#service_btn').click( function() {
				$('#service_tip').show();
			});

		});

function regist(n, p, c, e, pr, ci, co, j, flag, cd, cdp, t, url) {
	$.ajax( {
		type : 'post',
		url : './mh/login_ajax!regist.action',
		dataType : 'json',
		data : 'userName=' + n + '&password=' + p + '&code=' + c + '&email='
				+ e + '&province=' + pr + '&city=' + ci + '&county=' + co
				+ '&jzyx=' + j + '&type=' + flag + '&cardNo=' + cd
				+ '&cardPwd=' + cdp+'&tel='+t,
		success : function(data) {
					if (data.map.msg == "-1") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						alert("网络异常，请稍后再试...");
					} else if (data.map.msg == "0") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#code_msg").html("验证码错误");
					} else if (data.map.msg == "2") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("参数错误");
					} else if (data.map.msg == "3") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#name_msg").html("该会员名已被使用");
					} else if (data.map.msg == "4") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#email_msg").html("该邮箱已被使用");
					} else if (data.map.msg == "5") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#email_msg").html("该邮箱格式错误");
					} else if (data.map.msg == "6") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#card_msg").html("会员卡卡号或密码错误");
					} else if (data.map.msg == "7") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#card_msg").html("会员卡已被使用");
					} else if (data.map.msg == "8") {
						$("#r_btn").removeAttr("disabled");
						$("#res_msg").html("");
						$("#tel_msg").html("手机号已被使用");
					} else if (data.map.msg == "1") {
						$("#res_msg").html("注册成功，正在跳转请稍后...");
						if (url==null||url=="") {
							$("#jump").attr("action","space/my_space.html");
							$("#sp").val(data.map.res);
							$("#jump").submit();
						}else{
							$("#jump_msg").html(data.map.res);
							window.setTimeout(function(){
								window.location =url;
							},2000);
						}
					}
				}
	});
}