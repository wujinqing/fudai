<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>发卡单入库列表</title>
        <@u.css src="style.css"/>
         <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('cardOut_form');
                form.action = "card_out!edit.action";
                form.submit();
            }
             function input(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('cardOut_form');
                form.action = "card_out!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!delete.action";
                    form.submit();
                }
            }
            function tijiao(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('cardOut_form');
                form.action = "card_out!present.action";
                form.submit();
            }
            function ruku(id,type,orderId) {
                if(confirm("确认入库？")) {
                    document.getElementById('id').value = id;
                    document.getElementById('sort').value = type;
                    document.getElementById('orderId').value = orderId;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!storage.action";
                    form.submit();
                }
            }
            function tuihui(id) {
                if(confirm("确认退回？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardOut_form');
                    form.action = "card_out!showCardOut.action";
                    form.submit();
                }
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
            	form.action="card_out!cardOutInList.action";
            	form.submit();
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="cardOut_form" name="cardOut_form">
            <input id="id" name="id" type="hidden" value="${wOrgId!}"> 
            <input id="getinId" name="getinId" type="hidden"> 
            <input id="sort" name="sort" type="hidden">   
            <input id="orderId" name="orderId" type="hidden">
            <input id="formType" name="formType" type="hidden" value="${formType!}">       
        </form>
        
     	<@u.search_bar action="card_out!cardOutInList.action">
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
        	      <td width="15%">出库单号：</td>
        		  <td width="35%"><input type="text" name="cardOut.formNo" value="${cardOut.formNo!}"></td>
        	      <td width="15%">状态：</td>
        		  <td width="35%">
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
        		<td width="15%">创建时间：</td>
        		<td width="35%" class="txtLeft">&nbsp;<input type="text" name="cardOut.startTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardOut.startTime??>value="${(cardOut.startTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text"  name="cardOut.endTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardOut.endTime??>value="${(cardOut.endTime?string('yyyy-MM-dd'))!}"</#if>></td>
        		<td width="15%">入库时间：</td>
        		<td width="35%" class="txtLeft">&nbsp;<input type="text" name="cardOut.beginTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardOut.beginTime??>value="${(cardOut.beginTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text"  name="cardOut.eveTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardOut.eveTime??>value="${(cardOut.eveTime?string('yyyy-MM-dd'))!}"</#if>></td>
        	</tr>
        	<tr>
        		<td width="15%">领卡机构：</td>
        		<td width="35%">
        		 <select name="cardOut.getinId" id="cardOut.getinId">
			    	  <option value="">---请选择---</option>
	        		  <#if orgList??>
	        			<#list orgList as org>
	        				<option value="${(org.id)!}"<#if cardOut.getinId??><#if (cardOut.getinId)==org.id>selected</#if></#if>>${(org.name)!}</option>
	        			</#list>
	        		  </#if>
        		 </select>
        		</td>
        	</tr>
        	
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="${sort!}入库列表">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="13%"><a href="javascript:check('FORM_NO')">出库单号</a>
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
	        	  <th width="12%">发放方</th>
	        	  <th width="12%">领取方</th>
	        	  <th width="15%"><a href="javascript:check('STORE_IN_TIME')">入库时间</a>
				  <span 
	        	  <#if cardOut.storeInTimeSort??>
	        	  <#if cardOut.storeInTimeSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('4')">
	        	  <#if cardOut.storeInTimeSort??&&cardOut.storeInTimeSort=="4">
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
	              <th width="25%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as cardOut>
            	<#if (cardOut.getinId==wOrgId&&cardOut.formStatus!=0)||cardOut.outId==wOrgId>
            	<tr>
            	 	<td><a href="${base}/sm/card_out!viewOneOut.action?id=${cardOut.id!}" target="_blank">${cardOut.formNo!}</a></td>
            	 	<td><a href="${base}/sm/card_out!showCardCount.action?id=${cardOut.id!}" target="_blank">${cardOut.cardCount!}</a></td>
	        	    <td>${cardOut.outName!}</td>
	        	    <td>${cardOut.getinName!}</td>
	        	    <td>${(cardOut.storeInTime?string("yyyy-MM-dd HH:ss"))!}</td>
	        	    <td>${(cardOut.createDate?string("yyyy-MM-dd"))!}</td>
	        	    <td><@c.syscode syscodes = cardStatus code="${cardOut.formStatus!}"/></td>
                    <td>
	                     <#if wOrgId==cardOut.getinId><#if cardOut.formStatus==1><input class="btn_bg" type="button" value="入库" onclick="ruku('${cardOut.id}','1','${(cardOut.cardOrder.id)!}')"></#if></#if>
	                     <#if wOrgId==cardOut.outId><#if cardOut.formStatus==-1><input class="btn_bg" type="button" value="入库" onclick="ruku('${cardOut.id}','2','${(cardOut.cardOrder.id)!}')"></#if></#if>
                    </td>
                </tr>
                </#if>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
</html>