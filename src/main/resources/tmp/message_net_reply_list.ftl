<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言回复</title>
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
<div class="fastNav">物联网系统 -> 指导服务-> 未回复的留言</div>
<form action="message!netMesssageList.action" method="post" id="search_form" name="search_form">
<input type="hidden" id="curPage" name="message.curPage" value="${message.curPage}" />
</form>
<div class="listTitle">
  <span>未回复的留言列表</span>
</div>
<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>所属合作点</th>
    <th>所属营养师</th>
    <th>留言提交时间</th>
    <th>工作提示</th>
  </tr>
  <#if page.dataList??>
  <#list page.dataList as msg>
  <tr> 
	<td>${msg_index+1}</td> 
    <td><a href="javascript:show('${(msg.member.id)!}')" title="查看会员详情">${(msg.member.name)!}</a></td>
    <td><@c.syscode syscodes = sysCodeList code='${(msg.member.sex)!}'/></td>
    <td>${(msg.member.getAge(msg.member.birthday))!}</td>
    <td>${(msg.member.org.name)!}</td>
    <td>${(msg.member.staff.name)!}</td>
    <td>${(msg.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td><font color="red">有新留言</font><a href="message!netMessageRelpy.action?id=${msg.id}&preview=true">点此进入</a></td>
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
