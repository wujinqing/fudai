<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>出入库统计表(每天)</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>     
        	jQuery(document).ready(function(){
    	      if($("#org_type").val()!=''){
					$("#org_type").change();
				}
            })
            
             function getOrg(type){
				document.getElementById('orgId').options.length=0;
				var options = new Option("----所有----","");
				document.getElementById('orgId').options[0]=options;
				OrgAjaxService.getAllOrgByType(type,function(data){
					if(data.length != 0){
						for(var i=0;i<data.length;i++){
							options = new Option(data[i].name,data[i].id);
							document.getElementById('orgId').options[i+1]=options;
							var oid='${(org_p.id)!}';
							if(oid!=null&&oid!=''&&oid==data[i].id){
								document.getElementById('orgId').options[i+1].selected=true;
							}
						}
					}
				});
			}
         </script>
    </head>
    <body class="mainbody">
    	<form id="excel_from" name="excel_from" method="post" action="out_in_stock!getDayDetailList.action">
    	<input type="hidden" name="excel" value="true" id="excel" disabled="true"/>
    	</form>
    	
     	<@u.search_bar action="out_in_stock!getDayDetailList.action">
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        		<td>机构：</td>
	        	<td>类型
					<@s.select id="org_type" name="org_p.type" list="orgTypeList" listKey="code" listValue="codeName" headerKey="" onchange="getOrg(this.value)" headerValue="---所有---" value="org_p.type" theme="simple"/>	
					名称
						<select id="orgId" name="org_p.id">
						<option value="">---所有---</option>
						</select>
	        	 </td>
	        	 <td>查询项目：</td>
				 <td>
					<select id="outInStock_type" name="outInStock.type">
						<option value="0" <#if (outInStock.type??&&outInStock.type==0)>selected</#if>>出库量</option>
						<option value="1" <#if (outInStock.type??&&outInStock.type==1)>selected</#if>>入库量</option>
					</select>
				 </td>
        	</tr>
        	<tr>
        	    <td>时间：</td>
        	    <td>
        	    	<input type="text" name="outInStock.startDate" value="${(outInStock.startDate?string('yyyy-MM-dd'))!}" onclick="WdatePicker({readOnly:true})"/>~
        	    	<input type="text" name="outInStock.endDate" value="${(outInStock.endDate?string('yyyy-MM-dd'))!}" onclick="WdatePicker({readOnly:true})"/>
        	    </td>
				<td>产品</td>
      			<td><@s.select name="outInStock.product.id" value="${(outInStock.product.id)!}" list=productList listKey="id" listValue="name" headerKey="" headerValue="--请选择--" theme="simple" /></td>
	        </tr>
	        <tr>
	        	<td>销售单类型：</td>
	        	<td><@s.select name="outInStock.orderType" list="orderTypeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="outInStock.orderType"  theme="simple" /></td>
	        	<td colspan="2"></td>
	        </tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="出入库明细查询<font color='red'>（'-'表示库存无变化）</font>"></@u.title_bar>
        <div class="listLine">
        <table border="0" cellspacing="0">
            <tr>
            	  <th rowspan="2">序号</th>
	        	  <th rowspan="2">日期</th>
	        	  <th rowspan="2">机构</th>
	        	  <th rowspan="2">销售单类型</th>
	        	  <th rowspan="2"><#if outInStock.type??><#if outInStock.type=0>出库<#elseif outInStock.type=1>入库</#if></#if>类型</th>
	        	  <th>产品内容</th>
    	    </tr>
    	    <tr>
            	<#if (productList??&&productList?size gt 0)>
    	    		<#list productList as pd>
    	    		<#if (outInStock.product.id)??&&pd.id=outInStock.product.id>
        	    		<th align="top">${(pd.name)!}</th>
        	    	</#if>
    	    		</#list>
    	    	</#if>
            </tr>
    	    <#if outInStockList??&&outInStockList?size gt 0>
    	    <#list outInStockList as ois>
            <tr>
            	<td>${ois_index+1}</td>
            	<td>${(ois.createDate?string('yyyy-MM-dd'))!}</td>
        	    <td>${(ois.org.name)!}</td>
        	    <td><@c.syscode syscodes=orderTypeList code="${(ois.orderType)!}"/></td>
        	    <td><@c.syscode syscodes=reasonList code="${(ois.reason)!}"/></td>
        	    <td>${ois.num!}</td>
            </tr>
            </#list>
            <#else>
            <tr>
            	<td colspan="6">暂无记录</td>
            </tr>
            </#if>
        </table>
        </div>        
    </body>
</html>