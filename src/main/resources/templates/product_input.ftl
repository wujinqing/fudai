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
        		document.getElementById("product.salesType").value = st;
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
    	<form id="form" name="form" action="product!saveOne.action" method="post" enctype="multipart/form-data">
    	<input type="hidden" id="idAmount" name="idAmount" value=""/>
    	<input type="hidden" id="flush" name="flush" value="true">
    	<input type="hidden" id="id" name="id" value="${product.id!}">

    	<table>
    		<tr>
    			<td width="15%" class="txtRight">商品名称：</td>
			    <td width="35%" class="txtLeft"><input type="text" id="product.name" name="product.name" value="${product.name!}"></td>
        	    <td width="15%" class="txtRight">销售单价：</td>
			    <td width="35%" class="txtLeft"><input type="text" id="product.price" name="product.price" value="${(product.price)!}"><font color="red">*</font></td>
        	</tr>




            <tr>
                <td colspan="4">
                    <input type="button" class="btn_bg" value="保存" onClick="save('${(product.parentId)!}','${(product.id)!}')">
                    <span id="msg" style="color:red"></span>
                </td>
            </tr>

		</table>
        </form>
    	</@u.form_bar>

		<!--html编辑器-->
		<script type="text/javascript">
		var oFCKeditor = new FCKeditor("product.description");
		oFCKeditor.BasePath="/js/fckeditor/";
		oFCKeditor.Height="100%";
		oFCKeditor.ToolbarSet = "Default" ;
		oFCKeditor.Value="";
		oFCKeditor.ReplaceTextarea();
		</script>
    </body>
</html>