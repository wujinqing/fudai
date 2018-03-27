<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
</head>

<body class="mainbody">

<div class="fastNav">系统设置 > 工作人员帐号管理 > 暂未发货单</div>
<form id="search_form" name="search_form" action="league_order!isPartList.action" method="post">
<input type="hidden" id="curPage" name="leagueOrder.curPage" value="${(leagueOrder.curPage)!}" />
</form>
<div class="listLine">
  <table>
    <tr>
      <th>订货时间</th>
      <th>订货单位</th>
      <th>暂未发货清单</th>
      <th>处理状态</th>
      <th>操作</th>
    </tr>
    <#if page.dataList ?? && (page.dataList.size()>0)>
    	<#list page.dataList as leagueOrder>
    <tr>
      <td>${(leagueOrder.createDate?string("yyyy-MM-dd"))!}</td>
      <td>${leagueOrder.org.name!}</td>
      <td><a href="javascript:window.location.href='league_order!showDetails.action?param=isPart&id=${leagueOrder.id!}'">点此查看</a></td>
      <td><@c.syscode syscodes=syscodeList code="${leagueOrder.status!}" /></td>
      <td><#if (leagueOrder.status<4)><a href="javascript:window.location.href='league_order!showDetails.action?param=&id=${leagueOrder.id!}'">发货</a></#if> <a href="javascript:window.location.href='league_order!delete.action?id=${leagueOrder.id}'">删除</a></td>
    </tr>
    </#list>
    </#if>
  </table>
</div>
<@u.paginate page=page/>
</body>
</html>
