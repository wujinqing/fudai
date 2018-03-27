<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员购买清单</title>
<@u.css src="style.css"/>
</head>

<body class="mainbody">
<div class="fastNav">工作平台 > 营养师部 > 会员购买清单</div>
<div class="listLine">
  <table>
    <tr>
      <th>购买人</th>
      <th>购买日期</th>
      <th>购买内容</th>
      <th>销售单金额</th>
    </tr>
    <#if salesOrderList??>
    <#list salesOrderList as order>
    <tr>
      <td>${(order.member.name)!}</td>
      <td>${(order.salesDate?string('yyyy-MM-dd'))!}</td>
      <td>
       <#if order.sodList??&&order.sodList.size()!=0>
       <#list order.sodList as soDetail>
            ${soDetail.productName!}${soDetail.amount!}<@c.syscode syscodes=packageList code="${(soDetail.unit!)}"/></br>
       </#list>
       <#else>
       	暂无
       </#if>
      </td>
      <td>${((order.total)?string.number)!}</td>
    </tr>
    </#list>
    <#else><tr><td colspan='4'>暂无记录</td></tr>
    </#if>
    <tr><td colspan="3">合计：</td><td>${(sumTotal?string.number)!}</td></tr>
  </table>
</div>
</body>
</html>
