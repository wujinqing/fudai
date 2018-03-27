<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>启动期12天客户(按地区)</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/interface/WorkGroupAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/interface/StaffAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
  
</head>
<body class="mainbody">
<div class="fastNav">工作平台 > 营养师部工作平台 > 启动期12天客户(按地区)</div>
<@u.search_bar action="member!twelveDayAreaList.action">
<input type="hidden" id="curPage" name="member.curPage" value="${(member.curPage)!}" />
  <table>
	<tr>
      <td colspan='10'>
		  机构：
    	 <select id="org" name="member.limitOrgs" onchange="getDept(this.value,1)">
		    <option value="">---请选择---</option>
		    <#if orgList??>
			    <#list orgList as org> 
			       <option value="${org.id}" <#if "${orgId!}"="${(org.id)!}">selected</#if>>${org.name!}</option>
			    </#list>
		    </#if>
	      </select>
                           部门：
    	  <select id="depart" name="member.limitDeps" onchange="getGroup(this.value,1)">
		    <option value="">---请选择---</option>
	      </select>
	                工作组：
	      <select id="group" name="member.limitGroups" onchange="getStaff(this.value,1)">
		    <option value="">---请选择---</option>
	      </select>          
	                营养师： 
    	  <select id="staff" name="member.staff.id">
		    <option value="">---请选择---</option>
		  </select>
      </td>
      <td>点评状态：
      	<select name="member.closeComment">
      		<option value="0" <#if member.closeComment??&&(member.closeComment)=0>selected</#if>>未点评</option>
      		<option value="1" <#if member.closeComment??&&(member.closeComment)=1>selected</#if>>已点评</option>
      	</select>
      </td>
    </tr>
  </table> 
 </@u.search_bar>

<div class="listTitle"><span>启动期12天客户列表</span></div>
<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>姓名</th>
	<th>性别</th>
	<th>所属区域</th>
	<th>营养师</th>
    <th>所处阶段（天数/总天数）</th>
    <th>服务类型</th>
	<th>工作提示</th>
	<th>最后回访日期</th>
	<th width="15%">最后回访内容</th>
	<th>操作</th>
  </tr>
  <#if page.dataList??>
  <#list page.dataList as member>
  <tr>
    <td>${member_index+1}</td>
    <td><a  href="javascript:show('${member.id!}')">${member.name!}</a></td>
	<td><#if member.sex=="0">女<#else>男</#if></td>
	<td>${(member.org.name)!}</td>
	<td>${(member.staff.name)!}</td>
    <td>
    	<a href="javascript:intervence('${member.id!}')">
    	<@c.syscode syscodes=syscodeList code="${(member.phase)!}"/> 
    	<#if member.phaseStartDate??>${member.getDay(member.phaseStartDate)}</#if>/<#if member.startDate??>${member.getDay(member.startDate)}</#if>
       	</a>
    </td>
    <td>${(member.serviceName)!}</td>
    <td>
    	<#if member.phaseStartDate??&&(member.getDay(member.phaseStartDate)<=14)>
    			启动期第${member.getDay(member.phaseStartDate)}天
    	<#elseif member.phaseStartDate??&&(member.getDay(member.phaseStartDate)>14)>
    			超时第${member.getDay(member.phaseStartDate)-14}天
    	</#if>
    </td>
    <td>${(member.createDate?string("yyyy-MM-dd hh:mm"))!}</td>
    <td width="15%">${((member.content)?html)!}</td>
	<td>
		<#if member.closeComment??&&member.closeComment=1>
		<a href="javascript:showTasks('${member.id!}')">查看</a>
		<#else>
		<a href="javascript:comment('${member.id!}')">点评</a>
		</#if>
	</td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="9">暂无信息</td></tr>
  </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
<script type="text/javascript">
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'',
				'toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
 	function show(id,type){
		var url = "member!newCustomerEdit.action?id="+id+"&type="+type;
		beginOpen(url);
	}
 
	function intervence(id){
		var url = "member!getIntervence.action?header=true&id="+id;
		beginOpen(url);
	}
	
	function showTasks(id){
		var url = "comment_twelve!look.action?member.id="+id
		beginOpen(url);	
	}
	function comment(id){
		var url = "comment_twelve!input.action?member.id="+id;
		beginOpen(url);	
	}
	
	$(document).ready(function(){
		var v_org = $("#org").val();
	   	if(v_org !=''){
			getDept(v_org,0);
		}
	});
	
	function getDept(v_org,num){
		var obj_staff = document.getElementById('staff');
		var obj_group = document.getElementById('group');
		var obj_depart = document.getElementById('depart');
    	obj_staff.options.length=1;
    	obj_group.options.length=1;
        obj_depart.options.length=1;
        var did="";
        if(num==0){
        	did = "${(member.limitDeps)!}";
        }
        OrgAjaxService.getAllDepart(v_org,function(data){
           if(data !=""){
	          for(var i=0;i<data.length;i++){
		          var op = new Option(data[i].name,data[i].id);
		          obj_depart.options[i+1] = op;
		          if(did!=""&&did==data[i].id){
		          	obj_depart.options[i+1].selected = true;
          	  		getGroup(did,num);
		          }
              }
           }
        });
    }
    function getGroup(v_depart,num){
    	var v_org = $("#org").val();
    	var obj_staff = document.getElementById('staff');
		var obj_group = document.getElementById('group');
    	obj_staff.options.length=1;
    	obj_group.options.length=1;
    	var gid="";
    	if(num==0){
    		gid = "${(member.limitGroups)!}";
    	}
    	WorkGroupAjaxService.getWorkGrup(v_org,v_depart,function(data){
    		if(data != ""){
    			for(var i=0;i<data.length;i++){
		           var op = new Option(data[i].name,data[i].id);
		           obj_group.options[i+1] = op;
		           if(gid!=""&&gid==data[i].id){
		          	 obj_group.options[i+1].selected = true;
		           }
              	}
    		}
            getStaff(gid,num);
    	});
    }
    function getStaff(v_group,num){
    	var obj_staff = document.getElementById('staff');
    	obj_staff.options.length=1;
    	var sid="";
    	if(num==0){
    		sid = "${(member.staff.id)!}";
    	}
    	if(v_group!=""){
	    	StaffAjaxService.getStaffByGroup(v_group,function(data){
	    		if(data!=""){
		            for(var i=0;i<data.length;i++){
			           var ops = new Option(data[i].name,data[i].id);
			           obj_staff.options[i+1] = ops;
			           if(sid!=""&&sid==data[i].id){
			           	  obj_staff.options[i+1].selected = true;
			           }
	               }
	    		}
	    	});
    	}else{
    		var v_org = $("#org").val();
    		var v_depart = $("#depart").val();
    		OrgAjaxService.getAllStaff(v_org,v_depart,function(data){
	            if(data !=""){
		           for(var i=0;i<data.length;i++){
			           var ops = new Option(data[i].name,data[i].id);
			           obj_staff.options[i+1] = ops;
			           if(sid!=""&&sid==data[i].id){
			           	  obj_staff.options[i+1].selected = true;
			           }
	               }
	            }
            });
    	}
    }
</script>
</html>
