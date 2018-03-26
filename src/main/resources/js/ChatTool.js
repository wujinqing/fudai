
function getdate() {
	var now = new Date();
	y = now.getFullYear();
	m = now.getMonth() + 1;
	d = now.getDate();
	m = m < 10 ? "0" + m : m;
	d = d < 10 ? "0" + d : d;
	return y + "-" + m + "-" + d;
}

function curDateTime() {
	var d = new Date();
	var year = d.getYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var day = d.getDay();
	var hours = d.getHours();
	var minutes = d.getMinutes();
	var seconds = d.getSeconds();
	var ms = d.getMilliseconds();
	var curDateTime = year;
	if (month > 9)
		curDateTime = curDateTime + "-" + month;
	else
		curDateTime = curDateTime + "-0" + month;
	if (date > 9)
		curDateTime = curDateTime + "-" + date;
	else
		curDateTime = curDateTime + "-0" + date;

	if (hours > 9)
		curDateTime = getdate() + " " + hours;
	else
		curDateTime = getdate() + " 0" + hours;
	if (minutes > 9)
		curDateTime = curDateTime + ":" + minutes;
	else
		curDateTime = curDateTime + ":0" + minutes;
	if (seconds > 9)
		curDateTime = curDateTime + ":" + seconds;
	else
		curDateTime = curDateTime + ":0" + seconds;
	return curDateTime;
}

/**
* 查看图片
* @param {} t
*/
function viewImg(t){
	var src=$(t).attr("src");
	window.open(src,'_blank');
//	new Dialog('<img src="'+src+'" id=""  style="cursor:pointer"  />',{title:'图片预览'}).show();
}

function playTipSound(t,p){
	var file='';
	
	var pt='../';
	if(p){
		pt=p;
	}
	
	if(t==1){//上线
		file=pt+'swf/online.mp3';
	}
	if(t==2){//消息
		file=pt+'swf/msg.mp3';
	}
	if(file!='')
	document.getElementById('soundplayerlayer').innerHTML = AC_FL_RunContent('id', 'pmsoundplayer', 'name', 'pmsoundplayer', 'width', '0', 'height', '0', 'src',pt+ 'swf/player.swf', 'FlashVars', 'sFile='+file, 'menu', 'false',  'allowScriptAccess', 'sameDomain', 'swLiveConnect', 'true');
}