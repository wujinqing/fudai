<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>生成满意度调查名单</title>
        <@u.css src="style.css"/>
        <script language="javascript" src="${base}/js/jquery-1.4.2.min.js"></script>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
 		<script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>      
        function getOrg(type){
				var obj_org = document.getElementById("org_id");
				obj_org.options.length=1;
				OrgAjaxService.getAllOrgByType(type.value,function(data){
					if(data.length != 0){
						for(var i=0;i<data.length;i++){
							var op = new Option(data[i].name,data[i].id);
							obj_org.options[i+1] = op;
						}
					}
				});
			}
         
	        $("document").ready(function(){
	        	$("#selectCheck").click(function(){
	        		if($(this).attr("checked")){
	        			$("[name='checks']").attr("checked",'true');//全选
	        		}else{
	        		 	$("[name='checks']").removeAttr("checked");//取消全选
	        		}
	        	});
	        });  
            function doSubmit(obj){
            	var str = "";
            	$("input:checkbox[name='checks']").each(function(){
            		if($(this).attr("checked")){
            			str += $(this).val() + "_";
            		}
            	});
            	if(str != ""){
            		$("#ids").val(str.substring(0,str.length-1));
            	}
            	if(str == ""){
            		alert("请选择问题！");
            		return;
            	}
            	if($("#member_phase").val()==""){
            		alert("请选择调查对象");
            		return;
            	}
            	$(obj).attr("disabled","true");
            	$("#span_msg").html("生成时间会较长，请耐心等待！");
            	$("#survey_form").submit();
            }
            <#if msg??&&msg=1>
            	alert("名单生成成功！");
            </#if>
        </script>
    </head>
    <body class="mainbody">
    	<div class="fastNav">系统设置 > 综合管理 > 生成满意度调查名单</div>
        <@u.title_bar title="内部调查问题列表"></@u.title_bar>
        <div class="listLine">
        <form method="post" id="survey_form" action="survey!createSurveyList.action?preview=true">
        <input type="hidden" id="ids" name="ids" value=""/>
        <table width="100%" border="0" cellspacing="0">
            <tr>
            	  <th></th>
            	  <th>序号</th>
	        	  <th>问题类型</th>
	        	  <th>问题</th>
	        	  <th>肯定答案</th>
	        	  <th>否定答案</th>
	        	  <th>所属阶段</th>
            </tr>
            <#if surveyQuestionList??>
            	<#list surveyQuestionList as surveyQuestion>
            	<tr>
            		<td><input type="checkbox" name="checks" value="${(surveyQuestion.id)!}"/></td>
            		<td>${surveyQuestion_index+1}</td>
	        	    <td>
	        	    	<@c.syscodeOne syscodes = syscodeList  code='${surveyQuestion.questionType!}' type='${qType!}'/>
	        	    </td>
	        	    <td>${surveyQuestion.question!}</td>
	        	    <td>${surveyQuestion.positiveAnswer!}</td>
	        	    <td>${surveyQuestion.negativeAnswer!}</td>
	        	    <td>
	        	    	<@c.syscodeOne syscodes = syscodeList  code='${surveyQuestion.phase!}' type='${pType!}'/>
	        	    </td>
                </tr>
            	</#list>
            <#else>
            	<tr>
            		<td colspan="7">暂无信息！</td>
            	</tr>
            </#if>
        </table>
        </div>  
        <div class="listDiv">
        	<input type="checkbox" id="selectCheck">全选&nbsp;&nbsp;&nbsp;&nbsp;
        	将选中的问题分配给如下客户&nbsp;&nbsp;&nbsp;
        	 机构类型：<@s.select id="org_type" name="member.org.type" value="member.org.type" list="orgTypeList" listKey="code" listValue="codeName" headerKey="" headerValue="--请选择--" theme="simple" onchange="getOrg(this)"/>
	                      机构名称：<@s.select id="org_id" name="member.org.id" value="member.org.id" list="" listKey="" listValue="" headerKey="" headerValue="--请选择--" theme="simple" />
        	调查对象：<@c.sysListTwo syscodes=syscodeList pname="member.phase" pid="member_phase" param="${pType!}" flag="" />的客户，第<input type="text" id="begin_day" name="beginDate" value="1" size="2"/>到<input type="text" id="end_date" name="endDate" value="1" size="2"/>天
        </div>  
        <br/><br/>
        <div class="listDiv">
        	<input type="button" value="生成满意度调查名单" class="btn_bg" onclick="doSubmit(this)"/>
        	<span id="span_msg" style="color:red"></span>
        </div>
        </form>
    </body>   
</html>