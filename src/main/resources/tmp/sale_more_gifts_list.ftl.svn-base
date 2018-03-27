<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>赠品|配套列表</title>
<@u.css src="style.css"/>
<script type='text/javascript'>        
</script>
</head>
<body class="mainbody">
<div style="display:none">
</div>

<@u.title_bar title="赠品|配套列表"></@u.title_bar>
<div class="listLine">
<table width="100%" border="0" cellspacing="0">
	<tr>
	    <th>发货单编号</th>
	    <th>名称</th>
	    <th>单价</th>
	    <th>数量</th>
	    <th>备注</th>
	</tr>
<#if saleMoreList??&&saleMoreList?size gt 0>
	<#list saleMoreList as saleMore>
	<tr>
	    <td>${(saleMore.sale.id)!}</td>
	    <td>${(saleMore.productName)!}</td>
	    <td>${((saleMore.price)?string.number)!}</td>
	    <td>${(saleMore.count)!}</td>
	    <td>${(saleMore.remark)!}</td>
    </tr>
	</#list>
	<#else>
	<tr><td colspan="5">暂无记录！</td></tr>
</#if>
</table>
</div>        
</body>
</html>