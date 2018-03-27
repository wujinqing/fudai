<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回访</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
<script type='text/javascript' src='${base}/dwr/interface/VisitAjaxService.js'></script>
<script type='text/javascript' src='${base}/dwr/engine.js'></script>
<script type='text/javascript'>        
 	function saveRecord(){
 		var mid=jQuery("#mid").val();	
 		var content=jQuery("#visit_content").val();
 		var will=jQuery("#visit_vistWill").val();
 		if(will==''){
 			alert('请选择意愿！');
 			return false;
 		}
 		var state=jQuery("#visit_vistState").val();
 		if(state==''){
 			alert('请选择状态！');
 			return false;
 		}
 		var member_type=jQuery("#member_type").val();
 		if(member_type==''){
 			alert("请选择客户类型！");
 			return false;
 		}
 		var date = jQuery("#visit_stDate").val();
 		var currentWeight=jQuery("#currentWeight").val();
 		VisitAjaxService.doSave(mid,will,state,date,content,currentWeight,member_type,function(data){
 			if(null!=data&&data!=''){
 				if(data=='1'){
 					alert('添加完成');
 					//var again = window.parent.document.getElementById("frame").src;
 					//window.parent.document.getElementById("frame").window.location.reload();
 				}else{
 					alert('服务繁忙，请稍后再试！msg：'+data);
 				}
 			}
 		});
 	}
 	// 要创建一个随机浮点数时，使用rnd()；要创建一个随机整数时，例如，1到10时，使用rand(10)。
    rnd.today=new Date(); 
    rnd.seed=rnd.today.getTime();  
    function rnd(){ 
　　　　rnd.seed = (rnd.seed*9301+49297) % 233280; 
　　　　return rnd.seed/(233280.0); 
    } 
    function rand(number) { 
　　　　return Math.ceil(rnd()*number); 
    } 
</script>
</head>
<body class="mainbody">
<form id="search_form" name="search_form" action="visit!visitList.action" method="post">
	<input type="hidden" id="curPage" name="visit.curPage" value="${(visit.curPage)!}" />
	<input type="hidden" id="mid" name="mid" value="${member.id!}">
<form>
<div class="listLine txtLeft">
<table>
 <tr>
    <th align="left">添加回访记录</th>
 </tr>
 <tr>
	 <td>
    	客户意愿：
		<@s.select headerKey="" headerValue="--请选择--" id="visit_vistWill" name="visit.vistWill" list="sysCodeWillList" 
		     listKey="code" listValue="codeName" theme="simple" />
		回访状态：
	 	<@s.select id="visit_vistState" name="visit.vistState" list="sysCodeRecodeTypeList" 
	         listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple"/>	
		客户类型：
		<@s.select id="member_type"  name="member.visitType" list="visitTypeList"  listKey="code"
		     listValue="codeName" headerKey="" headerValue="--请选择--" value="member.visitType" theme="simple"/>	
	 </td>
  </tr>
  <tr> 
	    <td>
		    预邀检测日期：
	     <input type="text" id="visit_stDate" name="visit.vistDate" onClick="WdatePicker({isShowClear:true,readOnly:true})"/>
	            当前体重：
		 <input type="text" name="currentWeight" id="currentWeight" maxlength="8"/>kg(最多精确到小数点后1位)
		</td>
  </tr>
  <tr>
		 <td>
		               回访内容：<textarea rows="5" cols="50" id="visit_content" name="visit.content"></textarea>
	     </td>
  </tr>
</table>
</div>
<div class="listDiv"><input type="button" class="btn_bg" value="提交" onclick="saveRecord()"/></div>
<div class="listTitle"><span>回访记录历史记录</span></div>
<div class="listLine">
    <table width="100%" border="0" cellspacing="0">
        <tr>
        	  <th>回访日期</th>
        	  <th>回访人</th>
        	  <th>邀约检测日期</th>
        	  <th>客户意愿</th>
        	  <th>回访体重(kg)</th>
        	  <th>回访内容</th>
        </tr>
        <#if (page.dataList)??>
    	<#list page.dataList as visit>
    	<tr>
    	    <td>${(visit.createDate?string('yyyy-MM-dd hh:mm:ss'))!}</td>
    	    <td>${(visit.staff.name)!}</td>
    	    <td>${(visit.vistDate?string('yyyy-MM-dd'))!}</td>
    	    <td><#if sysCodeWillList??><@c.syscode syscodes=sysCodeWillList code="${(visit.vistWill)!}"/></#if></td>
    	    <td>${(visit.currentWeight?string.number)!}</td>
    	    <td title="${(visit.content)!}">${((visit.content)?html)!}</td>
        </tr>
    	</#list>
    	</tr>
        <#else>
        <tr><td colspan="6">暂无信息</td></tr>
        </#if>
    </table>
</div>  
<@u.paginate page=page/>
</body>      
</html>