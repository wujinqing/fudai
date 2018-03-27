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
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('materialProduct_form');
                form.action = "material_product!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('materialProduct_form');
                    form.action = "material_product!delete.action";
                    form.submit();
                }
            }
             function getdate(){   
			  var now=new Date();
			  y=now.getFullYear();
			  m=now.getMonth()+1;
			  d=now.getDate();
			  m=m<10?"0"+m:m;
			  d=d<10?"0"+d:d;
			  return y+"-"+m+"-"+d;
			}


function checkDate(n){
            	var myDate = getdate();
        		var startDate=$("#materialProduct_startDate").val();
	    	    var endDate=$("#materialProduct_endDate").val();
	    	    var m,newDate,newMonth,newYear;
            	if(n==1){
            		if(startDate>endDate){
            			newMonth=parseInt(startDate.split("-")[1]);
            			newYear=parseInt(startDate.split("-")[0]);
            			if(newMonth<10){
			    	    	m="0"+(newMonth+1);
			    	    }else if(newMonth==12){
							m="01";		   
							newYear+=1; 	    
			    	    }else{
			    	    	m=newMonth;
			    	    }
			    	    newDate=newYear+"-"+m+"-01";
            			$("#materialProduct_endDate").val(newDate);
            		}
            		if(myDate<startDate){
            			$("#materialProduct_startDate").val(myDate.split("-")

[0]+"-"+myDate.split("-")[1]+"-01");
            		}
            		
            		if(startDate<"2006-01-01"){
            			$("#materialProduct_startDate").val("2006-01-01");
            		}
            	}
            	if(n==2){
            		if(startDate>endDate){
            		 	newMonth=parseInt(endDate.split("-")[1]);
            		 	newYear=parseInt(endDate.split("-")[0]);
            			if(newMonth<11){
			    	    	m="0"+(newMonth-1);
			    	    }else if(newMonth==1){
			    	    	m="12";
			    	    	newYear-=1;
			    	    }else{
			    	    	m=newMonth;
			    	    }
			    	   newDate=newYear+"-"+m+"-01";
            		   $("#materialProduct_startDate").val(newDate);
            		}
            		if(myDate<endDate){
            			$("#materialProduct_endDate").val(myDate);
            		}
            	}
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="materialProduct_form" name="materialProduct_form">
            <input id="id" name="id" type="hidden">     
        </form>
     	<@u.search_bar action="material_product!getProductsList.action">
        <input type="hidden" id="curPage" name="materialProduct.curPage" value="${materialProduct.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td>产品：</td>
        		  <td>
				<@s.select id="product_id" 	
				  name="product.id" 
				  list="productList" 
				  listKey="id"
				  listValue="name" 
				  headerKey="" 
				  headerValue="--所有--"
				  value="product.id" theme="simple"/>	
				</td>
        	      <td>时间：</td>
        		  <td >
					<input type="text" id="materialProduct_startDate" name="materialProduct.startDate" 
                        value="<#if materialProduct.startDate??>${materialProduct.startDate?string('yyyy-MM-dd')}</#if>" 
                        onclick="WdatePicker({isShowClear:false,readOnly:true})" onchange="checkDate(1)"/>到
    	                <input type="text" id="materialProduct_endDate" name="materialProduct.endDate" 
    	                value="<#if materialProduct.endDate ??>${materialProduct.endDate?string('yyyy-MM-dd')}</#if>" 
    	                onclick="WdatePicker({isShowClear:false,readOnly:true})" onchange="checkDate(2)"/>
	              </td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="原材料进货表">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th rowspan="2">生产日期</th>
	        	  <th colspan="${(productList.size())!}">产品内容</th>
            </tr>
            <tr>
            	<#if (productList??&&productList?size>0)>
    	    		<#list productList as pd>
        	    		<th align="top">
        	    			${(pd.name)!}
        	    		</th>
    	    		</#list>
    	    	</#if>
            </tr>
            </tr>
            <#if (materialProductList??&&materialProductList?size>0)>
            	<#list materialProductList as mp>
            	<tr>
	        	    <td>${(mp.createDate?string('yyyy-MM'))!}</td>
	        	    <#if (productList??&&productList?size>0)>
        	    		<#list productList as pd>
        	    			<#if (mp.proList??&&mp.proList?size>0)>
		        	    		<#assign t_p="">
		        	    		<#list mp.proList as sops>
		        	    			<#if (sops??&&sops.product??&&sops.product.id??&&pd.id??&&sops.product.id=pd.id)>
		        	    				<#assign t_p="${sops.amount!}">
		        	    				<#break>
		        	    			</#if>
		        	    		</#list>
		        	    		<#if (t_p??&&t_p!="")>
		        	    			<td>
		        	    				${t_p!}
		        	    			</td>
		        	    		<#else>
		        	    			<td>
		        	    				-
		        	    			</td>
		        	    		</#if>
		        	    	</#if>
        	    		</#list>
        	    	</#if>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
</html>