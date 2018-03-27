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
                var form = document.getElementById('taskm_form');
                form.action = "taskm!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('taskm_form');
                    form.action = "taskm!delete.action";
                    form.submit();
                }
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="taskm_form" name="taskm_form">
            <input id="id" name="id" type="hidden">     
        </form>
        
     	<@u.search_bar action="taskm!choseList.action">
        <input type="hidden" id="curPage" name="taskm.curPage" value="${taskm.curPage}" />
        <input id="btnId" name="btnId" type="hidden" value="${btnId!}">     
        
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%">任务名称：</td>
        		  <td width="35%"><input type="text" name="taskm.taskName" value="${taskm.taskName!}"></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="任务列表">
        	<input type="button" style="visibility:hidden">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
            	  <th width="20%">
					选择
					</th>
                  <th width="20%">任务名称</th>
	        	  <th width="20%">任务类型</th>
	        	  <th width="20%">拨号类型</th>
	        	  <th width="20%">调整阶段</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as taskm>
            	<tr>
            		<td>
						<input type="checkbox" class="ckb" value="${taskm.id!}" />
					</td>
            	    <td>${(taskm.taskName)!}</td>
	        	    <td><#if typeList??><@c.syscode syscodes=typeList code="${(taskm.taskType)!}"/></#if></td>
	        	    <td><#if phoneTypeList??><@c.syscode syscodes=phoneTypeList code="${(taskm.phoneType)!}"/></#if></td>
	        	    <td><#if stageList??><@c.syscode syscodes=stageList code="${(taskm.stageCode)!}"/></#if></td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
       </body> 
</html>