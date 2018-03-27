<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>普通会员查询</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
<@u.js src="dialog.js"/>
<script type='text/javascript' src='${base}/dwr/interface/MemberAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/interface/TosAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#ck_all").click(function(){
		if($(this).attr("checked")){
			$("input:checkbox[name='ckMeb']").attr("checked",true);
		}else{
			$("input:checkbox[name='ckMeb']").removeAttr("checked");
		}
	});
	
	$("input:checkbox[name='ckMeb']").click(function(){
 		if(!$(this).attr("checked")){
 			$("#ck_all").removeAttr("checked");
 		}else{
 			var flag=true;
 			$("input:checkbox[name='ckMeb']").each(function(){
		 		if(!$(this).attr("checked")){
		 			flag =false;
		 		}
			});
			if(flag){
				$("#ck_all").attr("checked",true);
			}
 		}
	});
});

function pushMsg(){
	$("#choose_meb").val("");
  	var diag = new Dialog("Diag1");
	diag.Width = 600;
	diag.Height = 280;
	diag.Title = "搜索结果消息推送";
	diag.URL = "${base}/bz/send_member_msg!gelInput.action"
	diag.ShowMessageRow = true;
	diag.OKEvent = function(){
	  	Dialog.confirm("推送消息会花一点时间，确认推送？",
	  		function(){
				var id = diag.ID;
				document.getElementById("_DialogFrame_"+id).contentWindow.doSubmit();
	  		}
	  	);
	};
	diag.show();
}

function choosePushMsg(){
 	var check="";
 	$("input:checkbox[name='ckMeb']").each(function(){
 		if($(this).attr("checked")){
 			check += $(this).val()+",";
 		}
	});
	if(check==""){
		Dialog.alert("请选择要推送消息的会员");
		return;
	}else{
		check =check.substring(0,check.length-1);
	}
	$("#choose_meb").val(check);
  	var diag = new Dialog("Diag1");
	diag.Width = 600;
	diag.Height = 280;
	diag.Title = "选择会员消息推送";
	diag.URL = "${base}/bz/send_member_msg!gelInput.action"
	diag.ShowMessageRow = true;
	diag.OKEvent = function(){
	  	Dialog.confirm("推送消息会花一点时间，确认推送？",
	  		function(){
				var id = diag.ID;
				document.getElementById("_DialogFrame_"+id).contentWindow.doSubmit();
	  		}
	  	);
	};
	diag.show();
} 
</script>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 > 咨询师工作平台 > 会员查询</div>
<input type="hidden" id="choose_meb" name="chooseMeb" value="" />
<input type="hidden" id="choose_type" name="chooseType" value="false" />
<@u.search_bar action="member!generalMebList.action">
<input type="hidden" id="curPage" name="member.curPage" value="${(member.curPage)!}" />
  <table>
    <tr>
	  <td>姓名：</td>
      <td><input type="text" id="name" name="member.name" value="${member.name!}"/></td>
	  <td>性别：</td>
      <td><@s.select id="sex" name="member.sex" list="#request.sysCodeSexList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="member.sex" theme="simple"/></td>
	  <td>地址：</td>
      <td><input type="text" id="address" name="member.address" value="${member.address!}"/></td>
      <td>电话：</td>
      <td><input type="text" id="tel" name="member.tel" value="${member.tel!}"/></td>
    </tr>
    <tr>
      <td>职业：</td>
      <td><@s.select id="job" name="member.job" list="#request.sysCodeJobList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="member.job" theme="simple"/></td>
      <td>创建时间：</td>
      <td>
      		<input type="text" id="beginDate" name="member.beginDate" value="${((member.beginDate)?string("yyyy-MM-dd"))!}" size="8" onclick="WdatePicker({isShowClear:true,readOnly:true})"/>~
      		<input type="text" id="endDate" name="member.endDate" value="${((member.endDate)?string("yyyy-MM-dd"))!}" size="8" onclick="WdatePicker({isShowClear:true,readOnly:true})"/>
      </td>
      <td>注册系统：</td><td><@s.select id="phoneType" name="member.phoneType" list="#request.sysCodeTypeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="member.phoneType" theme="simple"/></td>
      <td>昵称：</td><td><input type="text" id="nikename" name="member.nikename" value="${(member.nikename)!}"/></td>
	</tr>
	<tr>
	  <td>体重>=：</td><td><input type="text" size="3" id="weight" name="member.weight" value="${(member.weight)!}"/></td>
	  <td>积分>=：</td><td><input type="text" size="3" id="totScore" name="member.totScore" value="${(member.totScore)!}"/></td>
   	  <td>性质：</td><td><@s.select id="memberQuale" name="member.memberQuale" list="#request.sysCodeQuaList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="member.memberQuale" theme="simple"/></td>
      <td>类型：</td><td><@s.select id="diffType" name="member.diffType" list="#request.sysCodeDifList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="member.diffType" theme="simple"/></td>
	</tr>
	<tr>
		<td>身高：</td><td><input type="text" size="3" id="startWeight" name="member.startWeight" value="${((member.startWeight)?c)!}"/>~<input type="text" size="3" id="endWeight" name="member.endWeight" value="${((member.endWeight)?c)!}"/></td>
		<td>减重意向：</td><td><@s.select id="jzyx" name="member.jzyx" list="#request.sysCodeJzyxList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="member.jzyx" theme="simple"/></td>
		<td>登录名：</td><td><input type="text" id="userName" name="member.userName" value="${(member.userName)!}"/></td>
		<td>会员等级</td>
    	<td>
    		<select id="member_qjScore" name="member.qjScore">
			    <option value="">---请选择---</option>
			    <option value=",0" <#if "${(member.qjScore)!}"==",0">selected</#if>>非会员</option>
				<option value="1,1879" <#if "${(member.qjScore)!}"=="1,1879">selected</#if>>普通会员</option>
				<option value="1880,5639" <#if "${(member.qjScore)!}"=="1880,5639">selected</#if>>VIP会员</option>
				<option value="5640,8939" <#if "${(member.qjScore)!}"=="5640,8939">selected</#if>>白金会员</option>
				<option value="8940," <#if "${(member.qjScore)!}"=="8940,">selected</#if>>钻石会员</option>
	      	</select>
    	</td>
    	<!--<td colspan="2">&nbsp;</td>-->
	</tr>
  </table> 
 </@u.search_bar>

