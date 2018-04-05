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

        		var productName = document.getElementById("product.name").value;
        		var productStyle = document.getElementById("product.style").value;
        		var productColor = document.getElementById("product.color").value;
        		var productUnit = document.getElementById("product.unit").value;
        		var productPrice = document.getElementById("product.price").value;

                if(productName ==""){
                    alert("请填写品名！");
                    return;
                }

                if(productStyle ==""){
                    alert("请填写款式！");
                    return;
                }
                if(productColor ==""){
                    alert("请填写颜色！");
                    return;
                }
                if(productUnit ==""){
                    alert("请填写单位！");
                    return;
                }
                if(productPrice ==""){
                    alert("请填写单价！");
                    return;
                }

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
        		var oName = document.getElementById("product.name").value;
        		var oPrice = document.getElementById("product.price").value;
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
    	<@u.form_bar title='${(product.id??)?string("编辑商品","新建商品")}'>
    	<form id="form" name="form" onsubmit="doCheck()" action="/product/save" method="post" enctype="multipart/form-data">
    	<input type="hidden" id="idAmount" name="idAmount" value=""/>
    	<input type="hidden" id="flush" name="flush" value="true">
    	<input type="hidden" id="id" name="id" value="${product.id!}">

    	<table>


            <tr>
                <td width="15%" class="txtRight">品名：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="name" id="product.name" value="${product.name!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">款式：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="style" id="product.style" value="${product.style!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">颜色：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="color" id="product.color" value="${product.color!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">单位：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="unit" id="product.unit" value="${product.unit!}">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">单价：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%"  name="price" id="product.price" value="${product.price!}">
				</td>
            </tr>


            <tr>
                <td colspan="4">
                    <input type="submit" class="btn_bg" value="保存" >
                    <span id="msg" style="color:red"></span>
                </td>
            </tr>

		</table>
        </form>
    	</@u.form_bar>
    </body>
</html>