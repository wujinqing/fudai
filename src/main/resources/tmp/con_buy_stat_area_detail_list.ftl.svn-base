<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>员工业绩统计(按地区)</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/interface/WorkGroupAjaxService.js'></script>
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
    	      if($("#orgId").val()!=''){
					$("#orgId").change();
				}
           })
			
		  function getDept(org){
		  	var v_dept = document.getElementById('depart');
		  	var v_group = document.getElementById('group');
	        v_dept.options.length=1;
	        v_group.options.length = 1;
            var did="${(conBuyStat.limitDeps)!}";
	        OrgAjaxService.getAllDepart(org,function(data){
	           if(data!=""){
		          for(var i=0;i<data.length;i++){
		        	  var op = new Option(data[i].name,data[i].id);
		        	  v_dept.options[i+1] = op;
					  if(did!=""&&did==data[i].id){
						 v_dept.options[i+1].selected=true;
				         getGroup(did);
					  }
	              }
	           }
	        });
		  }
		    
		  function getGroup(v_depart){
	    	var v_org = $("#orgId").val();
			var obj_group = document.getElementById('group');
	    	obj_group.options.length=1;
	    	var gid = "${(conBuyStat.limitGroups)!}";
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
	    	});
	      }  
        </script>
    </head>
    <body class="mainbody">
    	<div class="fastNav">统计报表 > 销售统计 > 员工业绩统计(按地区)</div>
     	<@u.search_bar action="con_buy_stat!getAreaDetailList.action">
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        		<td>
				机构名称：
					<@s.select id="orgId" name="orgId" list="orgList" listKey="id" listValue="name" 
					  headerKey="" onchange="getDept(this.value)" headerValue="---所有---" value="${orgId!}" theme="simple"/>	
        	            部门：
	        		<select id="depart" name="conBuyStat.limitDeps"  onchange="getGroup(this.value)">
					<option value="">---所有---</option>
					</select>
				 工作组：
					<select id="group" name="conBuyStat.limitGroups">
				    <option value="">---所有---</option>
			        </select>
        		 营养师：
        		 	<input type="text" id="staff_id" name="conBuyStat.staff.name"  value="${(conBuyStat.staff.name)!}"/>
				 </td>
			</tr>
			<tr>
        	     <td>
                                             时间： <input type="text" id="cbs_startDate" name="conBuyStat.startDate"  size="10" value="${(conBuyStat.startDate)!}" 
                        	onclick="WdatePicker({readOnly:true})" onchange="change(this)"/>到
    	               <input type="text" id="cbs_endDate" name="conBuyStat.endDate"  size="10" value="${(conBuyStat.endDate)!}" 
    	                	onclick="WdatePicker({readOnly:true})" onchange="change(this)"/>
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