<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>历史消息</title>
        <@u.css src="style.css"/>
        <link href="${base}/js/dialog/dialog.css" rel="stylesheet" type="text/css" />
        <@u.rootjs src="jquery-1.4.2.min.js"/>
       	<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
       	<script type='text/javascript' src='${base}/js/dialog/dialog.js'></script>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('message_form');
                form.action = "message!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('message_form');
                    form.action = "message!delete.action";
                    form.submit();
                }
            }
            function viewImg(t){
				var src=$(t).attr("src");
			//	window.open(src,'_blank');
				new Dialog('<img src="'+src+'" id=""  style="cursor:pointer"  />',{title:'图片预览'}).show();
			}
			function checkDate(a){
            	var st=$("#message_startTime").val();
            	var et=$("#message_endTime").val();     
            	if(a==1){
            		 if(et!=''){
            		 	if(st>et){
            		 		alert('起始日期不能大于结束日期，请重新选择!');
            		 		$("#message_startTime").val('');
            		 		return false;
            		 	}
            		 }
            	}
            	if(a==2){
            		 if(st!=''){
            		 	if(et<st){
            		 		alert('结束日期不能小于起始日期，请重新选择!');
            		 		$("#message_endTime").val('');    
            		 		return false;
            		 	}
            		 }
            	}
            }
            
            $(document).ready(function(){
            	$("#search_form").submit(function(){
            		$(this).attr("method","get");
            
	            });
	            $("#res_btn").click(function(){
	            	$("#message_startTime").val("");
	            	$("#message_endTime").val("");
	            });
            
            });
            
            
            
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="message_form" name="message_form">
            <input id="id" name="id" type="hidden">     
        </form>
        
     	<@u.search_bar action="i_message!viewUserMemberMsgList.action">
        <input type="hidden" id="curPage" name="message.curPage" value="${message.curPage}" />
        <input type="hidden" name="message.uid_1" value="${message.uid_1!}" />
        <input type="hidden" name="message.uid_2" value="${message.uid_2!}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%" align="right">时间：</td>
        		  <td width="40%" align="left">
                     <input type="text" id="message_startTime" onchange="checkDate(1)" name="message.startTime" value="<#if message.startTime ??>${message.startTime?string('yyyy-MM-dd HH:mm:ss')}</#if>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" size="20"/>到
	                 <input type="text" id="message_endTime" onchange="checkDate(2)" name="message.endTime" value="<#if message.endTime ??>${message.endTime?string('yyyy-MM-dd HH:mm:ss')}</#if>" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:true,readOnly:true})" size="20"/>
	              </td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="消息列表">
        	<#--
        	<@u.title_bar_btn type="new" onclick="edit();"/>
        	-->
        	<input style="visibility:hidden">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <#--
            <tr>
	        	  <th width="30%">发送者</th>
	        	  <th width="30%">发送时间</th>
	        	  <th width="30%">内容</th>
            </tr>
            -->
            <#if (page??&&page.dataList??)>
            	<#list page.dataList as message>
            	
            	<#if mapGroupDate??&&mapGroupDate.get('${message.id}')??>
            		<tr>	
            			<td align="left" style="border-bottom-color:#8ec3eb">
            				<span style="color:blue;font-weight:bold">日期:${mapGroupDate.get('${message.id}')!}</span>
            			</td>
            		</tr>
            	</#if>
            	
            	<tr>
            		<td align="left" style="border-bottom-color:white">
            			<span style="color:#42b475">
	            			<#if "${message.sendType!}"=="1">${message.uname_1!}&nbsp;${(message.getSendTimeStr())!}</#if>
            			</span>
    					<span style="color:#006efe">
            				<#if "${message.sendType!}"=="2">${message.uname_2!}&nbsp;${(message.getSendTimeStr())!}</#if>
            			</span>
            		</td>
            	</tr>	
        		<tr>
            		<td align="left">
            			<span style="margin-left:10px;margin-right:10px">
            				
	            			<#if "${message.contentType!}"=="0">
	            				${message.content!}
	            			</#if>
	            			<#if "${message.contentType!}"=="1">
	            				<img src="${base}/imphotos/${message.filePath!}" width="120px" onclick="viewImg(this)" style="cursor:pointer" />
	            			</#if>
	            			<#if "${message.contentType!}"=="2">
	            				<embed height="24px" width="261px" allowscriptaccess="always" wmode="transparent" 
	            				type="application/x-shockwave-flash" 
	            				src="${base}/swf/douban_music.swf?url=${base}/imaudios/${message.filePath!}&amp;autoplay=0">
	            			</#if>
            			</span>
            		</td>
                </tr>
            	</#list>
            	<#else>
            		<tr>
            			<td >暂无记录!</td>
            		</tr>
            </#if>
        </table>
        </div>        
        <#if page??>
        <@u.paginate page=page/>
        </#if>
    </body>    
</html>