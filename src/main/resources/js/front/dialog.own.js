var Dialog={};
var rootPath="";
if(base){
	rootPath=base;
}

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
	arr.push("<div style=\"text-align:left;background-image:url("+rootPath+"/images/front/top-dh-d.gif);padding:5px;\">提示：</div>");
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

Dialog.load=function(){
	var _a = document.getElementById("load_msg");
	if(_a) {
		if(_a.style.display=="none"){
			_a.style.display="block";
		}
		return;
	}
	var arr=[];
	arr.push("<div id=\"load_msg\" class=\"alertdiv\" style=\"text-align:center;\">");
	arr.push("<span style=\"background: url("+rootPath+"/images/front/loading.gif) no-repeat;overflow:hidden;padding:4px 0 0 20px;line-height:25px;\">正在加载...</span>");
	arr.push("</div>");
	var div = document.createElement("div");
	div.innerHTML = arr.join('');
	document.body.appendChild(div);
}
Dialog.cload=function(){
	document.getElementById("load_msg").style.display="none";
}
