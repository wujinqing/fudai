
if (typeof window['DWRUtil'] == 'undefined'){
	window.DWRUtil = dwr.util;
}

function setNewMsgCount(id, count) {
	$("#new_msg_" + id).html("(" + count + ")");
}

function showOfflineCount(id,count){
	$('#offlineCount').html("<a href='#' onclick='showOfflineMemberMsgList()'>离线消息:"+count+"</a>");
}
function showOfflineMemberMsgList(){
	$('#offlineList').css('background-color','red');
	$('#onlineList').css('background-color','white');
	
	$('#offlineList').show();
	
	$('#userlist').hide();
	
	
	$('#offlineUserlist').show();
	$('#offlineCount').html('');
	
	ChatAjax.memberMsgList(function(data){
		if(null!=data&&data.length>0){
			$('#o_table tr').remove();
			for (var i = 0; i <data.length; i++) {
				var mb=data[i];
				
				var mid='<input type="hidden" value="'+mb.cmid+'" id="mid_o_'+mb.cmid+'"  />';
				var name='<input type="hidden" value="'+mb.sname+'" id="name_o_'+mb.cmid+'"  />';
				var uname='<input type="hidden" value="'+mb.uname+'" id="uname_o_'+mb.cmid+'"  />';
				
				var phone='<input type="hidden" value="'+mb.mobile+'" id="phone_o_'+mb.cmid+'"  />';
				var email='<input type="hidden" value="'+mb.email+'" id="email_o_'+mb.cmid+'"  />';
				
				var tr='<tr id="tr_o_'+mb.cmid+'"><td><a href="#" onclick="showMemberOfflineMsgDetail(\''+mb.cmid+'\')">'+mb.uname+'</a>&nbsp;<span id="o_f_count_'+mb.cmid+'">['+mb.msgCount+']</span>'+mid+name+uname+phone+email+'</td></tr>';
				$('#o_table').append(tr);
			}
		}
	});
}
function showOfflineMemberList(){
	$('#offlineUserlist').show();
	$('#userlist').hide();
	
	$('#offlineList').css('background-color','red');
	$('#onlineList').css('background-color','white');
	
}

function isOnline(cid){
	var cid_=$('#m_cmid_'+cid).val();
	return	cid_==cid;
}

function showMemberOfflineMsgDetail(cid){
	$('#member_info_td').show();
	if(isOnline(cid)){//在线
		$('#status_member').html('');
	}else{
		$('#status_member').html(' 离线');
	}
	$('#memberUseName').html($('#uname_o_'+cid).val());
	
	$('#memberName').html($('#name_o_'+cid).val());
	
	var phone=$('#phone_o_'+cid).val();
	if(phone==null||phone=='null'||phone==''){
		$('#memberMobile').html('无');
	}else{
		$('#memberMobile').html(phone);
	}
	var email = $('#email_o_'+cid).val();
	if(email==null||email=='null'||email==''){
		$('#memberEmail').html('无');
	}else{
		$('#memberEmail').html(email);
	}
	
	$('#memberId').val(cid);
	
	$('#o_f_count_'+cid).html('');
	
	
	var wind=$("#window_content_" + cid);
	var win =wind.html();
	if (!win) {//不能存在 就创建 并隐藏
		initWindowCommon(cid,$('#uname_o_'+cid).val());
	}
	
	if(!isOnline(cid)){
		$('#chatBox_sendMsgButton_'+cid).hide();
		$('#exitBox_closeButton_'+cid).hide();
		$('#chatBox_sendOfflineMsgButton_'+cid).show();
	}else{
		$('#chatBox_sendOfflineMsgButton_'+cid).hide();
		$('#chatBox_sendMsgButton_'+cid).show();
		$('#exitBox_closeButton_'+cid).show();
	}
	
	//读取详细消息列表
	ChatAjax.getMemberOfflineMsgDetail(cid,function(data){
			if(null!=data&&data.length>0){
				for (var i =data.length-1; i >-1; i--) {
					var msg=data[i];
					var type=msg['type'];
					var content =''
					if(type=='0'){//文本
						content=msg['content'];
					}
					if(type=='1'){//图片
						content='<img src="../imphotos/'+msg['content']+'" width="120px" onclick="viewImg(this)" style="cursor:pointer"/>';
					}
					addContentToWindow(msg['uid'], msg['uname'], content, msg['time'],2);
				}
			}
	});
	$("#window_content_"+cid).show();
}


