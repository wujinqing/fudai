<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>未新续提醒名单</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 > 营养师部 > 未新续提醒名单</div>
<form  method="post" id="form" name="form">
<input type="hidden" id="id" name="id" />
<input type="hidden" id="sale.customer.id" name="sale.customer.id" />
</form>
<@u.search_bar action="member!newNameList.action">
<input type="hidden" id="curPage" name="member.curPage" value="${(member.curPage)!}" />
  <table>
    <tr>
      	<td>会员姓名</td>
      	<td><input type="text" name="member.name" value="${(member.name)!}"/></td>
      	<td>上次购买时间：</td>
	    <td>
		   <input type="text" id="beginDate" name="member.beginDate" 
	        	 value="${((member.beginDate)?string("yyyy-MM-dd"))!}"  onclick="WdatePicker({readOnly:true})"/>到
	       <input type="text" id="endDate" name="member.endDate"
	       	 	 value="${((member.endDate)?string("yyyy-MM-dd"))!}" onclick="WdatePicker({readOnly:true})"/>
	    </td>
	    <td>统计日期：</td>
	    <td><input type="text" id="startTime" name="member.startTime"
	       	 	 value="${((member.startTime)?string("yyyy-MM-dd"))!}" onclick="WdatePicker({readOnly:true})"/> </td>
    </tr>
   </table>
</@u.search_bar>
<div class="listTitle"><span>未新续提醒名单</span></div>
<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
	<th>性别</th>
    <th>所处阶段</th>
    <th>服务类型</th>
	<th>上次购买时间</th>
	<th width="20%">最近干预记录</th>
	<th>最后点评时间</th>
	<th width="20%">最后点评记录</th>
  </tr>
  <#if page.dataList??>
  <#list page.dataList as member>
  <tr>
	<td>${member_index+1!}</td>
    <td><a href="javascript:show('${member.id!}','${type!}')">${member.name!}</a></td>
	<td><@c.syscode syscodes=sysCodeSexList code="${(member.sex)!}"/></td>
    <td>
    	<a href="javascript:intervence('${member.id!}')">
    	<@c.syscode syscodes=sysCodeStageList code="${(member.phase)!}"/> 
	      <#if member.phaseStartDate??>${member.getDay(member.phaseStartDate)}</#if>/<#if member.startDate??>${member.getDay(member.startDate)}</#if>
	    </a>
    </td>
    <td>${(member.servieName)!}</td>
	<td><a href="javascript:showDate(${member.id!})"><#if member.saleDate??>${(member.saleDate!?string('yyyy-MM-dd'))?default("")}</#if></a></td>
	<td>${(member.service.content)!}</td>
	<td>${((member.service.commentDate)?string("yyyy-MM-dd"))!}</td>
	<td>${((member.service.comments)?html)!}</td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="9">暂无记录</td></tr>
  </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
<script type="text/javascript">
	function show(id,type){
		var url = "member!newCustomerEdit.action?id="+id+"&type="+type;
		beginOpen(url);
	}
	
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'',
				'toolbar=no,resizable=yes,location=no,scrollbars=yes,height=500,top='+top+',left='+left);
	}
	
	function showDate(id){
		var url = "member!getOrderDetial.action?member.id="+id;
		beginOpen(url);
	}

	function intervence(id){
		var url = "member!getIntervence.action?id="+id;
		beginOpen(url);
	}
</script>
</html>
