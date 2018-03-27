<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>干预记录列表</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
<script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type='text/javascript'>
function beginOpen(url){
	var sh = window.screen.height;
	var sw = window.screen.width;
	var top = Math.round(sh/4);
	var left = Math.round(sw/4);
	window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
}
function edit(id){
	var url = "member!newCustomerEdit.action?id="+id;
	beginOpen(url);
}
function intervence(id){
	var url = "member!getIntervence.action?id="+id+"&header=true";
	beginOpen(url);
}
function getDept(org){
    document.getElementById('depart').options.length=1;
	document.getElementById('staff').options.length=1;
    var dt = "${(service.staff.department.id)!}";
    OrgAjaxService.getAllDepart(org,function(data){
       if(data!=""){
          for(var i=0;i<data.length;i++){
	          var op = new Option(data[i].name,data[i].id);
	          document.getElementById('depart').options[i+1] = op;
	          if(dt!=""&&dt!=null&&dt==data[i].id){
	          	 document.getElementById('depart').options[i+1].selected=true;
	          	 getStaff(dt);
	          }
           }
        }
    });
}

function getStaff(department){
	var orgId=document.getElementById("org").value;
    document.getElementById('staff').options.length=1;
    var st='${(service.createUserId)!}';
    OrgAjaxService.getAllStaff(orgId,department,function(data){
        if(data!=""){
          for(var i=0;i<data.length;i++){
	          var ops = new Option(data[i].name,data[i].id);
	          document.getElementById('staff').options[i+1] = ops;
	          if(st!=""&&st!=null&&st==data[i].id){
	          	 document.getElementById('staff').options[i+1].selected=true;
	          }
          }
      }
    });
}
window.onload=function(){
	var orgId = document.getElementById("org").value;
	if(orgId != ""){
		getDept(orgId);
	}
}

function toExcel(){
    var form = document.getElementById('search_form');
    $("#excel").val(true);
    $("#excel").attr("disabled",false);
    form.submit();
    $("#excel").val(false);
    $("#excel").attr("disabled",true);
 }
</script>
</head>

<body>
<form action="service!serviceList.action" method="post" id="search_form" name="search_form" >
<input type="hidden" id="excel" name="excel" value="false" disabled="true"/>
	<div class="listLine">
		<table>
		  <tr>
		    <th align="left">&nbsp;&nbsp;查询</th>
		  </tr>
		 </table>
		<table width="100%" border="0" cellspacing="0">
		    <tr>
		       <td>
		       	机构：<@s.select id="org" name="service.staff.org.id" list="orgList" listKey="id" listValue="name" 
					  headerKey="" onchange="getDept(this.value)" headerValue="---所有---" value="service.staff.org.id" theme="simple"/>	
			           部门：
		        	  <select id="depart" name="service.staff.department.id" onchange="getStaff(this.value)">
		        	 	 <option value="">---所有---</option>
				      </select>
				 营养师： 
			           <select id="staff" name="service.createUserId">
			           	 <option value="">---所有---</option>
					   </select>
		       </td>
		       <td >干预日期：
		       <input type="text" name="service.startTime" onclick="WdatePicker({readOnly:true})" value="${(service.startTime?string('yyyy-MM-dd'))!}"/>~
		       <input type="text" name="service.endTime" onclick="WdatePicker({readOnly:true})" value="${(service.endTime?string('yyyy-MM-dd'))!}"/></td>
		    </tr>
		</table>
	</div>
	<div class="listDiv">
		<input type="submit" class="btn_bg" value="搜索" />
		<input type="reset" class="btn_bg" value="重置" />
	</div>
</form>
<@u.title_bar title="${(service.startTime?string('yyyy-MM-dd'))!}至${(service.endTime?string('yyyy-MM-dd'))!}干预记录（共${(serviceList?size)!'0'}条记录）">
	<input type="button" onclick="toExcel()" value="导出当前记录到excel" class="btn_bg"/>
</@u.title_bar>
<div class="listLine">
<table width="100%" border="0" cellspacing="0">
	<tr>
		<td width="3%">序号</td>
		<td width="8%">会员姓名</td>
		<td width="8%">联系电话</td>
		<td width="8%">营养师</td>
		<td width="15%">所处阶段</td>
		<td width="13%">所属机构</td>
		<td width="5%">初始体重(kg)</td>
		<td width="5%">目前体重(kg)</td>
		<td width="25%">干预记录</td>
		<td width="10%">干预时间</td>
	</tr>
	<#if serviceList??&&serviceList?size gt 0>
	<#list serviceList as service>
	<tr>
		<td>${service_index+1}</td>
		<td>${(service.member.name)!}</td>
		<td>${(service.member.tel)!}</td>
		<td>${(service.member.staff.name)!}</td>
		<td>
			<@c.syscode syscodes=sysCodeList code="${(service.member.phase)!}" />
			<#if (service.member.phaseStartDate)??>${(service.member.getDay(service.member.phaseStartDate))!}</#if>/<#if (service.member.startDate)??>${(service.member.getDay(service.member.startDate))!}</#if>
		</td>
		<td>${(service.member.org.name)!}</td>
		<td title="初始体重">${(service.member.weight?string.number)!}</td>
		<td title="目前体重">${(service.member.nowWeight?string.number)!}</td>
		<td title="干预内容">${(service.content)!}</td>
		<td title="干预时间">${(service.createDate)?string('yyyy-MM-dd')!}</td>
	</tr>
	</#list>
	<#else>
	<tr><td colspan="10" style="height:70px">暂无信息</td></tr>
	</#if>
</table>
</div>
</body>
</html>	
