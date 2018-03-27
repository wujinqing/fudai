<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>满意度调查</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
</head>
<script type="text/javascript">
	function intervence(id){
		var h = $("#header").val();
		var url = "member!getIntervence.action?id="+id+"&header="+h;
		beginOpen(url);
	}
	
	function showDetail(id){
		var url = "../mb/member!newCustomerEdit.action?id="+id;
		beginOpen(url);
	}
	
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
	
	function lookSurvey(id){
		var url = "survey_answer!show.action?surveyId="+id;
		beginOpen(url);
	}
	
	$(document).ready(function(){
	   	if($("#org").val()!=''){
			$("#org").change();
		}
	});

	function getDept(org){
		var obj_depart = document.getElementById('depart');
        obj_depart.options.length=1;
 		var oid = "${(survey.limitDeps)!}"
        OrgAjaxService.getAllDepart(org.value,function(data){
           if(data !=""){
	          for(var i=0;i<data.length;i++){
		          var op = new Option(data[i].name,data[i].id);
		          obj_depart.options[i+1] = op;
		          if(oid!=""&&oid==data[i].id){
		          	obj_depart.options[i+1].selected = true;
		          }
              }
           }
        });
    }
</script>
<body class="mainbody">
<div class="fastNav">工作平台 > 营养师部 > 满意度调查</div>
<@u.search_bar action="survey!memberList.action">
<input type="hidden" id="curPage" name="survey.curPage" value="${survey.curPage!}" />
<input type="hidden" id="header" name="header" value="${(header?string)!}" />
<table width="100%" border="0" cellspacing="0">
	<tr>
		<td colspan="4">
		<#if "${powerFlag!}"="1">
		 机构：
    	<select id="org" name="survey.limitOrgs" onchange="getDept(this)">
		    <option value="">---请选择---</option>
		    <#if orgList??>
			    <#list orgList as org> 
			       <option value="${org.id}" <#if "${orgId!}"="${org.id!}">selected</#if>>${(org.name)!}</option>
			    </#list>
		    </#if>
	    </select>
                             部门：
    	<select id="depart" name="survey.limitDeps">
			<option value="">---请选择---</option>
	    </select>
	    <#else>
	           机构：${(survey.nutrOrgName)!}
	           部门：${(survey.nutrDeptName)!}
	    </#if>
	          营养师：<input type="text" name="survey.nutrName" value="${(survey.nutrName)!}">
        </td>
        <td>是否有问题：</td>
        <td>
        	<select name="survey.isSatisfied">
        		<option value="0" <#if "${survey.isSatisfied!}"="0">selected</#if>>有</option>
        		<option value="1" <#if "${survey.isSatisfied!}"="1">selected</#if>>无</option>
        	</select>
        </td>
   </tr>
   <tr>
	    <td>客户姓名：</td>
		<td><input type="text" name="survey.member.name" value="${(survey.member.name)!}"></td>
	    <td>解决状态：</td>
		<td>
			<@s.select name="survey.status" value="survey.status" list="syscodeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple" />
		</td>
		<td>调查类型：</td>
		<td>
			<@s.select name="survey.surveyType" value="survey.surveyType" list="syscodeTypeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple" />
		</td>
	</tr>
</table>
</@u.search_bar>
<div class="listTitle"><span>满意度调查客户</span></div>
<div class="listLine">
<table>
  <tr>
	<th>序号</th>
	<th>姓名</th>
	<th>性别</th>
	<th>所属区域</th>
	<th>营养师</th>
	<th>所处阶段</th>
	<th>服务类型</th>
	<th>调查日期</th>
	<th>调查类型</th>
	<th>是否有问题</th>
	<th>操作</th>
	<th>解决状态</th>
  </tr>
  <#if page??&&page.dataList??>
  <#list page.dataList as survey>
  <tr>
    <td>${survey_index+1}</td>
    <td><a href="javascript:showDetail('${survey.member.id!}')">${(survey.member.name)!}</a></td>
    <td><#if survey.member??&&"${survey.member.sex!}"=="1">男<#else>女</#if></td>
    <td>${(survey.member.staff.org.name)!}</td>
    <td>${(survey.member.staff.name)!}</td>
    <td>
    	<a href="javascript:intervence('${survey.member.id!}')">
    	<@c.syscode syscodes=syscodePhaseList code="${(survey.member.phase)!}"/>
    	<#if survey.member.phaseStartDate??>${survey.member.getDay(survey.member.phaseStartDate)}</#if>/<#if survey.member.createDate??>${survey.member.getDay(survey.member.createDate)}</#if>
    	</a>
    </td>
    <td>${(survey.member.serviceName)!}</td>
    <td>${(survey.surveyDate?string("yyyy-MM-dd"))!}</td>
    <td><@c.syscode syscodes=syscodeTypeList code="${(survey.surveyType)!}"/></td>
    <td><#if "${survey.isSatisfied!}"="1">无<#elseif "${survey.isSatisfied!}"="0">有</#if></td>
    <td>
    	<a href="javascript:lookSurvey('${survey.id!}');">查看</a>
    	<a href="survey!manager.action?survey.id=${survey.id!}&header=${(header?string)!}">点评</a>
    </td>
    <td><@c.syscode syscodes=syscodeList code="${(survey.status)!}"/></td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="12">暂无信息</td></tr>
  </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
</html>
