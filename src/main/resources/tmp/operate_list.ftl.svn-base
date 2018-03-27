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
                document.getElementById('operate.id').value = id;
                var form = document.getElementById('oper_form');
                form.action = "operate!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除该菜单？")) {
                    document.getElementById('operate.id').value = id;
                    var form = document.getElementById('oper_form');
                    form.action = "operate!delete.action";
                    form.submit();
                }
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="oper_form" name="oper_form">
        	<input id="operate.id" name="operate.id" type="hidden" >
            <input id="parentId" name="parentId" type="hidden" value="${(operate.id)!''}">
            <input id="operate.type" name="operate.type" type="hidden" value="${(operate.type)!''}">
        </form>
        
        <@u.title_bar title="【${(operate.displayName)!'系统根目录'}】下子目录列表：">
        	<#if (operate.displayName)??>
        		<#if (operate.type)??>
        			<@u.title_bar_btn type="new" onclick="edit();"/>
        		</#if>
  			<#else>
        		<@u.title_bar_btn type="new" onclick="edit();"/>
        	</#if>
    	</@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <th width="15%">显示名称</th>
                <th width="25%">URL</th>
                <th width="15%">编码</th>
                <th width="5%">排序</th>
                <th width="15%">类型</th>
                <th width="25%">操作</th>
            </tr>
            <#if operateList??>
            	<#list operateList as operate>
            	<tr>
                    <td>${operate.displayName!'&nbsp;'}</td>
                    <td>${operate.url!'&nbsp;'}</td>
                    <td>${operate.code!'&nbsp;'}</td>
                    <td>${operate.order!'&nbsp;'}</td>
                    <td>
                    <#if operate.type??>
                    <@c.syscode syscodes = operateTypes code='${operate.type}'/>
                    </#if>
                    </td>
                    <td>
                       <input class="btn_bg" type="button" value="修改" onclick="edit('${operate.id!}')">
                       <input class="btn_bg" type="button" value="删除" onclick="del('${operate.id!}')">
                    </td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>
</html>
