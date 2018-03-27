<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购买</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<script type="text/javascript">
	function getIds(){
		var productIds="";
		var productAmounts="";
    	var names=document.getElementsByName("product");
    	for(var i=0;i<names.length;i++){
    		if(names[i].checked==true){
				amount=document.getElementById("p_"+names[i].value).value;
    			if(amount!=""){
    				productIds += names[i].value+"_";
    				productAmounts += amount+"_";
    			}
    		}
    	}
    	$("#productIds").val(productIds);
    	$("#productAmounts").val(productAmounts);
    	$("#bill").submit();
	}
</script>
</head>

<body class="mainbody">
<form action="sales_order!newBill.action" method="post" id="bill">
	<input type="hidden" id="productIds" name="productIds"/>
	<input type="hidden" id="productAmounts" name="productAmounts"/>
</form>
<div class="fastNav">系统设置 > 工作人员帐号管理 > 购买</div>
<div class="listLine">
  <table>
    <tr>
      <th colspan="6" align="left"> 购买</th>
    </tr>
    <tr>
      <td width="15%">客户姓名：</td>
      <td>${(salesOrder.useMember.name)!}</td>
      <td width="15%">手机：</td>
      <td>${(salesOrder.useMember.tel)!}</td>
      <td width="15%">客户类型：</td>
      <td><#if (salesOrder.useMember.id)??>老客户<#else>新客户</#if></td>
    </tr>
  </table>
</div>
<div class="listTitle"><span>产品品种及数量</span></div>
<div class="listLine txtLeft">
  <table>
  <#if productStockMap ??>
  	<#list productStockMap?keys as parentName>
  	<#if productStockMap.get(parentName)?? && productStockMap.get(parentName).size() gt 0>
    <tr>
      <td width="20%">${parentName}</td>
      <td>
	      <#list productStockMap.get(parentName) as stock>
		      <input type="checkbox" name="product" value="${(stock.product.id)!}" /> ${(stock.product.name)!}(库存:${(stock.stocknumber)!})
		      <input type="text" id="p_${(stock.product.id)!}" size="1"/>
		      <@c.syscode syscodes=packageList code="${(stock.product.packAge)!}"/>
		      &nbsp;&nbsp;
		 </#list>
      </td>
   </tr>
   </#if>
   </#list>
   </#if>
  </table>
</div>
<div class="listDiv">
	<input type="button" onclick="javascript:getIds()" value="选定" class="btn_bg" />
	<input type="button" onclick="javascript:history.back()" value="返回" class="btn_bg" />
</div>
</body>
</html>
