<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>干预记录点评</title>
</head>
<@u.css src="style.css"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
<body class="mainbody">

<div class="fastNav">工作平台 > 营养师主管工作平台 > 干预记录点评</div>
 <form id="form" name="form" method="post">
	<input type="hidden" name="id" id="id"/>
 </form>
 <@u.search_bar action="service!commentList.action">
 <input type="hidden" name="service.curPage" id="curPage" value="${service.curPage}"/>
  <table>
    <tr>
      <td>日期 </td>
      <td>
		<input type="text" name="service.startTime" value="${(service.startTime?string('yyyy-MM-dd'))!}" onclick="WdatePicker({isShowClear:true,readOnly:true})"/> 到 <input type="text" name="service.endTime" value="${(service.endTime?string('yyyy-MM-dd'))!}" onclick="WdatePicker({isShowClear:false,readOnly:true})"/></td>
	  <td>点评状态 </td>
      <td>
		<@s.select name="status" list="serviceStatusList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple" />
	  </td>
    </tr>
  </table> 
 </@u.search_bar>

<div class="listLine">
<table>
  <tr>
    <th><input type="checkbox" id="checkOne" onclick="selectCheck(this);"/> 全选</th>
    <th>回复日期</th>
    <th>会员姓名</th>
    <th>营养师</th>
    <th>所属机构</th>
	<th>所处阶段(天数/总天数)</th>
	<th>服务类型</th>
	<th>干预内容</th>
    <th>主管确认</th>
    <th>点评</th>
  </tr>
  <#if page??&&page.dataList??&&page.dataList?size gt 0>
  	<#list page.dataList as service> 
	  <tr>
		<td><input type="checkbox" name="check" value="${(service.id)!}"></td>
	    <td>${(service.createDate?string('yyyy-MM-dd HH:mm'))!}</td>
	    <td><a href="javascript:show('${service.member.id!}')">${(service.member.name)!}</a></td>
	    <td>${(service.staff.name)!}</td>
	    <td>${(service.org.name)!}</td>
		<td>
			<a href="javascript:intervence(${(service.member.id)!})">
	    	<@c.syscode syscodes=sysCodeStageList code="${(service.member.phase)!}"/> 
		    <#if service.member.phaseStartDate??>${(service.member.getDay(service.member.phaseStartDate))!}</#if>/<#if service.member.startDate??>${(service.member.getDay(service.member.startDate))!}</#if>
	        </a>
	    </td>
	    <td>${(service.member.serviceName)!}</td>
		<td width="30%">${service.content!}</td>
	    <td><#if service.isConfirm??&&service.isConfirm==0><input type="button" onclick="confirm('${service.id!}')" class="btn_bg" value="确认" /><#else>已确认</#if></td>
	    <td><#if service.isComment??&&service.isComment==0><a href="service!comment.action?id=${service.id!}">点评</a><#else>已点评</#if></td>
	  </tr>
  	</#list>
  </#if>
</table>
</div>
<div class="listDiv"><input type="button" value="批量确认" class="btn_bg" onclick="confirmAll()"/><font id="msg" color="red"></font></div>
<@u.paginate page=page/>
</body>
<script>
	// 全选框
	function selectCheck(obj){
	  var ck=document.getElementsByName("check");
	  if(obj.checked){
	     for(var i=0;i<ck.length;i++){
	        document.getElementsByName("check")[i].checked="checked";
	  	 }
	  }else{
	   	 for(var i=0;i<ck.length;i++){
	    	document.getElementsByName("check")[i].checked="";
	  	 }
	  }
	}
	
	// 确认
	function confirm(id){
	  document.getElementById("id").value=id;
	  var form=document.getElementById("form");
	  form.action="service!confirm.action";
	  form.submit();
	}
	
	// 确认(批量)
	function confirmAll(){
		var checkId="";
		var check=document.getElementsByName("check"); 
	 	for(var i=0;i<check.length;i++){
		   	if(check[i].checked){
		   		checkId=checkId+check[i].value+",";
		   	}
	 	}
		if(checkId==""){
			alert("请选择需要确认的记录！");
			return false;
		}
		var form=document.getElementById("form");
		form.action="service!confirmAll.action?ids="+checkId;
		document.getElementById("msg").innerHTML="确认中，请稍后...";
		form.submit();
	}
	
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
	
	function show(id){
		var url = "../mb/member!newCustomerEdit.action?id="+id;
		beginOpen(url);
	}
	
	function intervence(id){
		var url = "../mb/member!getIntervence.action?header=true&id="+id;
		beginOpen(url);
	}
</script>
</html>
