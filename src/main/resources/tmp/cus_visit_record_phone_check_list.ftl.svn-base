<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
  		<@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
	<script>
		function changeStaff(){
			var org=document.getElementById("org").value;
			OrgAjaxService.getStaffs(org,function(reply){
				var s=document.getElementById("staffList");
				s.options.length=1;
				for(var i=0;i<reply.length;i++){
					var option=new Option(reply[i].name,reply[i].id);
					s.options.add(option);
				}
			});
		}
		
		function getDept(org){
    	document.getElementById('staff').options.length=0;
    	var op = new Option("---请选择---","");
    	document.getElementById('staff').options[0] = op;
        OrgAjaxService.getAllDepart(org.value,function(data){
           if(data==""){
	         document.getElementById('depart').options.length=0;
	         var op = new Option("---请选择---","");
	         document.getElementById('depart').options[0] = op;
	        }
           else{
	          document.getElementById('depart').options.length=1;
	          var x=0;
	          for(var i=0;i<data.length;i++){
		          var op = new Option(data[i].name,data[i].id);
		          document.getElementById('depart').options[x+1] = op;
		          x++;
              }
           }
        });
    }
    
    function getStaff(department){
    	var orgId=document.getElementById("org").value;
	    document.getElementById('staff').options.length=0;
	    var op = new Option("---请选择---","");
	    document.getElementById('staff').options[0] = op;
        OrgAjaxService.getAllStaff(orgId,department.value,function(data){
            if(data !=""){
           	  var x=0;
		          for(var i=0;i<data.length;i++){
			          var ops = new Option(data[i].name,data[i].id);
			          document.getElementById('staff').options[x+1] = ops;
			          x++;
	              }
              }
        });
    }
	</script>
</head>

<body class="mainbody">

<div class="fastNav">工作平台> 营养师主管工作平台> 电话达成查询</div>


  <@u.search_bar action="cus_visit_record!phoneCheckList.action">
  	<input type="hidden" id="curPage" name="cusVisitRecord.curPage" value="${cusVisitRecord.curPage}" />
  	<table width="100%" border="0" cellspacing="0">
	<tr>
      机构：
			        	 <select id="org" name="cusVisitRecord.staff.limitOrgs" onchange="getDept(this)">
						    <option value="">---请选择---</option>
						    <#if orgList??>
							    <#list orgList as org> 
							       <option value="${org.id}" <#if orgId??><#if orgId=org.id>selected</#if></#if>>${org.name!}</option>
							    </#list>
						    </#if>
					      </select>
	                                                           部门：
			        	  <select id="depart" name="cusVisitRecord.staff.limitDeps" onchange="getStaff(this)">
						    <option value="">---请选择---</option>
						    <#if departList??>
							    <#list departList as depart> 
							       <option value="${depart.id}" <#if departId??><#if departId=depart.id>selected</#if></#if>>${depart.name!}</option>
							    </#list>
						    </#if>
					      </select> 
					                营养师： 
			        	  <select id="staff" name="cusVisitRecord.staff.id">
						    <option value="">---请选择---</option>
						    <#if staffList1??>
							    <#list staffList1 as staff> 
							       <option value="${staff.id}" <#if staffId??><#if staffId=staff.id>selected</#if></#if>>${staff.name!}</option>
							    </#list>
						    </#if>
						  </select>
	  </td>
    </tr>
	<tr>
      <td>客户姓名 </td>
      <td><input type="text" name="customer.name" value="${customer.name!}" /></td>
	  <td>客户电话 </td>
      <td><input type="text" name="customer.tel" value="${customer.tel!}"/></td>
    </tr>
    <tr>
      
	  <td>回访状态</td>
      <td>
		<@s.select name="customer.visitStatus" value="${customer.visitStatus!}" list=sysCodeRecodeTypeList listKey="code" listValue="codeName" theme="simple" />
	  </td>
	  <td>日期</td>
      <td>
		<input type="text" name="customer.startTime" onclick="WdatePicker({isShowClear:false,readOnly:true})" /> 至 <input type="text" name="customer.endTime" onclick="WdatePicker({isShowClear:false,readOnly:true})" />
	  </td>
    </tr>
    </table>
</@u.search_bar>


<div class="listTitle">
  <span>电话达成记录列表</span>
</div>

<div class="listLine">
<table>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
	<th>电话号码</th>
	<th>营养师</th>
	<th>所属机构</th>
	<th>回访状态</th>
	<th>最后回访记录</th>
	<th>首次咨询时间</th>
	<th>最近回访时间</th>
  </tr>
  <#if page.dataList ?? && (page.dataList.size()>0)>
  	<#list page.dataList as vr>
  <tr>
    <td>${vr_index+1!}</td>
    <td>${vr.customer.name!}</td>
	<td>${vr.customer.tel!}</td>
	<td>${vr.customer.staff.name!}</td>
	<td>${vr.customer.staff.org.name!}</td>
	<td><@c.syscode syscodes=sysCodeRecodeTypeList code="${vr.customer.visitStatus!}" /></td>
	<td>${vr.visitRecord!}</td>
	<td>${(vr.customer.createDate?string("yyyy-MM-dd"))?default("")}</td>
	<td>${(vr.createDate?string("yyyy-MM-dd"))?default("")}</td>
  </tr>
  	</#list>
  </#if>
</table>
</div>
<@u.paginate page=page/>
</body>
</html>
