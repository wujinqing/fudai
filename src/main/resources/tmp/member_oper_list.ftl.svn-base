<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <script type='text/javascript'>     
           
            function setOper(memberId,userName) {
              	document.getElementById('memberId').value = memberId;
                document.getElementById('name_id').value = userName;
                var form = document.getElementById('member_form');
                form.action = "${base}/sm/member_oper!selectTree.action";
                form.submit();
            }
            
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="member_form" name="member_form">
            <input id="memberId" name="memberId" type="hidden">    
            <input id="name_id" name="userName" type="hidden">  
        </form>
        
     	<@u.search_bar action="${base}/mb/member!qureyMemberOpers.action">
        <input type="hidden" id="curPage" name="member.curPage" value="${member.curPage!}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	 	<td width="15%" align="right">用户名</td>
    		  	<td width="35%" align="left">
    		  		<input type="text" name="member.userName" value="${member.userName!}">
    		  	</td>
    	      	<td width="15%" align="right">用户姓名</td>
    		  	<td width="35%" align="left">
    		  		<input type="text" name="member.name" value="${member.name!}">
    		  	</td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="用户权限设定列表">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
            	<th width="15%">用户名</th>
            	<th width="15%">用户姓名</th>
            	<th width="20%">手机号码</th>
            	<th width="20%">邮箱</th>
            	<th width="10%">会员等级</th>
              	<th width="20%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as member>
            	<tr>
	        	    <td>${member.userName!'<font color="red">--未填写--</font>'}</td>
	        	    <td>${member.name!'<font color="red">--未填写--</font>'}</td>
	        	    <td>${member.tel!'<font color="red">--未填写--</font>'}</td>
	        	    <td>${member.email!'<font color="red">--未填写--</font>'}</td>
	        	    <td>
	        	    	<#if member.customerType??>
	        	    		<@c.syscode syscodes=typeList code="${member.customerType!}"/>
	        	    	<#else>
	        	    		<font color="red">--未设置--</font>
	        	    	</#if>
        	    	</td>
                   <td>
                       <input class="btn_bg" type="button" value="功能设定" onclick="setOper('${member.id!}','${member.userName!}')">
                    </td>
                </tr>
            	</#list>
            <#else>
            	<tr>
            		<td colspan="6">--暂无信息--</td>
            	</tr>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
</html>