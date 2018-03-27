<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>内部满意度调查名单</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
 		<script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>  
        	function beginSurvey(mid,sid){
        		var url = "survey!surveyMeb.action?mid="+mid+"&id="+sid;
        		beginOpen(url);
        	}
        	
        	function intervence(id){
				var url = "member!getIntervence.action?id="+id+"&header=true";
				beginOpen(url);
			}
        	
		 	function show(id){
				var url = "member!newCustomerEdit.action?id="+id;
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
			
			jQuery(document).ready(function(){
    	      if($("#org_type").val()!=""){
					$("#org_type").change();
				}
           })
			
			function getOrg(type){
				var obj_org = document.getElementById('org_id');
				var obj_staff = document.getElementById('staff_id');
				var obj_depart = document.getElementById('depart_id');
				obj_org.options.length=1;
				obj_staff.options.length=1;
		        obj_depart.options.length=1;
				var oid='${(orgId)!}';
				OrgAjaxService.getAllOrgByType(type.value,function(data){
					if(data.length != 0){
						for(var i=0;i<data.length;i++){
							var ops = new Option(data[i].name,data[i].id);
							obj_org.options[i+1] = ops;
							if(oid!=null&&oid!=''&&oid==data[i].id){
								obj_org.options[i+1].selected=true;
								getDept(obj_org);
							}
						}
					}
				});
			}
			function getDept(org){
				var obj_staff = document.getElementById('staff_id');
				var obj_depart = document.getElementById('depart_id');
		    	obj_staff.options.length=1;
		        obj_depart.options.length=1;
		 		var oid = "${(survey.limitDeps)!}"
		        OrgAjaxService.getAllDepart(org.value,function(data){
		           if(data !=""){
			          for(var i=0;i<data.length;i++){
				          var ops = new Option(data[i].name,data[i].id);
				          obj_depart.options[i+1] = ops;
				          if(oid!=""&&oid==data[i].id){
				          	obj_depart.options[i+1].selected = true;
							getStaff(obj_depart);
				          }
		              }
		           }
		        });
		    }
			
			function getStaff(dept){
		    	var obj_org = document.getElementById("org_id");
		    	var obj_staff = document.getElementById('staff_id');
			    obj_staff.options.length=1;
				var sid = "${(survey.member.staff.id)!}";
		        OrgAjaxService.getAllStaff(obj_org.value,dept.value,function(data){
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
		    
		    function sure(obj){
		    	if(!$(obj).attr("checked")){
		    		$("input:radio[name='del_all']").removeAttr("checked");
		    	}
		    }
		    
		    function check_part(obj){
		    	if($(obj).attr("checked")){
		    		$("#ck_all_val").val("0");
		    		$("#ck_all").removeAttr("checked");
		    		$("input:checkbox[name='checks']").each(function(){
		    			$(this).attr("checked","true");
		    		});
		    	}
		    }
		    
		    function check_all(obj){
		    	if($(obj).attr("checked")){
		    		$("#ck_all_val").val("1");
		    		$("#ck_part").removeAttr("checked");
		    		$("input:checkbox[name='checks']").removeAttr("checked");
		    	}else{
		    		$("#ck_all_val").val("0");
		    	}
		    }
		    
		    function del(obj){
		    	if($("#ck_all").attr("checked")){
		    		if(confirm("确定：根据查询条件删除所有")){
	    				$(obj).attr("disabled","disabled")
	    				$("#msg").html("删除中，请稍后...");
	    				$("#search_form").attr("action","survey!delSurvey.action");
	    				$("#search_form").submit();
	    			}
		    	}else if($("#ck_part").attr("checked")){
		    		if(confirm("确定：删除当前页所有")){
	    				$(obj).attr("disabled","disabled")
	    				$("#msg").html("删除中，请稍后...");
	    				$("#form").submit();
	    			}
		    	}else{
		    		var check=false;
		    		$("input:checkbox[name='checks']").each(function(){
		    			if($(this).attr("checked")){
		    				check=true;
		    			}
		    		});
		    		if(check){
		    			if(confirm("确定：删除所选")){
			    			$(obj).attr("disabled","disabled")
		    				$("#msg").html("删除中，请稍后...");
		    				$("#form").submit();
		    			}
		    		}else{
		    			alert("请选择删除项");
		    		}
		    	}
		    }
        </script>
    </head>
    <body class="mainbody">
    	<div class="fastNav">工作平台 > 营养师主管工作平台 > 内部满意度调查名单</div>
        <form id="survey_form" method="post">
            <input id="id" name="id" type="hidden">     
        </form>
        
     	<@u.search_bar action="survey!surveyMebList.action">
     	<input type="hidden" id="ck_all_val" name="ck_all_val" value="0" />
        <input type="hidden" id="curPage" name="survey.curPage" value="${survey.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        		<td colspan="4">
        		   机构类型：<@s.select id="org_type" name="member.org.type" value="member.org.type" list="orgTypeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple" onchange="getOrg(this)"/>
	        	   机构名称：<@s.select id="org_id" name="survey.limitOrgs" value="survey.limitOrgs" list="" listKey="" listValue="" headerKey="" headerValue="--请选择--" theme="simple" onchange="getDept(this)"/>
	                                    部门：
	              <select id="depart_id" name="survey.limitDeps" onchange="getStaff(this)">
				  	<option value="">---请选择---</option>
				  </select>                       
			                营养师： 
			      <select id="staff_id" name="survey.member.staff.id">
				  	<option value="">---请选择---</option>
				  </select>
				</td>
        	</tr>
        	<tr>
        	   <td>调查阶段：</td>
        	   <td><@s.select headerKey="" headerValue="---请选择---" id="survey_phase" name="survey.phase" list="syscodeList" listKey="code" listValue="codeName" theme="simple" /></td>
        	   <td>天数：</td><td><input type="text" name="survey.member.day" size="2" value="${(survey.member.day)!}"/>天</td>
        	</tr>
        </table>
        </@u.search_bar>
        <@u.title_bar title="满意度名单列表">
        	<font id="msg" class="font_red"></font>
        	<input type="checkbox" id="ck_all" value="1" onclick="check_all(this)">根据查询条件全选所有
        	<input type="checkbox" id="ck_part" value="1" onclick="check_part(this)">当前页全选
        	<input type="button" id="btn" class="btn_bg" value="删除" onclick="del(this)"/>
        </@u.title_bar>
        <div class="listLine">
        <form id="form" name="form" action="survey!delSurvey.action" method="post">
        <table width="100%" border="0" cellspacing="0">
            <tr>
        		<th>选择</th>
        	  	<th>客户姓名</th>
        	  	<th>手机</th>
        	  	<th>所属机构</th>
        	  	<th>所处阶段(天数/总天数)</th>
        	  	<th>服务类型</th>
        	 	<th>营养师</th>
        	  	<th>调查阶段</th>
              	<th>满意度调查</th>
            </tr>
            <#if (page.dataList)??>
        	<#list page.dataList as survey>
        	<tr>
        		<td><input type="checkbox" name="checks" value="${survey.id!}" onclick="sure(this)"/></td>
        	    <td><a href="javascript:show('${(survey.member.id)!}')">${(survey.member.name)!}</a></td>
        	    <td>${(survey.member.tel)!}</td>
        	    <td>${(survey.member.org.name)!}</td>
        	    <td><a href="javascript:intervence('${(survey.member.id)!}')"><@c.syscode syscodes=syscodeList code="${(survey.member.phase)!}" />(${(survey.member.day)!}/${(survey.member.allDay)!})</a></td>
        	    <td>${(survey.member.serviceName)!}</td>
        	    <td>${(survey.member.staff.name)!}</td>
        	    <td><@c.syscode syscodes=syscodeList code="${(survey.phase)!}" /></td>
        	    <td><a href="javascript:" onclick="beginSurvey('${(survey.member.id)!}','${(survey.id)!}');">点此调查</a></td>
            </tr>
            </#list>
            <#else>
            <tr><td colspan="9">暂无信息</td></tr>
            </#if>
        </table>
        </div>  
        </form>
        <@u.paginate page=page/>
     </body>
</html>