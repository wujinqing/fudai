<#assign pageName='购买中心' >
<#include "space_top.ftl">
<script type="text/javascript">
$(document).ready(function(){
	$('#show').toggle(
		function(){
			$('#dataTable tr:gt(1)').hide();
			$('#key2').hide();
			$(this).text('+');
		},
		function(){
			$('#dataTable tr:gt(1)').show();
			$('#key2').show();
			$(this).text('-');
		}
	);
});
</script>

<div class="pagebody">
<div class="pagebody_sidebar">
		
		<#include "space_toolbar.ftl"/>
		<#include "space_noute.ftl"/>
		
		<#include "space_personal.ftl"/>
	</div>	
	
	<div class="pagebody_mainbody">
		<div class="space-alb-ad"><img src="${base}/images/space/icon-tu4.gif" /></div>	`
		<div class="pageb_universal">
			<div class="pageb_u_title">购买记录</div>
			<form id="form"  method="post" >
			<input type="hidden" id="curPage" name="salesOrderDetail.curPage" value="${(salesOrderDetail.curPage)!}" />
			<div class="space_ps_uni gj_jfgh_jf"><br />
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CFD8C5" id="dataTable">
				<tr>
					<td colspan="4" bgcolor="#FFF">
						<span style="float:right; font-size:14px; font-weight:bold; padding-right:10px;">
						<a href="#" id="show">-</a>
						</span>&nbsp;&nbsp;
						<strong>销售单</strong>
					</td>
				</tr>
				<tr id="divc">
					<td align="center" bgcolor="#E1F0AF">产品名称</td>
				    <td width="20%" align="center" bgcolor="#E1F0AF">数量</td>
				    <td width="20%" align="center" bgcolor="#E1F0AF">购买金额</td>
					<td width="20%" align="center" bgcolor="#E1F0AF">使用积分</td>
				</tr>
				<#if (page.dataList)??>
            	<#list page.dataList as pay>
				<tr>
				  <td align="center" bgcolor="#FFFFFF">${(pay.productName)!}</td>
			      <td align="center" bgcolor="#FFFFFF">${(pay.amount)!}</td>
			      <td align="center" bgcolor="#FFFFFF">${(pay.sumMoney)!}</td>
				  <td align="center" bgcolor="#FFFFFF">${(pay.needScore)!}</td>
			  	</tr>
			  	</#list>
			  	<#else>
			  	<tr><td colspan="4" align="center">暂无信息</td></tr>
			  	</#if>
			</table>
			
					<script type="text/javascript">
		function gotoPage(page){
			document.getElementById('curPage').value = page;
	  		document.getElementById('form').submit();
		}
	</script>
			<div class="paging" id="key2">			

				<div class="publicad_fy">

					<div class="viciao">
						<#if page.dataList??>
						<#if page.currentPage==1>
							<span class="disabled">上一页</span>
						<#else>
							<a href='javascript:gotoPage(${page.previousPage!})'> 上一页</a>
						</#if>
							
							<#if page.totalPage gt 7>
								<#if page.currentPage-3 lte 1>
								<#list 1..page.currentPage as i>
									<#if page.currentPage==i>
										<span class="current">${i}</span>
									<#else>
										<a href="javascript:gotoPage(${i})">${i}</a></li>
									</#if>
								</#list>
								<#else>
									<#if page.currentPage==1>
									<span class="current">1</span>
									<#else>
									<a href="javascript:gotoPage(1)" >1</a>
									</#if>
									<a>...</a>
									<#list page.currentPage-2..page.currentPage as i>
										<#if page.currentPage==i>
											<span class="current">${i}</span>
										<#else>
											<a href="javascript:gotoPage(${i})">${i}</a>
										</#if>
									</#list>
								</#if>
								<#if page.currentPage+3 gte page.totalPage>
									<#if page.currentPage!=page.totalPage>
										<#list page.currentPage+1..page.totalPage as i>
											<#if page.currentPage==i>
												<span class="current">${i}</span>
											<#else>
												<a href="javascript:gotoPage(${i})">${i}</a>
											</#if>
										</#list>
									</#if>
								<#else>
									<#list page.currentPage+1..page.currentPage+2 as i>
										<#if page.currentPage==i>
											<span class="current">${i}</span>
										<#else>
											<a href="javascript:gotoPage(${i})">${i}</a>
										</#if>
									</#list>
									<a>...</a>
									<#if page.currentPage==page.totalPage>
										<span class="current">${page.totalPage!}</span>
									<#else>
										<a href="javascript:gotoPage(${page.totalPage!})" >${page.totalPage!}</a>
									</#if>
								</#if>
							<#else>
								<#list 1..page.totalPage as i>
									<#if page.currentPage==i>
										<span class="current">${i}</span>
									<#else>
										<a href="javascript:gotoPage(${i})">${i}</a>
									</#if>
								</#list>
							</#if>
								<#if page.currentPage==page.totalPage>
									<span class="disabled"> 下一页</span> 
								<#else>
									<a href='javascript:gotoPage(${page.nextPage!})'> 下一页</a>
								</#if>
								共${(pageNum)!} 条记录
						</#if>
						
						</div>
				</div>
			</div>
			</div>
			</form>
		</div>		
	</div>	
</div>

<#include "space_footer.ftl"/>
</body>
</html>
