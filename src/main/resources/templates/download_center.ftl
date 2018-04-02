<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/macros/ui.ftl" as u>
<#import "/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品列表</title>
<@u.css src="style.css"/>

<@u.js src="drag.js"/>

</head>

<body>


<div class="listLine">
<table>
  <tr>
	<th>序号</th>
    <th>文件名</th>
    <th>操作</th>
  </tr>
  <#if fileList??>
  	<#list fileList as file>
  	<tr>
        <td>${(file_index+1)}</td>
	    <td>${(file.fileName)!}</td>
	    <td>
	    	<a href="${(file.filePath)!}">下载</a>
	    </td>
  	</tr>
  	</#list>
  <#else>
  	<tr><td colspan="3">暂无记录</td></tr>
  </#if>
</table>
</div>
<#--
<@u.paginate page=page/>
-->
</body>
</html>
