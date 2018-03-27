<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.js src="drag.js"/>  
        <@u.rootjs src="jquery-1.4.2.min.js"/>
         <@u.rootjs src="jquery.validate.js"/>
		<@u.rootjs src="jquery.validate.message_cn.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
		<script type='text/javascript' src='${base}/dwr/interface/StaffAjaxService.js'></script>
		<script type='text/javascript' src='${base}/dwr/engine.js'></script>
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
       			var form=document.getElementById('detectionAudit_form');
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
           		var form=document.getElementById('detectionAudit_form');
                var note = document.getElementById('note').value
           		document.getElementById('reMark').value = note;
           		if(type=="1"){
           		    document.getElementById('status').value="-1";
           			form.action="${base}/mb/detection_audit!audit.action";
           		}else if(type=="2"){
           			form.action="${base}/mb/detection_audit!sendMessage.action";
           		}
            	form.submit();
            }
            function writeNote(id,mid){
            	document.getElementById('id').value = id;
            	document.getElementById('memberId').value = mid;
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
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="detectionAudit_form" name="detectionAudit_form">
          	<input type="hidden" name="detectionAudit.curPage" value="${detectionAudit.curPage}" />
            <input id="id" name="id" type="hidden">
            <input id="status" name="status" type="hidden">
            <input id="ids" name="ids" type="hidden">  
            <input id="type" name="type" type="hidden">
            <input id="auditRecord" name="detectionAudit.auditRecord" type="hidden">    
            <input id="staffType" name="staffType" value="${staffType!}" type="hidden">
            <input name="orgIds" id="orgIds" type="hidden" value="${orgIds!}"/> 
            <input name="memberId" id="memberId" type="hidden"/>  
            <input name="reMark" id="reMark" type="hidden"/> 
            <input name="actiontype" id="actiontype" type="hidden"/> 
        </form>
        
     	<@u.search_bar action="${base}/mb/detection_audit!auditList.action">
        <input type="hidden" id="curPage" name="detectionAudit.curPage" value="${detectionAudit.curPage}" />
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
	        		<select id="org" name="detectionAudit.member.staff.org.id" ONCHANGE="getDept(this)">
	        			<option value="">---请选择---</option>
	        			<#if orgList??>
	        				<#list orgList as org>
	        					<option value="${org.id!}" <#if (detectionAudit.member.staff.org.id)??><#if (detectionAudit.member.staff.org.id)==org.id>selected</#if></#if>>${org.name!}</option>
	        				</#list>
	        			</#if>
	        		</select>
	        		<span>部门：</span>
	        		<select id="depart" name="detectionAudit.member.staff.department.id" ONCHANGE="getStaff(this)">
	        			<option value="">---请选择---</option>
	        			<#if departmentList??>
	        				<#list departmentList as dept>
	        					<option value="${dept.id!}"<#if (detectionAudit.member.staff.department.id)??><#if (detectionAudit.member.staff.department.id)==dept.id>selected</#if></#if>>${dept.name!}</option>
	        				</#list>
	        			</#if>
	        		</select>
	        		<span>员工：</span>
	        		<select id="staff" name="detectionAudit.member.staff.id">
	        			<option value="">---请选择---</option>
	        			<#if staffList??>
	        				<#list staffList as staff>
	        					<option value="${staff.id!}"<#if (detectionAudit.member.staff.id)??><#if (detectionAudit.member.staff.id)==staff.id>selected</#if></#if>>${staff.name!}</option>
	        				</#list>
	        			</#if>
	        		</select>
        		</td>
        	</tr>
        	</#if>
        	<tr>
    	     	<td width="15%" align="right">用户名：</td>
    		 	<td width="35%" align="left"><input type="text" name="detectionAudit.member.userName" value="${(detectionAudit.member.userName)!}"></td>
    		 	<td width="15%" align="right">电话号码：</td>
    		 	<td width="35%" align="left"><input type="text" name="detectionAudit.member.tel" value="${(detectionAudit.member.tel)!}"></td>
        	 </tr>
        	 <tr>	  
        	 	<td width="15%" align="right">姓名：</td>
    		 	<td width="35%" align="left"><input type="text" name="detectionAudit.member.name" value="${(detectionAudit.member.name)!}"></td>
	     		<td width="15%" align="right">所在城市：</td>
		 	 	<td width="35%" align="left"><input type="text" name="detectionAudit.member.addCity" value="${(detectionAudit.member.addCity)!}"></td>
        	</tr>
        <#--	<tr>
        <td width="15%" align="right">会员状态：</td>
    	     	<td width="35%" align="left"><@s.select name="detectionAudit.member.enabled" list="#request.enabledList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(detectionAudit.member.enabled)!}" theme="simple"/></td>
        		<td width="15%" align="right">减重意向：</td>
    	     	<td width="35%" align="left"><@s.select name="detectionAudit.member.jzyx" list="#request.jzyxList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(detectionAudit.member.jzyx)!}" theme="simple"/></td>	  
        		
        	</tr>-->
        	<tr>
    	     	<#--<td width="15%" align="right">会员等级：</td>
    	     	<td width="35%" align="left"><@s.select name="detectionAudit.member.customerType" list="#request.typeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(detectionAudit.member.customerType)!}" theme="simple"/></td>
    	     	-->
    	     	<td width="15%" align="right">审批状态：</td>
    	     	<td width="35%" align="left"><@s.select name="detectionAudit.auditStatus" list="#request.statusList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" value="${(detectionAudit.auditStatus)!}" theme="simple"/></td>	  	  	  	  
        	</tr>
        </table>
        </@u.search_bar>
     
        <#assign ntname="">
           <#if staffType=='yys'><#assign ntname="营养师" > </#if>
           <#if staffType=='zg'><#assign ntname="营养师主管" ></#if>
           <#if staffType=='zxs'><#assign ntname="咨询师" > </#if>
           <#if staffType=='zxszg'><#assign ntname="咨询师主管" ></#if>
        
        <@u.title_bar title="营养检测${ntname!}审批列表">
        	<#-- <input type="button" class="btn_bg" onclick="show()" value="批量审核"> -->
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
            	<th width="5%"><input type="checkbox" name="chk" id="chk" onclick="selectAll('chk','names');"></th>
              	<th width="8%">用户名</th>
                <th width="8%">电话号码</th>
        	  	<th width="8%">姓名</th>
        	  	<th width="8%">所在城市</th>
        	  	<th width="10%">减重目标</th>
        	  	<th width="7%">报名时间</th>
        	  	<th width="7%">会员等级</th>
	           <#if staffType=='yys'||staffType=='zg'>
	            <th width="7%">营养师发送消息</th>
	            <th width="7%">营养师主管发送消息</th>
        	  	 </#if>
	           <#if staffType=='zxs'||staffType=='zxszg'>
	            <th width="7%">咨询师发送消息</th>
        	  	<th width="7%">咨询师主管发送消息</th>
        	  	</#if>
        	  	<th width="8%">审核状态</th>
             	<th width="16%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as detectionAudit>
        		<tr <#if detectionAudit.auditStatus??>
            		<#if detectionAudit.auditStatus=-1||detectionAudit.auditStatus=-2>style="background:#FF83FA"</#if>
            		<#if detectionAudit.auditStatus=5 ||detectionAudit.auditStatus=7>style="background:#BCEE68"</#if>
            		</#if>>  
        			<td><input type="checkbox" name="names" id="${detectionAudit.id!}" value="${detectionAudit.id!}" onclick="unSelectAll('chk','names')"></td>
        			<td><a href="${base}/mb/detection_audit!deteDetail.action?id=${detectionAudit.id!}">${(detectionAudit.member.userName)!'--未填写--'}</a></td>
        			<td>${(detectionAudit.member.tel)!'--未填写--'}</td>
        	    	<td>${(detectionAudit.member.name)!'--未填写--'}</td>
        	    	<td>${(detectionAudit.member.addCity)!'--未填写--'}</td>
        	    	<td>${(detectionAudit.jzmb)!'--未填写--'}</td>
	        	    <td>${((detectionAudit.createDate)?string('yyyy-MM-dd'))!'--未填写--'}</td>
	        	    <td><#if detectionAudit.member.customerType??><@c.syscode syscodes=typeList code="${(detectionAudit.member.customerType)!}"/><#else>--未设置--</#if></td>
	        	    <td>${(detectionAudit.note)!}</td>
	        	    <td>${(detectionAudit.supNote)!}</td>
	        	    <td><#if detectionAudit.auditStatus??><@c.syscode syscodes=statusList code="${detectionAudit.auditStatus!}"/><#else>--未填写--</#if></td>
	                 <td>
                       	<#if staffType=='yys'>
                       		<#if detectionAudit.auditStatus??>
	                       		<#if (detectionAudit.auditStatus=1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','1','audit');">审核通过</a> -->
	                       		</#if>
	                       		<#if detectionAudit.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','1','audit');">审核通过</a>
	                       			<a href="javascript:remark('${detectionAudit.id!}','-1','${(detectionAudit.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if detectionAudit.auditStatus=5>
	                       		    <#if detectionAudit.note??&&detectionAudit.note!=''>
	                       		    <#else>
	                       			<a href="javascript:writeNote('${detectionAudit.id}','${(detectionAudit.member.id)!}');">发消息给客户</a>
	                       			</#if>
	                       		</#if>
                       		</#if>
                       	</#if>
                       	<#if staffType=='zg'>
                       		<#if detectionAudit.auditStatus??>
	                       		<#if detectionAudit.auditStatus=1>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','5','audit');">审核通过</a>
	                       			<a href="javascript:remark('${detectionAudit.id!}','-1','${(detectionAudit.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','5','audit');">审核通过</a> -->
	                       		</#if>
	                       		<#if detectionAudit.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','5','audit');">审核通过</a>
	                       			<a href="javascript:remark('${detectionAudit.id!}','-1','${(detectionAudit.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=5)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
                       		</#if>
                       	</#if>
                       	  	
                      	<#if staffType=='zxs'>
                       		<#if detectionAudit.auditStatus??>
	                       		<#if (detectionAudit.auditStatus=6)>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a>
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','6','audit');">审核通过</a>-->
	                       		</#if>
	                       		<#if detectionAudit.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','6','audit');">审核通过</a>
	                       			<a href="javascript:remark('${detectionAudit.id!}','-1','${(detectionAudit.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a>-->
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=7)>
	                       			  <#if detectionAudit.note??&&detectionAudit.note!=''>
	                       		      <#else> 
	                       			  <a href="javascript:writeNote('${detectionAudit.id}','${(detectionAudit.member.id)!}');">发消息给客户</a>
	                       			  </#if>
	                       		</#if>
                       		</#if>
                       	</#if>
                       	  	
                      <#if staffType=='zxszg'>
                       		<#if detectionAudit.auditStatus??>
	                       		<#if detectionAudit.auditStatus=6>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','7','audit');">审核通过</a>
	                       			<a href="javascript:remark('${detectionAudit.id!}','-1','${(detectionAudit.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a>-->
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=-1)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','7','audit');">审核通过</a>-->
	                       		</#if>
	                       		<#if detectionAudit.auditStatus=0>
	                       			<a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','7','audit');">审核通过</a>
	                       			<a href="javascript:remark('${detectionAudit.id!}','-1','${(detectionAudit.member.id)}');">审核不通过</a>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
	                       		<#if (detectionAudit.auditStatus=7)>
	                       			<#-- <a href="javascript:operate('${base}/mb/detection_audit!audit.action','${detectionAudit.id!}','-1','audit');">审核不通过</a> -->
	                       		</#if>
                       		</#if>
                       	</#if>
                    </td>
                </tr>
            	</#list>
            <#else>
            	<tr>
            		<td colspan="12">暂无信息</td>
            	</tr>
            </#if>
        </table>
        <#--  批量操作  弹出的div start 
	    <div class="listPot" id="closed" onmousedown="Drag(this, event)" style="display:none">
	     	<div class="closed" onmouseover="this.className='closed_hover'" onmouseout="this.className='closed_visited'">
	     	<a onclick = "document.getElementById('closed').style.display='none'" title="关闭">关闭</a>
	     	</div>
	     	<div class="listLine">
		     	<table>
			     	<tr>
			     		<td colspan="2">审核说明：</td>
			     	</tr>
		      		<tr>
		        		<td colspan="2"><textarea id="allAuditNotes" rows="5" cols="56" value="${detectionAudit.auditRecord!}" ></textarea></td>
		      		</tr>
		      		<tr>
		        		<td colspan="2">
		        			<#if staffType=='yys'>
		        				<input type="button" class="btn_bg" value="审核通过" onclick="operate('${base}/mb/detection_audit!audit.action','','1','auditAll')"/>
		        			</#if>
	        			 	<#if staffType=='zg'>
	        			 		<input type="button" class="btn_bg" value="审核通过" onclick="operate('${base}/mb/detection_audit!audit.action','','5','auditAll')"/>
	        			 	</#if>
	                    	<input type="button" class="btn_bg" value="审核不通过" onclick="operate('${base}/mb/detection_audit!audit.action','','-1','auditAll')"/>
	                    </td>
		      		</tr>
		    	</table>
		  	</div>
		</div> 
		弹出的div end -->  
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
			     		<td colspan="2">发消息给客户：</td>
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