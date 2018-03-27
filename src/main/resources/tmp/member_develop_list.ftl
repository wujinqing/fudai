<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>目标客户开发记录</title>
<@u.css src="style.css"/>
</head>

<body class="mainbody">

<div class="fastNav">工作平台 > 营养师部 > 目标客户开发记录</div>

<div class="listLine txtLeft">
<table>
  <tr>
	<th colspan="4" align="left">目标客户开发记录</th>
  </tr>
  <tr>
	<td width="20%">客户姓名：</td>
	<td width="30%">${member.name!}</td>
	<td width="20%">手机：</td>
	<td width="30%">${member.tel!}</td>
  </tr>
  <tr>
	<td>所处阶段(天数/总天数)：</td>
	<td><@c.syscode syscodes=sysCodeStageList code="${(member.phase)!}"/> 
      <#if member.phaseStartDate??>${member.getDay(member.phaseStartDate)}</#if>/<#if member.createDate??>${member.getDay(member.startDate)}</#if>
    </td>
	<td>转介绍名单：</td>
	<td>${member.toName!}</td>
  </tr>
  <tr>
	<td>原始体重：</td>
	<td>${((member.weight)?string.number)!}</td>
	<td>目前体重：</td>
	<td>${((member.nowWeight?string.number))!}</td>
  </tr>
  <tr>
	<td>营养师：</td>
	<td>${(member.staff.name)!}</td>
	<td>所属机构：</td>
	<td>${(member.staff.org.name)!}</td>
  </tr>
</table>
</div>
<div class="listLine txtLeft">
<form name="form" id="form" method="post" action="member!saveDevelop.action">
<input type="hidden" name="member.id" id="member.id" value="${member.id!}">
<input type="hidden" name="develop.member.id" id="develop.member.id" value="${member.id!}">
<table>
  <tr>
	<th colspan="2" align="left">开发记录</th>
  </tr>
  <tr>
  <tr>
	<td width="20%"><input type="text" name="develop.record" id="develop.record"/></td>
    <td><input type="button" value="提交" class="btn_bg" onclick="doSubmit();"/></td>
  </tr>
</table>
</form>
</div>
<div class="listLine">
<table>
  <tr>
	<th width="20%">开发日期</th>
    <th>开发记录</th>
  </tr>
<#if developList??>
  <#list developList as develop>
  <tr>
    <td><#if develop.createDate??>${(develop.createDate!?string('yyyy-MM-dd'))?default("")}</#if></td>
    <td>${develop.record!}</td>
  </tr>
  </#list>
</#if>
</table>
</div>
</body>
<script type="text/javascript">
     // 进入开发记录
     function doSubmit(){
		var form=document.getElementById("form");
		form.submit();
	}
</script>
</html>
