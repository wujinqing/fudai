<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('cardBack_form');
                form.action = "card_back!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cardBack_form');
                    form.action = "card_back!delete.action";
                    form.submit();
                }
            }
	        function reset(id,type) {
                document.getElementById('id').value = id;
                document.getElementById('type').value = type;
                var form = document.getElementById('cardBack_form');
                form.action = "card_back!reset.action";
                form.submit();
            }
            function check(sort){
	        	var createDateSort = document.getElementById("cardBack.createDateSort").value;
	        	var noSort = document.getElementById("cardBack.noSort").value;
	        	var formStatusSort = document.getElementById("cardBack.formStatusSort").value;
	        	var backTimeSort = document.getElementById("cardBack.backTimeSort").value;
	        	if(sort=="FORM_NO"){
	        		if(noSort!=""){
	        			document.getElementById("cardBack.noSort").value="";
	        		}else{
	        			document.getElementById("cardBack.noSort").value=sort;
	        		}
	        	}else if(sort=="FORM_STATUS"){
	        		if(formStatusSort!=""){
	        			document.getElementById("cardBack.formStatusSort").value="";
	        		}else{
	        			document.getElementById("cardBack.formStatusSort").value=sort;
	        		}
	        	}else if(sort=="BACK_TIME"){
	        		if(backTimeSort!=""){
	        			document.getElementById("cardBack.backTimeSort").value="";
	        		}else{
	        			document.getElementById("cardBack.backTimeSort").value=sort;
	        		}
	        	}else if(sort=="CREATE_DATE"){
	        		if(createDateSort!=""){
	        			document.getElementById("cardBack.createDateSort").value="";
	        		}else{
	        			document.getElementById("cardBack.createDateSort").value=sort;
	        		}
	        	}else if(sort=="1"){
	        		if(noSort=="1"){
	        			document.getElementById("cardBack.noSort").value="FORM_NO";
	        		}else{
	        			document.getElementById("cardBack.noSort").value=sort;
	        		}	
	        	}else if(sort=="2"){
	        		if(backTimeSort=="2"){
	        			document.getElementById("cardBack.backTimeSort").value="BACK_TIME";
	        		}else{
	        			document.getElementById("cardBack.backTimeSort").value=sort;
	        		}
	        	}
	        	else if(sort=="3"){
	        		if(formStatusSort=="3"){
	        			document.getElementById("cardBack.formStatusSort").value="FORM_STATUS";
	        		}else{
	        			document.getElementById("cardBack.formStatusSort").value=sort;
	        		}
	        	}else if(sort=="4"){
	        		if(createDateSort=="4"){
	        			document.getElementById("cardBack.createDateSort").value="CREATE_DATE";
	        		}else{
	        			document.getElementById("cardBack.createDateSort").value=sort;
	        		}
	        	}
	        	var form = document.getElementById("search_form");
	        	form.action="card_back!backList.action";
	        	form.submit();
	        }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="cardBack_form" name="cardBack_form">
            <input id="id" name="id" type="hidden"> 
            <input id="type" name="type" type="hidden">       
            <input id="formType" name="formType" type="hidden" value="${formType!}">
        </form>
        
     	<@u.search_bar action="card_back!backList.action">
        <input type="hidden" id="curPage" name="cardBack.curPage" value="${cardBack.curPage}" />
        <input type="hidden" id="cardBack.noSort" name="cardBack.noSort" value="${cardBack.noSort!}" />
        <input type="hidden" id="cardBack.formStatusSort" name="cardBack.formStatusSort" value="${cardBack.formStatusSort!}" />
        <input type="hidden" id="cardBack.backTimeSort" name="cardBack.backTimeSort" value="${cardBack.backTimeSort!}" />
        <input type="hidden" id="cardBack.createDateSort" name="cardBack.createDateSort" value="${cardBack.createDateSort!}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%">退卡单号：</td>
        		  <td width="35%"><input type="text" name="cardBack.formNo" value="${cardBack.formNo!}"></td>
        	      <td width="15%">状态：</td>
        		  <td width="35%">
	        		  <select name="cardBack.formStatus" id="cardBack.formStatus">
				    	  <option value="">---请选择---</option>
				    	  <#if sysList??>
				    	  	<#list sysList as formStatus>
				    	  		<option value="${(formStatus.code)!}"<#if cardBack.formStatus??><#if (cardBack.formStatus).toString()==formStatus.code>selected</#if></#if>>${(formStatus.codeName)!}</option>
				    	  	</#list>
				    	  </#if>
				      </select>
        		  </td>
        	</tr>
        	<tr>
        		 <td width="15%">创建时间：</td>
        		 <td width="35%" class="txtLeft">&nbsp;<input type="text"  name="cardBack.startTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBack.startTime??>value="${(cardBack.startTime?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text" name="cardBack.endTime" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBack.endTime??>value="${(cardBack.endTime?string('yyyy-MM-dd'))!}"</#if>></td>
        		 <td width="15%">退卡时间：</td>
        		 <td width="35%" class="txtLeft">&nbsp;<input type="text"  name="cardBack.startDate" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBack.startDate??>value="${(cardBack.startDate?string('yyyy-MM-dd'))!}"</#if>>&nbsp;至&nbsp;<input type="text" name="cardBack.endDate" size="13" onclick="WdatePicker({isShowClear:true})" <#if cardBack.endDate??>value="${(cardBack.endDate?string('yyyy-MM-dd'))!}"</#if>></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="营销退卡单列表">
        	<#--<@u.title_bar_btn type="new" onclick="edit();"/>-->
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="10%"><a href="javascript:check('FORM_NO')">退卡单号</a>
	        	  <span 
	        	  <#if cardBack.noSort??>
	        	  <#if cardBack.noSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('1')">
	        	  <#if cardBack.noSort??&&cardBack.noSort=="1">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="10%">退卡机构</th>
	        	  <th width="10%">入库机构</th>
	        	  <th width="10%">经手人</th>
	        	  <th width="10%"><a href="javascript:check('BACK_TIME')">退卡时间</a>
	        	  <span 
	        	  <#if cardBack.backTimeSort??>
	        	  <#if cardBack.backTimeSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('2')">
	        	  <#if cardBack.backTimeSort??&&cardBack.backTimeSort=="2">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="10%"><a href="javascript:check('FORM_STATUS')">状态</a>
	        	  <span 
	        	  <#if cardBack.formStatusSort??>
	        	  <#if cardBack.formStatusSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('3')">
	        	  <#if cardBack.formStatusSort??&&cardBack.formStatusSort=="3">
	        	  <img id="imgSrc" src="${base}/images/sort_up.png"/>
	        	  <#else>
	        	  <img id="imgSrc" src="${base}/images/sort_down.png"/>
	        	  </#if>
	        	  </a>
	        	  </span>
	        	  </th>
	        	  <th width="9%"><a href="javascript:check('CREATE_DATE')">创建时间</a>
	        	  <span 
	        	  <#if cardBack.createDateSort??>
	        	  <#if cardBack.createDateSort!="">
	        	  style="font-size:10px;"
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>
	        	  <#else>
	        	  style="font-size:10px;display:none"
	        	  </#if>>
	        	  <a href="javascript:check('4')">
	        	  <#if cardBack.createDateSort??&&cardBack.createDateSort=="4">
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
            	<#list page.dataList as cardBack>
            	<tr>
            		<td>${cardBack.formNo!}</td>
            		<td>${cardBack.backerName!}</td>
            		<td>${cardBack.getinName!}</td>
            		<td>${cardBack.reciverName!}</td>
            		<td>${(cardBack.createDate?string("yyyy-MM-dd"))!}</td>
	        	    <td><@c.syscode syscodes =sysList code="${cardBack.formStatus!}"/></td>
	        	    <td>${(cardBack.createDate?string("yyyy-MM-dd"))!}</td>
                    <td>${(cardBack.updateStaff.name)!}</td>
                    <td>
                    	<#if cardBack.formStatus==0><#if cardBack.getinId==orgId&&(cardBack.backAsk.createUserId)!=staffId>
                       	<input class="btn_bg" type="button" value="确认退卡" onclick="reset('${cardBack.id}','3')">
                        </#if></#if>
                        <#if cardBack.formStatus==1><#if cardBack.getinId==orgId>
                       	<input class="btn_bg" type="button" value="入库" onclick="reset('${cardBack.id}','4')">
                        </#if></#if>	
                    </td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
</html>