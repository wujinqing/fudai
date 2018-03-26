$(document).ready(function(){
	
	
	$('#chatBox_sendMsgButton').click(function(){
		var content=$.trim($('#rich_editor_text').val());
		if(content){
			ClientChatAjax.sendMessage(content,function(data){
				if(data){
					var Msg={
						title:$('#userName').val(),
						date:data,
						content:content	
					};
					addMsgToWindow(Msg,'1');
					$('#rich_editor_text').val('');
				}else{
					alert(content+'\n发送失败!');
				}
			});
		}
	});
		
	windowReady();
	initOther();
});

function windowReady(){
	$("#send_img").change(function(){//上传图片
		var v=$(this).val();
		if(v!=''){
			
			var extStart=v.lastIndexOf("."); 
			var ext=v.substring(extStart,v.length).toUpperCase(); 
			if(ext!=".BMP"&&ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"){ 
				$(this).val('');
				if($.browser.msie){
					var afile = $(this);
					afile.replaceWith(afile.clone());
				}
				alert("图片限于bmp,png,jpeg,jpg格式"); 
				return false; 
			}else{
				$("#upload_img_form").submit();
			}
		}
		
	});
	
	$("#upload_img_form").submit(function(){//上传图片表单
		startProgress('');
	});
	
	$("#chatBox_chatLogButton").click(function(){//查看历史
		window.open('../im/i_message!memberHistory.action','_blank');	
	});
	
	$('#clearScreen_Button').click(function(){//清屏
		$("#chatBox_msgList").html('');
	});
	
	$('#exitBox_closeButton').click(function(){//结束按钮
		ClientChatAjax.exitChat(function(data){
			if(data){
				
				
			}
//			window.close();
			
			$('#chatBox_sendPicButton_wrap').hide();
			$('#chatBox_sendMsgButton').hide();
			$('#exitBox_closeButton').hide();
			
			
		});
	});
   $(document).bind('keydown', 'Ctrl+return', function (evt){//绑定发送按钮  Ctrl+ent
    	$("#chatBox_sendMsgButton").click();
    	return false; 
    });

}

//playTipSound(msg.type);


function addMsgToWindow(msg,st){
	
	var msgHtml='<dl class="chatBox_myMsg">'+
					'<dt class="msgHead" title="'+msg['title']+'">'+
						'<span class="msgHead_title_'+st+'">'+msg.title+'</span>'+
						'<span style="margin-left: 5px">'+msg.date+'</span>'+
					'</dt>'+
					'<dd class="msg_detail_content" style="">'+msg.content+'</dd>'+
				'</dl>'
					
	$('#chatBox_msgList').append(msgHtml);
	
	var d=document.getElementById('chatBox_msgList');
	d.scrollTop=d.scrollHeight;
	
}
/**
* 输出会员消息
* @param {} uid
* @param {} uname
* @param {} date
* @param {} mt
* @param {} content
*/
function showMessage(uid,uname,date,mt, content,st ) {
	var content_='';
	
	if(mt=='0'){
		content_=content
		
	}
	if(mt=='1'){
		content_='<img src="./imphotos/'+content+'" width="120px" onclick="viewImg2(this)" style="cursor:pointer"/>';
	}

	if(mt=='2'){
		var src='./imaudios/'+content;
		var embed='<embed height="24px" width="261px" allowscriptaccess="always" wmode="transparent" ' +
				'type="application/x-shockwave-flash" ' +
				'src="./swf/douban_music.swf?url='+src+'&amp;autoplay=0">';
		content_=embed;
	}
	
	var Msg={
			title:uname,
			date:date,
			content:content_	
		};
		addMsgToWindow(Msg,st);
	
	
	if(st!='1'){
		playTipSound(2,'./');
	}
}

function  viewImg2(o){
	window.open(o.src,'_blank');
	
}

function initOther(){
	
	initscript();
	
}


function initscript(){
	ClientChatAjax.into("",function(data){
		if(data){
			var pass=data['pass'];
			if(pass=='1'){//成功
				
//				var Msg={
//					title:'客服',
//					date:'2012-08-24',
//					content:'hello'	
//				};
				
//				addMsgToWindow(Msg);
				
				//查找离线的消息
				
				ClientChatAjax.getMemberOfflineMsgDetail(function(data2){
					for(i=0;i<data2.length;i++){
						var type=data2[i]['type'];
						var content='';
						var time=data2[i]['time'];
						var uname=data2[i]['uname']+'[离线]';
						
						if(type=='0'){
							content=data2[i]['content'];
						}
						
						if(type=='1'){
							content='<img src="./imphotos/'+data2[i]['content']+'" width="120px" onclick="viewImg2(this)" style="cursor:pointer"/>';
						}
						
						var Msg={
							title:uname,
							date:time,
							content:content	
						};
						
						addMsgToWindow(Msg);
					}
					
				});
				
				
				$('#con_status').hide();
				$('#window_content').show();
				setScript();
				$('.space_ps_uni').css('visibility', '');
			}else{
				var tip=data['tip'];
				var content=data['msg'];
				if(tip){
					content+='<br/>'+tip;
				}
				$('#con_status').html(content);
				$('.space_ps_uni').css('visibility', 'hidden');
			}
			
		}
	});
}


function setScript(){
	dwr.engine.setTimeout(30000);
	dwr.engine.setActiveReverseAjax(true); // 激活反转 重要
	dwr.engine.setNotifyServerOnPageUnload(true);// 页面销毁或刷新时销毁当前ScriptSession
	dwr.engine.setErrorHandler(function (message){alert('返回超时,请刷新重试');}); 
}

 
window.onbeforeunload = function(){ 
	ClientChatAjax.exitChat();
	return ; 
}


window.onunload = function(){
	ClientChatAjax.exitChat();
};










