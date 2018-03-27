<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>机构发放营销列表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.js src="drag.js"/> 
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>        
            function input(id) {
                var form = document.getElementById('cardOut_form');
                document.getElementById('id').value = id;
                form.action = "card_out!cardToYinX.action";
                form.submit();
            }
            function edit(id) {
                var form = document.getElementById('cardOut_form');
                document.getElementById('id').value = id;
                form.action = "card_out!cardToYinX.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!deleteFaFangDan.action";
                    form.submit();
                }
            }
            function tijiao(id) {
                if(confirm("确认提交？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!tijiao.action";
                    form.submit();
                }
            }
            function ruku(id){
                if(confirm("确认入库？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!setIn.action";
                    form.submit();
                }
            }
            function yXioSure(id,type) {
                if(confirm("确定领取？")) {
                    document.getElementById('id').value = id;
                    document.getElementById('type').value = type;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!yXioSure.action";
                    form.submit();
                }
            }
            function refuse(type){
            	var backReason= document.getElementById("note").value;
            	document.getElementById('type').value = type;
            	document.getElementById('backReason_1').value = backReason;
            	var form = document.getElementById('cardOut_form');
            	form.action = "card_out!yXioSure.action";
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
            	var storeInTimeSort = document.getElementById("cardOut.storeInTimeSort").value;
            	var createDateSort = document.getElementById("cardOut.createDateSort").value;
            	var noSort = document.getElementById("cardOut.noSort").value;
            	var getinTimeSort = document.getElementById("cardOut.getinTimeSort").value;
            	var formStatusSort = document.getElementById("cardOut.formStatusSort").value;
            	var cardCountSort = document.getElementById("cardOut.cardCountSort").value;
            	var storeOutTimeSort = document.getElementById("cardOut.storeOutTimeSort").value;
            	if(sort=="FORM_NO"){
            		if(noSort!=""){
            			document.getElementById("cardOut.noSort").value="";
            		}else{
            			document.getElementById("cardOut.noSort").value=sort;
            		}
            	}else if(sort=="CARD_COUNT"){
            		if(cardCountSort!=""){
            			document.getElementById("cardOut.cardCountSort").value="";
            		}else{
            			document.getElementById("cardOut.cardCountSort").value=sort;
            		}
            	}else if(sort=="FORM_STATUS"){
            		if(formStatusSort!=""){
            			document.getElementById("cardOut.formStatusSort").value="";
            		}else{
            			document.getElementById("cardOut.formStatusSort").value=sort;
            		}
            	}else if(sort=="STORE_OUT_TIME"){
            		if(storeOutTimeSort!=""){
            			document.getElementById("cardOut.storeOutTimeSort").value="";
            		}else{
            			document.getElementById("cardOut.storeOutTimeSort").value=sort;
            		}
            	}
            	else if(sort=="STORE_IN_TIME"){
            		if(storeInTimeSort!=""){
            			document.getElementById("cardOut.storeInTimeSort").value="";
            		}else{
            			document.getElementById("cardOut.storeInTimeSort").value=sort;
            		}
            	}
            	else if(sort=="GETIN_TIME"){
            		if(getinTimeSort!=""){
            			document.getElementById("cardOut.getinTimeSort").value="";
            		}else{
            			document.getElementById("cardOut.getinTimeSort").value=sort;
            		}
            	}else if(sort=="CREATE_DATE"){
            		if(createDateSort!=""){
            			document.getElementById("cardOut.createDateSort").value="";
            		}else{
            			document.getElementById("cardOut.createDateSort").value=sort;
            		}
            	}else if(sort=="1"){
            		if(noSort=="1"){
            			document.getElementById("cardOut.noSort").value="FORM_NO";
            		}else{
            			document.getElementById("cardOut.noSort").value=sort;
            		}	
            	}else if(sort=="2"){
            		if(cardCountSort=="2"){
            			document.getElementById("cardOut.cardCountSort").value="CARD_COUNT";
            		}else{
            			document.getElementById("cardOut.cardCountSort").value=sort;
            		}
            	}else if(sort=="3"){
            		if(storeOutTimeSort=="3"){
            			document.getElementById("cardOut.storeOutTimeSort").value="STORE_OUT_TIME";
            		}else{
            			document.getElementById("cardOut.storeOutTimeSort").value=sort;
            		}
            	}else if(sort=="4"){
            		if(storeInTimeSort=="4"){
            			document.getElementById("cardOut.storeInTimeSort").value="STORE_IN_TIME";
            		}else{
            			document.getElementById("cardOut.storeInTimeSort").value=sort;
            		}
            	}else if(sort=="5"){
            		if(getinTimeSort=="5"){
            			document.getElementById("cardOut.getinTimeSort").value="GETIN_TIME";
            		}else{
            			document.getElementById("cardOut.getinTimeSort").value=sort;
            		}
            	}
            	else if(sort=="6"){
            		if(formStatusSort=="6"){
            			document.getElementById("cardOut.formStatusSort").value="FORM_STATUS";
            		}else{
            			document.getElementById("cardOut.formStatusSort").value=sort;
            		}
            	}else if(sort=="7"){
            		if(createDateSort=="7"){
            			document.getElementById("cardOut.createDateSort").value="CREATE_DATE";
            		}else{
            			document.getElementById("cardOut.createDateSort").value=sort;
            		}
            	}
            	var form = document.getElementById("search_form");
            	form.action="${actions}";
            	form.submit();
            }
            //根据部门 取得员工
            function getStaff(department){
		    	var orgId=document.getElementById("org_id").value;
			    document.getElementById('staff_id').options.length=1;
		        OrgAjaxService.getAllStaff(orgId,department.value,function(data){
		            if(data !=""){
			           for(var i=0;i<data.length;i++){
				          var ops = new Option(data[i].name,data[i].id);
				          document.getElementById('staff_id').options[i+1] = ops;
		               }
		             }
		        });
		    }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="cardOut_form" name="cardOut_form">
            <input id="id" name="id" type="hidden" value=""> 
            <input id="getinId" name="getinId" type="hidden"> 
            <input id="sort" name="sort" type="hidden">  
            <input id="type" name="type" type="hidden">  
            <input id="orderId" name="orderId" type="hidden">
            <input id="backReason_1" name="backReason" type="hidden">   
            <input id="formType" name="formType" type="hidden" value="${formType!}">
            <input type="hidden" id="org_id" name="org_id" value="${org.id!}"> 
        </form>
        
     	<@u.search_bar action="${actions}">
        <input type="hidden" id="curPage" name="cardOut.curPage" value="${cardOut.curPage}" />
        <input type="hidden" id="cardOut.createDateSort" name="cardOut.createDateSort" value="${cardOut.createDateSort!}" />
        <input type="hidden" id="cardOut.noSort" name="cardOut.noSort" value="${cardOut.noSort!}" />
        <input type="hidden" id="cardOut.formStatusSort" name="cardOut.formStatusSort" value="${cardOut.formStatusSort!}" />
        <input type="hidden" id="cardOut.getinTimeSort" name="cardOut.getinTimeSort" value="${cardOut.getinTimeSort!}" />
        <input type="hidden" id="cardOut.storeInTimeSort" name="cardOut.storeInTimeSort" value="${cardOut.storeInTimeSort!}" />
        <input type="hidden" id="cardOut.cardCountSort" name="cardOut.cardCountSort" value="${cardOut.cardCountSort!}" />
        <input type="hidden" id="cardOut.storeOutTimeSort" name="cardOut.storeOutTimeSort" value="${cardOut.storeOutTimeSort!}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%" class="txtRight">出库单号：</td>
        		  <td width="35%" class="txtLeft"><input type="text" name="cardOut.formNo" value="${cardOut.formNo!}"></td>
        	      <td width="15%" class="txtRight">状态：</td>
        		  <td width="35%" class="txtLeft">
        		  <select name="cardOut.formStatus" id="cardOut.formStatus">
			    	  <option value="">---请选择---</option>
			    	  <#if cardStatus??>
			    	  	<#list cardStatus as cardStatus>
			    	  		<option value="${(cardStatus.code)!}"<#if cardOut.formStatus??><#if (cardOut.formStatus).toString()==cardStatus.code>selected</#if></#if>>${(cardStatus.codeName)!}</option>
			    	  	</#list>
			    	  </#if>
			      </select>
        		  </td>
        	</tr>
        	<tr>
    	    	  <td width="15%" class="txtRight">部门：</td>
    	    	  <td width="35%" class="txtLeft">
    	    	  <select name="cardOut.departmentId" onchange="getStaff(this)">
    	    	  	<option value="">---请选择---</option>
				    <#if departmentList??>
					    <#list departmentList as depart> 
					       <option value="${depart.id}" <#if cardOut.departmentId??><#if cardOut.departmentId=depart.id>selected</#if></#if>>${depart.name!}</option>
					    </#list>
				    </#if>
    	    	  </select>
    	    	  </td>
        	      <td width="15%" class="txtRight">领取方：</td>
			      <td width="35%" class="txtLeft">
			      <select name="cardOut.getinUserId" id="staff_id">
				  <option value="">---请选择---</option>
				  <#if (staffList)??>
		            	<#list staffList as staff>
						<option value="${staff.id!}"<#if cardOut.getinUserId??><#if cardOut.getinUserId==staff.id>selected</#if></#if>>${staff.name!}</option>
						</#list>
		          </#if>
				  </select>
				  </td>
        	</tr>
        	<tr>
        		<td width="15%">创建时间：</td>
        		<td width="35%" class="txtLeft">&nbsp;<input type="text" name="cardOut.startTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardOut.startTime??>value="${(cardOut.startTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text"  name="cardOut.endTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardOut.endTime??>value="${(cardOut.endTime?string('yyyy-MM-dd'))!}"</#if>></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="${sort!}列表">
        	<#if sort=="机构发放单"><@u.title_bar_btn type="new" onclick="input('');"/></#if>
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
            <th width="13%"><a href="javascript:check('FORM_NO')">发放单号</a>
	        	  <span 
	        	  <#if cardOut.noSort??>
	        	  <#if cardOut.noSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('1')">
	        	  <#if cardOut.noSort??&&cardOut.noSort=="1">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="8%"><a href="javascript:check('CARD_COUNT')">会员卡数量</a>
	        	  <span 
	        	  <#if cardOut.cardCountSort??>
	        	  <#if cardOut.cardCountSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('2')">
	        	  <#if cardOut.cardCountSort??&&cardOut.cardCountSort=="2">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="10%">发放方</th>
	        	  <th width="10%">部门</th>
	        	  <th width="10%">领取方</th>
	        	  <th width="13%"><a href="javascript:check('GETIN_TIME')">领取时间</a>
				  <span 
	        	  <#if cardOut.getinTimeSort??>
	        	  <#if cardOut.getinTimeSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('5')">
	        	  <#if cardOut.getinTimeSort??&&cardOut.getinTimeSort=="5">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>	        	  
	        	  </th>
	        	  <th width="10%"><a href="javascript:check('CREATE_DATE')">创建时间</a>
	        	  <span 
	        	  <#if cardOut.createDateSort??>
	        	  <#if cardOut.createDateSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('7')">
	        	  <#if cardOut.createDateSort??&&cardOut.createDateSort=="7">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="10%"><a href="javascript:check('FORM_STATUS')">状态</a>
	        	  <span 
	        	  <#if cardOut.formStatusSort??>
	        	  <#if cardOut.formStatusSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('6')">
	        	  <#if cardOut.formStatusSort??&&cardOut.formStatusSort=="6">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="10%">操作员</th>
	              <th width="25%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as cardOut>
            	<#if cardOut.outId==wOrgId||cardOut.getinUserId==wOrgId>
            	<tr>
            	 	<td><a href="${base}/sm/card_out!viewOne.action?id=${cardOut.id!}" target="_blank">${cardOut.formNo!}</a></td>
            	 	<td><a href="${base}/sm/card_out!showCardCount.action?id=${cardOut.id!}" target="_blank">${cardOut.cardCount!}</a></td>
	        	    <td>${cardOut.outName!}</td>
	        	    <td>${cardOut.department!}</td>
	        	    <td>${(cardOut.getinUser.name)!}</td>
	        	    <td>${(cardOut.getinTime?string("yyyy-MM-dd HH:ss"))!}</td>
	        	    <td>${(cardOut.createDate?string("yyyy-MM-dd"))!}</td>
	        	    <td>
	        	    <#if cardOut.formStatus??><#if (cardOut.formStatus).toString()=='-1'>
	        	    <a href="javaScript:showBackReason('${cardOut.backReason!}')"><@c.syscode syscodes = cardStatus code="${cardOut.formStatus!}"/></a></td>
                    <#else>
                    <@c.syscode syscodes = cardStatus code="${cardOut.formStatus!}"/>
                    </#if></#if>
                    </td>
                    <td>${(cardOut.updateStaff.name)!}</td>
                    <td>
	                   	 <#if wOrgId==cardOut.outId>
	                   	 <#if cardOut.formStatus==0> 
		                   	 <input class="btn_bg" type="button" value="提交" onclick="tijiao('${cardOut.id}')">
		                     <input class="btn_bg" type="button" value="修改" onclick="edit('${cardOut.id}')">
		                     <input class="btn_bg" type="button" value="删除" onclick="del('${cardOut.id}')">
	                     </#if>
	                     </#if>
	                     <#if wOrgId==cardOut.outId>
	                     <#if cardOut.formStatus==-1>
		                     <input class="btn_bg" type="button" value="入库" onclick="ruku('${cardOut.id}')">
		                     <input class="btn_bg" type="button" value="删除" onclick="del('${cardOut.id}')">
	                     </#if>
	                     </#if>
                    	<#if cardOut.getinUserId??>
                    	<#if wOrgId==cardOut.getinUserId>
                    	<#if cardOut.formStatus==1> 
	                    	 <input class="btn_bg" type="button" value="已领取" onclick="yXioSure('${cardOut.id}','3')">
	                    	 <input class="btn_bg" type="button" value="拒绝" onclick="reBack('${cardOut.id}')">
                    	 </#if>
                    	 </#if>
                    	 </#if>
                    	<#-- <#if cardOut.getinUserId??>
                    	 <#if wOrgId==cardOut.getinUserId>
                    	 <#if cardOut.formStatus==0> 
                    	 <input class="btn_bg" type="button" value="确认" onclick="yXioSure('${cardOut.id}','1')">
                    	 </#if>
                    	 </#if>
                    	 </#if>-->
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
		        			<input type="button" class="btn_bg" value="拒绝" onclick="refuse('2')"/>
	                    	<input type="button" class="btn_bg" value="取消" onclick="cancel();"/>
	                    </td>
		      		</tr>
		    	</table>
		  	</div>
		</div> 
		<!-- 弹出的div end -->
</html>