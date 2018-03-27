<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>提供选卡的卡的列表</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
		<script type='text/javascript' src='${base}/dwr/interface/MemberCardAjaxService.js'></script>
        <script type='text/javascript'>        
            function createCard() {
             	var form = document.getElementById("memberCard_form");
             	//var check=document.getElementById("checkList").value;
             	var ids = document.getElementsByName("ids");
            	var check="";
            	var old_check = document.getElementById("checkList").value;
        		for(var i=0;i<ids.length;i++){
             		if(ids[i].checked){
             			check = old_check+check+ids[i].value+",";
             		}
             	}
             	document.getElementById("checkList").value=check;
      //       	if(check==""&&cardNom==""&&cardNomber==""){
       //      		alert("至少选择一张卡");
       //      		return;
       //      	}
        //     	if(cardNom==""&&cardNomber!=""){
        //     		alert("请选择一个区间");
        //     		return;
         //    	}
          //   	if(cardNom!=""&&cardNomber==""){
           //  		alert("请选择一个区间");
           //  		return;
            // 	}
            // 	if(check!=""&&cardNom!=""&&cardNomber!=""){
             //		alert("“勾选”与“填写区间”请选择一种");
             //		return;
             //	}
             	if(check==""){
             		alert("至少选择一张卡");
             		return;
             	}
             	if(confirm("确认选择?")){
             	//	window.opener.document.getElementById("cardNom_o").value=cardNom;
         		//	window.opener.document.getElementById("cardNomber_o").value=cardNomber;
             		window.opener.document.getElementById("checkList").value=check;
             		var orderId = document.getElementById("oid").value;
             		MemberCardAjaxService.getMemberCardByIds(check,orderId,function(data){
             			var flag=1;
             			var cardListHtml="";
             			var check_1="";
	        			var check_2="";
             			var cardList = data["memberCardList"];
             			var orderDetailList = data["orderDetailList"];
             			if(orderDetailList!=""&&orderDetailList!=null){
	        				cardListHtml+="<table><tr><td colspan=\"20\" style=\"color:red;\">已有";
	        				for(var j=0;j<orderDetailList.length;j++){
	        					cardListHtml+=""+orderDetailList[j].cardScore+"的积分:"+orderDetailList[j].sendCount+"张,";
	    						check_1 = check_1+orderDetailList[j].id+",";
	    						check_2 = check_2+orderDetailList[j].sendCount+",";
	    					}
	        				cardListHtml+="被选择.</td></tr>";
	        				cardListHtml+="<tr><td colspan=\"20\" style=\"color:red;\">还缺";
	        				for(var j=0;j<orderDetailList.length;j++){
	        					cardListHtml+=""+orderDetailList[j].cardScore+"的积分:"+orderDetailList[j].margin+"张,";
	    					}
	        				cardListHtml+=".</td></tr>";
		        		}else{
		        			cardListHtml+="<table>";
		        		}
		        		if(cardList!=""){
		        			cardListHtml+="<tr><td colspan=\"20\" style=\"color:red;\">共有"+cardList.length+"张卡被选择</td></tr></table>";
		        		}
		        		cardListHtml+="<table width=\"100%\" border=\"0\" cellspacing=\"0\">";
		        		cardListHtml+="<tr><th width=\"10%\">序号</th><th width=\"20%\">卡号</th><th width=\"20%\">分值</th>";
		        		cardListHtml+="<th width=\"20%\">创建时间</th><th width=\"10%\">创建人</th>";
		        		cardListHtml+="<th width=\"25%\">所属机构</th></tr>";
		        		
		        		if(cardList!=""){
	        			for(var i=0;i<cardList.length;i++){
	        				cardListHtml+="<tr><td>"+flag+"</td><td>"+cardList[i].cardNo+"</td><td>"+cardList[i].score+"</td>";
	        				cardListHtml+="<td>"+cardList[i].date+"</td><td>"+cardList[i].createUser.name+"</td>";
	        				cardListHtml+="<td>"+cardList[i].ownerOrg.name+"</td></tr>";
	        				check=check+cardList[i].id+",";
	        				flag++;
	        			}
	        		}
	        		window.opener.document.getElementById("cardListHtml").innerHTML=cardListHtml;
	        		//window.opener.document.getElementById("checkList").value=check;
	        		window.opener.document.getElementById("checkList_1").value = check_1;
	        		window.opener.document.getElementById("checkList_2").value = check_2;
	        		if(data["result"]=='true')
             			window.close();
             		});
             	}
            }
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
            function check(){
            	var ids = document.getElementsByName("ids");
            	var check="";
            	var old_check = document.getElementById("checkList").value;
        		for(var i=0;i<ids.length;i++){
             		if(ids[i].checked){
             			check = old_check+check+ids[i].value+",";
             		}
             	}
             	document.getElementById("checkList").value=check;
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="memberCard_form" name="memberCard_form">
            <input id="id" name="id" type="hidden">
            <input id="cardNom_o" name="cardNom" type="hidden">
            <input id="cardNomber_o" name="cardNomber" type="hidden">   
        </form>
        
        <form action="member_card!cardList.action" method="post" id="search_form" name="search_form">
        	<input type="hidden" id="curPage" name="memberCard.curPage" value="${memberCard.curPage}" />
        	<input id="checkList" name="checkList" type="hidden" value="${checkList!}">  
            <input id="oid" name="oid" type="hidden" value="${oid!}"> 
		</form>
        
        <@u.title_bar title="会员卡列表">
        <!--	<input style="width:100px" type="text" id="cardNom" name="cardNom" value=""/>到<input style="width:100px" type="text" id="cardNomber" name="cardNomber" value=""/>-->
        	<input type="button" class="btn_bg" value="确定" onclick="javascript:createCard();">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr> <th width="5%"><label class="CheckTxt"></label><input title="全选"type="checkbox" id="checkAll1" name="checkAll1" onclick='javascript:selectAll();'></th>
	        	  <th width="10%">卡号</th>
	        	  <th width="5%">积分额</th>
	        	  <th width="10%">当前状态</th>
	        	  <th width="10%">创建人</th>
	        	  <th width="10%">创建时间</th>
	        	  <th width="10%">制作时间</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as memberCard>
            	<tr><td><input type="checkbox" name="ids"  id="memberCard.id" value="${memberCard.id!}" onclick="javascript:resetAll();"></td>
            		<td>${memberCard.cardNo!}</td>
            		<td>${memberCard.score!}</td>
            		<td><@c.syscode syscodes = crruntStatus code="${memberCard.currentStatus!}"/></td>
            		<td>${(memberCard.createUser.userName)!}</td>
            		<td>${(memberCard.createDate?string("yyyy-MM-dd"))!}</td>
	        	    <td>${(memberCard.makeTime?string("yyyy-MM-dd"))!}</td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
       <script type="text/javascript">
		function gotoPage(page){
			document.getElementById('curPage').value = page;
	  		document.getElementById('search_form').submit();
		}
		</script>
		<div class="pageNum">
		<a href='javascript:check();gotoPage(1);'> 首页</a>
	    <#if (page.previousPage >= 1) >
			<a href='javascript:check();gotoPage(${page.previousPage!});'>上一页</a>
		</#if>
		<#if (page.nextPage <= page.totalPage)>
			<a href='javascript:check();gotoPage(${page.nextPage!});'> 下一页</a>
		</#if>
		<a href='javascript:check();gotoPage(${page.totalPage!});'> 尾页</a>
		当前第${page.currentPage!}页 共${page.totalPage!}页 转到第
		<select id="currentPage" name="currentPage" onchange="gotoPage(this.value)">
			<#list 1..page.totalPage as i>
				<option value="${i!}" <#if page.currentPage=i>selected</#if> >${i!}</option>
			</#list>
		</select>页 共${page.totalRow!}条记录
	    </div>
</html>