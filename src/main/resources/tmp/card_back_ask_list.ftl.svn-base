<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>营销退卡申请单列表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <@u.js src="drag.js"/> 
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('cardBackAsk_form');
               	form.action = "card_back_ask!add.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardBackAsk_form');
                    form.action = "card_back_ask!delete.action";
                    form.submit();
                }
            }
            function reset(id,type){
            	if(confirm("确认？")) {
                    document.getElementById('id').value = id;
                    document.getElementById('type').value = type;
                    var form = document.getElementById('cardBackAsk_form');
                    form.action = "card_back_ask!reset.action";
                    form.submit();
                }
            }
            function createBackForm(id){
                document.getElementById('id').value = id;
                var form = document.getElementById('cardBackAsk_form');
                form.action = "card_back!add.action";
                form.submit();
            }
            function refuse(type){
            	var backReason= document.getElementById("note").value;
            	document.getElementById('type').value = type;
            	document.getElementById('backReason_1').value = backReason;
            	var form = document.getElementById('cardBackAsk_form');
            	form.action = "card_back_ask!reset.action";
             	form.submit();
            }
            function reBack(id){
            	$('#note').attr("readOnly","");
            	document.getElementById('note').value="";
            	document.getElementById('noteTd').style.display="";
           		document.getElementById('id').value = id;
           		document.getElementById('closed').style.display = "block";//显示
            }
            function cancel(){
            	document.getElementById('closed').style.display = "none";
            }
            function showBackReason(reason){
            	$('#note').attr("readOnly","true");
            	document.getElementById('noteTd').style.display="none";
            	document.getElementById('note').value=reason;
            	document.getElementById('closed').style.display = "block";//显示
            }
            function check(sort){
	        	var createDateSort = document.getElementById("cardBackAsk.createDateSort").value;
	        	var noSort = document.getElementById("cardBackAsk.noSort").value;
	        	var formStatusSort = document.getElementById("cardBackAsk.formStatusSort").value;
	        	var confirmDateSort = document.getElementById("cardBackAsk.confirmDateSort").value;
	        	if(sort=="FORM_NO"){
	        		if(noSort!=""){
	        			document.getElementById("cardBackAsk.noSort").value="";
	        		}else{
	        			document.getElementById("cardBackAsk.noSort").value=sort;
	        		}
	        	}else if(sort=="FORM_STATUS"){
	        		if(formStatusSort!=""){
	        			document.getElementById("cardBackAsk.formStatusSort").value="";
	        		}else{
	        			document.getElementById("cardBackAsk.formStatusSort").value=sort;
	        		}
	        	}else if(sort=="CONFIRM_DATE"){
	        		if(confirmDateSort!=""){
	        			document.getElementById("cardBackAsk.confirmDateSort").value="";
	        		}else{
	        			document.getElementById("cardBackAsk.confirmDateSort").value=sort;
	        		}
	        	}else if(sort=="CREATE_DATE"){
	        		if(createDateSort!=""){
	        			document.getElementById("cardBackAsk.createDateSort").value="";
	        		}else{
	        			document.getElementById("cardBackAsk.createDateSort").value=sort;
	        		}
	        	}else if(sort=="1"){
	        		if(noSort=="1"){
	        			document.getElementById("cardBackAsk.noSort").value="FORM_NO";
	        		}else{
	        			document.getElementById("cardBackAsk.noSort").value=sort;
	        		}	
	        	}else if(sort=="2"){
	        		if(confirmDateSort=="2"){
	        			document.getElementById("cardBackAsk.confirmDateSort").value="CONFIRM_DATE";
	        		}else{
	        			document.getElementById("cardBackAsk.confirmDateSort").value=sort;
	        		}
	        	}
	        	else if(sort=="3"){
	        		if(formStatusSort=="3"){
	        			document.getElementById("cardBackAsk.formStatusSort").value="FORM_STATUS";
	        		}else{
	        			document.getElementById("cardBackAsk.formStatusSort").value=sort;
	        		}
	        	}else if(sort=="4"){
	        		if(createDateSort=="4"){
	        			document.getElementById("cardBackAsk.createDateSort").value="CREATE_DATE";
	        		}else{
	        			document.getElementById("cardBackAsk.createDateSort").value=sort;
	        		}
	        	}
	        	var form = document.getElementById("search_form");
	        	form.action="${actions}";
	        	form.submit();
	        }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="cardBackAsk_form" name="cardBackAsk_form">
            <input id="id" name="id" type="hidden">   
            <input id="type" name="type" type="hidden"> 
            <input id="sort" name="sort" type="hidden" value=${sort!}>   
            <input id="backReason_1" name="backReason" type="hidden">  
            <input id="formType" name="formType" type="hidden" value="${formType!}">
        </form>
        
     	<@u.search_bar action="${actions}">
        <input type="hidden" id="curPage" name="cardBackAsk.curPage" value="${cardBackAsk.curPage}" />
        <input type="hidden" id="cardBackAsk.noSort" name="cardBackAsk.noSort" value="${cardBackAsk.noSort!}" />
        <input type="hidden" id="cardBackAsk.formStatusSort" name="cardBackAsk.formStatusSort" value="${cardBackAsk.formStatusSort!}" />
        <input type="hidden" id="cardBackAsk.confirmDateSort" name="cardBackAsk.confirmDateSort" value="${cardBackAsk.confirmDateSort!}" />
        <input type="hidden" id="cardBackAsk.createDateSort" name="cardBackAsk.createDateSort" value="${cardBackAsk.createDateSort!}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	    <td width="15%">状态：</td>
        		<td width="35%">
        		<select name="cardBackAsk.formStatus" id="cardBackAsk.formStatus">
			    	<option value="">---请选择---</option>
			    	<#if syslist??>
			    	  	<#list syslist as formStatus>
			    	  		<option value="${(formStatus.code)!}"<#if cardBackAsk.formStatus??><#if (cardBackAsk.formStatus).toString()==formStatus.code>selected</#if></#if>>${(formStatus.codeName)!}</option>
			    	  	</#list>
			    	</#if>
			    </select>
        		</td>
        	    <td width="15%">单号：</td>
        		<td width="35%"><input type="text" name="cardBackAsk.formNo" value="${cardBackAsk.formNo!}"></td>
        	</tr>
        	<tr>
        		 <td width="15%">确认时间：</td>
        		 <td width="35%" class="txtLeft">&nbsp;<input type="text"  name="cardBackAsk.startTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBackAsk.startTime??>value="${(cardBackAsk.startTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text" name="cardBackAsk.endTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBackAsk.endTime??>value="${(cardBackAsk.endTime?string('yyyy-MM-dd'))!}"</#if>></td>
        		 <td width="15%">创建时间：</td>
        		 <td width="35%" class="txtLeft">&nbsp;<input type="text"  name="cardBackAsk.startDate" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBackAsk.startDate??>value="${(cardBackAsk.startDate?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text" name="cardBackAsk.endDate" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBackAsk.endDate??>value="${(cardBackAsk.endDate?string('yyyy-MM-dd'))!}"</#if>></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="营销退卡申请单列表">
        		<@u.title_bar_btn type="new" onclick="edit('');"/>
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="12%"><a href="javascript:check('FORM_NO')">单号</a>
	        	  <span 
	        	  <#if cardBackAsk.noSort??>
	        	  <#if cardBackAsk.noSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('1')">
	        	  <#if cardBackAsk.noSort??&&cardBackAsk.noSort=="1">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="10%">申请人</th>
	        	  <th width="8%">确认人</th>
	        	  <th width="10%">确认机构</th>
	        	  <th width="10%"><a href="javascript:check('CONFIRM_DATE')">确认时间</a>
	        	  <span 
	        	  <#if cardBackAsk.confirmDateSort??>
	        	  <#if cardBackAsk.confirmDateSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('2')">
	        	  <#if cardBackAsk.confirmDateSort??&&cardBackAsk.confirmDateSort=="2">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="8%"><a href="javascript:check('CREATE_DATE')">创建时间</a>
	        	  <span 
	        	  <#if cardBackAsk.createDateSort??>
	        	  <#if cardBackAsk.createDateSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('4')">
	        	  <#if cardBackAsk.createDateSort??&&cardBackAsk.createDateSort=="4">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	   <th width="8%"><a href="javascript:check('FORM_STATUS')">状态</a>
	        	  <span 
	        	  <#if cardBackAsk.formStatusSort??>
	        	  <#if cardBackAsk.formStatusSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('3')">
	        	  <#if cardBackAsk.formStatusSort??&&cardBackAsk.formStatusSort=="3">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="8%">操作人</th>
	              <th width="30%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as cardBackAsk>
            	<#if cardBackAsk.askforOrgId==staffId||(cardBackAsk.confirmOrgId==orgId&&cardBackAsk.formStatus!=0)>
            	<tr>
            		<td>${cardBackAsk.formNo!}</td>
	        	    <td>${(cardBackAsk.staff.name)!}</td>
	        	    <td>${cardBackAsk.confirmUserName!}</td>
	        	    <td>${cardBackAsk.confirmOrgName!}</td>
	        	    <td>${(cardBackAsk.confirmDate?string("yyyy-MM-dd"))!}</td>
	        	    <td>${(cardBackAsk.createDate?string("yyyy-MM-dd"))!}</td>
	        	    <td>
	        	    <#if cardBackAsk.formStatus??><#if (cardBackAsk.formStatus).toString()=='-1'>
	        	    <a href="javaScript:showBackReason('${cardBackAsk.backReason!}')"><@c.syscode syscodes = syslist code="${cardBackAsk.formStatus!}"/></a></td>
                    <#else>
                    <@c.syscode syscodes = syslist code="${cardBackAsk.formStatus!}"/>
                    </#if></#if>
	        	   </td>
	        	   <td>${(cardBackAsk.updateStaff.name)!}</td>
                    <td>
                        <#if cardBackAsk.formStatus==0><#if cardBackAsk.askforOrgId==staffId>
                        	<input class="btn_bg" type="button" value="提交" onclick="reset('${cardBackAsk.id}','6')">
	                        <input class="btn_bg" type="button" value="修改" onclick="edit('${cardBackAsk.id}')">
	                        <input class="btn_bg" type="button" value="删除" onclick="del('${cardBackAsk.id}')">
                   		</#if></#if>
                   		<#if cardBackAsk.formStatus==1><#if cardBackAsk.confirmOrgId==orgId><#if cardBackAsk.askforOrgId!=staffId>
                   			<input class="btn_bg" type="button" value="确认" onclick="reset('${cardBackAsk.id}','5')">
                   			<input class="btn_bg" type="button" value="拒绝" onclick="reBack('${cardBackAsk.id}')">
                   		</#if></#if></#if>
                   		<#if cardBackAsk.formStatus==3><#if cardBackAsk.askforOrgId==staffId>
                   			<input class="btn_bg" type="button" value="生成退卡单" onclick="createBackForm('${cardBackAsk.id}')">
                   		</#if></#if>
                   		<#if cardBackAsk.formStatus==-1><#if cardBackAsk.askforOrgId==staffId>
                   			<input class="btn_bg" type="button" value="入库" onclick="reset('${cardBackAsk.id}','8')">
                   		</#if></#if>
                    </td>
                </tr>
                </#if>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
        <!-- 弹出的div start -->
	    <div class="listPot1" id="closed" onmousedown="Drag(this, event)" style="display:none">
	     	<div class="closed" onmouseover="this.className='closed_hover'" onmouseout="this.className='closed_visited'">
	     	<a onclick = "document.getElementById('closed').style.display='none'" title="关闭">关闭</a>
	     	</div>
	     	<div class="listLine">
		     	<table>
			     	<tr>
			     		<td colspan="2">拒绝原因：</td>
			     	</tr>
		      		<tr>
		        		<td colspan="2"><textarea id="note" name="note" rows="5" cols="56"></textarea></td>
		      		</tr>
		      		<tr>
		        		<td colspan="2" id="noteTd">
		        			<input type="button" class="btn_bg" value="拒绝" onclick="refuse('7')"/>
	                    	<input type="button" class="btn_bg" value="取消" onclick="cancel();"/>
	                    </td>
		      		</tr>
		    	</table>
		  	</div>
		</div> 
		<!-- 弹出的div end -->
</html>