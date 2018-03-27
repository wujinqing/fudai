<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>日记留言回复</title>
<@u.css src="style.css"/>
<script>
	function show(id,type){
		var url = "member!newCustomerEdit.action?id="+id+"&type="+type;
		beginOpen(url);
	}
	function intervence(id){
		var url = "member!getIntervence.action?id="+id;
		beginOpen(url);
	}
	
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
	function gotoPage1(page){
		document.getElementById('curPage1').value = page;
  		document.getElementById('search_form').submit();
	}
</script>
</head>

<body class="mainbody">

<div class="fastNav">营养师部> 营养师日记留言 > 日记留言回复</div>

<form action="diary!replyList.action" method="post" id="search_form" name="search_form">
<input type="hidden" id="curPage" name="diary.curPage" value="${diary.curPage}" />
<input type="hidden" id="curPage1" name="message1.curPage" value="${message1.curPage}" />
</form>

<div class="listTitle"><span>未回复的日记</span></div>
<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>所处阶段（天数/总天数）</th>
    <th>日记提交时间</th>
    <th>工作提示</th>
  </tr>
  <#if page.dataList??>
  <#list page.dataList as diary>
  <tr> 
	<td>${diary_index+1}</td> 
    <td><a href="javascript:show('${(diary.member.id)!}','${type!}')">${(diary.member.name)!}</a></td>
    <td><@c.syscode syscodes = sysCodeSexList code='${(diary.member.sex)!}'/></td>
    <td>${(diary.member.getAge(diary.member.birthday))!}</td>
    <td>
    	<#if diary.member??&&diary.member.phase??>
    	<a href="javascript:intervence('${diary.member.id!}')"><@c.syscode syscodes=sysCodeList code="${(diary.member.phase)!}"/>
    		<#if diary.member.phaseStartDate??>${diary.member.getDay(diary.member.phaseStartDate)}</#if>/<#if diary.member.createDate??>${diary.member.getDay(diary.member.createDate)}</#if>
    	</a>
    	</#if>
    </td>
    <td>${(diary.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td>
    	<#if diary.managerComment??>
    		<font color="red">退回需修改</font>
    	<#else>
    		<font color="red">有新日记</font>
    	</#if>
    	<a href="javascript:intervence('${diary.member.id!}')">点此进入</a></td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="7">暂无信息</td></tr>
  </#if>
</table>
</div>
<@u.paginate page=page/>

<div class="listTitle">
  <span>未回复的留言</span>
</div>

<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>所处阶段（天数/总天数）</th>
    <th>留言提交时间</th>
    <th>工作提示</th>
  </tr>
  <#if pageMessage.dataList??>
  <#list pageMessage.dataList as message>
  <tr>
	<td>${message_index+1}</td>
    <td><a href="javascript:show('${message.member.id!}','${type!}')">${(message.member.name)!}</a></td>
    <td><@c.syscode syscodes = sysCodeSexList code='${(message.member.sex)!}'/></td>
    <td>${(message.member.getAge(message.member.birthday))!}</td>
    <td>
    	<a href="javascript:intervence('${message.member.id!}')">
    	<@c.syscode syscodes=sysCodeList code="${(message.member.phase)!}"/>
    	<#if message.member.phaseStartDate??>${message.member.getDay(message.member.phaseStartDate)}</#if>/<#if message.member.createDate??>${message.member.getDay(message.member.createDate)}</#if>
        </a>
    </td>
    <td>${(message.createDate!?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td>
    	<#if message.reviews??>
    		<font color="red">退回需修改</font>
    	<#else>
	    	<font color="red">有新留言</font>
    	</#if>
    	<a href="javascript:intervence('${message.member.id!}')">点此进入</a>
    </td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="7">暂无信息</td></tr>
  </#if>
</table>
</div>
<div class="pageNum">
	<a href='javascript:gotoPage1(1)'> 首页</a>
    <#if (pageMessage.previousPage >= 1) >
		<a href='javascript:gotoPage1(${pageMessage.previousPage!})'>上一页</a>
	</#if>
	<#if (pageMessage.nextPage <= pageMessage.totalPage)>
		<a href='javascript:gotoPage1(${pageMessage.nextPage!})'> 下一页</a>
	</#if>
	<a href='javascript:gotoPage1(${pageMessage.totalPage!})'> 尾页</a>
	当前第${pageMessage.currentPage!}/${pageMessage.totalPage!}页转到第
	<select id="currentPage" name="currentPage" onchange="gotoPage1(this.value)">
		<#list 1..pageMessage.totalPage as i>
			<option value="${i!}" <#if pageMessage.currentPage=i>selected</#if> >${i!}</option>
		</#list>
	</select>页 共${pageMessage.totalRow!}条记录
</body>
</html>
