<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>仓储管理-出入库统计</title>
        <@u.css src="style.css"/>
          <@u.rootjs src="jquery-1.4.2.min.js"/>
         <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>        
           $(document).ready(function(){
	           $("#search_form").submit(function(){
	           	  var orgId=document.getElementById("orgId").value;
	           	  var productId=document.getElementById("productId").value;
	           	  if(orgId=="" && productId==""){
	           	  	alert("请选择查询的仓库或产品。");
	           	  	return false;
	           	  }
	           });
           });
           
             function getOrg(type){
				document.getElementById('orgId').options.length=0;
				var options = new Option("----所有----","");
				document.getElementById('orgId').options[0]=options;
				OrgAjaxService.getAllOrgByType(type,function(data){
					if(data.length != 0){
						for(var i=0;i<data.length;i++){
							options = new Option(data[i].name,data[i].id);
							document.getElementById('orgId').options[i+1]=options;
							var oid='${(stockChange.org.id)!}';
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
        
     	<@u.search_bar action="stock_change!calList.action">
     	<input type="hidden" id="curPage" name="stockChange.curPage" value="${stockChange.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td>机构</td>
        	    <td>
	        	   	 类型
					<@s.select id="org_type" 
					  name="stockChange.org.type" 
					  list=orgTypeList
					  listKey="code"
					  listValue="codeName" 
					  headerKey="" onchange="getOrg(this.value)" 
					  headerValue="---所有---"
					  value="${(stockChange.org.type)!}" theme="simple"/>	
					名称
					<select id="orgId"  name="stockChange.org.id">
					<option value="">---所有---</option>
					</select>
        	    </td>
        		  <td>出入库类型</td>
	              <td><select name="stockChange.type">
	              		<option value="">---请选择---</option>
	              		<option value="0" <#if (stockChange.type)??&&(stockChange.type)=0>selected</#if>>出库</option>
	              		<option value="1" <#if (stockChange.type)??&&(stockChange.type)=1>selected</#if>>入库</option>
	              	  </select>
	              </td>
	          </tr>
	          <tr>
        		  <td>出入库原因</td>
        	      <td><@s.select id="orgId" name="stockChange.reason" value="${(stockChange.reason)!}" list=syscodeList listKey="code" listValue="codeName" headerKey="" headerValue="---请选择---" theme="simple" /></td>
        		  <td>日期：</td>
        	      <td>
                       <input type="text" name="stockChange.startDate" value="${(stockChange.startDate?string('yyyy-MM-dd'))!}" 
                        		onclick="WdatePicker({isShowClear:false,readOnly:true})"/>到
    	               <input type="text"  name="stockChange.endDate" value="${(stockChange.endDate?string('yyyy-MM-dd'))!}" 
    	                		onclick="WdatePicker({isShowClear:false,readOnly:true})"/>
	              </td>
        	</tr>
        </table>
        </@u.search_bar>
        <@u.title_bar title="出入库统计"></@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        		<th>月份</th>
        		<th>机构</th>
        		<th><#if stockChange.type ?? && stockChange.type==1>入<#elseif stockChange.type ?? && stockChange.type==0>出<#else>出（入）</#if>库原因</th>
        		<th>产品名称列表（注：负值为出库）</th>
        	</tr>
        	<#if stockChangeList ?? && (stockChangeList.size()>0) >
        		<#list stockChangeList as sc>
        		<tr>
        			<td>${(sc.createDate?string("yyyy-MM"))!}</td>
        			<td>${(sc.org.name)!}</td>
        			<td><@c.syscode syscodes=syscodeList code="${sc.reason!}" /></td>
        			<td>
        			<#if sc.stockChangeMoreList ?? && (sc.stockChangeMoreList.size()>0) >
        				<#list sc.stockChangeMoreList as scm>
        					${scm.productName!}(${scm.count!})&nbsp;&nbsp;
        				</#list>
        			</#if>
        			</td>
        		</tr>
        		</#list>
        	</#if>
    </body>
</html>