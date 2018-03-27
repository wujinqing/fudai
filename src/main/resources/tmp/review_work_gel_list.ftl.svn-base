<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>咨询师工作回顾</title>
<@u.css src="style.css"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
<script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type='text/javascript'>
function setHeight(obj){
	var win=obj;
	if (document.compatMode == "BackCompat") {
		win.height = win.contentWindow.document.documentElement.scrollHeight;
    	win.style.height=win.height+"px";
	}else{
    	win.height = win.contentWindow.document.body.offsetHeight;
    	win.style.height=win.height+"px";
	}
}   

function lookBack(id){
	var url;
	if(id==1){
		url = "review_work!viewDiary.action?param=gel";
	}else if(id==2){
		url = "review_work!viewMessage.action?param=gel";
	}
	document.getElementById("i_f").src=url;
}
</script>
</head>

<body>
<div class="fastNav">咨询师部 > 咨询师主管工作平台 > 咨询师工作回顾</div>
<@u.title_bar title="咨询师工作回顾"></@u.title_bar>
<div class="listLine">
<table width="100%" border="0" cellspacing="0">
	<tr>
		<td width="50%"><a href="javascript:lookBack('1')">日记回顾</a></td>
		<td width="50%"><a href="javascript:lookBack('2')">留言回顾</a></td>
	</tr>
</table>
</div>
<iframe id="i_f" name="i_f" src="review_work!viewDiary.action?param=gel" width="100%" height="100%;" onload="setHeight(this)" scrolling="auto" frameborder="0"></iframe>
</body>
</html>	
