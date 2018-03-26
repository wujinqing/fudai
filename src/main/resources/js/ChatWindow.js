/**
 * 初始化某会员的聊天窗口
 * @param {} id
 */
function initWindowCommon(id,title){
	var winw = initWindow(id, title);
	$("#content_td").append(winw);
	$("#chatBox_chatLogButton_"+id).click(function(){//查看历史
		window.open('../im/i_message!history.action?message.uid_2='+id,'_blank');	
	});
	initWindowButton(id);
}

/**
 * 初始化窗口按钮
 * @param {} id
 */
function initWindowButton(id){
	
    $(document).bind('keydown', 'Ctrl+return', function (evt){
    	$("#chatBox_sendMsgButton_" + id).click();
    	return false; 
    });

	
	$("#chatBox_sendMsgButton_" + id).click(function() {//发送按钮
		var v = $("#rich_editor_text_" + id).val();
		if (v == '') {
			//alert('请输入内容!');
		} else {
			var mname=$('#userName').val();
			var ty=$('#userType').val();
			ChatAjax.sendMessage(v, id, function(data) {
				if (null==data||data=='') {
					alert("\"" + v + "\"发送不成功!");
				}else{
					if(ty=='1'){
						addContentToWindow(id, mname+"[营养师]", v,data,1);
					}else if(ty=='2'){
						addContentToWindow(id, mname+"[咨询师]", v,data,1);
					}else{
						addContentToWindow(id, mname, v,data,1);
					}
				}
			});
			$("#rich_editor_text_" + id).val('');
		}
	});
	
	
	$("#chatBox_closeButton_"+id).click(function(){//关闭按钮
		$("#window_content_"+id).remove();
	});
	
	$("#upload_img_form_"+id).submit(function(){//上传图片表单
		startProgress(id);
	});
	
	$("#send_img_"+id).change(function(){//上传图片
		var v=$(this).val();
		if(v!=''){
			
			var cid_=$('#m_cmid_'+id).val();
			if(cid_==id){//在线
				$('#online_'+id).val('1');
			}else{//不在线
				$('#online_'+id).val('0');
			}
			
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
				$("#upload_img_form_"+id).submit();
			}
		}
		
	});
	
	
	$("#upload_audio_form_"+id).submit(function(){//上传音频表单
		startProgress(id);
	});
	
	$("#send_audio_"+id).change(function(){//上传音频
		var v=$(this).val();
		if(v!=''){
			var extStart=v.lastIndexOf("."); 
			var ext=v.substring(extStart,v.length).toUpperCase(); 
			if(ext!=".MP3"){ 
				$(this).val('');
				if($.browser.msie){
					var afile = $(this);
					afile.replaceWith(afile.clone());
				}
				alert("音频限于.MP3格式"); 
				return false; 
			}else{
				$("#upload_audio_form_"+id).submit();
			}
		}
	});
	
	
	$("#upload_file_form_"+id).submit(function(){//上传文件表单
		startProgress(id);
	});
	
	$("#send_file_"+id).change(function(){//上传文件
		alert('有待开发中,敬请关注!')
		//$("#upload_file_form_"+id).submit();
	});
	
	
	$("#clearScreen_Button_"+id).click(function(){//清屏
		$("#chatBox_msgList_"+id).html('');
	});
	
	$("#exitBox_closeButton_"+id).click(function(){//结束会话
		ChatAjax.endOne(id,function(data){
			if(data==true){
				$("#c_tr_"+id).remove();
				$("#chatBox_sendMsgButton_"+id).hide();
				$("#chatBox_sendPicButton_wrap_"+id).hide();
				$("#chatBox_sendAudioButton_wrap_"+id).hide();
				$("#exitBox_closeButton_"+id).hide();
				var m=$("#memberId").val();
				if(m==id){
					$("#dochange").hide();
				}
				playTipSound(1);
				alert('结束成功!');
			}else{
				alert('网络异常!');
			}
			
		});
	});
	
	/**
	 * 发送离线消息
	 */
	$('#chatBox_sendOfflineMsgButton_'+id).click(function(){
		
		var content=$.trim($('#rich_editor_text_'+id).val());
		if(content==''){
			return false;
		}
		var mname=$('#chatBox_mainName_'+id).html();
		var ty=$('#userType').val();
		ChatAjax.addOfflineMsg(id,mname,content,function(data){
			
			if(null!=data){
				var info ='';
				if(data['result']=='true'){
					$('#rich_editor_text_'+id).val('');
					
				}else{
					alert('失败');
					info='<br/>[发送失败!]';
				}
				var sendName='';
				if(ty=='1'){
					 sendName=$('#userName').val()+"[营养师]";
				}else if(ty=='2'){
					 sendName=$('#userName').val()+"[咨询师]";
				}else{
					 sendName=$('#userName').val();
				}
				addContentToWindow(id,sendName , content+info, data['time'],1);
			}else{
				//网络异常
				alert('网络异常,请稍后再试!');
			}
		});
	});
}


