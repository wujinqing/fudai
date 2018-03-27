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
			   
		 function toExcel(){
            var form = document.getElementById('search_form');
            $("#excel").val(true);
            $("#excel").attr("disabled",false);
            form.submit();
            $("#excel").val(false);
            $("#excel").attr("disabled",true);
		 }
		 
		 function look(flag,start,end,oid,type,pid){
		 	var url = "out_in_stock!lookOutInDetail.action?start="+start+"&end="+end+"&oid="+oid+"&type="+type+"&pid="+pid+"&flag="+flag;
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
     	<@u.search_bar action="out_in_stock!getDayDetailList.action">
     	<input type="hidden" id="excel" name="excel" value="false" disabled="true"/>
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
						<option value="0" <#if (outInStock.type??&&outInStock.type==0) >selected</#if>>出库量</option>
						<option value="1" <#if (outInStock.type??&&outInStock.type==1) >selected</#if>>入库量</option>
					</select>
				 </td>
        	</tr>
        	<tr>
        	    <td>时间：</td>
        	    <td>
        	    	<input type="text" name="outInStock.startDate" value="${(outInStock.startDate?string('yyyy-MM-dd'))!}" onclick="WdatePicker({readOnly:true})"/>~
        	    	<input type="text" name="outInStock.endDate" value="${(outInStock.endDate?string('yyyy-MM-dd'))!}" onclick="WdatePicker({readOnly:true})"/>
        	    </td>
				<td>产品：</td>
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
        
        <div class="listLine" style="width:${(productList?size*60+450)!}px">
        <table border="0" cellspacing="0">
            <tr>
            	  <th rowspan="2" style="width:30px">序号</th>
	        	  <th rowspan="2" style="width:100px">日期</th>
	        	  <th rowspan="2" style="width:130px">机构</th>
	        	  <th rowspan="2" style="width:130px">销售单类型</th>
	        	  <th rowspan="2" style="width:60px"><#if outInStock.type??><#if outInStock.type=0>出库<#elseif outInStock.type=1>入库</#if></#if>类型</th>
	        	  <th colspan="${(productList.size())!}">产品内容</th>
    	    </tr>
            <tr>
            	<#if (productList??&&productList?size gt 0)>
    	    		<#list productList as pd>
        	    		<th align="top" style="width:60px;">${(pd.name)!}</th>
    	    		</#list>
    	    	</#if>
            </tr>
            <#if (outInStockList??&&outInStockList?size gt 0)>
        	<#list outInStockList as ois>
        	<tr>
        		<td>${ois_index+1}</td>
        	    <td>${(ois.createDate?string('yyyy-MM-dd'))!}</td>
        	    <td>${(ois.org.name)!}</td>
        	    <td><@c.syscode syscodes=orderTypeList code="${(ois.orderType)!}"/></td>
        	    <td><@c.syscode syscodes=reasonList code="${(ois.reason)!}"/></td>
                <#if (productList??&&productList?size gt 0)>
    	    		<#list productList as pd>
    	    			<#if (ois.oisOwnList??&&(ois.oisOwnList)?size gt 0)>
	        	    		<#assign flag="">
	        	    		<#list ois.oisOwnList as own>
	        	    			<#if (own.product??&&own.product.id??&&pd.id??&&own.product.id=pd.id)>
	        	    				<td title="${pd.name!}"><a href="javascript:look('${(outInStock.type)!}','${(ois.createDate?string('yyyy-MM-dd'))!}','${(ois.createDate?string('yyyy-MM-dd'))!}','${(ois.org.id)!}','${(ois.orderType)}','${(pd.id)!}')">${own.num!}</a></td>
	        	    				<#assign flag="1">
	        	    				<#break>
	        	    			</#if>
	        	    		</#list>
	        	    		<#if flag="">
	        	    			<td title="${pd.name!}">-</td>
	        	    		</#if>
	        	    	</#if>
    	    		</#list>
    	    	</#if>
            </tr>
        	</#list>
        	<#else>
        	<tr>
        		<td colspan="<#if productList??&&productList?size gt 0>${(productList.size()+5)!}<#else>6</#if>">暂无记录</td>
        	</tr>
            </#if>
            <tr>
            	<td colspan="5">合计</td>
        		<#if (productList??&&productList?size gt 0)>
    	    		<#list productList as pd>
    	    			<#if sumList??&&sumList?size gt 0>
	        	    		<#assign flags=false>
	        	    		<#list sumList as sum>
	        	    			<#if "${(sum.product.id)!}"="${(pd.id)!}">
	        	    				<td title="${pd.name!}">${(sum.num)}</td>
	        	    				<#assign flags=true>
	        	    				<#break>
	        	    			</#if>
	        	    		</#list>
	        	    		<#if flags=false>
	        	    			<td title="${pd.name!}">-</td>
	        	    		</#if>
	        	    	</#if>
    	    		</#list>
    	    	</#if>
            </tr>
        </table>
        </div>        
        <input type="button" onclick="toExcel()" value="导出记录到excel" class="btn_bg"/>
    </body>
</html>