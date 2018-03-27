<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>发货处理</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 > 加盟点订、发货管理 > 发货处理</div>
<@u.search_bar action="league_order!deliveryList.action?param=">
<input type="hidden" id="curPage" name="leagueOrder.curPage" value="${(leagueOrder.curPage)!}" />
  <table>
    <tr>
      <td>订货机构</td>
      <td><@s.select name="leagueOrder.org.id" value="${(leagueOrder.org.id)!}" list=orgList listKey="id" listValue="name" headerKey="" headerValue="--请选择--" theme="simple" /></td>
      <td>订货日期</td>
      <td><input type="text" name="leagueOrder.startDate" value="${(leagueOrder.startDate?string('yyyy-MM-dd'))?default('')}" onclick="WdatePicker({isShowClear:false})"/> 到 <input type="text" name="leagueOrder.endDate" value="${(leagueOrder.endDate?string('yyyy-MM-dd'))?default('')}" onclick="WdatePicker({isShowClear:false})"/></td>
    </tr>
    <tr>
      <td>发货状态</td>
      <td><@s.select name="leagueOrder.status" value="${leagueOrder.status!}" list=syscodeList listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple" /></td>
      <td></td>
      <td></td>
    </tr>
  </table>
  </@u.search_bar>
<div class="listTitle"><span>查询结果列示</span></div>
<div class="listLine">
  <table>
    <tr>
      <th>订货单号</th>
      <th>订货单位</th>
      <th>订货时间</th>
      <th>收货人</th>
      <th>发货状态</th>
      <th>发货日期</th>
      <th>查看</th>
      <th>操作</th>
    </tr>
    <#if page.dataList ?? && (page.dataList.size()>0) >
    <#list page.dataList as leagueOrder>
    <tr>
      <td>${(leagueOrder.orderNumber)!}</td>
      <td>${(leagueOrder.org.name)!}</td>
      <td>${(leagueOrder.createDate?string("yyyy-MM-dd"))!}</td>
      <td>${(leagueOrder.receiver)!}</td>
      <td><@c.syscode syscodes=syscodeList code="${(leagueOrder.status)!}" /></td>
      <td>${(leagueOrder.deliveryDate?string("yyyy-MM-dd"))!}</td>
      <td><a href="javascript:window.location.href='league_order!showDetails.action?id=${(leagueOrder.id)}&param=details'">明细发货单</a></td>
      <td><#if (leagueOrder.status<4) ><a href="javascript:window.location.href='league_order!showDetails.action?id=${(leagueOrder.id)!}&param='">处理发货</a><#else>无</#if></td>
    </tr> 
	</#list>
    </#if>
  </table>
</div>
<@u.paginate page=page/>
</body>
</html>
