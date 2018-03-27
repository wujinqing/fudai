<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>报损（溢）查询列表</title>
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
        </script>
    </head>
    <body class="mainbody">
        
     	<@u.search_bar action="stock_change_more!bsList.action">
     	<input type="hidden" id="curPage" name="stockChangeMore.curPage" value="${stockChangeMore.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td>品种：</td>
        		  <td>
        		  	<@s.select id="productId" name="stockChangeMore.product.id" list=Request['productList'] listKey="id" listValue="name" headerKey="" headerValue="---请选择---" theme="simple" />	
        		  </td>
        		  <td>类型</td>
	              <td><select name="stockChangeMore.stockChange.stockSubmit.type">
	              		<option value="">---请选择---</option>
	              		<option value="0" <#if (stockChangeMore.stockChange.stockSubmit.type)??&&(stockChangeMore.stockChange.stockSubmit.type)=0>selected</#if>>报损</option>
	              		<option value="1" <#if (stockChangeMore.stockChange.stockSubmit.type)??&&(stockChangeMore.stockChange.stockSubmit.type)=1>selected</#if>>报溢</option>
	              	  </select>
	              </td>
	          </tr>
	          <tr>
        		  <td>仓库：</td>
        	      <td><@s.select id="orgId" name="stockChangeMore.stockChange.org.id" list=Request['orgList'] listKey="id" listValue="name" headerKey="" headerValue="---请选择---" theme="simple" /></td>
        		  <td>调整日期：</td>
        	      <td>
                       <input type="text" name="stockChangeMore.stockChange.startDate" value="${(stockChangeMore.stockChange.startDate?string('yyyy-MM-dd'))!}" 
                        		onclick="WdatePicker({isShowClear:false,readOnly:true})"/>到
    	               <input type="text"  name="stockChangeMore.stock.endDate" value="${(stockChangeMore.stockChange.endDate?string('yyyy-MM-dd'))!}" 
    	                		onclick="WdatePicker({isShowClear:false,readOnly:true})"/>
	              </td>
        	</tr>
        </table>
        </@u.search_bar>
        <@u.title_bar title="报损（溢）查询列表"></@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
        	<#if (stockChangeMore.stockChange.org.id)??||(stockChangeMore.stockChange.product.id)??>
        		<tr>
	        	<th>调整日期</th>
	        	<#if (stockChangeMore.stockChange.org)??&&(stockChangeMore.stockChange.org.id)??&&"${(stockChangeMore.stockChange.org.id)}"!=""><th>产品名称</th>
	        	<#elseif (stockChangeMore.product)??&&(stockChangeMore.product.id)??&&"${(stockChangeMore.product.id)}"!=""><th>所属机构</th></#if>
	        	<th>调整前库存</th>
	        	<th>调整类型</th>
	        	<th>调整后库存</th>
	        	<th>调整人</th>
	        	<th width="20%">调整原因</th>
	        	</tr>
	        	<#if page??&&page.dataList??&&(page.dataList.size()>0)>
	        	<#list page.dataList as scm>
	        		<tr>
	        		<td>${(scm.createDate?string("yyyy-MM-dd HH:mm"))!}</td> 
	        		<#if (stockChangeMore.stockChange.org)??&&(stockChangeMore.stockChange.org.id)??&&"${(stockChangeMore.stockChange.org.id)}"!=""><td>${scm.productName!}</td>
	        		<#elseif (stockChangeMore.product)??&&(stockChangeMore.product.id)??&& "${(stockChangeMore.product.id)}"!=""><td>${(scm.stockChange.org.name)!}</td></#if>
	        		<td>${scm.oldCount!}</td>
	        		<td><#if (scm.stockChange.stockSubmit.type)??&&(scm.stockChange.stockSubmit.type)=0>报损
	        			<#elseif (scm.stockChange.stockSubmit.type)??&&(scm.stockChange.stockSubmit.type)=1>报溢</#if></td>
	        		<td>${(scm.allCount)!}</td>
	        		<td>${(scm.stockChange.stockSubmit.staffName)!}</td>
	        		<td>${(scm.stockChange.stockSubmit.reason)!}</td>
	        		</tr>
	        	</#list>
	        	<#else>
	        		<tr><td colspan="7">查无信息！</td></tr>
	        	</#if>
	        <#else>
	        	<tr>
	        		<td>选择查询条件</td>
	        	</tr>
	        </#if>
        </table>
        </div>
        <@u.paginate page=page/>
    </body>
</html>