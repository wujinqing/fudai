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
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="productPrizeAudit_form" name="productPrizeAudit_form">
            <input id="id" name="id" type="hidden">  
            <input id="memberId" name="memberId" type="hidden">   
        </form>
        
     	<@u.search_bar action="product_prize_audit!sendList.action">
        <input type="hidden" id="curPage" name="productPrizeAudit.curPage" value="${productPrizeAudit.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%">会员：</td>
        		  <td width="35%"><input type="text" name="productPrizeAudit.member.name" value="${(productPrizeAudit.member.name)!}"></td>
        	</tr>
        </table>
          </@u.search_bar>
        <@u.title_bar title="奖品发货单列表">
        	<!--<@u.title_bar_btn type="new" onclick="edit();"/>-->
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
            	  <th width="15%">会员</th>
	        	  <th width="50%">具体内容</th>
	        	  <th width="10%">发单人</th>
	        	  <th width="15%">发单时间</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as productPrizeAudit>
            	<tr>
            		<td>${(productPrizeAudit.member.name)!}</td>
	        	    <td>${productPrizeAudit.content!}</td>
	        	    <td>${(productPrizeAudit.updateUser.name)!}</td>
	        	    <td>${(productPrizeAudit.updateDate?string("yyyy-MM-dd"))!}</td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
</html>