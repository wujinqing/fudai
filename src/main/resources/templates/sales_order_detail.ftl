<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/macros/ui.ftl" as u>
<#import "/macros/common.ftl" as c>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>订单详情</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="jquery.validate.js"/>
        <@u.rootjs src="jquery.validate.message_cn.js"/>
        <@u.rootjs src="fckeditor/fckeditor.js"/>
    </head>
    <body class="mainbody">
    <form method="post" id="form1" name="form1" action="/order/add_product">
        <input type="hidden" id="orderId" name="orderId" value="${(order.id)!}">
    </form>
    <div class="fastNav">订单信息</div>
    <div class="listLine">
        <table>
            <tr>
                <th>订单号</th>
                <th>已付订金</th>
                <th>贷款总额</th>
                <th>客户姓名</th>
                <th>联系电话</th>
                <th>地址</th>
                <th>订单日期</th>
                <th>原价</th>
                <th>实际价格</th>

            </tr>
            <tr>
                <td>${(order.orderNo)!}</td>
                <td>${(order.deposit)!}</td>
                <td>${(order.loansPrice)!}</td>
                <td>${(order.customerName)!}</td>
                <td>${(order.customerPhoneNumber)!}</td>
                <td>${(order.customerAddress)!}</td>
                <td>${(order.date)!}</td>
                <td>${(order.originalPrice)!}</td>
                <td>${(order.actualPrice)!}</td>
            </tr>
        </table>
    </div>
    <div class="fastNav">产品信息</div>
        <div class="listLine">
            <table>
                <tr>
                    <th>序号</th>
                    <th>品名</th>
                    <th>款式</th>
                    <th>颜色</th>
                    <th>单位</th>
                    <th>单价</th>
                    <th>数量</th>
                    <th>原价</th>
                    <th>实际价格</th>
                </tr>
			<#if (order.details)??>
				<#list order.details as detail>
                    <tr>
                        <td>${(detail_index+1)}</td>
                        <td>${(detail.name)!}</td>
                        <td>${(detail.style)!}</td>
                        <td>${(detail.color)!}</td>
                        <td>${(detail.unit)!}</td>
                        <td>${(detail.price)!}</td>
                        <td>${(detail.amount)!}</td>
                        <td>${(detail.originalPrice)!}</td>
                        <td>${(detail.actualPrice)!}</td>
                    </tr>
				</#list>
			<#else>
                <tr><td colspan="10">暂无记录</td></tr>
			</#if>
            </table>
        </div>

    </body>
</html>