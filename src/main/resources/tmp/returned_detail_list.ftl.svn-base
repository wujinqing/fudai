<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人退货入库</title>
<@u.css src="style.css"/> 
</head>

<body class="mainbody">
<div class="listTitle"><span>个人退货入库列表</span></div>
<div class="listLine">
<table>
  <tr> 
    <th>序号</th>
    <th>退货日期</th>
    <th>退货人</th>
	<th>退货金额</th>
	<th>批准退货金额</th>
    <th>批准人</th>
    <th width="20%">退货原因</th>
    <th>退货地点</th>
	<th>入库状态</th>
  </tr>
  <#if returnedList??>
  <#list returnedList as returned>
  <tr>
    <td>${returned_index+1}</td>
    <td>${(returned.createDate!?string("yyyy-MM-dd"))?default("")}</td>
 	<td>${(returned.customer.name)!}</td>
    <td>${(returned.money?string.number)!}</td>
    <td>${(returned.approveMoney?string.number)!}</td>
    <td>${returned.approveName!}</td>
    <td>${returned.reason!}</td>
    <td>${(returned.org.name)!}</td>
	<td><a href="javascript:look('${returned.customer.id!}','${returned.id!}')"><@c.syscode syscodes = inList code='${returned.instate!}'/></a></td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="8">暂无信息！</td></tr>
  </#if>
</table>
</div>
</body>
<script type="text/javascript">
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'',
				'toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
	
	function look(cusId,id){
		var url="returned!lookDetail.action?returnedGoods.id="+id+"&salecus.member.id="+cusId;
		beginOpen(url);
	}
</script>
</html>
