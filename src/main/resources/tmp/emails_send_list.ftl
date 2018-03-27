<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
 <@u.css src="style.css"/>
</head>

<body class="mainbody">

<div class="fastNav">系统设置 > 综合管理 > 发送记录查询</div>


<form  method="post" id="form" name="form">
<input type="hidden" id="id" name="id" />
<input type="hidden" id="curPage" name="emailRecive.curPage" value="${(emailRecive.curPage)!}" /> 
</form>

<div class="listTitle">
  <span>收件者列表</span>
</div>

<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>发送日期</th>
    <th>发送标题</th>
    <th>姓名</th>
	<th>EMAIL</th>
	<th>营养师</th>
	<th>所属区域</th>
	<th>成功与否</th>
  </tr>
  <#if page.dataList??>
    <#list page.dataList as email>
  <tr>
    <td>${email_index+1}</td>
    <td>${email.emails.createDate!?string("yyyy-MM-dd")?default("")}</td>
    <td>${email.emails.title!}</td>
    <td>${email.member.name!}</td>
	<td>${email.member.email!}</td>
	<td>${email.member.staff.name!}</td>
	<td>${email.member.staff.org.name!}</td>
	<td><@c.syscode syscodes=sysCodeIfList code="${(email.ifSuccess)!}"/></td>
  </tr>
  </#list>
  <#else><tr><td colspan="8">暂无记录</td></tr>
 </#if>
</table>
</div>
 <div class="pageNum">
	<a href='javascript:gotoPage1(1)'> 首页</a>
    <#if (page.previousPage >= 1) >
		<a href='javascript:gotoPage1(${page.previousPage!})'>上一页</a>
	</#if>
	<#if (page.nextPage <= page.totalPage)>
		<a href='javascript:gotoPage1(${page.nextPage!})'> 下一页</a>
	</#if>
	<a href='javascript:gotoPage1(${page.totalPage!})'> 尾页</a>
	当前第${page.currentPage!}/${page.totalPage!}页转到第
	<select id="currentPage" name="currentPage" onchange="gotoPage1(this.value)">
		<#list 1..page.totalPage as i>
			<option value="${i!}" <#if page.currentPage=i>selected</#if> >${i!}</option>
		</#list>
	</select>页 共${page.totalRow!}条记录
    </div>
</body>
<script type="text/javascript">	
    function gotoPage1(page){
			document.getElementById('curPage').value = page;
	  		var form=document.getElementById('form');
	  		form.action="emails!showMemberList.action";
	  		form.submit();
		}
    </script>
</html>
