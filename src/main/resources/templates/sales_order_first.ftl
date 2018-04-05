<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/macros/ui.ftl" as u>
<#import "/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新客户销售单</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>

    <script type='text/javascript'>
        function detail(id){
            document.getElementById("orderId").value=id;
            var form = document.getElementById("form");
            form.action="/order/edit";
            form.submit();
        }
        function edit(id){
            document.getElementById("orderId2").value=id;
            var form = document.getElementById("form2");
            form.action="/order/second";
            form.submit();
        }

        function download(id){
            document.getElementById("orderId").value=id;
            var form = document.getElementById("form");
            form.action="/order/download";
            form.submit();
        }

        function del(id){
            if(confirm("确认删除该产品？")){
                document.getElementById("orderId").value=id;
                var form = document.getElementById("form");
                form.action="/order/del";
                form.submit();
            }else{
                return;
            }
        }



    </script>
</head>

<body class="mainbody">

<form method="post" id="form" name="form">
    <input type="hidden" id="orderId" name="orderId">
</form>

<form method="post" id="form2" name="form2">
    <input type="hidden" id="orderId2" name="id">
</form>

<div class="fastNav">新销售单</div>
<div class="listLine">
    <table>
        <tr><th colspan="2" align="center">新销售单</th></tr>
        <tr>
            <td class="txtRight" width="50%">名称：</td>
            <td class="txtLeft" width="50%">福代门业销售订单</td>
        </tr>
        <tr>
            <td class="txtRight" width="50%">主营业务：</td>
            <td class="txtLeft" width="50%">防盗门、别墅门、铜门、推拉门、卫浴门、断桥推拉窗、室内烤漆门、进口橡木门及智能指纹锁</td>
        </tr>
        <tr>
            <td class="txtRight" width="50%">地址：</td>
            <td class="txtLeft" width="50%">江西省会昌县月亮湾新区天玺湾建材街21-22号</td>
        </tr>
        </tr>
    </table>
</div>


<form action="/order/second" method="post">
<div class="listDiv">
	<input type="submit" value="创建订单" class="btn_bg" />
</div>
</form>


<#--
<@u.search_bar action="/order/first">
<table width="100%" border="0" cellspacing="0">
    <tr>
        <td class="txtRight">订单号：</td>
        <td class="txtLeft">
            <input type="text" style="width:20%"  name="orderNo" value="">
        </td>
    </tr>
</table>
</@u.search_bar>
-->
<div class="listLine">
    <table>
        <tr>
            <th>序号</th>
            <th>订单号</th>
            <th>客户姓名</th>
            <th>联系电话</th>
            <th>地址</th>
            <th>订单日期</th>
            <th>订单总额</th>
            <th>已付订金</th>
            <th>贷款总额</th>
            <th>操作</th>
        </tr>
    <#if orderList??>
        <#list orderList as order>
            <tr>
                <td>${(order_index+1)}</td>
                <td><a href="javascript:detail(${order.id})">${(order.orderNo)!}(${((order.details)?size)!0})</a></td>
                <td>${(order.customerName)!}</td>
                <td>${(order.customerPhoneNumber)!}</td>
                <td>${(order.customerAddress)!}</td>
                <td>${(order.date)!}</td>
                <td>${(order.actualPrice)!}</td>
                <td>${(order.deposit)!}</td>
                <td>${(order.loansPrice)!}</td>
                <td>
                    <a href="javascript:edit(${order.id})">修改</a> |
                    <a href="javascript:del(${order.id})" class="font_red">删除</a> |
                    <a href="javascript:download(${order.id})">下载Word版</a>
                </td>
            </tr>
        </#list>
    <#else>
        <tr><td colspan="10">暂无记录</td></tr>
    </#if>
    </table>
</div>


</body>
</html>
