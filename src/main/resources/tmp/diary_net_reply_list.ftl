<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>日记回复</title>
<@u.css src="style.css"/>
<script>
	function show(id){
		var url = "../cm/scale_own!memberLookDetail.action?id="+id;
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

<div class="fastNav">物联网系统 -> 指导服务-> 未回复的日记</div>

<form action="diary!netReplyList.action" method="post" id="search_form" name="search_form">
<input type="hidden" id="curPage" name="diary.curPage" value="${diary.curPage}" />
</form>

<div class="listTitle">
  <span>未回复的日记列表</span>
</div>

<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>所属合作点</th>
    <th>营养师</th>
    <th>日记提交时间</th>
    <th>工作提示</th>
  </tr>
  <#if page.dataList??>
  <#list page.dataList as diary>
  <tr> 
	<td>${diary_index+1}</td> 
    <td><a href="javascript:show('${(diary.member.id)!}')" title="查看会员详情">${(diary.member.name)!}</a></td>
    <td><@c.syscode syscodes = sysCodeSexList code='${(diary.member.sex)!}'/></td>
    <td>${(diary.member.getAge(diary.member.birthday))!}</td>
    <td>${(diary.member.org.name)!}</td>
    <td>${(diary.member.staff.name)!}</td>
    <td>${(diary.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td><#if diary.managerComment??><font color="red">有主管点评</font><#else><font color="red">有新日记</font></#if><a href="diary!netReply.action?id=${diary.id}">点此进入</a></td>
  </tr>
  </#list>
  <#else>
  <tr>
  	<td colspan="8">暂无信息</td>
  </tr>
  </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
</html>