/**
 * 显示发送的内容
 * @param {} uid
 * @param {} uname
 * @param {} content
 * @param {} date
 */
function addContentToWindow(uid,uname,content,date,t){
	var msg= '<dl class="chatBox_myMsg" >'+
			    '<dt title="'+uname+'" class="msgHead"><span class="msgHead_title_'+t+'">'+uname+'</span><span style="margin-left:5px">'+date+'</span></dt>'+
			    '<dd style="" class="msg_detail_content">'+content+ '</dd>'+
			  '</dl>';
	$("#chatBox_msgList_"+uid).append(msg);
	
	var d=document.getElementById('chatBox_msgList_'+uid)
	d.scrollTop=d.scrollHeight;
}

/**
 * 窗体
 * @param {} uid
 * @param {} uname
 * @return {}
 */
function initWindow(uid ,uname){
	var ws= '<div class="window_content" id="window_content_'+uid+'" style="width:;display:none;margin-top:0px;">'+
	'<div class="window_titleBar" id="window_titleBar_3" style="height:;width:;">'+
	    '<div class="window_title titleText" id="window_title_'+uid+'" style="height: ;">'+
	      '<div class="chatBox_nameArea" id="chatBox_nameArea_'+uid+'"><a href="###" title="'+uname+' " uin="'+uid+'" class="chatBox_allName titleText" id="chatBox_allName_'+uid+'"> <span id="chatBox_mainName_'+uid+'" class="chatBox_mainName">'+uname+'</span> </a></div>'+
	    '</div>'+
	  '</div>'+
	  '<div class="window_bodyOuter" id="window_body_outer_'+uid+'" style="width:; top: 83px; height: 447px; border:1px solid black;">'+
	    '<div class="window_bodyArea" id="window_body_'+uid+'" style="width:; height: 347px;">'+
	      '<div id="chatBox_chatBox_mainArea_'+uid+'" class="chatBox_mainArea" style="">'+
	        '<div class="chatBox_chatBoard" id="chatBox_chatBoard_'+uid+'" style="bottom: 171px;height:">'+
	          '<div class="chatBox_msgList" id="chatBox_msgList_'+uid+'" style="height:300px;overflow:scroll;">'+
	          '</div>'+
	        '</div>'+
	        '<div class="chatBox_toolBar" id="chatBox_toolBar_'+uid+'"> '+
			   '<a href="###" id="chatBox_sendPicButton_wrap_'+uid+'"  style="float:left;cursor:pointer;height:20px;margin-right:10px;">'+
			   initUploadImgForm('发图片',uid,uname,1)+
	          '</a>'+
	          
			  '<a href="###" id="chatBox_sendAudioButton_wrap_'+uid+'" style="float:left;cursor:pointer;height:20px;margin-right:10px;display:none;">'+
			  	initUploadAudioForm('发音频',uid,uname,2)+
	          '</a> '+
	          
	          '<a href="###" id="chatBox_sendFileButton_wrap_'+uid+'" style="float:left;cursor:pointer;height:20px;margin-right:10px;display:none">'+
	          	initUploadFileForm('发送文件',uid,uname,3)+
	          '</a> '+
	          
	          '<a id="chatBox_clearButton_'+uid+'" style="float:left;">'+
		          '<div id="progressBar_'+uid+'" class="progressBar" style="display: none;">'+
		          '<div id="theMeter_'+uid+'" class="theMeter">'+
		          	'<div id="progressBarBox_'+uid+'" class="progressBarBox" style="float:left">'+
		          		'<div id="progressBarBoxContent_'+uid+'" clas="progressBarBoxContent" style="float:left"></div>'+
		          	'</div>'+
		          	'<div id="progressBarText_'+uid+'" class="progressBarText" style="float:left;font-size:12px"></div>'+
		          '</div>'+
		          '</div>'+
	          '</a>'+
			  '<a href="###" title="消息记录" class="chatBox_historyButtonCon" id="chatBox_chatLogButton_'+uid+'" style="float:right">'+
				  '消息记录'+
	          '</a> '+
	          '<a href="###" title="清屏" class="clearScreen_Button" id="clearScreen_Button_'+uid+'" style="float:right;margin-right:10px;">'+
				  '清屏'+
	          '</a> '+
			  '</div>'+
	        '<div class="chatBox_inputBox" id="chatBox_inputBox_'+uid+'">'+
	          '<div class="rich_editor" style="font-family: Arial; font-size: 13pt; font-weight: bold; font-style: italic; text-decoration: underline; color: rgb(0, 0, 255);">'+
	            '<div contenteditable="true" class="rich_editor_div" style="display: none;"><br>'+
	            '</div>'+
	            '<textarea class="rich_editor_text" id="rich_editor_text_'+uid+'" _olddisplay="block" style="display:;width:99.5%; height:100px"></textarea>'+
	          '</div>'+
	        '</div>'+
	        '<div class="chatBox_controlPanel">'+
	          '<a title="发送离线消息" class="chatBox_sendMsgButton" id="chatBox_sendOfflineMsgButton_'+uid+'" href="###">发送离线消息</a> '+
			  '<a title="发送" class="chatBox_sendMsgButton" id="chatBox_sendMsgButton_'+uid+'" href="###">发&#12288;送</a> '+
			  '<a title="关闭" class="chatBox_closeButton" id="chatBox_closeButton_'+uid+'" href="###">关&#12288;闭</a> '+
			  '<a title="结束会话" class="exitBox_closeButton" id="exitBox_closeButton_'+uid+'" href="###">结束会话</a> '+
			  '</div>'+
	      '</div>'+
	    '</div>'+
	  '</div>'+
	'</div>';
	return ws;
}

