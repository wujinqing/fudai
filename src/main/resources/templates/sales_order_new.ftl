<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新客户销售单</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
</head>

<body class="mainbody">
<div class="fastNav">系统设置 > 工作人员帐号管理 > 新客户销售单</div>
<div class="listDiv font_red txtLeft">在系统里没有记录，确定为新客户</div>
<div class="listLine">
<table>
  	<tr><th colspan="2" align="left">系统确定</th></tr>
  	<tr>
  		<td class="txtRight" width="30%">客户姓名：</td>
  		<td class="txtLeft" width="70%">${(user.name)!}</td>
  	</tr>
	<tr>
		<td class="txtRight" width="30%">性别：</td>
		<td class="txtLeft" width="70%"><#if "${(user.sex)!}"=="1">男<#else>女</#if></td>
	</tr>
	<tr>
		<td class="txtRight" width="30%">手机：</td>
		<td class="txtLeft" width="70%">${(user.tel)!}</td>
	</tr>
  </tr>
</table>
</div>
<form action="sales_order!newSecond.action" method="post">
<div class="listDiv">
	<#if user.tel??&&user.tel!="">
	<input type="submit" value="确认" class="btn_bg" />
	<#else>
	<div class="font_red">请返回填写手机号码</font>
	</#if>
	<input type="button" value="返回" class="btn_bg" onclick="history.back()" />
</div>
</form>
</body>
</html>
