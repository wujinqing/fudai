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
              $().ready(function(){
        		$('#form').validate({
        			rules:{

        			}
        		});
        	})

        	function doCheck(){
        		var types = document.getElementsByName("sale_type");
        		var check = "";
        		for(var i=0;i<types.length;i++){
        			if(types[i].checked){
        				check = check + types[i].value + ",";
        			}
        		}
        		var st = check.substring(0,check.length-1);
        		document.getElementById("order.salesType").value = st;
        	}


        	function save(pid,id){
        		var name = document.getElementsByName("m_p");
        		var ia = ""
        		for(var i=0;i<name.length;i++){
        			if(name[i].checked == true){
        				var amount = document.getElementById("amount_"+name[i].value).value;
        				if(amount != ""){
        					var s = name[i].value+"_"+amount;
        					ia = ia + "," + s;
        				}
        			}
        		}
        		$("#idAmount").attr("value",ia);
        		var form = document.getElementById("form");
        		var vFile = document.getElementById("file").value;
        		if(vFile!=""){
					var position = vFile.indexOf(".");
					var name = vFile.substring(position+1).toUpperCase();
					if(name!="JPG"&&name!="BMP"&&name!="JIF"&&name!="JPEG"&&name!="PNG"){
						alert("请选择图像后缀名为：jpg,bmp,jif,jpeg,png");
						return;
					}
				}
				if(pid=="") pid=0;
				if(id=="") id=0;
        		var oName = document.getElementById("order.name").value;
        		var oPrice = document.getElementById("order.price").value;
	        	var over = document.getElementById("isOver").value;
	        	if(oName ==""){
	        		alert("请填写商品名称！");
	        		return;
	        	}
	        	if(oPrice ==""){
	        		alert("请填写商品单价！");
	        		return;
	        	}	        	ProductAjaxService.checkNameAndStore(oName,pid,id,over,function(data){
	        		if(data!=""){
	        			alert(data);
	        			return;
	        		}else{
	        			document.getElementById("msg").innerHTML="正在提交，请稍后...";
	        			form.submit();
	        		}
	        	});
        	}
        </script>
    </head>
    <body class="mainbody">
    	<@u.form_bar title='选择产品'>
    	<form id="form" name="form" action="/order/third" method="post" enctype="multipart/form-data">
    	<input type="hidden" id="idAmount" name="idAmount" value=""/>
    	<input type="hidden" id="flush" name="flush" value="true">
    	<input type="hidden" id="id" name="id" value="${order.id!}">

    	<table>


            <tr>
                <td width="15%" class="txtRight">订单号：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="orderNo" value="${order.orderNo!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">下单日期：</td>
                <td colspan="3" width="35%" class="txtLeft">
                    <input type="text" style="width:50%"  name="date" value="${order.date!}">
                </td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">客户姓名：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="customerName" value="${order.customerName!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">联系电话：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="customerPhoneNumber" value="${order.customerPhoneNumber!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">联系地址：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="customerAddress" value="${order.customerAddress!}">
				</td>
            </tr>



            <tr>
                <td colspan="4">
                    <input type="submit" class="btn_bg" value="下一步，选择产品" >
                    <span id="msg" style="color:red"></span>
                </td>
            </tr>

		</table>
        </form>
    	</@u.form_bar>
    </body>
</html>