/**
 * 图片表单
 * @param {} title
 * @param {} uid
 * @param {} uname
 * @param {} ft
 * @return {}
 */
function initUploadImgForm(title,uid,uname,ft){
	var s='<form action="../upload/file_upload.action" enctype="multipart/form-data" method="post" id="upload_img_form_'+uid+'"	target="hidden_frame">'+
		title+
		'<input type="file" name="uf" class="input_file_'+ft+'" id="send_img_'+uid+'" size="4"/>'+
		'<input type="hidden" value="'+uid+'" name="uid"/>'+
		'<input type="hidden" value="'+uname+'" name="uname"/>'+
		'<input type="hidden" value="" name="online" id="online_'+uid+'"/>'+
		'<input type="hidden" value="'+ft+'" name="ft"/>'+
	'</form>';
	return s;
}
/**
 * 音频表单
 * @param {} title
 * @param {} uid
 * @param {} uname
 * @param {} ft
 * @return {}
 */
function initUploadAudioForm(title,uid,uname,ft){
	var s='<form action="../upload/file_upload.action" enctype="multipart/form-data" method="post" id="upload_audio_form_'+uid+'" target="hidden_frame">'+
		title+
		'<input type="file" name="uf" class="input_file_'+ft+'" id="send_audio_'+uid+'" size="4"/>'+
		'<input type="hidden" value="'+uid+'" name="uid"/>'+
		'<input type="hidden" value="'+uname+'" name="uname"/>'+
		'<input type="hidden" value="'+ft+'" name="ft"/>'+
	'</form>';
	return s;
}
/**
 * 文件表单
 * @param {} title
 * @param {} uid
 * @param {} uname
 * @param {} ft
 * @return {}
 */
function initUploadFileForm(title,uid,uname,ft){
	var s='<form action="../upload/file_upload.action" enctype="multipart/form-data" method="post" id="upload_file_form_'+uid+'" target="hidden_frame">'+
		title+
		'<input type="file" name="uf" class="input_file_'+ft+'" id="send_file_'+uid+'" size="4"/>'+
		'<input type="hidden" value="'+uid+'" name="uid"/>'+
		'<input type="hidden" value="'+uname+'" name="uname"/>'+
		'<input type="hidden" value="'+ft+'" name="ft"/>'+
	'</form>';
	return s;
}