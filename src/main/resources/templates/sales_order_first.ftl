<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/macros/ui.ftl" as u>
<#import "/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新客户销售单</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
</head>

<body class="mainbody">
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
</body>
</html>
