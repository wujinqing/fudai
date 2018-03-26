var Dialog={};
Dialog.alert=function(msg){
	var _a = document.getElementById("alert_msg");
	if(_a) {
		if(_a.style.display=="none"){
			document.getElementById("a_m").innerHTML=msg;
			_a.style.display="block";
			window.setTimeout("Dialog.close()",2000);
		}
		return;
	}
	var arr=[];
	arr.push("<div id=\"alert_msg\" class=\"alertdiv\">");
	arr.push("<div style=\"text-align:left;background-image:url(../images/front/top-dh-d.gif);padding:5px;\">提示：</div>");
	arr.push("<div id=\"a_m\" style=\"text-align:center;padding:20px;\">"+msg+"</div>");
	arr.push("</div>");
	var div = document.createElement("div");
	div.innerHTML = arr.join('');
	document.body.appendChild(div);
	window.setTimeout("Dialog.close()",2000);
}

Dialog.close=function(){
	document.getElementById("alert_msg").style.display="none";
}

function decimal(num,v){
	var w = Math.pow(10,v);
	return Math.round(num*w)/w;
}

function multiply(x,y,point){
	var res = (x*y).toString();
	alert(res)
	var index = res.indexOf(".");
	var length = res.substring(index+1,res.length);
	if(index == -1 && (length-point>0)){
		return Number(res).toFixed(point);
	}
	return Number(res);
}

var reg1 = /^[0-9]*[1-9][0-9]*$/;
var reg2 = /^[0-9]+\.?[0-9]{0,2}$/;

$(document).ready(function(){
	$("#btn").click(function(){
		var sex = $("input:radio[name='sex_radio']:checked").val();
		var a = $("#age").val();
		var h = $("#height").val();
		var w = $("#weight").val();
		if(typeof(sex)=="undefined"){
			Dialog.alert("请选择性别");
			return;
		}
		if(!reg1.test(a)){
			Dialog.alert("年龄请输入整数");
			return;
		}
		if(!reg2.test(h)){
			Dialog.alert("身高请输入最多小数点后2位");
			return;
		}
		if(!reg2.test(w)){
			Dialog.alert("体重请输入最多小数点后2位");
			return;
		}
		var res_met = 0;
		if(sex==0){
			res_met = 655+9.6*w+(1.7*h-4.7*a);
		}else{
			res_met = 66+13.7*w+(5*h-6.8*a);
		}
		var res_bmi = w/((h/100)*(h/100));
		var min_weg_res = decimal((18*(h/100*h/100)),0);
		var max_weg_res = decimal((23*(h/100*h/100)),0);
		var min_res = decimal((220-a)*0.6,0);
		var max_res = decimal((220-a)*0.8,0);
		$("#met_msg").html(decimal(res_met,2));
		$("#bmi_msg").html(decimal(res_bmi,2));
		$("#weg_msg").html(min_weg_res+"~"+max_weg_res);
		$("#min_msg").html(min_res);
		$("#max_msg").html(max_res);
	});

	
	$("#tz_btn").click(function(){
		var sex = $("input:radio[name='sex_radio']:checked").val();
		var a = $("#age").val();
		var h = $("#height").val();
		if(typeof(sex)=="undefined"){
			Dialog.alert("请选择性别");
			return;
		}
		if(!reg1.test(a)){
			Dialog.alert("年龄请输入整数");
			return;
		}
		if(!reg2.test(h)){
			Dialog.alert("身高请输入最多小数点后2位");
			return;
		}
		var res = 20.5*(h/100*h/100);
		$("#res_msg").html(decimal(res,2));
	});

	
	$("#bmi_btn").click(function(){
		var h = $("#height").val();
		var w = $("#weight").val();
		if(!reg2.test(h)){
			Dialog.alert("身高请输入最多小数点后2位");
			return;
		}
		if(!reg2.test(w)){
			Dialog.alert("体重请输入最多小数点后2位");
			return;
		}
		var res = w/((h/100)*(h/100));
		$("#res_msg").html(decimal(res,1));
	});

	
	$("#dx_btn").click(function(){
		var sex = $("input:radio[name='sex_radio']:checked").val();
		var a = $("#age").val();
		var h = $("#height").val();
		var w = $("#weight").val();
		if(typeof(sex)=="undefined"){
			Dialog.alert("请选择性别");
			return;
		}
		if(!reg1.test(a)){
			Dialog.alert("年龄请输入整数");
			return;
		}
		if(!reg2.test(h)){
			Dialog.alert("身高请输入最多小数点后2位");
			return;
		}
		if(!reg2.test(w)){
			Dialog.alert("体重请输入最多小数点后2位");
			return;
		}
		var result = 0;
		if(sex==0){
			res = 655+9.6*w+(1.7*h-4.7*a);
		}else{
			res = 66+13.7*w+(5*h-6.8*a);
		}
		$("#res_msg").html(decimal(res,2));
	});

	
	//健康范围
	$("#jf_btn").click(function(){
		var h = $("#height").val();
		if(!reg2.test(h)){
			Dialog.alert("身高请输入最多小数点后2位");
			return;
		}
		var min_res = decimal((18*(h/100*h/100)),0);
		var max_res = decimal((23*(h/100*h/100)),0);
		$("#res_msg").html(min_res+"~"+max_res);
	});

	//燃脂运动计算
	$("#rz_btn").click(function(){
		var a = $("#age").val();
		if(!reg1.test(a)){
			Dialog.alert("年龄请输入整数");
			return;
		}
		var min_res = decimal((220-a)*0.6,0);
		var max_res = decimal((220-a)*0.8,0);
		$("#min_msg").html(min_res);
		$("#max_msg").html(max_res);
	});

});

