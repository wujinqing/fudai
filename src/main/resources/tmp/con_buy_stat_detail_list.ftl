<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>员工业绩统计</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/interface/WorkGroupAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/interface/StaffAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>    
          function change(obj){
	    	 if(obj.value!=""){
	        	 var data = obj.value.split("-");
	        	 var content = data[0]+"-"+data[1];
	        	 obj.value=content;
	    	 }
	      }
        	    
          jQuery(document).ready(function(){
          	 var v_type = $("#org_type").val();
    	      if(v_type!=''){
					getOrg(v_type,0)
				}
           })
            
      function getOrg(type,num){
      	var obj_staff = document.getElementById('staff');
		var obj_group = document.getElementById('group');
	    var obj_depart = document.getElementById('depart');
	    var obj_org = document.getElementById('orgId');
		obj_org.options.length=1;
		obj_depart.options.length=1;
    	obj_staff.options.length=1;
    	obj_group.options.length=1;
		var oid="";
		if(num == 0) oid = "${orgId!}";
		OrgAjaxService.getAllOrgByType(type,function(data){
			if(data.length != 0){
				for(var i=0;i<data.length;i++){
					options = new Option(data[i].name,data[i].id);
					obj_org.options[i+1]=options;
					if(oid!=''&&oid==data[i].id){
						obj_org.options[i+1].selected=true;
						getDept(data[i].id,num);
					}
				}
			}
		});
	  }
			
	  function getDept(org,num){
	    var obj_staff = document.getElementById('staff');
		var obj_group = document.getElementById('group');
	    var obj_depart = document.getElementById('depart');
        obj_depart.options.length=1;
    	obj_staff.options.length=1;
    	obj_group.options.length=1;
    	var did="";
    	if(num == 0) did="${(conBuyStat.limitDeps)!}";
        OrgAjaxService.getAllDepart(org,function(data){
           if(data!=""){
	          for(var i=0;i<data.length;i++){
	        	  var op = new Option(data[i].name,data[i].id);
	        	  obj_depart.options[i+1] = op;
				  if(did!=""&&did==data[i].id){
					 obj_depart.options[i+1].selected=true;
					 getGroup(did,num);
				  }
              }
           }
        });
      }
      
      function getGroup(v_depart,num){
    	var v_org = $("#orgId").val();
    	var obj_staff = document.getElementById('staff');
		var obj_group = document.getElementById('group');
    	obj_staff.options.length=1;
    	obj_group.options.length=1;
    	var gid="";
    	if(num == 0) gid = "${(conBuyStat.limitGroups)!}";
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
	    var v_org = $("#orgId").val();
	    var v_dept = $("#depart").val();
	    var sid="";
	    if(num == 0) sid="${(conBuyStat.staff.id)!}";
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
	        OrgAjaxService.getAllStaff(v_org,v_dept,function(data){
	            if(data!=""){
		          for(var i=0;i<data.length;i++){
			          var ops = new Option(data[i].name,data[i].id);
			          obj_staff.options[i+1] = ops;
			          if(sid!=""&&sid==data[i].id){
			          	 obj_staff.options[i+1].selected=true;
			          }
	              }
	             }
	         });
	    }
       }
    </script>
    </head>
    <body class="mainbody">
    	<div class="fastNav">统计报表 > 销售统计 > 员工业绩统计</div>
     	<@u.search_bar action="con_buy_stat!getDetailList.action">
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        		<td colspan="2">
        	 	机构类型:
					<@s.select id="org_type" name="conBuyStat.org.type" list="orgTypeList" listKey="code" listValue="codeName" 
					  headerKey="" onchange="getOrg(this.value,1)" headerValue="---所有---" value="conBuyStat.org.type" theme="simple"/>	
				机构名称：
					<select id="orgId" name="conBuyStat.limitOrgs" onchange="getDept(this.value,1)">
					<option value="">---所有---</option>
					</select>
        	            部门：
	        		<select id="depart" name="conBuyStat.limitDeps" onchange="getGroup(this.value,1)">
					<option value="">---所有---</option>
					</select>
				工作组：
					<select id="group" name="conBuyStat.limitGroups" onchange="getStaff(this.value,1)">
				    <option value="">---所有---</option>
			        </select> 
        		 营养师：
	        		  <select id="staff" name="conBuyStat.staff.id" >
	        		  	<option value="">---所有---</option>
	        		  </select>
				 </td>
			</tr>
			<tr>
        	     <td>
                                             时间： <input type="text" id="cbs_startDate" name="conBuyStat.startDate"  size="10" value="${(conBuyStat.startDate)!}" 
                        	onclick="WdatePicker({readOnly:true})" onchange="change(this)"/>到
    	               <input type="text" id="cbs_endDate" name="conBuyStat.endDate"  size="10" value="${(conBuyStat.endDate)!}" 
    	                	onclick="WdatePicker({readOnly:true})" onchange="change(this)"/>
	             </td>
	             <td>
	                                   营养师：
	         		  <input type="text" name="conBuyStat.staff.name"  value="${(conBuyStat.staff.name)!}"/>
	             </td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <div class="listTitle"><span>${(conBuyStat.startDate)!}到${(conBuyStat.endDate)!}员工业绩统计(总部和直营)</span></div>
        <div class="listLine" style="width:150%">
        <table width="100%" border="0" cellspacing="0">
            <tr>	
                  <th>序号</th>
                  <th>机构</th>
                  <th>部门</th>
                  <th>工作组</th>
                  <th>姓名</th>
	        	  <th width="5%">月份</th>
	        	  <#--<th>总销售额(元)</th>-->
	        	  <th>归属金额(元)</th>
	        	  <th>有效销售额(元)</th>
	        	  <th>无效销售额(元)</th>
	        	  <th>新客户销售金额(元)</th>
	        	  <th>新续金额(元)</th>
	        	  <th>新续其他金额(元)</th>
	        	  <th>老续金额(元)</th>
	        	  <th>老续其他金额(元)</th>
	        	  <th>上月客户总数</th>
	        	  <th>上月启动期人数</th>
	        	  <th>上月新客户数</th>
	        	  <th>本月新续人数</th>
	        	  <th>新续率</th>
	        	  <th>本月新开发客户数</th>
	        	  <th>开发率</th>
	        	  <th>本月老续人数</th>
	        	  <th>老续率</th>
            </tr>
            <#if cbsList??&&cbsList?size gt 0>
            	<#list cbsList as cbs>
            	<tr>
            		<td>${cbs_index+1}</td>
            		<td>${(cbs.org.name)!}</td>
            		<td>${(cbs.staff.department.name)!}</td>
            		<td>${(cbs.staff.workgroup.name)!}</td>
            		<td>${(cbs.staff.name)!}</td>
	        	    <td>${cbs.strDate!}</td>
	        	    <#--<td title="${(cbs.staff.name)!}/总销售额(元)">${(cbs.zxxe?string.number)!}</td>-->
	        	    <td title="${(cbs.staff.name)!}/归属金额(元)">${(cbs.gsje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/有效销售额(元)">${(cbs.yxxxe?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/无效销售额(元)">${(cbs.wxxxe?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/新客户销售金额(元)">${(cbs.xkhxxe?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/新续金额(元)">${(cbs.xxje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/新续其他金额(元)">${(cbs.xxqtje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/老续金额(元)">${(cbs.lxje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/老续其他金额(元)">${(cbs.lxqtje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/上月客户总数">${cbs.sykhzs!}</td>
	        	    <td title="${(cbs.staff.name)!}/上月启动期人数">${cbs.syqdqrs!}</td>
	        	    <td title="${(cbs.staff.name)!}/上月新客户数">${cbs.syxkhs!}</td>
	        	    <td title="${(cbs.staff.name)!}/本月新续人数">${cbs.byxxrs!}</td>
	        	    <td title="${(cbs.staff.name)!}/新续率">${(cbs.xxl?string.number)!}%</td>
	        	    <td title="${(cbs.staff.name)!}/本月新开发客户数">${cbs.byxkfkhs!}</td>
	        	    <td title="${(cbs.staff.name)!}/开发率">${(cbs.kfl?string.number)!}%</td>
	        	    <td title="${(cbs.staff.name)!}/本月老续人数">${cbs.bylxrs!}</td>
	        	    <td title="${(cbs.staff.name)!}/老续率">${(cbs.lxl?string.number)!}%</td>
                </tr>
            	</#list>
            	<tr>
            		<td>合计</td>
            		<td>-</td>
            		<td>-</td>
            		<td>-</td>
            		<td>-</td>
            		<td>-</td>
	        	    <#--<td title="总销售额(元)">${(sum.zxxe?string.number)!}</td>-->
	        	    <td title="归属金额(元)">${(sum.gsje?string.number)!}</td>
	        	    <td title="有效销售额(元)">${(sum.yxxxe?string.number)!}</td>
	        	    <td title="无效销售额(元)">${(sum.wxxxe?string.number)!}</td>
	        	    <td title="新客户销售金额(元)">${(sum.xkhxxe?string.number)!}</td>
	        	    <td title="新续金额(元)">${(sum.xxje?string.number)!}</td>
	        	    <td title="新续其他金额(元)">${(sum.xxqtje?string.number)!}</td>
	        	    <td title="老续金额(元)">${(sum.lxje?string.number)!}</td>
	        	    <td title="老续其他金额(元)">${(sum.lxqtje?string.number)!}</td>
	        	    <td title="上月客户总数">${sum.sykhzs!}</td>
	        	    <td title="上月启动期人数">${sum.syqdqrs!}</td>
	        	    <td title="上月新客户数">${sum.syxkhs!}</td>
	        	    <td title="本月新续人数">${sum.byxxrs!}</td>
	        	    <td title="新续率">-</td>
	        	    <td title="本月新开发客户数">${sum.byxkfkhs!}</td>
	        	    <td title="开发率">-</td>
	        	    <td title="本月老续人数">${sum.bylxrs!}</td>
	        	    <td title="老续率">-</td>
            	</tr>
            <#else>
            <tr><td colspan="23">暂无信息</td><tr>
            </#if>
        </table>
        </div>   
        
        <div class="listTitle"><span>${(conBuyStat.startDate)!}到${(conBuyStat.endDate)!}员工业绩统计(加盟和代理)</span></div>
        <div class="listLine" style="width:150%">
        <table width="100%" border="0" cellspacing="0">
            <tr>	
                  <th>序号</th>
                  <th>机构</th>
                  <th>部门</th>
                  <th>工作组</th>
                  <th>姓名</th>
	        	  <th width="5%">月份</th>
	        	  <#--<th>总销售额(元)</th>-->
	        	  <th>归属金额(元)</th>
	        	  <th>有效销售额(元)</th>
	        	  <th>无效销售额(元)</th>
	        	  <th>新客户销售金额(元)</th>
	        	  <th>新续金额(元)</th>
	        	  <th>新续其他金额(元)</th>
	        	  <th>老续金额(元)</th>
	        	  <th>老续其他金额(元)</th>
	        	  <th>上月客户总数</th>
	        	  <th>上月启动期人数</th>
	        	  <th>上月新客户数</th>
	        	  <th>本月新续人数</th>
	        	  <th>新续率</th>
	        	  <th>本月新开发客户数</th>
	        	  <th>开发率</th>
	        	  <th>本月老续人数</th>
	        	  <th>老续率</th>
            </tr>
            <#if cbsListOne??&&cbsListOne?size gt 0>
            	<#list cbsListOne as cbs>
            	<tr>
            		<td>${cbs_index+1}</td>
            		<td>${(cbs.org.name)!}</td>
            		<td>${(cbs.staff.department.name)!}</td>
            		<td>${(cbs.staff.workgroup.name)!}</td>
            		<td>${(cbs.staff.name)!}</td>
	        	    <td>${cbs.strDate!}</td>
	        	    <#--<td title="${(cbs.staff.name)!}/总销售额(元)">${(cbs.zxxe?string.number)!}</td>-->
	        	    <td title="${(cbs.staff.name)!}/归属金额(元)">${(cbs.gsje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/有效销售额(元)">${(cbs.yxxxe?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/无效销售额(元)">${(cbs.wxxxe?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/新客户销售金额(元)">${(cbs.xkhxxe?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/新续金额(元)">${(cbs.xxje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/新续其他金额(元)">${(cbs.xxqtje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/老续金额(元)">${(cbs.lxje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/老续其他金额(元)">${(cbs.lxqtje?string.number)!}</td>
	        	    <td title="${(cbs.staff.name)!}/上月客户总数">${cbs.sykhzs!}</td>
	        	    <td title="${(cbs.staff.name)!}/上月启动期人数">${cbs.syqdqrs!}</td>
	        	    <td title="${(cbs.staff.name)!}/上月新客户数">${cbs.syxkhs!}</td>
	        	    <td title="${(cbs.staff.name)!}/本月新续人数">${cbs.byxxrs!}</td>
	        	    <td title="${(cbs.staff.name)!}/新续率">${(cbs.xxl?string.number)!}%</td>
	        	    <td title="${(cbs.staff.name)!}/本月新开发客户数">${cbs.byxkfkhs!}</td>
	        	    <td title="${(cbs.staff.name)!}/开发率">${(cbs.kfl?string.number)!}%</td>
	        	    <td title="${(cbs.staff.name)!}/本月老续人数">${cbs.bylxrs!}</td>
	        	    <td title="${(cbs.staff.name)!}/老续率">${(cbs.lxl?string.number)!}%</td>
                </tr>
            	</#list>
            	<tr>
            		<td>合计</td>
            		<td>-</td>
            		<td>-</td>
            		<td>-</td>
            		<td>-</td>
            		<td>-</td>
	        	    <#--<td title="总销售额(元)">${(sumOne.zxxe?string.number)!}</td>-->
	        	    <td title="归属金额(元)">${(sumOne.gsje?string.number)!}</td>
	        	    <td title="有效销售额(元)">${(sumOne.yxxxe?string.number)!}</td>
	        	    <td title="无效销售额(元)">${(sumOne.wxxxe?string.number)!}</td>
	        	    <td title="新客户销售金额(元)">${(sumOne.xkhxxe?string.number)!}</td>
	        	    <td title="新续金额(元)">${(sumOne.xxje?string.number)!}</td>
	        	    <td title="新续其他金额(元)">${(sumOne.xxqtje?string.number)!}</td>
	        	    <td title="老续金额(元)">${(sumOne.lxje?string.number)!}</td>
	        	    <td title="老续其他金额(元)">${(sumOne.lxqtje?string.number)!}</td>
	        	    <td title="上月客户总数">${sumOne.sykhzs!}</td>
	        	    <td title="上月启动期人数">${sumOne.syqdqrs!}</td>
	        	    <td title="上月新客户数">${sumOne.syxkhs!}</td>
	        	    <td title="本月新续人数">${sumOne.byxxrs!}</td>
	        	    <td title="新续率">-</td>
	        	    <td title="本月新开发客户数">${sumOne.byxkfkhs!}</td>
	        	    <td title="开发率">-</td>
	        	    <td title="本月老续人数">${sumOne.bylxrs!}</td>
	        	    <td title="老续率">-</td>
            	</tr>
            <#else>
            <tr><td colspan="23">暂无信息</td><tr>
            </#if>
        </table>
        </div>   
    </body>     
</html>