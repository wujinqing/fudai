<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>一种类型商品列表</title>
<@u.css src="style.css"/>
<script type='text/javascript' src='${base}/dwr/interface/ProductAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<@u.js src="drag.js"/>
<script type='text/javascript'>
	function edit(id){
		document.getElementById("id").value=id;
		var form = document.getElementById("pro_form");
		form.action="product!input.action";
		form.submit();
	}
	
	function del(id){
		if(confirm("确认删除该商品？")){
			ProductAjaxService.isDelete(id,function(data){
				if(data){
					document.getElementById("id").value=id;
					var form = document.getElementById("pro_form");
					form.action="product!deleteOne.action";
					form.submit();
				}else{
					alert("产品产生过销售单或订单不能删除！");
				}
			});
		}else{
			return;
		}
	}
	
	function operate(productId,productName,type){
		if(type=='set'){
			var form = document.getElementById("form1");
			document.getElementById("productId").value=productId;
			document.getElementById("productName").value=encodeURIComponent(productName);
			form.action="${base}/mb/product_rebate_rule!input.action";
			form.submit();
		}
		if(type=='list'){
			var form = document.getElementById("form1");
			document.getElementById("productId").value=productId;
			form.action="${base}/mb/product_rebate_rule!ruleList.action";
			form.submit();
		}
	}

</script>
</head>

<body>
<script>
    <#if flush??>
    	window.parent.left.location.reload();
    </#if>
</script>
<form method="post" id="pro_form" name="pro_form">
  <input type="hidden" id="flush" name="flush" value="true">
  <input type="hidden" id="id" name="id">
  <#if (product.id)??>
  <input type="hidden" id="pId" name="pId" value="${(product.id)!}">
  <#else>
  <input type="hidden" id="pId" name="pId" value="0">
  </#if>
</form>
<form method="post" id="form1" name="form1">
	 <input type="hidden" id="productId" name="productId">
	 <input type="hidden" id="productName" name="productName">
</form>
 <@u.title_bar title="${(product.name)!'产品'}列表">
 <#if '${operate!}'=='rebate'>
 <#else>
 	<#if (product.packAge)??>
 		<#if (product.packAge)?string==no>
    	<@u.title_bar_btn type="new" onclick="edit();"/>
    	</#if>
    <#else>
    	<@u.title_bar_btn type="new" onclick="edit();"/>
    </#if>
 </#if>
</@u.title_bar>
    	
<div class="listLine">
<table>
  <tr>
    <th>产品名称</th>
    <th>产品单位</th>
    <th>产品价格</th>
    <th>销售类型</th>
    <th>是否停产</th>
    <th>操作</th>
  </tr>
  <#if productList??>
  	<#list productList as product>
  	<tr>
	    <td>${(product.name)!}</td>
	    <td><@c.syscodeOne syscodes = sysCodeList  code='${(product.packAge)!}' type='${unit!}'/></td>
	    <td><#if (product.price)??>${(product.price)?if_exists?string.number}</#if></td>
	    <td>
	    	<#if (product.salesType)??>
	    		<#assign arr=(product.salesType)?split(",")>
	    		<#list sysCodeList as sysCode>
	    			<#list arr as a>
	    				<#if sysCode.code=a&&sysCode.type=type>
	    					${sysCode.codeName!}
	    				</#if>
	    			</#list>
	    		</#list>
	    	</#if>
	    </td>
	    <td><#if product.isOver??><#if product.isOver="0">否<#elseif product.isOver="1">是</#if></#if></td>
	    <td>
	    <#if '${operate!}'=='rebate'>
	    <a href="javascript:operate('${product.id}','','list')">折现规则列表</a> |
	    <a href="javascript:operate('${product.id}','${(product.name)!}','set')">设置折现规则</a> 
	    <#else>
	    	<a href="javascript:edit(${product.id})">修改</a> | 
	    	<a href="javascript:del(${product.id})" class="font_red">删除</a>
	    </#if>
	    </td>
  	</tr>
  	</#list>
  <#else>
  	<tr><td colspan="5">暂无记录</td></tr>
  </#if>
</table>
</div>

</body>
</html>
