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
        <script type='text/javascript'>        
           function view(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('message_form');
                form.action = "i_message!viewUserMemberMsgList.action";
                form.submit();
            }
            $(document).ready(function(){
            	$("#res_btn").click(function(){
            		$("#message_uid_2").val('');
            	});
            
            });
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="message_form" name="message_form">
        	<input type="hidden" name="message.uid_1" value="${message.uid_1!}" />
            <input id="id" name="message.uid_2" type="hidden">     
        </form>
        
     	<@u.search_bar action="i_message!viewUserMemberList.action">
        <input type="hidden" id="curPage" name="message.curPage" value="${message.curPage}" />
        <input type="hidden" name="message.uid_1" value="${message.uid_1!}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td >会员：</td>
        		  <td>
        		  <input type="text" name="message.uname_2" value="${(message.uname_2)!}">
        		  <#--
        		  	<select name="message.uid_2" id="message_uid_2">
        		  		<option value="">--全部--</option>
        		  		<#if (memberList??&&memberList?size>0)>
		        		  	<#list memberList as member>
		        		  		<option value="${(member.id)!}" <#if "${(member.id)!}"=="${(message.uid_2)!}">selected</#if>>${(member.loginName)!}</option>
		        		  	</#list>
		        		  </#if>
        		  	</select>
        		  -->
				</td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="会员咨询列表">
        	<#--
        	<@u.title_bar_btn type="new" onclick="edit();"/>
        	-->
        	<input style="visibility:hidden" />
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th >咨询人</th>
	        	  <th>咨询人姓名</th>
	        	  <th >咨询总次数</th>
	              <th width="80px">操作</th>
            </tr>
            <#if (page??&&page.dataList??)>
            	<#list page.dataList as message>
            	<tr>
	        	    <td>${message.uname_2!}</td>
	        	    <td>${message.uname_s_2!}</td>
	        	    <td>${message.chatCount!}</td>
                    <td>
                       <input class="btn_bg" type="button" value="查看" onclick="view('${message.uid_2!}')">
                    </td>
                </tr>
            	</#list>
            	<#else>
            		<tr>
            			<td colspan="4">暂无记录!</td>
            		</tr>
            </#if>
        </table>
        </div>        
        <#if page??>
        	<@u.paginate page=page/>
        </#if>
     </body>   
</html>