<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <script type='text/javascript' src='${base}/dwr/interface/ChannelAjaxService.js'></script>
		<script type='text/javascript' src='${base}/dwr/engine.js'></script>
        <@u.css src="style.css"/>
        <@u.rootjs src="jquery-1.4.2.min.js"/>
        <script type='text/javascript'>
            function edit(id) {
                document.getElementById('channel.id').value = id;
                var form = document.getElementById('oper_form');
                form.action = "channel!input.action?pid=${(id)!}";
                form.submit();
            }
            function del(id,pId) {
                if(confirm("确认删除该菜单？")) {
                    document.getElementById('channel.id').value = id;
                    var form = document.getElementById('oper_form');
                    form.action = "channel!delete.action?pid="+pId;
                    form.submit();
                }
            }
            function setAd(code){
            	if(code!=''){
	            	document.getElementById('channel_code').value = code;
	                var form = document.getElementById('ad_form');
	                form.action = "advert!listAd.action";
	                form.submit();
                }
            }
                   
	  $(document).ready(function(){
            	  //排序 -----
            	$(".old_order").click(function(){
 	 		  		var obj=$(this);
 	 		  		obj.hide();
 	 		  		$("#msginfo").fadeIn(800);
					$("#tip").html('保存排序修改内容请点击保存!'); 		  		
 	 		  		var hidden=obj.parent().find(".order_orderId").first();
  		  			hidden.show();
  		  			hidden.val(obj.text());
  		  			hidden.focus();
  		  			hidden.attr("class","order_orderId_show");
  		  			hidden.blur(function(){
  		  				var id=$(this).attr("id");
			  			var v=$(this).val();
			  			if(v==''){
			  				$(this).val(id.split("_")[1]);
			  			}else{
			  				if(v.length>4){
			  					alert('长度过长，请保持在1~4位之内');
			  					$(this).val(id.split("_")[1]);
			  					return false;
			  				}
			  				var numberRole=/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/;
			  				if(!numberRole.test(v)){
			  					alert('请输入有效地数字');
			  					$(this).val(id.split("_")[1]);
			  					return false;
			  				}
			  				var eid_order=$(".order_orderId_show");
			  				var redInput=new Array();
				  			if(eid_order.length>1){
				  				k=0;
			  					eid_order.each(function(){
			  						var oid=$(this).attr("id");
			  						var ov=$(this).val();
			  						if(id!=oid&&v==ov){
			  							$(this).css("background","red");
			  							redInput.push($(this));
			  							k++;
			  						}
			  					});
			  					if(k>0){
			  						alert('与其他需修改的记录重复');
	  								$(this).val(id.split("_")[1]);
	  								$(this).focus();
	  								window.setTimeout(function(){
	  									for(i=0;i<redInput.length;i++){
	  										redInput[i].css("background","");
	  									}
	  								},2000);
			  					}
				  			}
			  			}
  		  			});
  		  			obj.parent().find("img").first().show();
  		  		});
  		  		
  		  		$("#orderCancel").click(function(){
  		  			$(".old_order").show();
  		  			//$(".order_orderId").hide();
  		  			$(".order_orderId_show").hide();
  		  			$(".order_orderId_show").val('');
  		  			$(".order_orderId_show").attr("class","order_orderId");
  		  			$(".edit_span img").hide();
  		  			$("#msginfo").hide();
  		  		});
  		  		
  		  		$("#orderSave").click(function(){
  		  			//发送到后台
  		  			var orders=$(".order_orderId_show");
					if(orders.length>0){
						var myOrders=new Array();
						var j=0;
						//检查是否有修改的记录
						orders.each(function(){
							var order=$(this);
							var old_order=order.attr("id").split("_")[1];
							if(old_order==order.val()||order.val()==''){
								j++;
							}else{
								myOrders.push(order.attr("id")+"_"+order.val());
							}
						});
						if(j==orders.length){
							$("#msginfo input").hide();
							$("#tip").html('未修改任何记录!');
		  		  			window.setTimeout(function(){
		  		  				$("#msginfo input").show();
		  		  				$("#tip").html('保存排序修改内容请点击保存！');
			  		  			$("#msginfo").hide();
		  		  				$(".old_order").show();
		  		  				$(".order_orderId_show").hide();
		  		  				$(".order_orderId_show").val('');
			  		  			$(".order_orderId_show").attr("class","order_orderId");
			  		  			$(".edit_span img").hide();
		  		  			},2000);
						}else{
							//post 数据
						    ChannelAjaxService.saveOrders(myOrders,function(data){
								$("#msginfo input").hide();
								if(null!=data&&data){
									$("#tip").html(data["msg"]+':'+data["count"]);
								}else{
									$("#tip").html('系统繁忙,请稍后再试!');
								}
								window.setTimeout(function(){
			  		  				//$("#search_form").submit();
			  		  				window.location="channel!list.action?id=${(channel.id)!}"
			  		  			},1500);
							});
						}
					}  		  		
  		  		});
  		  		$(".edit_span img").click(function(){
  		  			var p=$(this).parent();
  		  			var input=p.find("input").first();
  		  			input.hide();
  		  			input.val(input.attr("id").split("_")[1]);
  		  			input.attr("class","order_orderId");
  		  			p.find("span").first().show();
  		  			$(this).hide();
  		  		});
  		  		$("div.listTitle ul").css("width","auto");
            	$("div.listTitle ul li").css({"margin-left":"auto","margin-right":"auto"});
  		  		$(".edit_span img").hide();
  		  		$(".edit_span img").css("cursor","pointer");
  		  		$(".edit_span img").attr("title","取消");
  		  		//-----排序结束----
  		  		
            	  
            	  })
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="oper_form" name="oper_form">
        	<input id="channel.id" name="id" type="hidden"  value="${(channel.id)!}">
        	
        </form>
        
        <form method="post" id="ad_form" name="ad_form">
        	<input id="channel_code" name="advert.channelCode" type="hidden" >
        	
        </form>
        
        
        <@u.title_bar title="【${(channel.channelName)!'根目录列表'}】下子目录列表：">
              <span id="msginfo" style="border:1px solid blue;font-size:10px;padding:0px;margin-top:4px;margin-bottom:4px;width:75%;text-align:center;background:yellow;display:none;">
			    		<input class="btn_bg" type="button" value="保存" id="orderSave" />
			    		<input class="btn_bg" type="button" value="取消" id="orderCancel" />
			    		<span id="tip" style="font-size:13px;float:right;margin-right:30%;margin-left:0px;"></span>
			   </span> 
        <@u.title_bar_btn type="new" onclick="edit();"/>
    	</@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <th width="15%">显示名称</th>
                <th width="15%">栏目编号</th>
                <th width="10%">排序</th>
                <th width="25%">操作</th>
            </tr>
            <#if channelList??>
            	<#list channelList as channel>
            	<tr>
                    <td>${channel.channelName!'&nbsp;'}</td>
                    <td>${channel.channelCode!'&nbsp;'}</td>
                    <td>
                       <span class="edit_span">
                    		<span id="old_${((channel.orderId)?c)!}" class="old_order" style="width:40px;cursor:pointer;" title="点击修改">${((channel.orderId)?c)!}</span>
		        	    	<input type="text" style="display:none;border:1px solid blue;width:40px;text-align:center;" value="" class="order_orderId" id="${((channel.id)?c)!}_${((channel.orderId)?c)!}" />
		        	    	<img src="${base}/images/front/close.gif" style="display:none"/>
                    	</span>
                    </td>
                    <td>
                       <input class="btn_bg" type="button" value="修改" onclick="edit('${channel.id!}')" />
                       <input class="btn_bg" type="button" value="删除" onclick="del('${channel.id!}','${channel.parentId!}')" />
                       <input class="btn_bg" type="button" value="管理广告" onclick="setAd('${channel.channelCode!}')" />
                    </td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>
     </body>
</html>
