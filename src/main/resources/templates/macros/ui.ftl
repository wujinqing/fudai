<#--
定义资源根路径
-->
<#assign css_root='/themes/inch-silver/css'>
<#assign js_root='/themes/inch-silver/js'>
<#--
项目统一引入css标签
-->
<#macro css src>
	<link href="${css_root}/${src}" rel="stylesheet" type="text/css" />
</#macro>

<#macro rootcss src>
	<link href="/css/${src}" rel="stylesheet" type="text/css" />
</#macro>

<#macro js src>
	<script language="javascript" src="${js_root}/${src}"></script>
</#macro>

<#macro rootjs src>
	<script language="javascript" src="/js/${src}"></script>
</#macro>

<#--
列表标题栏
title--标题
-->
<#macro title_bar title>
	<br>
	<div class="listTitle">
		<span>${title}</span>
		<ul>
		<#nested>
		</ul>
	</div>
</#macro>
<#--
列表标题栏按钮，配合列表标题栏使用
type--按钮类型（new:新建；enable:启用；disable：禁用;header:新增主管账户；fenpei:associate分配按钮;batch:批量设置）
-->
<#macro title_bar_btn type onclick>
	<li>
		<#if type=='new'>
			<a href="javascript:${onclick}" class="btn_add"></a>
		<#elseif type="enable">
			<a href="javascript:${onclick}" class="btn_use"></a>
		<#elseif type="disable">
			<a href="javascript:${onclick}" class="btn_notUse"></a>
		<#elseif type="header">
			<a href="javascript:${onclick}" class="btn_add2"></a>
		<#elseif type="fenpei">
			<a href="javascript:${onclick}" class="btn_dist"></a>
		<#elseif type="modify">
			<a href="javascript:${onclick}" class="btn_modify"></a>
		<#elseif type="batch">
			<a href="javascript:${onclick}" class="btn_batch"></a>
		<#elseif type="delete">
			<input type="button" onclick="${onclick}" class="btn_delete" />
	    <#elseif type="check">
			<input type="button" class="btn_bg" value="选择" onclick="${onclick}"/>
		</#if>
	</li>
</#macro>
<#--
搜索栏
action--搜索form的action
-->
<#macro search_bar action title="查询">
	<script type="text/javascript">
	function clearForm() {
    	var formObj = document.forms["search_form"];
    	var formEl = formObj.elements;
    	for (var i=0; i<formEl.length; i++)
	    {
	        var element = formEl[i];
	        if (element.type == 'submit') { continue; }
	        if (element.type == 'reset') { continue; }
	        if (element.type == 'button') { continue; }
	        if (element.type == 'hidden') { continue; }

	        if (element.type == 'text') { element.value = ''; }
	        if (element.type == 'textarea') { element.value = ''; }
	        if (element.type == 'checkbox') { element.checked = false; }
	        if (element.type == 'radio') { element.checked = false; }
	        if (element.type == 'select-multiple') { element.selectedIndex = -1; }
	        if (element.type == 'select-one') { element.selectedIndex = -1; }
	    }
	}
	</script>
	<form action="${action}" method="post" id="search_form" name="search_form" >
	<div class="listLine">
		<table>
		  <tr>
		    <th align="left">&nbsp;&nbsp;${title}</th>
		  </tr>
		 </table>

		<#nested>
	</div>
	<div class="listDiv">
		<input id='sbmt_id' type="submit" class="btn_bg" value="搜索" />
		<input type="button" class="btn_bg" value="重置" onclick="clearForm();" />
	</div>
	</form>
</#macro>


<#macro search_bar2 action title="查询">
	<script type="text/javascript">
	function clearForm() {
    	var formObj = document.forms["search_form"];
    	var formEl = formObj.elements;
    	for (var i=0; i<formEl.length; i++)
	    {
	        var element = formEl[i];
	        if (element.type == 'submit') { continue; }
	        if (element.type == 'reset') { continue; }
	        if (element.type == 'button') { continue; }
	        if (element.type == 'hidden') { continue; }

	        if (element.type == 'text') { element.value = ''; }
	        if (element.type == 'textarea') { element.value = ''; }
	        if (element.type == 'checkbox') { element.checked = false; }
	        if (element.type == 'radio') { element.checked = false; }
	        if (element.type == 'select-multiple') { element.selectedIndex = -1; }
	        if (element.type == 'select-one') { element.selectedIndex = -1; }
	    }
	}
	</script>
	<form action="${action}" method="post" id="search_form" name="search_form" >
	<div class="listLine">
		<table>
		  <tr>
		    <th align="left">&nbsp;&nbsp;${title}</th>
		  </tr>
		 </table>

		<#nested>
	</div>
	<div class="listDiv">
		<input id='sbmt_id' type="button" class="btn_bg" value="搜索" onclick="searchJs();" />
		<input type="button" class="btn_bg" value="重置" onclick="clearForm();" />
	</div>
	</form>
</#macro>
<#--
列表中的操作
-->
<#macro oper value onclick>
	<input type="button" class="btn_bg" value="${value}" onclick="${onclick}">
</#macro>
<#--
表单栏
-->
<#macro form_bar title>
	<div class="listLine">
		<table>
			<tr>
				<th align="left">&nbsp;&nbsp;${title}</th>
			</tr>
		</table>
		<#nested>
	</div>
</#macro>
<#--
分页控件
form——form表单id
page——page对象
-->
<#macro paginate page form="search_form">
	<script type="text/javascript">
		function gotoPage(page){
			document.getElementById('curPage').value = page;
	  		document.getElementById('${form}').submit();
		}
	</script>
	<div class="pageNum">
	<a href='javascript:gotoPage(1)'> 首页</a>
    <#if (page.previousPage >= 1) >
		<a href='javascript:gotoPage(${page.previousPage!})'>上一页</a>
	</#if>
	<#if (page.nextPage <= page.totalPage)>
		<a href='javascript:gotoPage(${page.nextPage!})'> 下一页</a>
	</#if>
	<a href='javascript:gotoPage(${page.totalPage!})'> 尾页</a>
	当前第${page.currentPage!}页 共${page.totalPage!}页 转到第
	<select id="currentPage" name="currentPage" onchange="gotoPage(this.value)">
		<#list 1..page.totalPage as i>
			<option value="${i!}" <#if page.currentPage=i>selected</#if> >${i!}</option>
		</#list>
	</select>页 共${page.totalRow!}条记录
    </div>
</#macro>