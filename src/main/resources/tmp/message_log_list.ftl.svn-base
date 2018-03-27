<#assign pageName='我的消息' >
<#include "space_top.ftl">
<script type='text/javascript'>
function selectAll() {
    var ids = document.getElementsByName("ids");
    var isCheck =  document.getElementById("checkAll1");
    if(isCheck.checked){
    	for(var i=1;i<ids.length;i++){
    		ids[i].checked = true;
    	}
    }else{
    	for(var i=1;i<ids.length;i++){
    		ids[i].checked = false;
    	}
    }
}

function resetAll(){
	var ids = document.getElementsByName("ids");
	var isCheck =  document.getElementById("checkAll1");
	var flag = 0;
	for(var i=1;i<ids.length;i++){
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
        
        
function rubbish(){
	var checks="";
	var check=document.getElementsByName("ids");
	for(var i=1;i<check.length;i++){
	   if(check[i].checked){
	   checks=checks+check[i].value+",";
	   }
	  }
	  if(checks==""){
	   alert("至少选择一条消息！");
	  }else{
	  document.getElementById('ids').value=checks;
	    if(confirm("确认放入垃圾箱？")) {
	        var form = document.getElementById("message_form");
	        form.action = "${base}/mh/message_log!toRubbish.action";
	        form.submit();
	    }
	}
}
        
        
function deletemes(){
	var checks="";
	var check=document.getElementsByName("ids");
	for(var i=1;i<check.length;i++){
	   if(check[i].checked){
	   checks=checks+check[i].value+",";
	   }
	  }
	  if(checks==""){
	   alert("至少选择一条消息！");
	  }else{
	  document.getElementById('ids').value=checks;
	    if(confirm("删除后不可恢复！")) {
	        var form = document.getElementById("message_form");
	        form.action = "${base}/mh/message_log!deleteMess.action";
	    form.submit();
	}
	}
}
        
function deleteAll(){
	if(confirm("清空后将不可恢复!")) {
	    var form = document.getElementById('message_form');
	    form.action = "${base}/mh/message_log!deleteAll.action";
	    form.submit();
	}
}

function intoOnes(id,formId){
	window.location='${base}/mh/message_log!oneMessage.action?messageId='+id+'&isRub='+${isRub!};
	window.open('${base}/bs_0_services_'+formId+'_'+${(memberId)!}+'.html','_blank');
}
</script>

<div class="pagebody">
<div class="pagebody_sidebar">
		<#include "space_toolbar.ftl"/>
		<#include "space_noute.ftl"/>
		<#include "space_personal.ftl"/>
	</div>	
	<div class="pagebody_mainbody">
	  <div class="pageb_universal">
			<div class="pageb_u_title">消息</div>
				
		<div class="pers-r-content1">
			<div class="p-posts-title">
				<div class="posts-on">收信箱</div>
				<div class="posts-off"><a href="${base}/space/message_rubbish.html">垃圾箱</a></div>
			</div>
			
			<div class="p-posts-box">				
				<div class="pers-r-inf">
					<div class="space_inf-qk">
						<ol class="color_fff"><a href="javascript:deletemes();">永久删除</a> <a href="javascript:rubbish();">放入垃圾箱</a> <a href="javascript:deleteAll();">清空帖箱</a></ol>
					</div>
			<form id="message_form"  method="post" name="memberMessage.form">
			<input type="hidden" id="curPage" name="memberMessage.curPage" value="${(memberMessage.curPage)!}" />
			<input  name="ids" id="ids" type="hidden"/> 	
			<input name="isRub" type="hidden" value="${(isRub)!}">	
			</form>
					<div class="p-posts-list">
						<ul>
							<li class="p-posts-listli">
								<span class="p-posts-list-zt"><input type="checkbox" id="checkAll1" name="checkAll1" onclick='javascript:selectAll();' > 主题</span>
								<span class="p-posts-list-ly">状态</span>
								<span class="p-posts-list-rq">日期</span>
						  	</li>
						  	<#if (page.dataList)??>
            				<#list page.dataList as message>
							<li>
							  <span class="p-posts-list-zt color_680"><input type="checkbox" name="ids"  id="message_id" value="${message.id!}" onclick="javascript:resetAll()">
								<#if "${(message.type)!}"="1">
								<a href="javascript:" onclick="intoOnes('${message.id}','${message.formId}');">${(message.formTitle)!}</a></span>
								<#elseif "${(message.type)!}"="7">
								<a href="${base}/message_detail_${(message.id)!}.html">${(message.content?html)!'无主题'}</a></span>
								<#else>
								<a href="${base}/message_detail_${(message.id)!}.html">诺特消息</a></span>
								</#if>
								<span class="p-posts-list-ly color_680">
								  <#if (message.isRead??&&message.isRead==0)>未读</#if>
	        	    			  <#if (message.isRead??&&message.isRead==1)>已读</#if>
	        	    			</span>
								<span class="p-posts-list-rq">${(message.createDate?string('yyyy-MM-dd hh:mm'))!}</span>
							</li>
							</#list>
							</#if>
						</ul>
					<div class="xxxpers-r-infbt1">
					<div class="paging" id="key2">			
				<div class="publicad_fy">
					<div class="viciao">
						<#if page.dataList??>
						<#if page.currentPage==1>
							<span class="disabled">上一页</span>
						<#else>
							<a href='${base}/space/message_p_${page.previousPage!}.html'> 上一页</a>
						</#if>
							
							<#if page.totalPage gt 7>
								<#if page.currentPage-3 lte 1>
								<#list 1..page.currentPage as i>
									<#if page.currentPage==i>
										<span class="current">${i}</span>
									<#else>
										<a href="${base}/space/message_p_${i}.html">${i}</a></li>
									</#if>
								</#list>
								<#else>
									<#if page.currentPage==1>
									<span class="current">1</span>
									<#else>
									<a href="${base}/space/message_p_1.html" >1</a>
									</#if>
									<a>...</a>
									<#list page.currentPage-2..page.currentPage as i>
										<#if page.currentPage==i>
											<span class="current">${i}</span>
										<#else>
											<a href="${base}/space/message_p_${i}.html">${i}</a>
										</#if>
									</#list>
								</#if>
								<#if page.currentPage+3 gte page.totalPage>
									<#if page.currentPage!=page.totalPage>
										<#list page.currentPage+1..page.totalPage as i>
											<#if page.currentPage==i>
												<span class="current">${i}</span>
											<#else>
												<a href="${base}/space/message_p_${i}.html">${i}</a>
											</#if>
										</#list>
									</#if>
								<#else>
									<#list page.currentPage+1..page.currentPage+2 as i>
										<#if page.currentPage==i>
											<span class="current">${i}</span>
										<#else>
											<a href="${base}/space/message_p_${i}.html">${i}</a>
										</#if>
									</#list>
									<a>...</a>
									<#if page.currentPage==page.totalPage>
										<span class="current">${page.totalPage!}</span>
									<#else>
										<a href="${base}/space/message_p_${page.totalPage!}.html">${page.totalPage!}</a>
									</#if>
								</#if>
							<#else>
								<#list 1..page.totalPage as i>
									<#if page.currentPage==i>
										<span class="current">${i}</span>
									<#else>
										<a href="${base}/space/message_p_${i}.html">${i}</a>
									</#if>
								</#list>
							</#if>
								<#if page.currentPage==page.totalPage>
									<span class="disabled"> 下一页</span> 
								<#else>
									<a href='${base}/space/message_p_${page.nextPage!}.html'> 下一页</a>
								</#if>
								共${(pageNum)!} 条记录
						</#if>
						</div>
				</div>
			</div>
					</div>
					</div>
				</div>				
			</div>
		</div>
		</div>
	</div>
</div>
<#include "space_footer.ftl"/>
</body>
</html>
