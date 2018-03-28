<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/macros/ui.ftl" as u>
<#import "/macros/common.ftl" as c>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品列表</title>
<@u.css src="style.css"/>

<@u.js src="drag.js"/>
<script type='text/javascript'>
	function edit(id){
		document.getElementById("id").value=id;
		var form = document.getElementById("pro_form");
		form.action="/product/edit";
		form.submit();
	}

    function add(){
        var form = document.getElementById("form1");
        form.action="/product/add";
        form.submit();
    }
	
	function del(id){
		if(confirm("确认删除该产品？")){
            document.getElementById("id").value=id;
            var form = document.getElementById("pro_form");
            form.action="/product/del";
            form.submit();
		}else{
			return;
		}
	}
	


</script>
</head>

<body>
<script>
    <#if flush??>
    	window.parent.left.location.reload();
    </#if>
</script>
<form method="post" id="pro_form" name="pro_form">
  <input type="hidden" id="flush" name="flush" value="true">
  <input type="hidden" id="id" name="id">
  <#if (product.id)??>
  <input type="hidden" id="pId" name="pId" value="${(product.id)!}">
  <#else>
  <input type="hidden" id="pId" name="pId" value="0">
  </#if>
</form>
<form method="post" id="form1" name="form1">
	 <input type="hidden" id="productId" name="productId">
	 <input type="hidden" id="productName" name="productName">
</form>
 <@u.title_bar title="${(product.name)!'产品'}列表">

    	<@u.title_bar_btn type="new" onclick="add();"/>

</@u.title_bar>

<@u.search_bar action="/product/list">
<table width="100%" border="0" cellspacing="0">
    <tr>

        <td>品名：</td>
        <td>
            <select id="member_qjScore" name="name">
                <option value="">---请选择---</option>
                <option value="尊贵系列门卫浴">尊贵系列门卫浴</option>

            </select>
        </td>

    </tr>
</table>
</@u.search_bar>

<div class="listLine">
<table>
  <tr>
	<th>序号</th>
    <th>品名</th>
    <th>款式</th>
    <th>颜色</th>
    <th>单位</th>
    <th>单价</th>
    <th>操作</th>
  </tr>
  <#if productList??>
  	<#list productList as product>
  	<tr>
        <td>${(product_index+1)}</td>
	    <td>${(product.name)!}</td>
	    <td>${(product.style)!}</td>
	    <td>${(product.color)!}</td>
	    <td>${(product.unit)!}</td>
	    <td>${(product.price)!}</td>
	    <td>
	    	<a href="javascript:edit(${product.id})">修改</a> |
	    	<a href="javascript:del(${product.id})" class="font_red">删除</a>
	    </td>
  	</tr>
  	</#list>
  <#else>
  	<tr><td colspan="7">暂无记录</td></tr>
  </#if>
</table>
</div>
<#--
<@u.paginate page=page/>
-->
</body>
</html>
