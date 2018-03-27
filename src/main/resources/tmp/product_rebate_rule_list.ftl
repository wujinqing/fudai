<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <@u.rootjs src="jquery.validate.js"/>
        <@u.rootjs src="jquery.validate.message_cn.js"/>
        <script type='text/javascript'>       
          	$().ready(function(){
        		$('#search_form').validate({
        			rules:{
        				"productRebateRule.needScore":{number:true,maxlength:10,min:0},
        				"productRebateRule.rebatePrice":{number:true,maxlength:10,min:0}
        			}
    			});
    		});
        		 
           	function edit(id,productId,productName) {
                document.getElementById('id').value = id;
                document.getElementById('productId').value = productId;
                document.getElementById('productName').value = encodeURIComponent(productName);
                var form = document.getElementById('productRebateRule_form');
                form.action = "product_rebate_rule!input.action";
                form.submit();
            }
            
            function del(id,productId) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('productRebateRule_form');
                    document.getElementById('productId').value=productId;
                    form.action = "product_rebate_rule!delete.action";
                    form.submit();
                }
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="productRebateRule_form" name="productRebateRule_form">
            <input id="id" name="id" type="hidden">     
          	<input id="productId" name="productId" type="hidden">  
          	<input id="type" name="type" type="hidden" value='ruleList'>   
            <input id="productName" name="productName" type="hidden">     
        </form>
        
     	<@u.search_bar action="product_rebate_rule!ruleList.action">
     	<input id="productId" name="productId" type="hidden" value="${productBean.id!}">     
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="10%" align="right">折现积分：</td>
        		  <td width="25%" align="left"><input type="text" name="productRebateRule.needScore" value="${productRebateRule.needScore!}"></td>
        	      <td width="10%" align="right">折扣金额：</td>
        		  <td width="20%" align="left"><input type="text" name="productRebateRule.rebatePrice" value="${productRebateRule.rebatePrice!}"></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="产品【${productBean.name!}】折现规则列表">
        	<input type="button" class="btn_bg" value="返回" onclick="javascript:history.go(-1);">
        	<input type="button" class="btn_bg" value="增加" onclick="javascript:edit('','${productBean.id!}','${productBean.name!}');">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="30%">折现积分</th>
	        	  <th width="30%">折扣金额</th>
	        	  <th width="30%">会员类型</th>
	              <th width="40%">操作</th>
            </tr>
            <#if ruleList??&&ruleList.size() gt 0>
            	<#list ruleList as productRebateRule>
            	<tr>
	        	    <td>${productRebateRule.needScore!}</td>
	        	    <td>${((productRebateRule.rebatePrice)?string.currency)!}</td>
	        	    <td><@c.syscode syscodes = memberTypeList code="${productRebateRule.memberType!}"/></td>
                    <td>
                    	<a href="javascript:edit('${productRebateRule.id}','${(productRebateRule.product.id)!}','${(productRebateRule.product.name)!}');">修改</a>
                    	<a href="javascript:del('${productRebateRule.id}','${(productRebateRule.product.id)!}');">删除</a>
                    </td>
                </tr>
            	</#list>
            <#else>
            	<tr><td colspan="3">--暂无信息--</td></tr>
            </#if>
        </table>
        </div>        
</html>