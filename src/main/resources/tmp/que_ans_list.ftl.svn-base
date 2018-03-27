<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诺特会员中心-常见问题回答</title>
<@u.css src="nt.css"/>
</head>

<body>
<div class="right_main">
  <div class="fastNav">首页 > 会员中心 > 常见问题回答</div>
  <#if queAnsList??>
  <#list queAnsList as queAns>
  <table class="boxB table2">
	<tr class="bg_blue">
       <td width="5%">问：</td>
       <td>${(queAns.question)!}</td></tr>
	<tr>
    <td>答：</td>
       <td>${(queAns.answer)!}</td></tr>
  </table>
  </#list>
  <#else>
   <table class="boxB table2">
	<tr>
    	<td>暂无问题</td>
    </tr>
  </table>
  </#if>
</div>
</body>
</html>
