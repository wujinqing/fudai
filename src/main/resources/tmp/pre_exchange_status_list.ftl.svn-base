<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
    </head>
    <body class="mainbody">
        <form method="get" id="preExchange_form" name="exchange_form">
            <input type="hidden" id="flag" name="flag">
            <input id="id" name="id" type="hidden">   
        </form>
        
     	<@u.search_bar action="pre_exchange!statusList.action">
        <input type="hidden" id="curPage" name="preExchange.curPage" value="${preExchange.curPage}" />
        <table width="100%" border="0" cellspacing="0">
		    <tr>
			  <td>换货人</td>
		      <td>
				<input id="preExchange.member.name" name="preExchange.member.name" value="${(preExchange.member.name)!}"/>
			  </td>
		      <td>换货单位</td>
		      <td>
                   <@s.select id="preExchange.org.id" name="preExchange.org.id" list="orgList" listKey="id" listValue="name" headerKey="" headerValue="" theme="simple" value="${(preExchange.org.id)!}"/>             
			  </td>
		    </tr>
		    <tr>
		    <td>换货日期</td>
		      <td>
				从<input size="6" id="preExchange.startTime" name="preExchange.startTime" onclick="WdatePicker({isShowClear:false,readOnly:true})" value="${(preExchange.startTime?string('yyyy-MM-dd'))!}"/>
				到<input size="6" id="preExchange.endTime" name="preExchange.endTime" onclick="WdatePicker({isShowClear:false,readOnly:true})" value="${(preExchange.endTime?string('yyyy-MM-dd'))!}"/>
			  </td>
		      <td>批准状态</td>
		      <td>
                  <@s.select id="preExchange.isApprove" name="preExchange.isApprove" list="sysCodeApproveList" listKey="code" listValue="codeName" headerKey="" headerValue="---请选择---" value="${(preExchange.isApprove)!}" theme="simple"/>    
			  </td>
		    </tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="换货申请单列表">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th>换货日期</th>
	        	  <th>换货单位(人)</th>
	        	  <th>换货品种及数量</th>
	        	  <th>批准状态</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as preExchange>
            	<tr>
	        	    <td>${(preExchange.createDate?string('yyyy-MM-dd'))!}</td>
	        	    <#if (preExchange.member.name)??>
	        	         <td>${(preExchange.member.name)!}</td>
	        	    <#else>
	        	         <td><font color="red">${(preExchange.org.name)!}</font></td>
	        	    </#if>
	        	    <td>
					  <#if (preExchange.pemList)??> 
					       <#list preExchange.pemList as preExchangeMore>
					         <#if !preExchangeMore_has_next>
					            ${preExchangeMore.product.name!}(${preExchangeMore.count!})
					         <#else>
					            ${preExchangeMore.product.name!}(${preExchangeMore.count!}),
					         </#if> 
					       </#list>
					  </#if>
					  
	        	    </td>
	        	    <#if preExchange.isApprove=0>
	        	         <td>未批准</td>
	        	    <#elseif preExchange.isApprove=2>
	        	         <td>已拒绝</td>
	        	    <#elseif preExchange.isApprove=1>
	        	         <td>已批准</td>
	        	    </#if>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
    </body>
</html>