/**
 * 输出会员消息
 * @param {} uid
 * @param {} uname
 * @param {} date
 * @param {} mt
 * @param {} content
 */
function showCMemberMessage(uid,uname,date,mt, content,st ) {
	var wind=$("#window_content_" + uid);
	var win =wind.html();
	if (!win) {//不能存在 就创建 并隐藏
	//	var uname= $("#m_uname_" + uid).val();
		
		initWindowCommon(uid,uname);
		$("#window_content_"+uid).hide();
	}
	
	var display=$("#window_content_"+uid).css("display");
	if(display=='none'){
		var count=$("#status_"+uid).html();
		if(count=='')count=0;
		$("#status_"+uid).html(parseInt(count)+1);	
		$("#status_"+uid).show();
		
		//文字闪动
//		setInterval(function(){
//			var color="#f00|#0f0|#00f|#880|#808|#088|yellow|green|blue|gray"; 
//			color=color.split("|"); 
//			$("#status_"+uid).css("color",color[parseInt(Math.random() * color.length)]);
//		},200); 
		
		$("#msg_tip").html('<a  onclick="showNewMsg('+uid+')" id="tip_'+uid+'">'+uname+'  来消息了</a>');
		$("#msg_tip").show();
		
		setInterval(function(){
			var color="#f00|#0f0|#00f|#880|#808|#088|yellow|green|blue|gray"; 
			color=color.split("|"); 
			$("#tip_"+uid).css("color",color[parseInt(Math.random() * color.length)]);
		},200); 
	}
	
	if(mt=='0'){
		addContentToWindow(uid, uname, content, date,st);
	}
	if(mt=='1'){
		var img='<img src="../imphotos/'+content+'" width="120px" onclick="viewImg(this)" style="cursor:pointer"/>';
		addContentToWindow(uid, uname, img, date,st);
	}

	if(mt=='2'){
		var src='../imaudios/'+content;
		var embed='<embed height="24px" width="261px" allowscriptaccess="always" wmode="transparent" ' +
				'type="application/x-shockwave-flash" ' +
				'src="../swf/douban_music.swf?url='+src+'&amp;autoplay=0">';
		addContentToWindow(uid, uname, embed, date,st);
	}
	if(st!='1'){
		playTipSound(2);


		
		
	}
	
	
}



/**
 * 显示聊天窗口
 * 
 * @param {}
 *            id
 */
function showNewMsg(id) {
	$('#member_info_td').show();
	$(".window_content").hide();
	showInfo(id);
	var wind=$("#window_content_" + id);
	var win =wind.html();
	if (!win) {
		var uname= $("#m_uname_" + id).val();
		 initWindowCommon(id,uname);
		$("#window_content_" + id).show();
	}else{
		wind.show();
	}
	$('#chatBox_sendOfflineMsgButton_'+ id).hide();
	$("#dochange").show();
	$("#status_"+id).html('');
	$("#tip_"+id).remove();
	$("#msg_tip").hide();
	
	var d=document.getElementById('chatBox_msgList_'+id)
	d.scrollTop=d.scrollHeight;
}

/**
 * 登出提示
 * @param {} id
 * @param {} mname
 */
function showLoginOut(id, mname) {
	$("#login_msg").html(mname + ' 下线了!');
	setTimeout(function() {
				$("#login_msg").html('');
			}, 3000);
	$("#m_" + id).parent().parent().remove();
	$("#status_" + id).html("");
	
	$("#chatBox_sendMsgButton_"+id).hide();
//	$("#chatBox_sendPicButton_wrap_"+id).hide();
	$("#chatBox_sendAudioButton_wrap_"+id).hide();
	$("#exitBox_closeButton_"+id).hide();
	
	$('#chatBox_sendOfflineMsgButton_'+ id).show();
	
	playTipSound(1);
		
	try{
		$("#tip_"+id).parent().hide();
		$("#tip_"+id).remove();
		
		if($("#memberId").val()==id){
			$("#dochange").hide();
		}
	}catch(err){
		
	}
}

