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
<script type='text/javascript' src='${base}/dwr/interface/MemberAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type='text/javascript'>  
	function edit(){
		$("#search_form").attr("action","sales_order!first.action");
		$("#search_form").submit();
	}
	
	function sureOwn(mid,id){
		MemberAjaxService.staffExist(mid,function(data){
			if(data){
				$("#user_id").val(mid);
				$("#id").val(id);
				$("#own_form").submit();
			}else{
				alert("请先分配营养师");
			}
		});
	}
	
	function editOwn(mid,id){
		$("#user_id").val(mid);
		$("#id").val(id);
		$("#modify").val("1");
		$("#own_form").submit();
	}
	
	function assign(umid){
		window.location="sales_order!assignDietitian.action?user.id="+umid+"&flag=true";
	}
	
	function oldAct(mid,id){
		window.location="sales_order!sureBuyType.action?user.id="+mid+"&id="+id;
	}
	
	function lookDetail(sid){
		window.location="sales_order!salesLookDetail.action?id="+sid;
	}
	
	function editTypeOwn(sid){
		window.location.href="sales_order!toEditTypeOwn.action?id="+sid;
	}
	
	function gotoList(){
		var url="";
		if("${tot!}"!=""){
			url="${base}/mb/act_signup!reportDetail.action?tot=${tot!}";
		}
		else{
			url="${base}/mb/act_signup!reportDetail.action";
		}
		window.location.href=url;
	}
</script>
</head>

<body class="mainbody">
<form id="own_form" method="post" action="sales_order!fixOwn.action">
<input type="hidden" id="user_id" name="user.id" />
<input type="hidden" id="id" name="salesOrder.id" />
<input type="hidden" id="modify" name="modify"/>
</form>
<div class="fastNav">工作平台 > 门店销售工作平台 > 客户销售单列表</div>
<@u.title_bar title="销售单列表">
	<@u.title_bar_btn type="new" onclick="edit();"/>
</@u.title_bar>
<@u.search_bar action="sales_order!salesList.action">
<input type="hidden" id="curPage" name="curPage" value="${salesOrder.curPage!}">
<table width="100%" border="0" cellspacing="0">
	<tr>
		<td>客户姓名</td>
		<td><input type="text" name="salesOrder.useMember.name" value="${(salesOrder.useMember.name)!}" /></td>
		<td>机构</td>
		<td>
			<@s.select headerKey="" headerValue="--请选择--" id="" name="salesOrder.org.id"
				 list="orgList" listKey="id" listValue="name" theme="simple" />
		</td>
		<td>操作</td>
		<td>
			<select name="operate">
				<option value="">--请选择--</option>
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
    <#if page.dataList??>
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
      		<a href="javascript:sureOwn('${(salesOrder.useMember.id)!}','${(salesOrder.id)!}')">确定销售归属</a>&nbsp;
      		</#if>
      		<#if (salesOrder.useMember.staff.id)??>
      		营养师已分配
      		<#else>
	      		<a href="javascript:assign('${(salesOrder.useMember.id)!}')">分配营养师</a>
      		</#if>
      		<#if (salesOrder.ownFlag)??>
      		<#if edit_o??&&edit_o?string="true">
      		<a href="javascript:editOwn('${(salesOrder.useMember.id)!}','${(salesOrder.id)!}')">修改销售归属</a>
      		</#if>
      		</#if>
      	</#if>
      	<#if salesOrder.useMemberType=1>
      		<#if (salesOrder.ownFlag)??>
      		续购归属已确定
      		<#else>
      		<a href="javascript:oldAct('${(salesOrder.useMember.id)!}','${(salesOrder.id)!}')">确定续购类型/归属</a>
      		</#if>
      		<#if (salesOrder.ownFlag)??>
	      		<#if edit_to??&&edit_to?string="true">
	      			<a href="javascript:editTypeOwn('${(salesOrder.id)!}')">修改续购归属</a>
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
      			<a href="javascript:editOwn('${(salesOrder.useMember.id)!}','${(salesOrder.id)!}')">修改销售归属</a>
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
	      			<a href="javascript:editTypeOwn('${(salesOrder.id)!}')">修改续购归属</a>
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
