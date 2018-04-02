<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/macros/ui.ftl" as u>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>福代门业</title>
<@u.css src="mainIndex.css"/>
<@u.css src="topInput.css"/>
<@u.js src="indexFrame.js"/>
<@u.js src="miaov.js"/>
<script type='text/javascript'>
function changeLeft(mid){
	var Oiframe=document.getElementById("left_frameMenu");
	Oiframe.src="operate!menuLists.action?operate.id="+mid;
}
</script>
</head>
<body>


<div class="side" id="left_frame">
	<iframe id="left_frameMenu" src="/left_menu" marginwidth="0" height="100%" marginheight="0" align="left"
			scrolling="No" frameborder="0" name="left"></iframe>
</div>

<div class="main" id="right_frame">
	<iframe src="/right_menu" name="mainFrame" class="rightIframe" align="top" scrolling="Auto" frameborder="0" id="mainFrame" ></iframe>
</div>

<div class="arrow" id="slide" onclick=switchSysBar()></div>



</body>
</html>