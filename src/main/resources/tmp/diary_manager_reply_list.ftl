<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
  <script type='text/javascript' src='${base}/dwr/engine.js'></script>
  <title>日记留言回复</title>
  <@u.css src="style.css"/>
  <@u.rootjs src="jquery-1.4.2.min.js"/>
<script>
	function show(id,type){
		var url = "member!newCustomerEdit.action?id="+id;
		beginOpen(url);
	}
	function intervence(id){
		var url = "member!getIntervence.action?id="+id+"&header=true";
		beginOpen(url);
	}
	
	function comments(id){
		document.getElementById("id").value=id;
		var form=document.getElementById("form1");
		form.action="diary!managerReply.action?header=true&flag=msgRep";
		form.submit();
	}
	
	function sureRep(id){
		$("#id").val(id);
		$("#form1").attr("action","message!input.action?reviews=true&flag=msgRep");
		$("#form1").submit();
	}
	
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
</script>
</head>

<body class="mainbody">

<div class="fastNav">营养师部 > 营养师主管日记留言 > 日记留言回复</div>
<form action="member!targetTrue.action?target=true" method="post" id="form1" name="form1">
<input type="hidden" id="id" name="id" />
</form>

<@u.search_bar action="diary!managerReplyList.action">
<input type="hidden" id="curPage" name="diary.curPage" value="${diary.curPage}" />
<input type="hidden" id="curPage1" name="message1.curPage" value="${message1.curPage}" />
  <table>
    <tr>
      <td>
      		 <#if powerFlag??&&powerFlag="1">
			  机构：
        	 <select id="org" name="diary.limitOrgs" onchange="getDept(this)">
			    <option value="">---请选择---</option>
			    <#if orgList??>
				    <#list orgList as org> 
				       <option value="${org.id}" <#if "${orgId!}"="${org.id!}">selected</#if>>${(org.name)!}</option>
				    </#list>
			    </#if>
		      </select>
                                      部门：
        	  <select id="depart" name="diary.limitDeps" onchange="getStaff(this)">
			  	<option value="">---请选择---</option>
		      </select>
		      <#else>
		                机构：${(diary.nutrOrgName)!}
		                部门：${(diary.nutrDeptName)!}
		      </#if>
		                营养师： 
        	  <select id="staff" name="diary.nutrId">
			    <option value="">---请选择---</option>
			  </select>
      </td>
      <td>客户姓名：</td>
      <td><input type="text" id="member_name" name="diary.member.name" value="${(diary.member.name)!}"/></td>
      </tr>
  </table> 
  </@u.search_bar>

<div class="listTitle">
  <span>共有<#if page.dataList??> ${page.totalRow}<#else>0</#if>条记录</span>
