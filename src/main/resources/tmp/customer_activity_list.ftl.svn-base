<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>报名客户回访</title>
<@u.css src="style.css"/>
<script type='text/javascript' src='${base}/dwr/interface/CustomerAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 > 营养师部 > 报名客户回访</div>
<form action="customer_activity!input.action?header=${(header?string)!}" method="post" id="form" name="form">
<input type="hidden" id="header" name="header" value="${(header?string)!}" />
<input type="hidden" id="id" name="id" />
</form>
<@u.search_bar action="customer_activity!customerActivityList.action">
<input type="hidden" id="header" name="header" value="${(header?string)!}" />
<input type="hidden" id="curPage" name="customerActivity.curPage" value="${(customerActivity.curPage)!}" />
  <table>
    <input type="hidden" id="startTime" name="customerActivity.customer.startTime" />
    <input type="hidden" id="endTime" name="customerActivity.customer.endTime" />
	<tr>
	  <td width="25%">活动名称</td>
      <td width="25%">
	      <select name="customerActivity.activity.id">
	          <option value="">--请选择--</option>
	          <#list activityList as activity>
	          <option value="${activity.id!}" <#if (customerActivity.activity.id)??&&activity.id==customerActivity.activity.id>selected</#if>>${activity.name!}
	          </option>
	          </#list>
	      </select>
	  </td>
	  <td width="25%">年龄段</td>
      <td width="25%">
		从<select id="start" onchange="getStart()">
		<option value="">--请选择--</option>
		<#if startList??>
		<#list startList as start>
		    <option value="${start!}" <#if begin??&&begin==start> selected</#if>>${start!}</option>
		</#list>
		</#if>
		</select>到
		<select id="end" onchange="getEnd()">
		<option value="">--请选择--</option>
		<#if endList??>
		<#list endList as end>
		    <option value="${end!}" <#if over??&&over==end> selected</#if>>${end!}</option>
		</#list>
		</#if>
		</select>
	  </td>
    </tr>
	<tr>
	  <td width="25%">客户姓名</td>
      <td width="25%"><input type="text" name="customerActivity.customer.name" value="${(customerActivity.customer.name)!}" /></td>
	  <td width="25%">性别</td>
      <td width="25%">
		<@s.select id="customerActivity.customer.sex" name="customerActivity.customer.sex" list="sysCodeSexList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="customerActivity.customer.sex" theme="simple"/>
	  </td>
    </tr>
  </table> 
 </@u.search_bar>
<div class="listDiv">

<div class="listTitle">
  <span>报名客户列表</span>
    <#if header><input type="button" value="报名客户回访查询" onclick="window.location.href='customer_activity!customerActivityList.action?header=true&param=record'" class="btn_bg fr"></#if>
    <#if header><input type="button" value="报名客户分配" onclick="window.location.href='customer_activity!customerActivityList.action?header=true&param=assign'" class="btn_bg fr"></#if>
    <input type="button" value="活动报名" onclick="window.location.href='activity.action<#if header>?header=true</#if>'" class="btn_bg fr">
</div>

<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>姓名</th>
	<th>性别</th>
	<th>电话</th>
	<th>年龄</th>
	<th>身高</th>
	<th>体重</th>
	<th>活动名称</th>
	<th>回访人员</th>
	<th>回访状态</th>
	<th>最后回访日期</th>
	<th>BMI</th>
	<th>意愿</th>
	<th>报名日期</th>
	<th>操作</th>
  </tr>
  <#if (page.dataList)??>
  <#list page.dataList as customerActivity>
  <tr>
  	  <td>${customerActivity_index+1}
	  <td>${(customerActivity.customer.name)!}</td>
      <td><@c.syscode syscodes = sysCodeSexList code='${(customerActivity.customer.sex)!}'/></td>
      <td>${customerActivity.customer.tel!}</td>
      <td><#if customerActivity.customer.birthday ??>${(customerActivity.customer.getAge(customerActivity.customer.birthday))!}</#if></td>
      <td>${(customerActivity.customer.height)!}</td>
	  <td>${((customerActivity.customer.weight)?string.number)!}</td>
      <td>${(customerActivity.activity.name)!}</td>
      <td>${(customerActivity.cusVisitRecord.staff.name)!}</td>
	  <td><@c.syscode syscodes = sysCodeStatusList code='${customerActivity.customer.visitStatus!}'/></td>
      <td>${(customerActivity.cusVisitRecord.createDate!?string("yyyy-MM-dd"))?default("")}</td>
      <td><#if (customerActivity.customer.height)??&&(customerActivity.customer.weight)??>${(customerActivity.customer.getBMI(customerActivity.customer.height,customerActivity.customer.weight))!}<#else>暂无</#if></td>
      <td><@c.syscode syscodes = sysCodeWillList code='${(customerActivity.customer.will)!}'/></td>
	  <td>${(customerActivity.createDate!?string("yyyy-MM-dd"))?default("")}</td>
	  <td>
		  <a href="javascript:edit(${(customerActivity.customer.id)!});">修改</a>
		  <a href="javascript:record(${(customerActivity.customer.id)!});">回访</a>
	  </td>
  </tr>
  </#list>
 </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
<script type="text/javascript">
function edit(id){
	document.getElementById("id").value=id;
	var form=document.getElementById("form");
	form.submit();
}
function record(id){
	document.getElementById("id").value=id;
	var form=document.getElementById("form");
	form.action="customer_activity!input.action?param=record"
	form.submit();
}
// 开始年龄段
function getStart(){
var select=document.getElementById("start");
var start="";
if(select[0].selected){
  return false;
}
for(var i=1;i<select.length;i++){
  if(select[i].selected){
    start=select.options[i].value;
  }
}
 CustomerAjaxService.getAgeRange(start,function(reply){
    document.getElementById("startTime").value=reply+"-12-31";
  });
}
// 结束年龄段
function getEnd(){
var select=document.getElementById("end");
var end="";
if(select[0].selected){
  return false;
}
for(var i=1;i<select.length;i++){
  if(select[i].selected){
    end=select.options[i].value;
  }
}
 CustomerAjaxService.getAgeRange(end,function(reply){
    document.getElementById("endTime").value=reply+"-1-1";
  });
}
</script>
</html>
