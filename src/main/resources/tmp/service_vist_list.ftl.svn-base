<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('service_form');
                form.action = "service!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('service_form');
                    form.action = "service!delete.action";
                    form.submit();
                }
            }
            function vistList(){
                var form = document.getElementById('service_form');
                form.action = "service!vistServiceList.action";
                form.submit();
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="service_form" name="service_form">
            <input id="id" name="id" type="hidden">   
            <input type="hidden" id="curPage" name="service.curPage" value="${service.curPage}" />
	        <input type="hidden" id="curPage" name="service.member.id" value="${(service.member.id)!}" />  
        </form>
        
        <!--
        <@u.title_bar title="历史回访记录列表">
        	 <input class="btn_bg" type="button" value="查看" onclick="vistList()">
        </@u.title_bar>
        -->
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="30%">CONTENT</th>
	        	  <th width="30%">IS_COMMENT</th>
	        	  <th width="30%">MEMBER_ID</th>
	        	  <th width="30%">RESULT</th>
	        	  <th width="30%">STYLE</th>
	        	  <th width="30%">COMMENT_DATE</th>
	        	  <th width="30%">IS_CONFIRM</th>
	        	  <th width="30%">COMMENT_TYPE</th>
	        	  <th width="30%">COMMENTS</th>
	        	  <th width="30%">COMMENT_PERSON</th>
            </tr>
            <#if (page??)&&(page.dataList?size>0)>
            	<#list page.dataList as service>
            	<tr>
	        	    <td>${service.content!}</td>
	        	    <td>${service.isComment!}</td>
	        	    <td>${(service.member.name)!}</td>
	        	    <td>${service.result!}</td>
	        	    <td>${service.style!}</td>
	        	    <td>${service.commentDate?string('yyyy-MM-dd')}</td>
	        	    <td>${service.isConfirm!}</td>
	        	    <td>${service.commentType!}</td>
	        	    <td>${service.comments!}</td>
	        	    <td>${service.commentPerson!}</td>
                </tr>
            	</#list>
            	<#else>
            	<tr>
            		<td colspan="10">暂无记录</td>
            	</tr>
            </#if>
        </table>
        </div>      
        <#if page??>
        <@u.paginate page=page/>
        </#if>
</html>