/**
 * 显示登入提示
 * @param {} id
 * @param {} sname
 * @param {} uname
 * @param {} email
 * @param {} mobile
 */
function showLogin(id, sname, uname, email, mobile) {
	$("#login_msg").html(uname + ' 进来了!');
		setTimeout(function() {
			$("#login_msg").html('');
		}, 3000);
	$("#status_" + id).html("");
	$("#c_tr_" + id).remove();
	$("#u_table").append(addOneMember(id, sname, uname, email, mobile));
		
	var wind=$("#window_content_" + id);
	var win =wind.html();
	if (!win) {//不能存在 就创建 并隐藏
//		initWindowCommon(id);
//		$("#window_content_"+id).hide();
	}else{
//		initWindowButton(id);
		
		$("#chatBox_sendMsgButton_"+id).show();
		$("#chatBox_sendPicButton_wrap_"+id).show();
		//$("#chatBox_sendAudioButton_wrap_"+id).show();
		$("#exitBox_closeButton_"+id).show();
		
		$('#chatBox_sendOfflineMsgButton_'+ id).hide();
	}
	
	playTipSound(1);
}

/**
 * 显示会员信息
 * @param {} mid
 */
function showInfo(mid) {
	if (mid != '') {
		$("#memberUseName").html($("#m_uname_" + mid).val());
		$("#memberName").html($("#m_sname_" + mid).val());
		$("#memberMobile").html($("#m_mobile_" + mid).val());
		$("#memberEmail").html($("#m_email_" + mid).val());
		$("#memberId").val(mid);
	}
}

/**
 * 添加一个会员到会员列表中
 * @param {} cmid
 * @param {} sname
 * @param {} uname
 * @param {} email
 * @param {} mobile
 * @return {}
 */
function addOneMember(cmid, sname, uname, email, mobile) {
	if(email=='null'||email==null){
		email='无';
	}
	if(mobile=='null'||mobile==null){
		mobile='无';
	}
	var cidInput = '<input type="hidden" value="' + cmid + '" id="m_cmid_'
			+ cmid + '" />';// id
	
	var unameInput = '<input type="hidden" value="' + uname + '" id="m_uname_'
			+ cmid + '" />';// 用户名
	var snameInput = '<input type="hidden" value="' + sname + '" id="m_sname_'
			+ cmid + '" />';// 姓名
	var mobileInput = '<input type="hidden" value="' + mobile
			+ '" id="m_mobile_' + cmid + '" />';//
	var emailInput = '<input type="hidden" value="' + email + '" id="m_email_'
			+ cmid + '" />';//
	var tdata = unameInput + snameInput + mobileInput + emailInput+cidInput;
	var mhtml = '<tr id="c_tr_' + cmid + '">' + '<td>'
			+ '	<font color="blue" id="m_' + cmid
			+ '" style="cursor:pointer;" un="' + uname
			+ '" onclick="showNewMsg(\'' + cmid + '\')">' + uname + '</font>'
			+ tdata + '</td>' + '<td>'
			+ '<span style="cursor:pointer;"  id="new_msg_' + cmid
			+ '" onclick="showNewMsg(\'' + cmid + '\')"></span>' + '</td>' +

			'<td>' + '<span style="cursor:pointer;"  id="new_file_' + cmid
			+ '" onclick="showFileList(\'' + cmid + '\')"></span>' + '</td>' +

			'<td>' + '<span id="status_' + cmid + '"></span>' + '</td>'
			+ '</tr>';
	return mhtml;
}

/**
 * 获取在线咨询的会员列表
 */
function getMemberList() {
	ChatAjax.getOnLineCMembers(function(data) {
		if (null != data && data.length > 0) {
			var table = $("#u_table");
			table.html('');
			var tr = '';
			for (i = 0; i < data.length; i++) {
				var m = data[i];
				tr += addOneMember(m.cmid, m.sname, m.uname, m.email, m.mobile);
			}
			table.append(tr);
		}
	});
}