//选中文本框中的一段文字
function selectText(textBox, startIndex, endIndex) {
	if (textBox.setSelectionRange) {
		textBox.setSelectionRange(startIndex, endIndex);
	} else if (textBox.createTextRange) {
		/*ie的实现方法*/
		var range = textBox.createTextRange();
		range.collapse(true);
		range.moveStart("character", startIndex);
		range.moveEnd("character", endIndex - startIndex);
		range.select();
	}
	textBox.focus();
}

function copy(id) {
	selectText(document.getElementById(id), 0,
			document.getElementById(id).innerHTML.length);
	var txt = document.getElementById(id).innerHTML;
	if (window.clipboardData) {
		window.clipboardData.setData("Text", txt);
		alert("复制成功！")
		return;
	} else if (window.netscape) {
		try {
			netscape.security.PrivilegeManager
					.enablePrivilege("UniversalXPConnect");
		} catch (e) {
			alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将 'signed.applets.codebase_principal_support'设置为'true'");
		}
		var clip = Components.classes['@mozilla.org/widget/clipboard;1']
				.createInstance(Components.interfaces.nsIClipboard);
		if (!clip)
			return;
		var trans = Components.classes['@mozilla.org/widget/transferable;1']
				.createInstance(Components.interfaces.nsITransferable);
		if (!trans)
			return;
		trans.addDataFlavor('text/unicode');
		var str = new Object();
		var len = new Object();
		var str = Components.classes["@mozilla.org/supports-string;1"]
				.createInstance(Components.interfaces.nsISupportsString);
		var copytext = txt;
		str.data = copytext;
		trans.setTransferData("text/unicode", str, copytext.length * 2);
		var clipid = Components.interfaces.nsIClipboard;
		if (!clip)
			return false;
		clip.setData(trans, null, clipid.kGlobalClipboard);
		alert("复制成功！")
	} else if ((window.MessageEvent && !document.getBoxObjectFor)) {
		alert("您的浏览器不支持此功能，请按Ctrl+C进行复制！");
	}
}
