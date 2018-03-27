<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>卡的列表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="jquery.validate.js"/>
		<@u.rootjs src="jquery.validate.message_cn.js"/>
		<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript'>    
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="memberCard_form" name="memberCard_form">
            <input id="id" name="id" type="hidden">
        </form>
    	<@u.search_bar action="member_card!cardMaintainStatis.action">
    	<input type="hidden" id="cardType" name="cardType" value="${cardType!}"/>
        <table width="100%" border="0" cellspacing="0">
        <tr>
        	<td width="15%">制作人</td>
        	<td width="35%"><input type="text" name="memberCard.user.name" value="${(memberCard.user.name)!}"/></td>
       		<td width="15%">制作时间</td>
    		<td width="35%" class="txtLeft">&nbsp;<input type="text"  name="memberCard.startTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if memberCard.startTime??>value="${(memberCard.startTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text" name="memberCard.endTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if memberCard.endTime??>value="${(memberCard.endTime?string('yyyy-MM-dd'))!}"</#if>></td>
        </tr>
        </table>
    	</@u.search_bar>
        <@u.title_bar title="维护制作统计列表">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr> <th width="5%">序号</th>
	        	  <th width="12%">卡号</th>
	        	  <th width="5%">积分额</a></th>
	        	  <th width="8%">制作时间</th>
	        	  <th width="10%">制作数量</th>
	        	  <th width="10%">制作机构</th>
	        	  <th width="10%">制作人</th>
            </tr>
            <#if memberCardList??>
            <#assign count = memberCardList.size()>
            	<#list memberCardList as memberCard>
            	<tr><td>${memberCard_index+1}</td>
            		<td>${memberCard.cardNo!}</td>
            		<td>${memberCard.score!}</td>
            		<td>${(memberCard.createDate?string("yyyy-MM-dd"))!}</td>
            		<td>${memberCard.cardCount!}</td>
            		<td>${(memberCard.ownerOrg.name)!}</td>
	        	    <td>${(memberCard.user.name)!}</td>
                </tr>
            	</#list>
            </#if>
            <#if list??>
            	<tr>
	            	<td colspan="<#if count??>${count!}<#else>7</#if>">合计数量：${list?size}张</td>
	            </tr>
            </#if>
        </table>
        </div>        
</html>