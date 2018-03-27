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
	function detail(id){
		var url = "member!gelMebIntervene.action?id="+id+"&header=true";
		beginOpen(url);
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
<div class="fastNav">咨询师部 > 咨询师主管工作平台 > 日记留言回复</div>
<@u.search_bar action="diary!gelMebDiaryList.action">
<input type="hidden" id="header" name="header" value="true" />
<input type="hidden" id="curPage" name="diary.curPage" value="${diary.curPage}" />
<input type="hidden" id="msg_curPage" name="message1.curPage" value="${message1.curPage}" />
  <table>
    <tr>
      <td>
  		 <#if powerFlag??&&powerFlag="1">
		  机构：
    	 <select id="org_id" name="diary.limitOrgs" onchange="getDept(this)">
		    <option value="">---请选择---</option>
		    <#if orgList??>
			    <#list orgList as org> 
			       <option value="${org.id!}" <#if "${(diary.limitOrgs)!}"="${org.id!}">selected</#if>>${(org.name)!}</option>
			    </#list>
		    </#if>
	      </select>
                                  部门：
    	  <select id="dept_id" name="diary.limitDeps" onchange="getStaff(this)">
		  	<option value="">---请选择---</option>
	      </select>
	      <#else>
	                机构：${(diary.nutrOrgName)!}
	                部门：${(diary.nutrDeptName)!}
	      </#if>
	                咨询师： 
    	  <select id="staff_id" name="diary.nutrId">
		    <option value="">---请选择---</option>
		  </select>
      </td>
      <td>客户姓名：</td>
      <td><input type="text" id="member_name" name="diary.member.name" value="${(diary.member.name)!}"/></td>
      </tr>
  </table> 
</@u.search_bar>

<div class="listTitle">
  <span>共有<#if page.dataList??>${page.totalRow}<#else>0</#if>条记录</span>
</div>
<div class="listLine">
<table>
  <tr><th colspan="8">日记回复</th></tr>
  <tr>
    <th>序号</th>
    <th>客户姓名</th>
    <th>性别</th>
    <th>年龄</th>
	<th>所属合作点</th>
	<th>咨询师</th>
    <th>日记提交时间</th>
    <th>工作提示</th>
  </tr>
 <#if page.dataList ??>
  <#list page.dataList as diary>
  <tr>
	<td>${diary_index+1}</td>
    <td><a href="javascript:show('${diary.member.id!}','${type!}')">${(diary.member.name)!}</a></td>
    <td><@c.syscode syscodes = sysCodeSexList code='${diary.member.sex!}'/></td>
    <td><#if (diary.member.birthday)??>${diary.member.getAge(diary.member.birthday)!}</#if></td>
	<td>${(diary.member.org.name)!}</td>
	<td>${(diary.member.staff.name)!}</td>
    <td>${(diary.createDate?string("yyyy-MM-dd HH:mm:ss"))!}</td>
    <td>
    	<#if "${diary.isChecked!}"="0"&&"${diary.isComment}"="1">
    		<font color="red">退回需修改</font>
    	<#else>
	    	<font color="red">有新日记</font>
    	</#if>
    	<a href="javascript:detail('${(diary.member.id)!}')">点此进入</a>
    </td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="8">暂无信息</td></tr>
  </#if>
  </table>
</div>
<@u.paginate page=page/>

<div class="listTitle">
  <span>共有<#if pageMessage.dataList??>${pageMessage.totalRow}<#else>0</#if>条记录</span>
</div>
<div class="listLine">
<table>
    <tr><th colspan="8">留言回复</th></tr>
	<tr>
		<th>序号</th>
		<th>客户姓名</th>
		<th>性别</th>
		<th>年龄</th>
		<th>所属合作点</th>
		<th>咨询师</th>
		<th>留言提交时间</th>
		<th>工作提示</th>
    </tr>
  	<#if pageMessage.dataList??>
  	<#list pageMessage.dataList as msg>
  	<tr>
		<td>${msg_index+1}</td>
	    <td><a href="">${(msg.member.name)!}</a></td>
	    <td><@c.syscode syscodes = sysCodeSexList code='${(msg.member.sex)!}'/></td>
	    <td><#if (msg.member.birthday)??>${(msg.member.getAge(msg.member.birthday))!}</#if></td>
		<td>${(msg.member.org.name)!}</td>
		<td>${(msg.member.staff.name)!}</td>
	    <td>${((msg.createDate)?string("yyyy-MM-dd HH:mm:ss"))!}</td>
	    <td>
	    	<#if "${msg.isChecked!}"="0"&&"${msg.isComment}"="1">
	    		<font color="red">退回需修改</font>
	    	<#else>
		    	<font color="red">有新留言</font>
	    	</#if>
	    	<a href="javascript:detail('${(msg.member.id)!}')">点此进入</a>
	    </td>
  	</tr>
  	</#list>
  	<#else>
  	<tr><td colspan="8">暂无信息</td></tr>
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
	function gotoPage1(page){
		document.getElementById('msg_curPage').value = page;
  		document.getElementById('search_form').submit();
	}
	<#if powerFlag??&&powerFlag="1">
	$(document).ready(function(){
	   	if($("#org_id").val()!=''){
			$("#org_id").change();
		}
	});	
	function getDept(org){
		var obj_staff = document.getElementById('staff_id');
		var obj_depart = document.getElementById('dept_id');
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
    
    function getStaff(dept){
    	var obj_org = document.getElementById("org_id");
    	var obj_staff = document.getElementById('staff_id');
    	var orgId = obj_org.value;
	    obj_staff.options.length=1;
        var sid = "${(diary.nutrId)!}";
        OrgAjaxService.getAllStaff(orgId,dept.value,function(data){
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
	</#if>
</script>
</html>
