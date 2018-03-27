<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.js src="drag.js"/>  
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
		<script type='text/javascript' src='${base}/dwr/interface/StaffAjaxService.js'></script>
		<script type='text/javascript' src='${base}/dwr/engine.js'></script>
		<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <script type='text/javascript'>        
        	function selectAll(id,name){
        	  	var chk = document.getElementById(id);
        		if(chk.checked){
        			$("input[name="+name+"]").each(function(){
   						$(this).attr("checked",true);
  					});
        		}
        		else{
        			$("input[name="+name+"]").each(function(){
   						$(this).attr("checked",false);
  					});
        		}
       		}
       		
       		function unSelectAll(id,name){
       			var flag = 0;
       			var len=document.getElementsByName(name);
       			$("input[name="+name+"]").each(function(key){
       				if($(this).attr("checked")==true){
       					flag++;
       				}
       			});
       			if(flag==len.length){
       				$("#"+id).attr("checked",true)
       			}
       			else{
       				$("#"+id).attr("checked",false)
       			}
       		}
       		
       		function operate(url,id,status,type){
       			var form=document.getElementById('actSignup_form');
       			document.getElementById('type').value=type;
       			if(type=='audit'){
       				var info="";
       				if(status=='1'||status=='5'||status=='6'||status=='7'){
						info="确认审核通过?";}
					else{
						info="确认审核不通过?";
					}
					if(confirm(info)){
	       				document.getElementById('id').value=id;
	       				document.getElementById('status').value=status;
	       				form.action=url;
	       				form.submit();
	       			}
       			}
       			if(type=='auditAll'){
       				 auditAll(url,form,status);
       			}
       			if(type=='viewAct'){
       				form=document.getElementById('form1');
	        		document.getElementById('actId').value=id;
	        		document.getElementById('type_').value=type;
	        		form.action=url;
	        		form.submit();
	        	}
       		}
       		
       		function show(){
          		var falg = 0; 
				$("input[name='names']:checkbox").each(function () { 
					if ($(this).attr("checked")) { 
						falg += 1; 
					} 
				});
				if (falg <=0){
					alert("请选择要操作的记录!");
                	return;
				} 
				else{
					document.getElementById('closed').style.display = "block";   //显示
				}
            } 
       		
       		function auditAll(url,form,status){
          		var falg = 0; 
          		var names="";
				$("input[name='names']:checkbox").each(function () { 
					if ($(this).attr("checked")) { 
						names += $(this).val()+",";
					} 
				}) 
				names= names.substring(0, names.length-1);
				var info="";
				if(status=='1')
					info="确认审核通过?";
				else
					info="确认审核不通过?";
				if(confirm(info)){
					document.getElementById('ids').value=names;
					document.getElementById('status').value=status;
					if($('#allAuditNotes').val()!=""){
						document.getElementById('auditRecord').value=$('#allAuditNotes').val();
					}
					form.action=url;
					form.submit();
				}
            } 
           	
           	     function remark(id,status,memberId){
            	document.getElementById('note').value="";
           		document.getElementById('id').value = id;
           		document.getElementById('status').value=status;
            	document.getElementById('memberId').value=memberId;
            	document.getElementById('type').value = "audit";
                document.getElementById('actiontype').value = "1";
           		document.getElementById('closed').style.display = "block";//显示
            }
            function cancel(){
            	document.getElementById('closed').style.display = "none";
            }
            function refuse(){//弹出框 确认调用的js
            	var type = document.getElementById('actiontype').value;
           		var form=document.getElementById('actSignup_form');
                var note = document.getElementById('note').value
           		document.getElementById('reMark').value = note;
           		if(type=="1"){
           		    document.getElementById('status').value="-1";
           			form.action="${base}/mb/act_signup!audit.action";
           		}else if(type=="2"){
           			form.action="${base}/mb/act_signup!sendMessage.action";
           		}
            	form.submit();
            }
            function writeNote(id){
            	document.getElementById('id').value = id;
            	document.getElementById('actiontype').value = "2";
            	document.getElementById('closed').style.display = "block";//显示
            }
	
		     function getOrg(obj){
	        		var orgIds = document.getElementById('orgIds').value;
	    			document.getElementById('org').options.length=1;
	    			document.getElementById('staff').options.length=1;
		       		document.getElementById('depart').options.length=1;
	        		OrgAjaxService.getOrgByTypeAndOrgIds(obj.value,orgIds,function(data){
	        			if(data!=null){
	        				 for(var i=0;i<data.length;i++){
	        				 	var op = new Option(data[i].name,data[i].id);
	        				 	document.getElementById('org').options[i+1] = op;
	        				 }
	        			}
	        		});
	        	 }
	        	function getDept(org){
	    	 		document.getElementById('staff').options.length=1;
		        	document.getElementById('depart').options.length=1;
			        OrgAjaxService.getAllDepart(org.value,function(data){
			           if(data!=""){
				          for(var i=0;i<data.length;i++){
					          var op = new Option(data[i].name,data[i].id);
					          document.getElementById('depart').options[i+1] = op;
			              }
				        }
			        });
			    }
			    function getStaff(department){
		    		var orgId=document.getElementById("org").value;
		    		document.getElementById('staff').options.length=1;
			        OrgAjaxService.getAllStaff(orgId,department.value,function(data){
			            if(data !=""){
				           for(var i=0;i<data.length;i++){
					          var ops = new Option(data[i].name,data[i].id);
					          document.getElementById('staff').options[i+1] = ops;
			               }
			             }
			        });
			    }
			    
			     function checkDate(a){
            	var st=$("#actSignup_startTime").val();
            	var et=$("#actSignup_endTime").val();     
            	if(a==1){
            		 if(et!=''){
            		 	if(st>et){
            		 		alert('起始日期不能大于结束日期，请重新选择!');
            		 		$("#actSignup_startTime").val('');
            		 		return false;
            		 	}
            		 }
            	}
            	if(a==2){
            		 if(st!=''){
            		 	if(et<st){
            		 		alert('结束日期不能小于起始日期，请重新选择!');
            		 		$("#actSignup_endTime").val('');    
            		 		return false;
            		 	}
            		 }
            	}
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="actSignup_form" name="actSignup_form">
        	<input type="hidden" name="actSignup.curPage" value="${actSignup.curPage}" />
            <input id="id" name="id" type="hidden">
            <input id="status" name="status" type="hidden">
            <input id="ids" name="ids" type="hidden">  
            <input id="type" name="type" type="hidden">
            <input id="auditRecord" name="actSignup.auditRecord" type="hidden">
            <input id="staffType" name="staffType" value="${staffType!}" type="hidden">
            <input name="orgIds" id="orgIds" type="hidden" value="${orgIds!}"/> 
            <input name="memberId" id="memberId" type="hidden"/>  
            <input name="reMark" id="reMark" type="hidden"/> 
            <input name="actiontype" id="actiontype" type="hidden"/>
        </form>
        
        <form  method="post" id="form1" name="form1">
        	<input id="actId" name="actId" type="hidden">
        	<input id="type_" name="type" type="hidden">
        </form>
        
     	<@u.search_bar action="${base}/mb/act_signup!auditList.action">
        <input type="hidden" id="curPage" name="actSignup.curPage" value="${actSignup.curPage}" />
        <input  name="staffType" value="${staffType!}" type="hidden">
        <table width="100%" border="0" cellspacing="0">
        	<#if staffType??&&staffType=="zg"||staffType=="zxszg">
        	<tr>
        		<td width="35%" COLSPAN="4" >
        			<span>机构类型：</span>
	        		<select id="orgType" name="orgType" ONCHANGE="getOrg(this)" >
	        		<option value="">---请选择---</option>
	        		<#if orgTypeList??>
	        			<#list orgTypeList as orgType>
	        				<option value="${orgType.code!}" <#if orgType??><#if orgType.toString()==orgType.code>selected</#if></#if>>${orgType.codeName!}</option>
	        			</#list>
	        		</#if>
	        		</select>
	        		<span>机构：</span>
	        		<select id="org" name="actSignup.member.staff.org.id" ONCHANGE="getDept(this)">
	        			<option value="">---请选择---</option>
	        			<#if orgList??>
	        				<#list orgList as org>
	        					<option value="${org.id!}" <#if (actSignup.member.staff.org.id)??><#if (actSignup.member.staff.org.id)==org.id>selected</#if></#if>>${org.name!}</option>
	        				</#list>
	        			</#if>
	        		</select>
	        		<span>部门：</span>
	        		<select id="depart" name="actSignup.member.staff.department.id" ONCHANGE="getStaff(this)">
	        			<option value="">---请选择---</option>
	        			<#if departmentList??>
	        				<#list departmentList as dept>
	        					<option value="${dept.id!}"<#if (actSignup.member.staff.department.id)??><#if (actSignup.member.staff.department.id)==dept.id>selected</#if></#if>>${dept.name!}</option>
	        				</#list>
	        			</#if>
	        		</select>
	        		<span>员工：</span>
	        		<select id="staff" name="actSignup.member.staff.id">
	        			<option value="">---请选择---</option>
	        			<#if staffList??>
	        				<#list staffList as staff>
	        					<option value="${staff.id!}"<#if (actSignup.member.staff.id)??><#if (actSignup.member.staff.id)==staff.id>selected</#if></#if>>${staff.name!}</option>
	        				</#list>
	        			</#if>
	        		</select>
        		</td>
        	</tr>
        	</#if>
        	<tr>
    	     	<td width="15%" align="right">用户名：</td>
    		 	<td width="35%" align="left"><input type="text" name="actSignup.member.userName" value="${(actSignup.member.userName)!}"></td>
    		 	<td width="15%" align="right">电话号码：</td>
    		 	<td width="35%" align="left"><input type="text" name="actSignup.member.tel" value="${(actSignup.member.tel)!}"></td>
        	 </tr>
        	 <tr>	  
        	 	<td width="15%" align="right">姓名：</td>
    		 	<td width="35%" align="left"><input type="text" name="actSignup.member.name" value="${(actSignup.member.name)!}"></td>
	     		<td width="15%" align="right">所在城市：</td>
		 	 	<td width="35%" align="left"><input type="text" name="actSignup.member.addCity" value="${(actSignup.member.addCity)!}"></td>
        	</tr>
        	<tr>
        		<td width="15%" align="right">减重意向：</td>
    	     	<td width="35%" align="left"><@s.select id="actSignup.member.jzyx" name="actSignup.member.jzyx" list="#request.jzyxList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(actSignup.member.jzyx)!}" theme="simple"/></td>	  
        		<td width="15%" align="right">审批状态：</td>
    	     	<td width="35%" align="left"><@s.select name="actSignup.auditStatus" list="#request.statusList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(actSignup.auditStatus)!}" theme="simple"/></td>	  	  	  	  
        	</tr>
        	<tr>
    	     	<#--<td width="15%" align="right">会员等级：</td>
    	     	<td width="35%" align="left"><@s.select name="detectionAudit.member.customerType" list="#request.typeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(detectionAudit.member.customerType)!}" theme="simple"/></td>
    	     	-->
        		<td width="15%" align="right">报名活动：</td>
    		 	<td width="35%" align="left"><input type="text" name="actSignup.act.subject" value="${(actSignup.act.subject)!}"></td>
        		<td></td><td></td>	
        	</tr>
        	<tr>
        	<td width="15%" class="txtRight">报名时间：</td>
                  <td width="35%" class="txtLeft">&nbsp;<input type="text"  id="actSignup_startTime" onchange="checkDate(1)" name="actSignup.startTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if actSignup.startTime??>value="${(actSignup.startTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text"  id="actSignup_endTime" onchange="checkDate(2)" name="actSignup.endTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if actSignup.endTime??>value="${(actSignup.endTime?string('yyyy-MM-dd'))!}"</#if>></td>
        		  <td></td><td></td>	
        	</tr>
        </table>
        </@u.search_bar>
        
        <#assign ntname="">
           <#if staffType=='yys'><#assign ntname="营养师" > </#if>
           <#if staffType=='zg'><#assign ntname="营养师主管" ></#if>
           <#if staffType=='zxs'><#assign ntname="咨询师" > </#if>
           <#if staffType=='zxszg'><#assign ntname="咨询师主管" ></#if>
        
        <@u.title_bar title="活动报名申请${ntname!}审批列表">
        <#-- 	<input type="button" class="btn_bg" onclick="show()" value="批量审核"> -->
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
            <#--	<th width="5%"><input type="checkbox" name="chk" id="chk" onclick="selectAll('chk','names');"></th> -->
              	<th width="8%">用户名</th>
                <th width="8%">电话号码</th>
        	  	<th width="7%">姓名</th>
        	  	<th width="7%">所在城市</th>
        	  	<th width="6%">减重意向</th>
        	  	<th width="7%">报名时间</th>
        	  	<th width="16%">报名活动</th>
        	  	<th width="6%">会员等级</th>
        	  	<#if staffType=='yys'||staffType=='zg'>
	            <th width="7%">营养师审核说明</th>
	            <th width="7%">营养师主管审核说明</th>
        	  	 </#if>
	           <#if staffType=='zxs'||staffType=='zxszg'>
	            <th width="7%">咨询师审核说明</th>
        	  	<th width="7%">咨询师主管审核说明</th>
        	  	</#if>
        	  	<th width="8%">审核状态</th>
             	<th width="16%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as actSignup>
        		<tr <#if actSignup.auditStatus??>
            		<#if actSignup.auditStatus=-1||actSignup.auditStatus=-2>style="background:#FF83FA"</#if>
            		<#if actSignup.auditStatus=5 ||actSignup.auditStatus=7>style="background:#BCEE68"</#if>
            		</#if>>  
        		<#--	<td><input type="checkbox" name="names" id="${actSignup.id!}" value="${actSignup.id!}" onclick="unSelectAll('chk','names')"></td> -->
        			<td>${(actSignup.member.userName)!'--未填写--'}</td>
        			<td>${(actSignup.member.tel)!'--未填写--'}</td>
        	    	<td>${(actSignup.member.name)!'--未填写--'}</td>
        	    	<td>${(actSignup.member.addCity)!'--未填写--'}</td>
        	    	<td><#if actSignup.member.jzyx??><@c.syscode syscodes=jzyxList code="${(actSignup.member.jzyx)!}"/><#else>--未填写--</#if></td>
	        	    <td>${((actSignup.createDate)?string('yyyy-MM-dd'))!'--未填写--'}</td>
	        	    <td><#if actSignup.act.subject??><a href="javascript:operate('${base}/zc/act_info!view.action','${(actSignup.act.id)!}','1','viewAct');">${(actSignup.act.subject)!}</a><#else>--未填写--</#if></td>
	        	    <td><#if actSignup.member.customerType??><@c.syscode syscodes=typeList code="${(actSignup.member.customerType)!}"/><#else>--未设置--</#if></td>
	        	    <td>${(actSignup.note)!}</td>
	        	    <td>${(actSignup.supNote)!}</td>
	        	    <td><#if actSignup.auditStatus??><@c.syscode syscodes=statusList code="${actSignup.auditStatus!}"/><#else>--未填写--</#if></td>
	                 <td>
                       	<#if staffType=='yys'>
                       		<#if actSignup.auditStatus??>
	                       		<#if (actSignup.auditStatus=1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (actSignup.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','1','audit');">审核通过</a> -->
	                       		</#if>
	                       		<#if actSignup.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','1','audit');">审核通过</a>
	                       			<a href="javascript:remark('${actSignup.id!}','-1','${(actSignup.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if actSignup.auditStatus=5>
	                       			<#if actSignup.note??>
	                       			<#if actSignup.note!="">
	                       			<#else>
	                       				<a href="javascript:writeNote('${actSignup.id}');">审核说明</a>
	                       			</#if>
                       			<#else>
                       				<a href="javascript:writeNote('${actSignup.id}');">审核说明</a>
                       			</#if>
	                       		</#if>
                       		</#if>
                       	</#if>
                       	<#if staffType=='zg'>
                       		<#if actSignup.auditStatus??>
	                       		<#if actSignup.auditStatus=1>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','5','audit');">审核通过</a>
	                       			<a href="javascript:remark('${actSignup.id!}','-1','${(actSignup.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (actSignup.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','5','audit');">审核通过</a> -->
	                       		</#if>
	                       		<#if actSignup.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','5','audit');">审核通过</a>
	                       			<a href="javascript:remark('${actSignup.id!}','-1','${(actSignup.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (actSignup.auditStatus=5)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
                       		</#if>
                       	</#if>
                      	<#if staffType=='zxs'>
                       		<#if actSignup.auditStatus??>
	                       		<#if (actSignup.auditStatus=6)>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','-1','audit');">审核不通过</a>
	                       		</#if>
	                       		<#if (actSignup.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','6','audit');">审核通过</a>-->
	                       		</#if>
	                       		<#if actSignup.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','6','audit');">审核通过</a>
	                       			<a href="javascript:remark('${actSignup.id!}','-1','${(actSignup.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a>-->
	                       		</#if>
	                       		<#if (actSignup.auditStatus=7)>
	                       		<#if actSignup.note??>
	                       			<#if actSignup.note!="">
	                       			<#else>
	                       				<a href="javascript:writeNote('${actSignup.id}');">审核说明</a>
	                       			</#if>
                       			<#else>
                       				<a href="javascript:writeNote('${actSignup.id}');">审核说明</a>
                       			</#if>
	                       		</#if>
                       		</#if>
                       	</#if>
                        <#if staffType=='zxszg'>
                       		<#if actSignup.auditStatus??>
	                       		<#if actSignup.auditStatus=6>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','7','audit');">审核通过</a>
	                       			<a href="javascript:remark('${actSignup.id!}','-1','${(actSignup.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a>-->
	                       		</#if>
	                       		<#if (actSignup.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','7','audit');">审核通过</a>-->
	                       		</#if>
	                       		<#if actSignup.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/act_signup!audit.action','${actSignup.id!}','7','audit');">审核通过</a>
	                       			<a href="javascript:remark('${actSignup.id!}','-1','${(actSignup.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (actSignup.auditStatus=7)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
                       		</#if>
                       	</#if>
                    </td>
                </tr>
            	</#list>
            <#else>
            	<tr>
            		<td colspan="11">暂无信息</td>
            	</tr>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
         <!-- 弹出的div start -->
	    <div class="listPot1" id="closed" onmousedown="Drag(this, event)" style="display:none">
	     	<div class="closed" onmouseover="this.className='closed_hover'" onmouseout="this.className='closed_visited'">
	     	<!--<a onclick = "document.getElementById('closed').style.display='none'" title="关闭">关闭</a>-->
	     	</div>
	     	<div class="listLine">
		     	<table>
			     	<tr>
			     		<td colspan="2">审核说明：</td>
			     	</tr>
		      		<tr>
		        		<td colspan="2"><textarea id="note" name="note" rows="5" cols="56"></textarea></td>
		      		</tr>
		      		<tr>
		        		<td colspan="2" id="noteTd">
		        			<input type="button" class="btn_bg" value="确认" onclick="refuse()"/>
	                    	<input type="button" class="btn_bg" value="取消" onclick="cancel();"/>
	                    </td>
		      		</tr>
		    	</table>
		  	</div>
		</div> 
		<!-- 弹出的div end -->
</html>