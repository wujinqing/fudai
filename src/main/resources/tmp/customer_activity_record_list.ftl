<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<@u.css src="style.css"/>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 >  活动管理 > 报名客户回访查询</div>
<@u.search_bar action="customer_activity!customerActivityList.action?param=record&header=true">
<input type="hidden" id="curPage" name="customerActivity.curPage" value="${(customerActivity.curPage)!}" />
  <table>
	<tr>
	  <td width="25%">活动名称</td>
      <td width="25%">
		      <select name="customerActivity.activity.id">
                      <option value="">--请选择--</option>
                      <#list activityList as activity>
                      <option value="${activity.id!}" <#if "${(customerActivity.activity.id)!}"="${(activity.id)!}">selected</#if>>${(activity.name)!}
                      </option>
                      </#list>
        </select>
	  </td>
	  <td width="25%">回访人</td>
      <td width="25%">
		<select name="customerActivity.cusVisitRecord.staff.id">
                      <option value="">--请选择--</option>
                      <#list staffList as staff>
                      <option value="${staff.id!}" <#if "${(customerActivity.cusVisitRecord.staff.id)!}"="${(staff.id)!}">selected</#if>>${staff.name!}
                      </option>
                      </#list>
        </select>
	  </td>
    </tr>
	<tr>
	 <td width="25%">回访状态</td>
	<td width="25%"><@s.select id="customerActivity.customer.visitStatus" name="customerActivity.customer.visitStatus" list="sysCodeStatusList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="customerActivity.customer.visitStatus" theme="simple"/></td>
     <td width="25%">&nbsp;</td>
	  <td width="25%">&nbsp;</td>
    </tr>
  </table> 
</@u.search_bar>

<div class="listTitle">
  <span>报名客户列表</span>
  <#if header><input type="button" value="报名客户分配" onclick="window.location.href='customer_activity!customerActivityList.action?header=true&param=assign'" class="btn_bg fr"></#if>
  <input type="button" value="报名客户回访" onclick="window.location.href='customer_activity!customerActivityList.action<#if header>?header=true</#if>'" class="btn_bg fr">
  <input type="button" value="活动报名" onclick="window.location.href='activity.action<#if header>?header=true</#if>'" class="btn_bg fr">
</div>

<div class="listLine">
<table>
  <tr>
    <th>选择</th>
    <th>姓名</th>
	<th>性别</th>
	<th>电话</th>
	<th>年龄</th>
	<th>身高</th>
	<th>体重</th>
    <th>意愿</th>
    <th>备注</th>
	<th>回访人员</th>
	<th>回访状态</th>
    <th>最后回访日期</th>
  </tr>
  <#if page??&&(page.dataList)??>
  <#list page.dataList as customerActivity>
  <tr>
    <td><input type="checkbox" id="check" name="check" value="${customerActivity.customer.id!}"></td>
	<td>${(customerActivity.customer.name)!}</td>
      <td><@c.syscode syscodes = sysCodeSexList code='${customerActivity.customer.sex!}'/></td>
      <td>${(customerActivity.customer.tel)!}</td>
      <td><#if customerActivity.customer.birthday ??>${customerActivity.customer.getAge(customerActivity.customer.birthday)!}</#if></td>
      <td>${(customerActivity.customer.height)!}</td>
	  <td>${(customerActivity.customer.weight)!}</td>
    <td><@c.syscode syscodes = sysCodeWillList code='${customerActivity.customer.will!}'/></td>
    <td>${(customerActivity.customer.remark)!}</td>
    <td><#if customerActivity.cusVisitRecord??>${(customerActivity.cusVisitRecord.staff.name)!}</#if></td>
	  <td><@c.syscode syscodes = sysCodeStatusList code='${customerActivity.customer.visitStatus!}'/></td>
      <td>${(customerActivity.cusVisitRecord.createDate!?string("yyyy-MM-dd"))?default("")}</td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="12">暂无记录</td></tr>
  </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
</html>
