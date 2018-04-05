<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/macros/ui.ftl" as u>
<#import "/macros/common.ftl" as c>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>编辑/增加商品</title>

        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="jquery.validate.js"/>
        <@u.rootjs src="jquery.validate.message_cn.js"/>
        <@u.rootjs src="fckeditor/fckeditor.js"/>
        <script type="text/javascript">

        </script>
    </head>
    <body class="mainbody">
    <form method="post" id="form1" name="form1" action="/order/add_product">
        <input type="hidden" id="orderId" name="orderId" value="${(order.id)!}">
    </form>

    	<@u.form_bar title='计算价格'>
    	<form id="form" name="form" action="/order/fifth" method="post" enctype="multipart/form-data">
    	<input type="hidden" id="idAmount" name="idAmount" value=""/>
    	<input type="hidden" id="flush" name="flush" value="true">
    	<input type="hidden" id="id" name="orderId" value="${order.id!}">

    	<table>
            <tr>
                <td width="15%" class="txtRight">已付订金：</td>
                <td colspan="3" width="35%" class="txtLeft" >
                    <input type="text" style="width:10%" id="deposit"  name="deposit" value="${(order.deposit)?c!}">
                </td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">贷款总额：</td>
                <td colspan="3" width="35%" class="txtLeft">
                    <input type="text" style="width:10%"  id="loansPrice" name="loansPrice" value="${(order.loansPrice)?c!}">
                </td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">原价：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%; border: hidden" id="originalPrice"  readonly="readonly" name="originalPrice" value="${(order.originalPrice)?c!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">实际价格：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:20%; border: hidden"  id="actualPrice" name="actualPrice" readonly="readonly" value="${(order.actualPrice)?c!}">
				</td>
            </tr>




            <tr>
                <td colspan="4">
                    <input type="submit" class="btn_bg" value="完成订单，请到订单列表下载Word文件">

                    <span id="msg" style="color:red"></span>
                </td>
            </tr>

		</table>
        </form>
    	</@u.form_bar>

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
                    <th>操作</th>
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
                        <td>
                            <a href="javascript:edit(${detail.id})">修改</a> |
                            <a href="javascript:del(${detail.id})" class="font_red">删除</a>
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