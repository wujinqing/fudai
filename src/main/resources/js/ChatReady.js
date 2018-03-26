$(document).ready(function() {
	/**
	 * 休息 1
	 */
	$("#rest").click(function() {
		var c=$(this);
		ChatAjax.setStatus('1', function(data) {
			if (null != data && data == true) {
				$(".staff_status").css("color", "black");
				c.css("color", "red");
			} else {
				alert('服务繁忙!');
			}
			$("#leave").attr("disabled",false);
		});
	});
	
	/**
	 * 空闲 2
	 */
	$("#free").click(function() {
		var c=$(this);
		ChatAjax.setStatus('2', function(data) {
			if (null != data && data == true) {
				$(".staff_status").css("color", "black");
				c.css("color", "red");
				$("#rest").attr("disabled",false);
				$("#busy").attr("disabled",false);
				$("#leave").attr("disabled",false);
				
				getMemberList();
			} else {
				alert('服务繁忙!');
			}
		});
	});
	
	/**
	 * 忙碌 3
	 */
	$("#busy").click(function() {
		var c=$(this);
		ChatAjax.setStatus('3', function(data) {
			if (null != data && data == true) {
				$(".staff_status").css("color", "black");
				c.css("color", "red");;
			} else {
				alert('服务繁忙!');
			}
		});
	});
	/**
	 * 退出 4
	 */
	$("#leave").click(function() {
		var c=$(this);
		ChatAjax.setStatus('4', function(data) {
			if (null != data && data == true) {
				$(".staff_status").css("color", "gray");
				$("#free").css("color", "black");
				$("#rest").attr("disabled",true);
				$("#busy").attr("disabled",true);
				$("#leave").attr("disabled",true);
				
				$(".window_content").remove();
				$("#u_table").html('');
				
				$("#memberUseName").html('');
				$("#memberName").html('');
				$("#memberMobile").html('');
				$("#memberEmail").html('');
				
				$("#dochange").hide();
			} else {
				alert('服务繁忙!');
			}
		});
	});
	$("#rest").attr("disabled",true);
	$("#busy").attr("disabled",true);
	$("#leave").attr("disabled",true);
	$("#dochange").hide();

	
	
	$("#dochange").click(function() {
		var cmid=$("#memberId").val();
		if(cmid!=''){
				ChatAjax.assign(cmid,function(data){
					if(data==0){
						alert('服务繁忙,请稍后再试!');
					}
					if(data==1){
						
						$("#c_tr_" + cmid).remove();
						$("#memberUseName").html('');
						$("#memberName").html('');
						$("#memberMobile").html('');
						$("#memberEmail").html('');
						$("#memberId").val('');
						
//						$("#chatBox_sendMsgButton_"+cmid).hide();
//						$("#chatBox_sendPicButton_wrap_"+cmid).hide();
//						$("#chatBox_sendAudioButton_wrap_"+cmid).hide();
//						$("#exitBox_closeButton_"+cmid).hide();
						$("#window_content_"+cmid).remove();
						
						$("#dochange").hide();
						
						alert('分配成功!');
					}
					if(data==2){
						alert('无其他在线客服人员,无法分配!');
					}
					if(data==3){
						alert('无其他空闲客服人员,无法分配!');
					}
			});		
		}

	});

	
//	dwr.engine.setActiveReverseAjax(true); // 激活反转 重要
//	dwr.engine.setNotifyServerOnPageUnload(true);// 页面销毁或刷新时销毁当前ScriptSession
	
	(function(){
		$("#free").click();			
		
		
	})();
	
	$('#onlineList').click(function(){
			$('#userlist').show();
			$('#onlineList').css('background-color','red');
			$('#offlineUserlist').hide();
			$('#offlineList').css('background-color','white');
	});
	
	
	
	$(function() { 
//		if($.browser.msie) { 
//			alert("this is msie"); 
//		} else if($.browser.safari) { 
//			alert("this is safari!"); 
//		} else if($.browser.mozilla) { 
//			alert("this is mozilla!"); 
//		} else if($.browser.opera) { 
//			alert("this is opera"); 
//		} else { 
//			alert("i don't konw!"); 
//		} 
	});
		
	if($.browser.webkit||$.browser.msie){
		$("#free").click();
	}
	
});


function initscript(){
	dwr.engine.setTimeout(30000);
	dwr.engine.setActiveReverseAjax(true); // 激活反转 重要
	dwr.engine.setNotifyServerOnPageUnload(true);// 页面销毁或刷新时销毁当前ScriptSession
	dwr.engine.setErrorHandler(function (message){alert('返回超时,请刷新重试');}); 
}

//document.onkeydown = function(event){
//	
//	/*
//	(ctrlKey == true && keyCode == 82)    Ctrl+R    ---刷新
//	(keyCode == 116)                      F5        ---刷新
//	(ctrlKey == true && keyCode == 116) Ctrl+F5 ---强制刷新
//	*/
//	    //window.alert(event.keyCode);
//	    var k = event.keyCode;
//	    if((event.ctrlKey == true && k == 82) || (k == 116) || (event.ctrlKey == true && k == 116))
//	     {
//	    	if(window.confirm("确定要刷新或关闭当前页面?")){
//	    		$("#leave").click() ;
//	    				
//				return true;
//	    	}else{
//	    		return false;
//	    	}
//	    	
//	    	
//	    	
////	        alert('不能刷新');
////	         event.keyCode = 0;
////	         event.returnValue = false;
////	         event.cancelBubble = true;
//	     }
//	}
	
	
window.onbeforeunload = function(){ 
//	if (window.event.clientX>document.body.clientWidth&&event.clientY<0||event.altKey) { 
//	     alert("浏览器关闭"); 
//	     $("#leave").click() ;
//     } else { 
//    	 alert("刷新或者跳转到其他页"); 
//     } 

//if(($.browser.msie)&&($.browser.version.indexOf('8')!='-1')){
	ChatAjax.setStatus('4', function(data) {});
//}
	return ;
//	return '将丢失未保存的数据!'; 
}

window.onunload = function(){
	ChatAjax.setStatus('4', function(data) {});
};