</div>
<div class="listLine">
<table>
  <tr><th colspan="9">日记回复</th></tr>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>所处阶段（天数/总天数）</th>
	<th>所属合作点</th>
	<th>营养师</th>
    <th>日记提交时间</th>
    <th>工作提示</th>
  </tr>
 <#if page.dataList ??>
  <#list page.dataList as diary>
  <tr>
	<td>${diary_index+1}</td>
    <td><a href="javascript:show('${diary.member.id!}','${type!}')">${(diary.member.name)!}</a></td>
    <td>
        <@c.syscode syscodes = sysCodeSexList code='${diary.member.sex!}'/>
    </td>
    <td><#if diary.member??&&diary.member.birthday??>${diary.member.getAge(diary.member.birthday)!}</#if></td>
    <td>
    	<#if diary.member??&&diary.member.phase??>
    		<a href="javascript:intervence('${(diary.member.id)!}')">
    		<@c.syscode syscodes=sysCodeList code="${(diary.member.phase)!}"/>
    		<#if diary.member.phaseStartDate??>${diary.member.getDay(diary.member.phaseStartDate)}</#if>/<#if diary.member.startDate??>${diary.member.getDay(diary.member.startDate)}</#if>
    		</a>
    	</#if>
    </td>
	<td>${(diary.member.staff.org.name)!}</td>
	<td>${(diary.member.staff.name)!}</td>
    <td>${(diary.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td>
    	<#if "${diary.isChecked!}"="0"&&"${diary.isComment}"="1">
    		<font color="red">退回需修改</font>
    	<#else>
	    	<font color="red">有新日记</font>
    	</#if>
    	<a href="javascript:intervence('${(diary.member.id)!}')">点此进入</a>
    </td>
  </tr>
  </#list>
  <#else>
  	<tr>
  		<td colspan="9">暂无信息</td>
  	</tr>
  </#if>
  </table>
</div>
<@u.paginate page=page/>

<div class="listTitle">
  <span>共有<#if pageMessage.dataList??> ${pageMessage.totalRow}<#else>0</#if>  条记录</span>
</div>
<div class="listLine">
<table>
  <tr>
     <th colspan="9">留言回复</th>
  </tr>
    <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
    <th>所处阶段（天数/总天数）</th>
	<th>所属合作点</th>
	<th>营养师</th>
    <th>留言提交时间</th>
    <th>工作提示</th>
  </tr>
  <#if pageMessage.dataList??>
     <#list pageMessage.dataList as message>
  <tr>
	<td>${message_index+1}</td>
    <td><a href="javascript:show('${(message.member.id)!}','${type!}')">${(message.member.name)!}</a></td>
    <td><@c.syscode syscodes = sysCodeSexList code='${(message.member.sex)!}'/></td>
    <td>${(message.member.getAge(message.member.birthday))!}</td>
    <td>
    	<a href="javascript:intervence('${(message.member.id)!}')">
    		<@c.syscode syscodes=sysCodeList code="${(message.member.phase)!}"/>
    		<#if message.member ?? && message.member.phaseStartDate??>${message.member.getDay(message.member.phaseStartDate)}</#if>/<#if message.member??&&message.member.startDate??>${message.member.getDay(message.member.startDate)}</#if>
       </a>
    </td>
	<td>${(message.member.staff.org.name)!}</td>
	<td>${(message.member.staff.name)!}</td>
    <td>${((message.createDate)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td>
    	<#if "${message.isChecked!}"="0"&&"${message.isComment}"="1">
    		<font color="red">退回需修改</font>
    	<#else>
	    	<font color="red">有新留言</font>
    	</#if>
    	<a href="javascript:intervence('${(message.member.id)!}')">点此进入</a>
    </td>
  </tr>
  </#list>
  <#else>
  	<tr>
  		<td colspan="9">暂无信息</td>
  	</tr>
  </#if>
</table>
</div>
	<div class="pageNum">
	<a href='javascript:gotoPage1(1)'> 首页</a>
    <#if (pageMessage.previousPage >= 1) >
		<a href='javascript:gotoPage1(${pageMessage.previousPage!})'>上一页</a>
	</#if>
	<#if (pageMessage.nextPage <= pageMessage.totalPage)>
		<a href='javascript:gotoPage1(${pageMessage.nextPage!})'> 下一页</a>
	</#if>
	<a href='javascript:gotoPage1(${pageMessage.totalPage!})'> 尾页</a>
	当前第${pageMessage.currentPage!}/${pageMessage.totalPage!}页转到第
	<select id="currentPage" name="currentPage" onchange="gotoPage1(this.value)">
		<#list 1..pageMessage.totalPage as i>
			<option value="${i!}" <#if pageMessage.currentPage=i>selected</#if> >${i!}</option>
		</#list>
	</select>页 共${pageMessage.totalRow!}条记录
    </div>
</body>
    <script type="text/javascript">
    function org(obj){
		document.getElementById("message1.member.staff.org.id").value=obj.value;
	}
	function staff(obj){
		document.getElementById("message1.member.staff.id").value=obj.value;
	}
	function gotoPage1(page){
		document.getElementById('curPage1').value = page;
  		document.getElementById('search_form').submit();
	}
	<#if powerFlag??&&powerFlag="1">
	$(document).ready(function(){
	   	if($("#org").val()!=''){
			$("#org").change();
		}
	});	
	</#if>
	function getDept(org){
		var obj_staff = document.getElementById('staff');
		var obj_depart = document.getElementById('depart');
    	obj_staff.options.length=1;
        obj_depart.options.length=1;
        var oid = "${(diary.limitDeps)!}"
        OrgAjaxService.getAllDepart(org.value,function(data){
           if(data !=""){
	          for(var i=0;i<data.length;i++){
		          var op = new Option(data[i].name,data[i].id);
		          obj_depart.options[i+1] = op;
		          if(oid!=""&&oid==data[i].id){
		          	obj_depart.options[i+1].selected = true;
		          	getStaff(obj_depart);
		          }
              }
           }
        });
    }
    
    function getStaff(department){
    	var obj_org = document.getElementById("org");
    	var obj_staff = document.getElementById('staff');
    	var orgId = obj_org.value;
	    obj_staff.options.length=1;
        var sid = "${(diary.nutrId)!}";
        OrgAjaxService.getAllStaff(orgId,department.value,function(data){
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
    </script>
</html>
