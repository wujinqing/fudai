<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>各阶段客户统计表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/interface/StaffAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('eachStage_form');
                form.action = "each_stage!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('eachStage_form');
                    form.action = "each_stage!delete.action";
                    form.submit();
                }
            }
            
            jQuery(document).ready(function(){
            	if($("#org_type").val()!=''){
					$("#org_type").change();
				}
            })
            
			function getdate(){   
			  var now=new Date();
			  y=now.getFullYear();
			  m=now.getMonth()+1;
			  d=now.getDate();
			  m=m<10?"0"+m:m;
			  d=d<10?"0"+d:d;
			  return y+"-"+m+"-"+d;
			}
            
            function checkDate(n){
            	var myDate = getdate();
        		var startDate=$("#eachStage_startDate").val();
	    	    var endDate=$("#eachStage_endDate").val();
	    	    var m,newDate,newMonth,newYear;
            	if(n==1){
            		if(startDate>endDate){
            			newMonth=parseInt(startDate.split("-")[1]);
            			newYear=parseInt(startDate.split("-")[0]);
            			if(newMonth<10){
			    	    	m="0"+(newMonth+1);
			    	    }else if(newMonth==12){
							m="01";		   
							newYear+=1; 	    
			    	    }else{
			    	    	m=newMonth;
			    	    }
			    	    newDate=newYear+"-"+m+"-01";
            			$("#eachStage_endDate").val(newDate);
            		}
            		if(myDate<startDate){
            			$("#eachStage_startDate").val(myDate.split("-")[0]+"-"+myDate.split("-")[1]+"-01");
            		}
            		
            		if(startDate<"2006-01-01"){
            			$("#eachStage_startDate").val("2006-01-01");
            		}
            	}
            	
            	if(n==2){
            		if(startDate>endDate){
            		 	newMonth=parseInt(endDate.split("-")[1]);
            		 	newYear=parseInt(endDate.split("-")[0]);
            			if(newMonth<11){
			    	    	m="0"+(newMonth-1);
			    	    }else if(newMonth==1){
			    	    	m="12";
			    	    	newYear-=1;
			    	    }else{
			    	    	m=newMonth;
			    	    }
			    	   newDate=newYear+"-"+m+"-01";
            		   $("#eachStage_startDate").val(newDate);
            		}
            		if(myDate<endDate){
            			$("#eachStage_endDate").val(myDate);
            		}
            	}
            }
            
               function getOrg(type){
				document.getElementById('orgId').options.length=0;
				var options = new Option("----所有----","");
				document.getElementById('orgId').options[0]=options;
				OrgAjaxService.getAllOrgByType(type,function(data){
					if(data.length != 0){
						for(var i=0;i<data.length;i++){
							options = new Option(data[i].name,data[i].id);
							document.getElementById('orgId').options[i+1]=options;
							var oid='${(org_p.id)!}';
							if(oid!=null&&oid!=''&&oid==data[i].id){
								document.getElementById('orgId').options[i+1].selected=true;
								getStaffByOrg(data[i].id);
							}
						}
					}
				});
			}
			
			
			function getStaffByOrg(org){
				document.getElementById('staff').options.length=0;
			    var op = new Option("---所有---","");
			    document.getElementById('staff').options[0] = op;
		        StaffAjaxService.getStaffList(org,function(data){
		            if(data !=""){
		           	  var x=0;
				          for(var i=0;i<data.length;i++){
					          var ops = new Option(data[i].name,data[i].id);
					          document.getElementById('staff').options[x+1] = ops;
					          var st='${(staff.id)!}';
					          if(null!=st&&st!=''&&st==data[i].id){
					          	 document.getElementById('staff').options[x+1].selected=true;
					          }
					          x++;
			              }
		              }
		        });
			}
			
            
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="eachStage_form" name="eachStage_form">
            <input id="id" name="id" type="hidden">     
        </form>
        
     	<@u.search_bar action="each_stage!getStateMemberDetailList.action">
        <input type="hidden" id="curPage" name="eachStage.curPage" value="${eachStage.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        		<td>机构：</td>
        	    <td>
	        	   	 类型
					<@s.select id="org_type" 
					  name="org_p.type" 
					  list="orgTypeList" 
					  listKey="code"
					  listValue="codeName" 
					  headerKey=""   onchange="getOrg(this.value)" 
					  headerValue="---所有---"
					  value="org_p.type" theme="simple"/>	
					名称
					<select id="orgId" onchange="getStaffByOrg(this.value)" name="org_p.id">
					<option value="">---所有---</option>
					</select>
        	    </td>
        	     <td>营养师：</td>
	             <td>
                      <select id="staff"  name="staff.id" >
	        		  	<option value="">---所有---</option>
	        		  </select>
                       
	              </td>
	               <td>客户：</td>
	             <td>
                        	<input type="text" name="member.name" value="${(member.name)!}" />
	              </td>
	               <td>手机：</td>
	             <td>
                        	<input type="text" name="member.tel" value="${(member.tel)!}" />
	              </td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="未启动阶段客户统计表"></@u.title_bar>
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th>序号</th>
	        	  <th>姓名</th>
	        	  <th>性别</th>
	        	  <th>手机</th>
	        	  <th>机构</th>
	        	  <th>营养师</th>
	        	  <th>所处阶段（天数/总天数）</th>
	        	  <th>短信</th>
            </tr>
            <#if (uxd_list??&&uxd_list?size>0)>
            	<#list uxd_list as member>
            	<tr>
	        	    <td>${member_index+1}</td>
	        	    <td>${member.name!}</td>
	        	    <td>
	        	    	<#if (member??&&member.sex??&&member.sex=='0')>男</#if>
	        	    	<#if (member??&&member.sex??&&member.sex=='1')>女</#if>
	        	    </td>
	        	    <td>${member.tel!}</td>
	        	    <td>${(member.staff.org.name)!}</td>
	        	    <td>${member.staff.name!}</td>
	        	    <td>
	        	    	<#if phaseList??><@c.syscode syscodes=phaseList code="${(member.phase)!}"/></#if>
	        	     	<#if ((member.phaseStartDate)?? && (member.startDate)??)>
					       ${member.getDay(member.phaseStartDate)}/
					       ${member.getDay(member.startDate)}
				       </#if>
	        	    </td>
	        	    <td>
	        	    	<#if (member??&&member.isSms??&&member.isSms==0)>关</#if>
	        	    	<#if (member??&&member.isSms??&&member.isSms==1)>开</#if>
	        	    </td>
                </tr>
            	</#list>
            	<#else>
            	<tr>
	        	    <td colspan="8">暂时没有相关数据！</td></tr>
            </#if>
        </table>
        </div>     
        
        <@u.title_bar title="启动阶段客户统计表"></@u.title_bar>
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th>序号</th>
	        	  <th>姓名</th>
	        	  <th>性别</th>
	        	  <th>手机</th>
	        	  <th>机构</th>
	        	  <th>营养师</th>
	        	  <th>所处阶段（天数/总天数）</th>
	        	  <th>短信</th>
            </tr>
            <#if (xd_list??&&xd_list?size>0)>
            	<#list xd_list as member>
            	<tr>
	        	    <td>${member_index+1}</td>
	        	    <td>${member.name!}</td>
	        	    <td>
	        	    	<#if (member??&&member.sex??&&member.sex=='0')>男</#if>
	        	    	<#if (member??&&member.sex??&&member.sex=='1')>女</#if>
	        	    </td>
	        	    <td>${member.tel!}</td>
	        	    <td>${(member.staff.org.name)!}</td>
	        	    <td>${member.staff.name!}</td>
	        	    <td>
	        	    	<#if phaseList??><@c.syscode syscodes=phaseList code="${(member.phase)!}"/></#if>
	        	     	<#if ((member.phaseStartDate)?? && (member.startDate)??)>
					       ${member.getDay(member.phaseStartDate)}/
					       ${member.getDay(member.startDate)}
				       </#if>
	        	    </td>
	        	    <td>
	        	    	<#if (member??&&member.isSms??&&member.isSms==0)>关</#if>
	        	    	<#if (member??&&member.isSms??&&member.isSms==1)>开</#if>
	        	    </td>
                </tr>
            	</#list>
            	<#else>
            	<tr>
	        	    <td colspan="8">暂时没有相关数据！</td></tr>
            </#if>
        </table>
        </div>     
        
        <@u.title_bar title="减重动阶段客户统计表"></@u.title_bar>
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th>序号</th>
	        	  <th>姓名</th>
	        	  <th>性别</th>
	        	  <th>手机</th>
	        	  <th>机构</th>
	        	  <th>营养师</th>
	        	  <th>所处阶段（天数/总天数）</th>
	        	  <th>短信</th>
            </tr>
            <#if (jz_list??&&jz_list?size>0)>
            	<#list jz_list as member>
            	<tr>
	        	    <td>${member_index+1}</td>
	        	    <td>${member.name!}</td>
	        	    <td>
	        	    	<#if (member??&&member.sex??&&member.sex=='0')>男</#if>
	        	    	<#if (member??&&member.sex??&&member.sex=='1')>女</#if>
	        	    </td>
	        	    <td>${member.tel!}</td>
	        	    <td>${(member.staff.org.name)!}</td>
	        	    <td>${member.staff.name!}</td>
	        	    <td>
	        	    	<#if phaseList??><@c.syscode syscodes=phaseList code="${(member.phase)!}"/></#if>
	        	     	<#if ((member.phaseStartDate)?? && (member.startDate)??)>
					       ${member.getDay(member.phaseStartDate)}/
					       ${member.getDay(member.startDate)}
				       </#if>
	        	    </td>
	        	    <td>
	        	    	<#if (member??&&member.isSms??&&member.isSms==0)>关</#if>
	        	    	<#if (member??&&member.isSms??&&member.isSms==1)>开</#if>
	        	    </td>
                </tr>
            	</#list>
            	<#else>
            	<tr>
	        	    <td colspan="8">暂时没有相关数据！</td></tr>
            </#if>
        </table>
        </div>     
        
        <@u.title_bar title="维持阶段客户统计表"></@u.title_bar>
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th>序号</th>
	        	  <th>姓名</th>
	        	  <th>性别</th>
	        	  <th>手机</th>
	        	  <th>机构</th>
	        	  <th>营养师</th>
	        	  <th>所处阶段（天数/总天数）</th>
	        	  <th>短信</th>
            </tr>
            <#if (wc_list??&&wc_list?size>0)>
            	<#list wc_list as member>
            	<tr>
	        	    <td>${member_index+1}</td>
	        	    <td>${member.name!}</td>
	        	    <td>
	        	    	<#if (member??&&member.sex??&&member.sex=='0')>男</#if>
	        	    	<#if (member??&&member.sex??&&member.sex=='1')>女</#if>
	        	    </td>
	        	    <td>${member.tel!}</td>
	        	    <td>${(member.staff.org.name)!}</td>
	        	    <td>${member.staff.name!}</td>
	        	    <td>
	        	    	<#if phaseList??><@c.syscode syscodes=phaseList code="${(member.phase)!}"/></#if>
	        	     	<#if ((member.phaseStartDate)?? && (member.startDate)??)>
					       ${member.getDay(member.phaseStartDate)}/
					       ${member.getDay(member.startDate)}
				       </#if>
	        	    </td>
	        	    <td>
	        	    	<#if (member??&&member.isSms??&&member.isSms==0)>关</#if>
	        	    	<#if (member??&&member.isSms??&&member.isSms==1)>开</#if>
	        	    </td>
                </tr>
            	</#list>
            	<#else>
            	<tr>
	        	    <td colspan="8">暂时没有相关数据！</td></tr>
            </#if>
        </table>
        </div>     
          <@u.title_bar title="暂停阶段客户统计表"></@u.title_bar>
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th>序号</th>
	        	  <th>姓名</th>
	        	  <th>性别</th>
	        	  <th>手机</th>
	        	  <th>机构</th>
	        	  <th>营养师</th>
	        	  <th>所处阶段（天数/总天数）</th>
	        	  <th>短信</th>
            </tr>
            <#if (zt_list??&&zt_list?size>0)>
            	<#list zt_list as member>
            	<tr>
	        	    <td>${member_index+1}</td>
	        	    <td>${member.name!}</td>
	        	    <td>
	        	    	<#if (member??&&member.sex??&&member.sex=='0')>男</#if>
	        	    	<#if (member??&&member.sex??&&member.sex=='1')>女</#if>
	        	    </td>
	        	    <td>${member.tel!}</td>
	        	    <td>${(member.staff.org.name)!}</td>
	        	    <td>${member.staff.name!}</td>
	        	    <td>
	        	    	<#if phaseList??><@c.syscode syscodes=phaseList code="${(member.phase)!}"/></#if>
	        	     	<#if ((member.phaseStartDate)?? && (member.startDate)??)>
					       ${member.getDay(member.phaseStartDate)}/
					       ${member.getDay(member.startDate)}
				       </#if>
	        	    </td>
	        	    <td>
	        	    	<#if (member??&&member.isSms??&&member.isSms==0)>关</#if>
	        	    	<#if (member??&&member.isSms??&&member.isSms==1)>开</#if>
	        	    </td>
                </tr>
            	</#list>
            	<#else>
            	<tr>
	        	    <td colspan="8">暂时没有相关数据！</td></tr>
            </#if>
        </table>
        </div>     
</html>