<div class="listTitle">
	<span>会员列表</span>
	<ul>
	<li><input type="button" class="btn_bg" value="选择会员推消息" onclick="choosePushMsg()"/></li>
	<li><input type="button" class="btn_bg" value="搜索结果推消息" onclick="pushMsg()"/></li>
	</ul>
</div>
<div class="listLine">
<table>
  <tr>
    <th width="3%">序号</th>
    <th width="4%">全选<input type="checkbox" id="ck_all" name="ckAll" /></th>
    <th width="7%">姓名</th>
	<th width="4%">性别</th>
	<th width="4%">年龄</th>
	<th width="5%">登录名</th>
	<th width="8%">手机</th>
	<th width="10%">地址</th>
	<th width="8%">EMAIL</th>
	<th width="6%">咨询师</th>
	<th width="10%">所属区域</th>
	<th width="6%">注册系统</th>
    <th width="6%">昵称</th>
    <th width="2%">类型</th>
    <th width="5%">积分</th>
    <th width="4%">积分详情</th>
    <th width="4%">服务类型</th>
    <th width="4%">会员详情</th>
    <th width="4%">会员等级</th>
  </tr>
  <#if page.dataList??>
  <#list page.dataList as member>
  <tr>
    <td>${member_index+1}</td>
    <td><input type="checkbox" name="ckMeb" value="${member.id!}" /></td>
    <td><a  href="javascript:show('${member.id!}','${type!}')">${member.name!}</a></td>
	<td><@c.syscode syscodes=sysCodeSexList code="${member.sex!}" /></td>
	<td><#if member.birthday??>${member.getAge(member.birthday)!}<#else></#if></td>
	<td>${member.userName!}</td>
	<td>${member.tel!}</td>
	<td>${member.addProvince!}${member.addCity!}${member.addOther!}${member.address!}</td>     
	<td>${member.email!}</td>
	<td>${(member.staff.name)!}</td>
	<td>${(member.org.name)!}</td>
	<td><@c.syscode syscodes=sysCodeTypeList code="${(member.phoneType)!}" /></td>
    <td>${(member.nikename?html)!}</td>
    <td><@c.syscode syscodes=sysCodeDifList code="${(member.diffType)!}" /></td>
	<td>
		<#if opeScore??&&(opeScore?string)="true">
		<a href="javascript:editScore('${member.id!}')" title="修改会员积分">${member.totScore!0}</a>
		<#else>
		${member.totScore!0}
		</#if>
	</td>
	<td><a href="javascript:lookScore('${member.id!}')" title="查看积分详情">查看</a></td>
    <td><a href="javascript:getService('${member.id!}','${member.serviceType!}')" title="修改服务类型">${(member.serviceName)!'无'}</a></td>
	<td><a href="javascript:look('${member.id!}')">点此进入</a></td>
	<td>
		${member.levName!}
	</td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="18">暂无信息</td></tr>
 </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
 <script type="text/javascript">
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		//var top = Math.round(sh/4);
		//var left = Math.round(sw/4);
		//window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
		window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width='+sw+',height='+sh+',top=0,left=0');
	}
	
	function look(id){
		var url = "member!gelMebIntervene.action?header=true&id="+id;
		beginOpen(url);
	}
	
 	function show(id,type){
		var url = "member!newCustomerEdit.action?id="+id+"&type="+type;
		beginOpen(url);
	}
 
	function getService(id,sid){
		var html = "";
		TosAjaxService.getGelTos(function(data){
			if(data!=null&&data.length>0){
				var arr=[];
				arr.push("<table height='100%' width='100%' border='0' align='center' cellpadding='10' cellspacing='0'>");
				arr.push("<tr><td align='right'>服务类型：</td><td align='left'><select id='serId'>");
				for(var i=0;i<data.length;i++){
					if(sid==data[i].id){
						arr.push("<option value=\""+data[i].id+"\" selected>"+data[i].serviceName+"</option>");
					}else{
						arr.push("<option value=\""+data[i].id+"\">"+data[i].serviceName+"</option>");
					}
				}
				arr.push("</select></td></tr></table>");
				html = arr.join('');
			}
			Dialog.box("修改服务类型",html,300,120,function(){
				doServie(id);
			});
		});
	}
	
	function doServie(id){
		var sid = $("#serId").val();
		var sname = $("#serId option:selected").text();
		MemberAjaxService.changeGelMebService(id,sid,sname,function(data){
			if(data=="-1"){
				Dialog.alert("系统忙，请稍后再试...");
			}else if(data=="1"){
				$("#search_form").submit();
				//window.location.href=location.href;
			}
		});
	}
	
	function editScore(id){
		var diag = new Dialog("Diag1");
		diag.Width = 800;
		diag.Height = 400;
		diag.Title = "积分赠送";
		diag.URL = "${base}/mb/use_score_audit!sendScore.action?mebId="+id
		diag.OKEvent = function(){
		  	Dialog.confirm("确认赠送？",
		  		function(){
					var id = diag.ID;
					document.getElementById("_DialogFrame_"+id).contentWindow.doSubmit();
		  		}
		  	);
		};
		diag.show();
	}
	
	function lookScore(id){
		var diag = new Dialog("Diag1");
		diag.Width = 800;
		diag.Height = 500;
		diag.Title = "积分详情";
		diag.URL = "${base}/mb/use_score_audit!scoreDetail.action?mebId="+id
		diag.ShowButtonRow = false;
		diag.show();
	}
	
	function backList(){
		Dialog.alert("操作成功！");
		$("#search_form").submit();
	}
</script>
</html>
