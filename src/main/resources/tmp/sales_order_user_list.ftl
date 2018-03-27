<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户销售单列表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.js src="drag.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/SalesOrderAjaxService.js'></script>
  		<script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>  
        function edit(){
        	$("#search_form").attr("action","sales_order!first.action");
        	$("#search_form").submit();
        }
        
        function sureOwn(mid,id){
        	$("#user_id").val(mid);
        	$("#id").val(id);
        	$("#own_form").submit()
        }
        
        function assign(mid,umid){
        	window.location="sales_order!assignDietitian.action?customer.id="+mid+"&user.id="+umid+"&flag=true";
        }
        
        function sureXg(mid,id){
        	window.location="sales_order!sureBuyType.action?id="+id+"&user.id="+mid+"&flag=true";
        }
        
        function oldAct(id){
        	SalesOrderAjaxService.sureBuyType(id,function(data){
        		if(data == ""){
        			$("#msg").html("请先确定续够类型！");
        			$("#closed").fadeIn();
        			return;
        		}else{
        			window.location="sales_order!memberActive.action?id="+id;
        		}
        	})
        }
        
        function lookDetail(sid){
        	window.location="sales_order!salesLookDetail.action?id="+sid;
        }
        </script>
</head>

<body class="mainbody">
<form id="search_form" method="post" action="sales_order!salesList.action">
<input type="hidden" id="curPage" name="curPage" value="${salesOrder.curPage!}">
</form>

<form id="own_form" method="post" action="sales_order!fixOwn.action">
<input type="hidden" id="user_id" name="user.id" />
<input type="hidden" id="id" name="salesOrder.id" />
</form>

<div class="fastNav">工作平台 > 门店销售工作平台 > 客户销售单列表</div>

<@u.title_bar title="销售单列表">
	<@u.title_bar_btn type="new" onclick="edit();"/>
</@u.title_bar>
<div class="listLine">
  <table>
    <tr>
      <th>序号</th>
      <th>购买人</th>
      <th>购买人类型</th>
      <th>使用人</th>
      <th>使用人类型</th>
      <th>购买日期</th>
      <th>发货状态</th>
      <th>详情</th>
      <th>操作</th>
    </tr>
    <#if page.dataList ??>
    <#list page.dataList as salesOrder>
    <tr>
      <td>${(salesOrder_index+1)}</td>
      <td>${(salesOrder.member.name)!}</td>
      <td>
      	<#if (salesOrder.memberType)??>
      		<#if salesOrder.memberType=0>
      			新客户
      	    <#else>
      	    	老客户
      	    </#if>
      	</#if>
      </td>
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
      <td>
      	<@c.syscode syscodes=syscodeList code="${(salesOrder.status)!}" />
      </td>
      <td><a href="javascript:lookDetail('${(salesOrder.id)!}')">查看详情</a></td>
      <td>
      	<#if salesOrder.useMemberType=0>
      		<#if (salesOrder.ownFlag)??>
      		销售归属已确定
      		<#else>
      		<a href="javascript:sureOwn('${(salesOrder.useMember.id)!}','${(salesOrder.id)!}')">确定销售归属</a>&nbsp;
      		</#if>
      		<#if (salesOrder.useMember.staff.id)??>
      		营养师已分配
      		<#else>
	      		<#if salesOrder.memberType=1>
	      		<a href="javascript:assign('','${(salesOrder.useMember.id)!}')">分配营养师</a>
	      		<#else>
	      		<a href="javascript:assign('${(salesOrder.member.id)!}','${(salesOrder.useMember.id)!}')">分配营养师</a>
	      		</#if>
      		</#if>
      	</#if>
      	<#if salesOrder.useMemberType=1>
      		<#if (salesOrder.buyType)??>
      		续够已确定
      		<#else>
      		<a href="javascript:sureXg('${(salesOrder.useMember.id)!}','${(salesOrder.id)!}')">续够确定</a>&nbsp;
      		</#if>
      		<#if (salesOrder.ownFlag)??>
      		已激活
      		<#else>
      		<a href="javascript:oldAct('${(salesOrder.id)!}')">老客户激活</a>
      		</#if>
      	</#if>
      </td>
    </tr>
    </#list>
    <#else>
    <tr>
    	<td colspan="9">暂无信息！</td>
    </tr>
    </#if>
  </table>
</div>
<@u.paginate page=page/>

</body>
</html>
