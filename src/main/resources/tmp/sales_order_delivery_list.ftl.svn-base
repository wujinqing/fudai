<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>销售单发货</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript'>        
        function delivery(id,type){
        	$("#id").val(id);
        	$("#type").val(type);
        	document.getElementById("form").action="sales_order!deliveryView.action";
        	$("#form").submit();
        }
        function del(id,type){
        	$("#id").val(id);
        	$("#type").val(type);
        	document.getElementById("form").action="sales_order!del.action";
        	$("#form").submit();
        }
        function edit(id,type){
        	$("#id").val(id);
        	$("#type").val(type);
        	$("#form").attr("action","sales_order!editView.action");
        	$("#form").submit();
        }
        function lookDelivery(id,type,flag){
        	$("#id").val(id);
        	$("#type").val(type);
        	$("#form").attr("action","sales_order!deliveryLook.action");
        	$("#form").submit();
        }
        
        function printOrder(id,payType){
        	var sh = window.screen.height;
			var sw = window.screen.width;
			var top = Math.round(sh/4);
			var left = Math.round(sw/4);
			var url = "sales_order!printOrderNew.action?id="+id+"&payType="+payType;
			window.open(url,'',
					'toolbar=no,resizable=yes,location=0,scrollbars=yes,top='+top+',left='+left);
        }
        </script>
</head>

<body class="mainbody">
<form id="form" method="post">
<input type="hidden" id="header" name="header" value="${(header?string)!}"/>
<input type="hidden" id="id" name='salesOrder.id'>
<input type="hidden" id="type" name="salesOrder.payType">
</form>
<#if header>
<div class="fastNav">工作平台 > 工厂管理工作平台 > 快递发货处理</div>
<@u.search_bar action="sales_order!deliveryList.action?header=true">
<input type="hidden" id="curPage" name="salesOrder.curPage" value="${(salesOrder.curPage)!}" />
  <table>
    <tr>
      <td>客户姓名</td>
      <td><input type="text" name="salesOrder.member.name" value="${(salesOrder.member.name)!}"/></td>
      <td>发货状态</td>
      <td>
      	<@s.select headerKey="" headerValue="----请选择----" id="salesOrder.status" name="salesOrder.status" 
      		list="syscodeList" listKey="code" listValue="codeName" theme="simple" />
      </td>
    </tr>
    <tr>
      <td>购买日期</td>
      <td><input type="text" name="salesOrder.salesDate" value="${(salesOrder.salesDate?string('yyyy-MM-dd'))?default('')}" onclick="WdatePicker({isShowClear:true,readOnly:true})"/></td>
      <td></td>
      <td></td>
    </tr>
  </table>
</@u.search_bar>
<#else>
<div class="fastNav">工作平台 > 门店销售工作平台 > 销售单发货</div>
<@u.search_bar action="sales_order!deliveryList.action">
<input type="hidden" id="curPage" name="salesOrder.curPage" value="${(salesOrder.curPage)!}" />
  <table>
    <tr>
      <td>客户姓名</td>
      <td><input type="text" name="salesOrder.member.name" value="${(salesOrder.member.name)!}"/></td>
      <td>发货状态</td>
      <td>
      	<@s.select headerKey="" headerValue="----请选择----" id="salesOrder.status" name="salesOrder.status" 
      		list="syscodeList" listKey="code" listValue="codeName" theme="simple" />
      </td>
    </tr>
    <tr>
      <td>购买日期</td>
      <td><input type="text" name="salesOrder.salesDate" value="${(salesOrder.salesDate?string('yyyy-MM-dd'))?default('')}" onclick="WdatePicker({isShowClear:true,readOnly:true})"/></td>
      <td></td>
      <td></td>
    </tr>
  </table>
</@u.search_bar>
</#if>

<@u.title_bar title="销售单列表"></@u.title_bar>
<div class="listLine">
  <table>
    <tr>
      <th width="10%">客户姓名</th>
      <th width="10%">购买日期</th>
      <th width="40%">购买内容</th>
      <th width="15%">备注</th>
      <th width="10%">发货状态</th>
      <th width="15%">操作</th>
    </tr>
    <#if page.dataList??>
    <#list page.dataList as salesOrder>
    <tr>
      <td>${(salesOrder.member.name)!}</td>
      <td>${(salesOrder.salesDate?string('yyyy-MM-dd'))?default("")}</td>
      <td>
      	  <#list salesOrder.sodList as sod>
      		${(sod.productName)!}${(sod.amount)!}<@c.syscode syscodes=packageList code="${(sod.unit!)}"/>
      	  </#list>
      </td>
      <td>${((salesOrder.note)?html)!}</td>
      <td><@c.syscode syscodes=syscodeList code="${(salesOrder.status)!}"/></td>
      <td>
      <#if salesOrder.status=deliveryAll>
      	  <a href="javascript:printOrder(${salesOrder.id!},${salesOrder.payType!})">打印</a>
      	  <a href="javascript:lookDelivery(${salesOrder.id!},${salesOrder.payType!})">查看</a>
      <#elseif salesOrder.status=deliveryPart>
	      <a href="javascript:delivery(${salesOrder.id!},${salesOrder.payType!})">发货</a> |
	      <a href="javascript:lookDelivery(${salesOrder.id!},${salesOrder.payType!})">查看</a>
	  <#else>
	      <a href="javascript:delivery(${salesOrder.id!},${salesOrder.payType!})">发货</a> |
	      <a href="javascript:del(${salesOrder.id!},${salesOrder.payType!})">删除</a> |
      	  <a href="javascript:edit(${salesOrder.id!},${salesOrder.payType!})">修改</a>
      </#if>
    </tr>
    </#list>
    <#else>
    <tr><td colspan="6">暂无信息！</td></tr>
    </#if>
  </table>
</div>
<@u.paginate page=page/>
</body>
</html>
