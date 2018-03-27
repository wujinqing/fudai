<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="jquery.validate.js"/>
        <@u.rootjs src="jquery.validate.message_cn.js"/>
        <script type='text/javascript'>    
           function makeSS(id,memberId,isPrize){
           		var form=document.getElementById('productPrizeAudit_form');
           		document.getElementById('id').value = id;
           		document.getElementById('memberId').value = memberId;
           		document.getElementById('isPrize').value = isPrize;
            	form.action="${base}/mb/product_prize_audit!newDiscount.action";
            	form.submit();
           }
           
            function make(id,memberId,isPrize){
           		var form=document.getElementById('productPrizeAudit_form');
           		document.getElementById('id').value = id;
           		document.getElementById('memberId').value = memberId;
           		document.getElementById('isPrize').value = isPrize;
            	form.action="${base}/mb/product_prize_audit!newExchange.action";
            	form.submit();
           }
           <#if msg??>
		        <#if msg!="">
		        	alert('${msg!}');
		        </#if>
	        </#if>
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="productPrizeAudit_form" name="productPrizeAudit_form">
            <input id="id" name="id" type="hidden">  
            <input id="memberId" name="memberId" type="hidden">   
            <input id="operator" name="operator" type="hidden" value="${operator!'1'}"> 
            <input id="status" name="status" type="hidden">
            <input id="type" name="productPrizeAudit.type" type="hidden" value="${(productPrizeAudit.type)!}"> 
            <input id="isPrize" name="isPrize" type="hidden" value="${(isPrize)!}}"/>   
            <input id="member_type" name="memberType" type="hidden" value="${memberType!}">  
        </form>
        
        <#assign ntname="" >
        <#if productPrizeAudit??&&isPrize??&&isPrize==0>
        <#assign ntname="product_prize_audit!auditList.action" ></#if>
        <#if productPrizeAudit??&&isPrize??&&isPrize==1>
        <#assign ntname="product_prize_audit!prizeAuditList.action" ></#if>
     	<@u.search_bar action="${(ntname)!}">
        <input type="hidden" id="curPage" name="productPrizeAudit.curPage" value="${productPrizeAudit.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	     <td width="15%">会员：</td>
        		  <td width="35%"><input type="text" name="productPrizeAudit.member.name" value="${(productPrizeAudit.member.name)!}"></td>
        	</tr>
        </table>
        </@u.search_bar>
         <#assign htname="" >
         <#if productPrizeAudit??&&isPrize??&&isPrize==0>
        <#assign ntname="${sortName!}产品折现审核已通过列表" ></#if>
        <#if productPrizeAudit??&&isPrize??&&isPrize==1>
        <#assign ntname="${sortName!}奖品兑现审核已通过列表" ></#if>
        <@u.title_bar title="${(ntname)!}">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
        		<th width="10%">会员</th>
        	  	<th width="50%">具体内容</th>
        	  	<th width="10%">状态</th>
        	  	<th width="10%">时间</th>
              	<th width="20%">操作</th>
            </tr>
            <#if (page.dataList)??>
        	<#list page.dataList as productPrizeAudit>
        	<tr>
        		<td>${(productPrizeAudit.member.name)!}</td>
        	    <td>${productPrizeAudit.content!}</td>
        	    <td><@c.syscode syscodes = sysCodeList code="${productPrizeAudit.auditStatus!}"/></td>
        	    <td>${(productPrizeAudit.createDate?string("yyyy-MM-dd"))!}</td>
                <td>
                  <#if productPrizeAudit??&&isPrize??&&isPrize==0>
	                  <#if "${(productPrizeAudit.auditStatus)!}"=="7">
	                  		销售单已生成
	                  <#elseif "${(productPrizeAudit.auditStatus)!}"=="5">		
	                  		<a href="javascript:makeSS('${productPrizeAudit.id}','${(productPrizeAudit.member.id)!}','${(isPrize)!}');">生成销售单</a>
	                  </#if>
                  </#if>
                  <#if productPrizeAudit??&&isPrize??&&isPrize==1>
	                  <#if "${(productPrizeAudit.auditStatus)!}"=="9">
	                	 	销售单已生成
	                  <#elseif "${(productPrizeAudit.auditStatus)!}"=="5">		
	                  		<a href="javascript:make('${productPrizeAudit.id}','${(productPrizeAudit.member.id)!}','${(isPrize)!}');">生成销售单</a>
	                  </#if>
                  </#if>
                </td>
            </tr>
        	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
    </body>
</html>