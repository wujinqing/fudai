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
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript' src='${base}/dwr/interface/OrgAjaxService.js'></script>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('customer_form');
                form.action = "customer!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('customer_form');
                    form.action = "customer!delete.action";
                    form.submit();
                }
            }
            
            function add(id){
                document.getElementById('id').value = id;
                var form = document.getElementById('customer_form');
                form.action = "customer!addRec.action";
                form.submit();
            }

			jQuery(document).ready(function(){
				jQuery("#search_form input[type=reset]").click(function(){
					jQuery("input[name=customer.startTime]").val('');
					jQuery("input[name=customer.endTime]").val('');
				});
			});
			

			function successDiv(userid) {
				window.location.reload();
			}

</script>
    </head>
    <body class="mainbody">
        <form method="get" id="customer_form" name="customer_form">
            <input id="id" name="id" type="hidden" value="">     
        </form>
        <div class="listTitle"><span>
         	<#if (ttype??&&ttype=='0')>新增的潜力客户信息表</#if>
		    <#if (ttype??&&ttype=='1')>新成交的潜力客户信息表</#if>
        </span></div>
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="5%">序号</th>
	        	  <th>
		        	  <#if (ttype??&&ttype=='0')>新增日期</#if>
		        	  <#if (ttype??&&ttype=='1')>回访日期</#if>
	        	  </th>
	        	  <th>客户姓名</th>
	        	  <th>性别</th>
	        	  <th>BMI</th>
	        	  <th>手机</th>
	        	  <th>EMAIL或QQ</th>
	        	  <th>最后记录</th>
	        	  <th>操作</th>
            </tr>
            <#if customerList??>
            	<#list customerList as cus>
            		<tr>
            			<td>${cus_index+1}</td>
            			<td>
            				 <#if (ttype??&&ttype=='0')>${(cus.createDate?string('yyyy-MM-dd'))!}</#if>
		        	  		 <#if (ttype??&&ttype=='1')>${(cus.updateDate?string('yyyy-MM-dd'))!}</#if>
            			</td>
            			<td>${(cus.name)!}</td>
            			<td>
            				<#if (cus??&&cus.sex??&&cus.sex=0)>男</#if>
            				<#if (cus??&&cus.sex??&&cus.sex=1)>女</#if>
            			</td>
            			<td>
            				<#if (cus??&&cus.height??&&cus.weight??&&cus.weight!=0)>
	            				${(cus.getBMI(cus.height,cus.weight))!}
            				</#if>
            			</td>
            			<td>${(cus.tel)!}</td>
            			<td>${(cus.email?default(cus.qq))!}</td>
            			<td>${(cus.updateDate?string('yyyy-MM-dd'))!}</td>
            			<td>
						<input class="btn_bg" type="button" value="添加" onclick="add('${(cus.id)!}')">
                          <input class="btn_bg" type="button" value="修改" onclick="edit('${(cus.id)!}')">
						</td>
            		</tr>
            	</#list>
            <#else>
            <tr>
            	<td colspan="9">暂无记录</td>
            </tr>
            </#if>
        </table>
        </div>      
</div>
</body>      
</html>