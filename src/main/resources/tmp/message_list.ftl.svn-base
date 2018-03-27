<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言列表</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<script type='text/javascript' src='${base}/dwr/interface/MemberAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type='text/javascript'>
function subMessage(id,tid){
	var reply=document.getElementById("msg_"+id+"_id").value;
	MemberAjaxService.subMessage(id,reply,tid,function(data){
		alert(data);
    });
}

function del(id){
	if(confirm("确认删除？")){
	   	var form=document.getElementById("msg_form");
	   	$("#id").val(id);
	   	form.action="message!delMsg.action";
	   	form.submit();
   	}
}
</script>
</head>

<body>
<form method="post" id="msg_form" name="msg_form" >
<input type="hidden" id="id" name="id" value="">
<input type="hidden" id="mem_id" name="memId" value="${memId!}">
<input type="hidden" id="task_id" name="taskId" value="${taskId!}">
</form>
<form action="message!msgList.action" method="post" id="search_form" name="search_form" >
<input type="hidden" id="m_id" name="memId" value="${memId!}">
<input type="hidden" id="t_id" name="taskId" value="${taskId!}">
<input type="hidden" id="curPage" name="message.curPage" value="${message.curPage!}" />
</form>
<div class="listLine">
  <table>
    <tr>
      <th colspan="7" align="left">客户留言</th>
    </tr>
    <tr>
      <td width="10%">序号</td>
      <td width="15%">留言时间</td>
      <td width="20%">问题</td>
      <td width="10%">回答</td>
      <td width="10%">回复</td>
      <td width="10%">删除</td>
      <td width="25%">主管点评</td>
    </tr>
    <#if page??&&page.dataList??>
     <#list page.dataList as msg>
      <tr id="${(msg_index+1)}_member">
      <td>${(msg_index+1)}</td>
      <td>${((msg.createDate)?string("yyyy-MM-dd HH:mm"))!}</td>
      <td>${((msg.content)?html)!}&nbsp;</td>
      <td><textarea id="msg_${(msg.id)}_id" cols="50" rows="5" >${(msg.reply)!}</textarea></td>
      <td><#if "${(msg.isChecked)!}"!="1"><input type="button" value="回复" class="btn_bg" onclick="subMessage('${(msg.id)!}','${taskId!}')"/><#else>已回复</#if></td>
      <td><a href="javascript:del('${(msg.id)}');">删除</a></td>
      <td>${(msg.reviews)!}</td>
    </tr>
    </#list>
    <#else>
    <tr><td colspan="7">暂无记录</td></tr>
    </#if>
  </table>
</div>
<@u.paginate page=page/>
</body>
</html>
