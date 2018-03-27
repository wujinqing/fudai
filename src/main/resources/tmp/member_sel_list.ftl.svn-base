<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>会员列表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/> 
        <@u.rootjs src="jquery-1.4.2.min.js"/>   
        <@u.rootjs src="jquery.validate.js"/>
        <@u.rootjs src="jquery.validate.message_cn.js"/>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>    
          function selectAll() {
                var ids = document.getElementsByName("ids");
                var isCheck =  document.getElementById("checkAll1");
                if(isCheck.checked){
                	for(var i=0;i<ids.length;i++){
                		ids[i].checked = true;
                	}
                }else{
                	for(var i=0;i<ids.length;i++){
                		ids[i].checked = false;
                	}
                }
            }
           function resetAll(){
           		var ids = document.getElementsByName("ids");
           		var isCheck =  document.getElementById("checkAll1");
           		var flag = 0;
           		for(var i=0;i<ids.length;i++){
            		if(ids[i].checked){
            			flag++;
            		}
            	}
            	if(flag==ids.length){
            		isCheck.checked = true;
            	}else{
            		isCheck.checked = false;
            	}
           }
           
          function selectOne(id){
           		document.getElementById("id").value = id;
           		var form = document.getElementById("member_form");
           		form.action="${base}/mh/member!saveOneMember.action";
           		form.submit();
           }
           
          function selectSome(){
           		var ids = document.getElementsByName("ids");
           		var check="";
           		var form = document.getElementById("member_form");
           		for(var i=0;i<ids.length;i++){
           			if(ids[i].checked){
            			check = check+ids[i].value+",";
            		}
           		}
           		if(check==null||check==""){
           			alert("至少选择一个会员");
           			return false;
           		}else{
           			document.getElementById("checkList").value = check;
           			form.action="${base}/mh/member!saveSomeMember.action";
           			form.submit();
           		}
           }	
           	function back(){
        		alert("操作完成！");
        		window.opener.gotoPage(1);
        		window.close();
        	} 
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="member_form" name="member_form" target="innerframe">
            <input id="id" name="id" type="hidden">  
            <input id="checkList" name="checkList" type="hidden">      
            <input type="hidden" id="chooseType" name="chooseType" value="${(member.chooseType)!}"/> 
        </form>
        
     	<@u.search_bar action="${base}/mh/member!selList.action">
        <input type="hidden" id="curPage" name="member.curPage" value="${member.curPage}" />
         <input type="hidden" id="member_chooseType" name="member.chooseType" value="${(member.chooseType)!}"/>  
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%" align="right">用户名：</td>
        		  <td width="35%" align="left"><input type="text" name="member.userName" value="${(member.userName)!}"></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="会员列表">
        	<@u.title_bar_btn type="check" onclick="selectSome();"/>
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr><th width="5%"><label class="CheckTxt">选择</label><input type="checkbox" id="checkAll1" name="checkAll1" onclick='javascript:selectAll();'></th>
	        	   <th width="10%">用户名</th>
                  <th width="10%">空间名</th>
                  <th width="10%">头像</th>
                  <th width="10%">减少体重/kg</th>
                  <th width="10%">空间浏览数</th>
	        	  <th width="10%">瘦身宣言</th>
	        	  <th width="10%">创建时间</th>
	        	  <th width="10%">更新时间</th>
	        	  <th width="10%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as member>
            	<tr>
            		  <td><input type="checkbox" name="ids"  id="member.id" value="${(member.id)!}" onclick="javascript:resetAll()"></td>
            		  <td>${(member.userName)!}</td>
                 	  <td>${(member.spaceName)!}</td>
            	      <td>
            	               <#if (member??&&member.headPortrait??)>
									<img src="${base}/${(member.headPortrait)!}" width="80" height="80" />
								<#else>
									未上传
								</#if>
            	      </td>
            	      <td>${(member.loseWeight)!}KG</td>
            	      <td>${(member.pageView?default('0'))!}</td>
            	      <td>${(member.declaration)!}</td>
            	      <td>${(member.createDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
            	      <td>${(member.updateDate?string('yyyy-MM-dd HH:mm:ss'))!}</td>
            	      <td>
                   	   <input class="btn_bg" type="button" value="选择" onclick="selectOne('${(member.id)!}')">
                    </td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
        <iframe frameborder="0" src="" name="innerframe" id="innerframe" height="0" width="0"></iframe>
        </body>
</html>