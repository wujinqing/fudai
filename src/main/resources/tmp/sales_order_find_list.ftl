<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户销售单查询列表</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<script type='text/javascript'>  
	function lookDetail(sid){
		var url = "sales_order!salesLookDetail.action?id="+sid;
		beginOpen(url);
	}
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'',
				'toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
</script>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 > 门店销售工作平台 > 客户销售单列表</div>
<div class="listTitle"><span>销售单列表</span></div>
<@u.search_bar action="sales_order!salesFindList.action">
<input type="hidden" id="curPage" name="curPage" value="${salesOrder.curPage!}">
<table width="100%" border="0" cellspacing="0">
	<tr>
		<td>客户姓名：</td>
		<td><input type="text" name="salesOrder.useMember.name" value="${(salesOrder.useMember.name)!}" /></td>
		<td>机构：</td>
		<td>
			<@s.select headerKey="" headerValue="--所有--" id="org_id" name="salesOrder.org.id"
				 list="orgList" listKey="id" listValue="name" theme="simple" />
		</td>
		<td>操作：</td>
		<td>
			<select name="operate">
				<option value="">--所有--</option>
				<option value="1" <#if salesOrder.assign??&&salesOrder.assign="1">selected</#if>>营养师待分配</option>
				<option value="2" <#if salesOrder.sureOwn??&&salesOrder.sureOwn="2">selected</#if>>销售归属待确定</option>
				<option value="3" <#if salesOrder.sureBuy??&&salesOrder.sureBuy="3">selected</#if>>续购类型待确定</option>
			</select>
		</td>
	</tr>
</table>
</@u.search_bar>

<div class="listLine">
  <table>
    <tr>
      <th>序号</th>
      <th>客户姓名</th>
      <th>客户类型</th>
      <th>购买日期</th>
      <th width="15%">备注</th>
      <th>发货状态</th>
      <th>所属机构</th>
      <th>详情</th>
      <th>操作</th>
    </tr>
    <#if page.dataList ??>
    <#list page.dataList as salesOrder>
    <tr>
      <td>${(salesOrder_index+1)}</td>
      <td>${(salesOrder.useMember.name)!}</td>
      <td>
      	<#if (salesOrder.useMemberType)??>
      		<#if salesOrder.useMemberType=0>
      			新客户
      	    <#else>
      	    	老客户
      	    </#if>
      	</#if>
      </td>
      <td>${(salesOrder.salesDate?string('yyyy-MM-dd'))?default("")}</td>
      <td>${(salesOrder.note)!}</td>
      <td><@c.syscode syscodes=syscodeList code="${(salesOrder.status)!}" /></td>
      <td>${(salesOrder.org.name)!}</td>
      <td><a href="javascript:lookDetail('${(salesOrder.id)!}')">查看详情</a></td>
      <td>
      <#if (salesOrder.org.id)??&&salesOrder.org.id=ownOrg>
      	<#if salesOrder.useMemberType=0>
      		<#if (salesOrder.ownFlag)??>
      			销售归属已确定
      		<#else>
      			确定销售归属&nbsp;
      		</#if>
      		<#if (salesOrder.useMember.staff.id)??>
      			营养师已分配
      		<#else>
	      		分配营养师
      		</#if>
      		<#if (salesOrder.ownFlag)??>
	      		<#if edit_o??&&edit_o?string="true">
	      		修改销售归属
	      		</#if>
      		</#if>
      	</#if>
      	<#if salesOrder.useMemberType=1>
      		<#if (salesOrder.ownFlag)??>
      			续购归属已确定
      		<#else>
      			确定续购类型/归属
      		</#if>
      		<#if (salesOrder.ownFlag)??>
	      		<#if edit_to??&&edit_to?string="true">
	      			修改续购归属
	      		</#if>
      		</#if>
      	</#if>
      <#else>
      	<#if salesOrder.useMemberType=0>
      		<#if (salesOrder.ownFlag)??>
      			销售归属已确定&nbsp;
      		<#else>
      			确定销售归属&nbsp;
      		</#if>
      		<#if (salesOrder.useMember.staff.id)??>
      			营养师已分配
      		<#else>
	      		分配营养师
      		</#if>
      		<#if (salesOrder.ownFlag)??>
      			<#if edit_o??&&edit_o?string="true">
      			修改销售归属
      			</#if>
      		</#if>
      	</#if>
      	<#if salesOrder.useMemberType=1>
      		<#if (salesOrder.ownFlag)??>
      		续购归属已确定
      		<#else>
      		确定续购类型/归属
      		</#if>
      		<#if (salesOrder.ownFlag)??>
	      		<#if edit_to??&&edit_to?string="true">
	      			修改续购归属
	      		</#if>
      		</#if>
      	</#if>
      </#if>
      </td>
    </tr>
    </#list>
    <#else>
    <tr><td colspan="11">暂无信息！</td></tr>
    </#if>
  </table>
</div>
<@u.paginate page=page/>
</body>
</html>
