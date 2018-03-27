 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>诺特会员中心-会员阶段申请</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.js src="dialog.js"/>
<script type='text/javascript' src='${base}/dwr/interface/MemberAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/interface/TosAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type='text/javascript'>
    function msgSet(id,val){
         window.location.href="member!messageSet.action?member.id="+id+"&member.isSms="+val;
    }
    
	function adapt(id,p,sid){
		Dialog.confirm("确认申请?",
	  		function(){
	  			if(sid!=""){
		  			TosAjaxService.existsPhase(sid,p,function(data){
		  				if(data){
				  			window.location.href="member!adapt.action?member.id="+id+"&member.adjustPhase="+p+"&task.id=${(taskId)!}";
		  				}else{
		  					Dialog.alert("该会员所属服务类型下无此阶段，故不能申请到该阶段");
		  				}
		  			});
	  			}else{
	  				window.location.href="member!adapt.action?member.id="+id+"&member.adjustPhase="+p+"&task.id=${(taskId)!}";
	  			}
	  		}
  		)
	}
	
	function getPhase(id,sid,pCode){
		var html = "";
		TosAjaxService.getStageByServiceId(sid,function(data){
			if(data!=null&&data.length>0){
				var arr=[];
				arr.push("<table height='100%' width='100%' border='0' align='center' cellpadding='10' cellspacing='0'>");
				arr.push("<tr><td align='right'>阶段类型：</td><td align='left'><select id='serId'>");
				for(var i=0;i<data.length;i++){
					if(pCode==data[i].stageCode){
						arr.push("<option value=\""+data[i].stageCode+"\" selected>"+data[i].stageName+"</option>");
					}else{
						arr.push("<option value=\""+data[i].stageCode+"\">"+data[i].stageName+"</option>");
					}
				}
				arr.push("</select></td></tr></table>");
				html = arr.join('');
			}
			Dialog.box("修改阶段类型",html,300,120,function(){
				doPhase(id,pCode);
			});
		});
	}
	
	function doPhase(id,pCode){
		var sid = $("#serId").val();
		if(sid==""){
			Dialog.alert("此服务类型下无阶段");
		}else{
		  	window.location.href="member!adapt.action?member.id="+id+"&member.phase="+pCode+"&member.adjustPhase="+sid+"&task.id=${(taskId)!}";
		}
	}
</script>
</head>

<body>
   <div class="fastNav">工作平台 > 营养师部 > 会员阶段申请</div>
   <@u.search_bar action="member!stageApply.action">
<input type="hidden" id="curPage" name="member.curPage" value="${member.curPage}" />
    <table>
	    <tr>
	      <td width="25%">客户姓名 </td>
	      <td width="25%">
			<input type="text" id="member.name" name="member.name" value="${member.name!}"/>
		  </td>
		  <td width="25%">手机 </td>
	      <td width="25%">
			<input type="text" id="member.tel" name="member.tel" value="${member.tel!}"/>
		  </td>
	    </tr>
  </table> 
</@u.search_bar>
<div class="listTitle"><span>会员阶段申请</span></div>
<div class="listLine">
<table>
	<tr>
	    <th>序号</th>
	    <th>姓名</th>
		<th>性别</th>
		<th>手机</th>
		<th width="30%">最近干预记录</th>
		<th>所属机构</th>
	    <th>所处阶段</th>
	    <th>服务类型</th>
		<th>拟进入阶段</th>
		<th>短信</th>
  	</tr>
	<#if page??&&page.dataList??>
	<#list page.dataList as member>
	<tr>
		<td>${member_index+1!}</td>
	    <td><a href="javascript:show('${member.id!}')">${member.name!}</a></td>
		<td><@c.syscode syscodes=sysCodeSexList code="${(member.sex)!}"/></td>
		<td>${member.tel!}</td>
		<td>${(member.service.content)!}</td>
		<td>${(member.org.name)!}</td>
	    <td>
	    	<a href="javascript:intervence('${member.id!}')">
			<@c.syscode syscodes=sysCodeStageList code="${(member.phase)!}"/>
			<#if member.phaseStartDate??>${member.getDay(member.phaseStartDate)}</#if>/<#if member.startDate??>${member.getDay(member.startDate)}</#if>
	        </a>
	    </td>
     	<td>${(member.serviceName)!}</td>
   		<td>
		   <#-- 
		    <a href="javascript:adapt('${member.id!}','1','${member.serviceType!}')">未</a>
			<a href="javascript:adapt('${member.id!}','2','${member.serviceType!}')">启</a>  
			<a href="javascript:adapt('${member.id!}','3','${member.serviceType!}')">减</a>  
			<a href="javascript:adapt('${member.id!}','4','${member.serviceType!}')">维</a>
			<a href="javascript:adapt('${member.id!}','5','${member.serviceType!}')">暂</a>
			-->
			<a href="javascript:getPhase('${member.id!}','${member.serviceType!}','${(member.phase)!}')" title="修改阶段类型">修改阶段</a>
		</td>
		<#if member.isSms??&&member.isSms=0>
		<td><a id="open" href="javascript:msgSet('${member.id!}','${member.isSms!0}')">重开</a></td>
    	<#else>
        <td><a id="close" href="javascript:msgSet('${member.id!}','${member.isSms!1}')">关</a></td>
    	</#if>
  	</tr>
	</#list>
    <#else>
	<tr><td colspan="10">暂无信息！</td></tr>
    </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
<script type="text/javascript">
     function show(id){
		var url = "member!newCustomerEdit.action?id="+id;
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
		window.open(url,'',
			'toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
</script>
</html>
