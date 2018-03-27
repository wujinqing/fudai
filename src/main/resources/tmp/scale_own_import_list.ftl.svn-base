<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>导入客户资料</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="jquery.validate.js"/>
        <@u.rootjs src="jquery.validate.message_cn.js"/>
        <script type='text/javascript'>
        function doImport(soId,ssId,fsId,sId,name,tel){
        	$("#own_id").attr("value",soId);
        	$("#scale_id").attr("value",fsId);
        	$("#staff_id").attr("value",sId);
        	$("#cus_name").attr("value",name);
        	$("#cus_tel").attr("value",tel);
        	$("#ss_id").attr("value",ssId);
        	$("#form1").attr("action","scale_own!preImportMsg.action");
        	$("#form1").submit();
        }
        function havImport(mid,sid){
        	var url = "scale_own!memberDetail.action?id="+mid+"&scaleSales.id="+sid+"&view=true";
        	beginOpen(url);
        }
        
        function beginOpen(url){
			var sh = window.screen.height;
			var sw = window.screen.width;
			var top = Math.round(sh/4);
			var left = Math.round(sw/4);
			window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
		}
        </script>
    </head>
    <body class="mainbody">
    	<form id="form1" method="post">
    		<input type="hidden" name="scaleOwn.id" id="own_id"/>
    		<input type="hidden" name="scaleOwn.fatScale.id" id="scale_id"/>
    		<input type="hidden" name="id" id="staff_id"/>
    		<input type="hidden" name="scaleOwn.fatScale.scaleSales.customerName" id="cus_name"/>
    		<input type="hidden" name="scaleOwn.fatScale.scaleSales.telephone" id="cus_tel"/>
    		<input type="hidden" name="scaleSales.id" id="ss_id"/>
    	</form>
    
	    <div class="fastNav">物联网系统 > 导入客户资料</div> 
	    <@u.search_bar action="scale_own!listNotImport.action">
	    <input type="hidden" id="curPage" name="scaleOwn.curPage" value="${scaleOwn.curPage}" />
		  <table> 
		    <tr>
		      <td>序列号：</td>
		      <td><input type="text" name="scaleOwn.fatScale.scaleSerial" value="${(scaleOwn.fatScale.scaleSerial)!}"/></td>
		      <td>客户姓名：</td>
		      <td><input type="text" name="scaleOwn.fatScale.scaleSales.customerName" value="${(fatScale.scaleSales.customerName)!}" /></td>
		    </tr>
		    <tr>
		      <td>是否导入：</td>
		      <td>
		      	<select name="scaleOwn.condition">
		      		<option value="">所有</option>
		      		<option value="1" <#if "${(scaleOwn.condition)!}"="1">selected</#if>>是</option>
		      		<option value="0" <#if "${(scaleOwn.condition)!}"="0">selected</#if>>否</option>
		      	</select>
		      </td>
		      <td colspan="2">&nbsp;</td>
		    </tr> 
		  </table>
		</@u.search_bar>
    
		<div class="listLine"> 
		  <table> 
		    <tr> 
		     <th>购买日期</th>
		     <th>客户姓名</th> 
		     <th>所属机构</th> 
		     <th>手机</th> 
		     <th>序列号(内码号)</th> 
		     <th>频道</th>
		     <th>营养师</th> 
		     <th>服务开始日期</th> 
		     <th>操作</th> 
		    </tr> 
		    <#if page.dataList??>
		    <#list page.dataList as scaleOwn>
		    <tr> 
		      <td>${((scaleOwn.fatScale.scaleSales.saleDate)?string('yyyy-MM-dd'))!}</td> 
		      <td>
		      	<#if (scaleOwn.member.id)??>
		      	<a href="javascript:havImport('${(scaleOwn.member.id)!}','${(scaleOwn.fatScale.scaleSales.id)!}')" title="编辑客户资料">${(scaleOwn.fatScale.scaleSales.customerName)!}</a>
		      	<#else>
		      	${(scaleOwn.fatScale.scaleSales.customerName)!}
		      	</#if>
		      </td> 
		      <td>${(scaleOwn.fatScale.scaleSales.org.name)!}</td> 
		      <td>${(scaleOwn.fatScale.scaleSales.telephone)!}</td> 
		      <td>${(scaleOwn.fatScale.scaleSerial)!}(${(scaleOwn.fatScale.scaleNo)!})</td>
		      <td>${(scaleOwn.channels)!}</td>
		      <td>${(scaleOwn.fatScale.scaleSales.operator.name)!}</td> 
		      <td>${((scaleOwn.fatScale.serviceBeginDate)?string('yyyy-MM-dd'))!}</td> 
		      <td>
		      	<#if (scaleOwn.member.id)??>
		      		<a href="javascript:havImport('${(scaleOwn.member.id)!}','${(scaleOwn.fatScale.scaleSales.id)!}')">查看资料</a>
		      	<#else>
		      	<a href="javascript:doImport('${scaleOwn.id}','${(scaleOwn.fatScale.scaleSales.id)!}','${(scaleOwn.fatScale.id)}','${(scaleOwn.fatScale.scaleSales.operator.id)!}','${(scaleOwn.fatScale.scaleSales.customerName)!}','${(scaleOwn.fatScale.scaleSales.telephone)!}')">导入资料</a>
		      	</#if>
		      </td> 
		    </tr> 
		    </#list>
		    <#else>
		    <tr>
		      <td colspan="9">暂无信息！</td>
		    </tr>
		    </#if>
		  </table> 
		</div> 
		<@u.paginate page=page/>
	</body>
</html>