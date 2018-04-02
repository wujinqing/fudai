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

              function addProduct() {

                  var form = document.getElementById("form");

                  document.getElementById("msg").innerHTML = "正在提交，请稍后...";
                  form.submit();

              }

              function forthStep(){
                  var form = document.getElementById("form1");

                  document.getElementById("msg").innerHTML = "正在提交，请稍后...";
                  form.submit();
              }

              function ch() {

                  var select = document.getElementById("member_qjScore");

                  var index = select.selectedIndex;

                  var pid = select.options[index].getAttribute("pid"); // 选中值
                  var price = select.options[index].getAttribute("price"); // 选中值
                  var productPrice = document.getElementById('productPrice');
                  productPrice.value = price
//				alert(v)
              }

              function changeNums()
			  {
                  var productPrice = Number(document.getElementById('productPrice').value);
                  var productAmount = Number(document.getElementById('productAmount').value);
//                  alert(productAmount)
//                  alert(isNumber(productAmount))

                  if(!isNumber(productAmount))
				  {
				      alert("请输入数字！")
					  return
				  }

                  var originalPrice = document.getElementById('originalPrice');
                  var actualPrice = document.getElementById('actualPrice');
                  var priceTotal = productPrice * productAmount
                  originalPrice.value = priceTotal
                  actualPrice.value = priceTotal

			  }

              function isNumber(obj) {
                  return obj === +obj
              }
        </script>
    </head>
    <body class="mainbody">
    <form method="post" id="form1" name="form1" action="/order/forth">
        <input type="hidden" id="orderId" name="orderId" value="${(order.id)!}">
    </form>

    	<@u.form_bar title='添加产品'>
    	<form id="form" name="form" action="/order/add_product" method="post" enctype="multipart/form-data">
    	<input type="hidden" id="idAmount" name="idAmount" value=""/>
    	<input type="hidden" id="flush" name="flush" value="true">
    	<input type="hidden" id="id" name="orderId" value="${order.id!}">

    	<table>


            <tr>
                <td width="15%" class="txtRight">选择产品：</td>
                <td colspan="3" width="35%" class="txtLeft">
                    <select id="member_qjScore" name="productId" onchange="ch()">
                        <option value="">---请选择---</option>
						<#if productList??>
							<#list productList as product>
								<option value="${(product.id)!}" pid="${(product.id)!}" price="${(product.price)?c!}">
								【${(product.name)!}】-【${(product.style)!}】-【${(product.color)!}】
								</option>
							</#list>
						</#if>
                    </select>
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">单价：</td>
                <td colspan="3" width="35%" class="txtLeft" >
                    <input type="text" style="width:50%; border: hidden" id="productPrice"  readonly="readonly" name="price" value="0">
                </td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">数量：</td>
                <td colspan="3" width="35%" class="txtLeft">
                    <input type="text" style="width:10%"  id="productAmount" name="amount" value="0" onkeyup="changeNums()">
                </td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">原价：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:50%; border: hidden" id="originalPrice"  readonly="readonly" name="originalPrice" value="0">
				</td>
            </tr>
            <tr>
                <td width="15%" class="txtRight">实际价格：</td>
                <td colspan="3" width="35%" class="txtLeft">
					<input type="text" style="width:20%"  id="actualPrice" name="actualPrice" value="0">
				</td>
            </tr>




            <tr>
                <td colspan="4">
                    <input type="button" class="btn_bg" value="添加产品" onClick="addProduct()">

                    <input type="button" class="btn_bg" value="下一步，计算价格" onClick="forthStep()">
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