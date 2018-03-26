var base="..";
var reg = /^[0-9]+\.?[0-9]{0,2}$/;

function selectTag(showContent,selfObj,flag){
	// 操作标签
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// 操作内容
	for(i=0; j=document.getElementById("tagContent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";	
	$("#s_value").val('');// 重置搜索
	$("#dalei").val('');//重置大类
	$("#xiaolei").val('');//重置小类
	if(flag=="4"){
		$("#up_eat_ol").hide();
		getCalorie(1,2,flag);
	}else{
		$("#up_eat_ol").show();
		$("#flag").val(flag);
		var w = whichUp(flag);
		$("#up_eat div:first-child").html(w);
		getCalorie(1,1,flag);
		getEatPic(flag);
	}
}

function whichUp(flag){
	if (flag==0) {
		return "早餐图片上传：";
	}else if (flag==1) {
		return "午餐图片上传：";
	}else if (flag==2) {
		return "晚餐图片上传：";
	}else if (flag==3) {
		return "日常饮食图片上传：";
	}
}

$(document).ready(function(){
	getCalorie(1,1,0);
	$("#keep_btn").click(function(){
		var w = $("#wgt").val();
		if (w!=""&&!reg.test(w)) {
			Dialog.alert("请正确输入体重");
			return;
		}
		$("#kp_res").css("display","inline");
		$("#form1").removeAttr("target");
		$("#form1").attr("action","./diary_save.html");
		$(this).attr("disabled",true);
		$("#clean_btn").attr("disabled",true);
		$("#form1").submit();
	});
	
	$("#clean_btn").click(function(){
		$("#form1")[0].reset();
	});
	
	$("#upload_btn").click(function(){
		var pic = $("#pic").val();
		if(pic==""){
			Dialog.alert("请先选择图片");
			return;
		}
		$("#form1").attr("target","upload_frame");
		$("#form1").attr("action","./upload_show.html");
		$("#up_res").css("display","inline");
		$("#form1").submit();
	});
});

function getCalorie(page,type,open){
	///Dialog.load();
	var search = $("#s_value").val();
	if(typeof(search)=="undefined") search='';
	if(typeof(search)=="undefined") search='';
	var daType = $("#dalei").val();
	if(typeof(daType)=="undefined") daType='';
	var xiaoType = $("#xiaolei").val();
	if(typeof(xiaoType)=="undefined") xiaoType='';
	$.ajax({
		type : 'post',
		url : 'calorie_rule_ajax!calorieCascade.action',
		dataType : 'json',
		data : 'num='+page+'&name='+search+'&type='+type+'&open='+open+'&daType='+daType+'&xiaoType='+xiaoType,
		success :callBack
	});
}

function callBack(data){
	//Dialog.cload();
	var list = data.page.dataList;
	var typeList = data.typeList;
	var typeXList = data.typeXList;
	var type = data.type;
	var open = data.open;
	//Dialog.alert(type)
	var tag = $("#dis_tag").val();
	var htmlList = [];
	var htmlList1=[];
	htmlList1.push("<div class=\"food-right-selecet\">" );
	htmlList1.push("<a href=\"javascript:\" onclick=\"changeSel('1')\" class=\"btn_select\">");
	if(tag==2){
		htmlList1.push("<span id=\"handSpan\">手工输入</span></a>");
	}else{
		htmlList1.push("<span id=\"handSpan\" class=\"color_red\">手工输入</span></a>");
	}
	htmlList1.push("<a href=\"javascript:\" onclick=\"changeSel('2')\" class=\"btn_select\">");
	if(tag==2){
		htmlList1.push("<span id=\"selectSpan\" class=\"color_red\">选择输入</sapn></a>");
	}else{
		htmlList1.push("<span id=\"selectSpan\">选择输入</sapn></a>");
	}
	htmlList1.push("</div>");
	if(tag==2){
		htmlList.push("<div class=\"food-right-search\" style=\"display:none;\" id=\"handIn\"><ol>");
	}else{
		htmlList.push("<div class=\"food-right-search\" style=\"display:;\" id=\"handIn\"><ol>");
	}
	if(open==0) htmlList.push("<div>早餐：</div>");
	else if(open==1) htmlList.push("<div>午餐：</div>");
	else if(open==2) htmlList.push("<div>晚餐：</div>");
	else if(open==3) htmlList.push("<div>日常：</div>");
	else if(open==4) htmlList.push("<div>运动：</div>");
	htmlList.push("<div><input style=\"width:100px\" type=\"text\" id=\"a_name\" name=\"a_name\" value=\"名称\" maxlength=\"100\" onfocus=\"if(this.value=='名称') this.value=''\" onblur=\"if(this.value=='') this.value='名称'\"/></div>");
	if(type==1){
		htmlList.push("<div><input type=\"text\" size=\"+5\" id=\"a_amount\" name=\"a_amount\" value=\"数量\" maxlength=\"10\" onfocus=\"if(this.value=='数量') this.value=''\" onblur=\"if(this.value=='') this.value='数量'\"/></div>");
	}else{
		htmlList.push("<div><input type=\"text\" size=\"+5\" id=\"a_amount\" name=\"a_amount\" value=\"时间\" maxlength=\"10\" onfocus=\"if(this.value=='时间') this.value=''\" onblur=\"if(this.value=='') this.value='时间'\"/></div>");
	}
	htmlList.push("<div><input type=\"text\" size=\"+5\" id=\"a_unit\" name=\"a_unit\" value=\"单位\" maxlength=\"10\" onfocus=\"if(this.value=='单位') this.value=''\" onblur=\"if(this.value=='') this.value='单位'\"/></div>");
	htmlList.push("<div><input style=\"width:50px\" type=\"text\" id=\"a_energy\" name=\"a_energy\" value=\"千卡\" maxlength=\"10\" onfocus=\"if(this.value=='千卡') this.value=''\" onblur=\"if(this.value=='') this.value='千卡'\"/></div>");
	htmlList.push("<a href=\"javascript:\" onclick=\"addAuto("+type+","+open+")\"><img src=\"../images/space/pd-tj.gif\" /></a></ol></div>");
	if(tag==2){
		htmlList.push("<div style=\"display:;\" id=\"selectIn\"><div class=\"food-right-search\">");
	}else{
		htmlList.push("<div style=\"display:none;\" id=\"selectIn\"><div class=\"food-right-search\">");
	}
	if(type!=2){
		htmlList.push("<div class=\"food-right-search-select\"><select id=\"dalei\" name=\"dd\" style=\"height:22px;\" onchange=\"getCalorie(1,"+type+","+open+")\">");
		htmlList.push("<option value=\"\">选择大类</option>");
		if(typeList==null||typeList.length==0){
		}else{
			for(var i=0;i<typeList.length;i++){
				if(data.daType==typeList[i].id){
					htmlList.push("<option value=\""+typeList[i].id+"\" selected>"+typeList[i].name+"</option>");
				}else{
					htmlList.push("<option value=\""+typeList[i].id+"\">"+typeList[i].name+"</option>");
				}
			}
		}
		htmlList.push("</select></div>");
		htmlList.push("<div class=\"food-right-search-select\"><select id=\"xiaolei\" name=\"dd\" style=\"height:22px;\" onchange=\"getCalorie(1,"+type+","+open+")\">");
		htmlList.push("<option value=\"\">选择小类</option>");
		if(typeXList!=null&&typeXList.length>0){
			for(var i=0;i<typeXList.length;i++){
				if(data.xiaoType==typeXList[i].id){
					htmlList.push("<option value=\""+typeXList[i].id+"\" selected>"+typeXList[i].name+"</option>");
				}else{
					htmlList.push("<option value=\""+typeXList[i].id+"\">"+typeXList[i].name+"</option>");
				}
			}
		}
		htmlList.push("</select></div>");
	}
	htmlList.push("&nbsp;<div class=\"food-right-search-wb\"><input id=\"s_value\" name=\"sValue\" type=\"text\" value=\""+data.name+"\"/></div>");
	htmlList.push("<div class=\"food-right-search-an color_fff hao14\">");
	htmlList.push("<a href=\"javascript:\" onclick=\"getCalorie(1,"+type+","+open+")\">搜索</a></div></div>");
	if(list==null||list.length==0){
		htmlList.push("<div align=\"center\">暂无信息</div>");
	}else{
		if(type==1){
			$.each(list,function(key,value){
				htmlList.push("<div class=\"reduce-kllj-ybox2ss\">");
				htmlList.push("<div class=\"reduce-kllj-ybox2ss-img\"><img width=\"43px\" height=\"43px\" src=\""+base+"/"+value.imge+"\" /></div>");
				htmlList.push("<div class=\"reduce-kllj-ybox2ss-ly\"><p>"+value.ruleName+"</p>"+value.energy+"千卡("+value.unit+")</div>");
				htmlList.push("<div class=\"reduce-kllj-ybox2ss-an\"><a href=\"javascript:\" onclick=\"addOut(this,'"+value.id+"','"+type+"')\"><img src=\"../images/front/reduce-icon-6.gif\" /></a></div>");
				htmlList.push("<div id=\"select_"+value.id+"\" class=\"r-kllj-body\" style=\"display:none;\">");
				htmlList.push("<div class=\"r-kllj-bodytj\">自定义添加</div>");
				htmlList.push("<div class=\"r-kllj-bodysl\">名称："+value.ruleName+"<p>数量：<input style=\"width:50px;\" id=\"num_"+value.id+"\" type=\"text\" /></p><p>单位："+value.unit+"</p></div>");
				htmlList.push("<div class=\"r-kllj-bodyal\"><input type=\"button\" value=\"添加\" onclick=\"add('"+value.id+"','"+type+"',"+open+")\"/> <input type=\"button\" value=\"取消\" onclick=\"cal('"+value.id+"')\"/>");
				htmlList.push("</div></div></div>");
			});
		}else{
			var weg = getCookie("weg");
			$.each(list,function(key,value){
				htmlList.push("<div class=\"reduce-kllj-ybox2ss\">");
				htmlList.push("<div class=\"reduce-kllj-ybox2ss-img\"><img width=\"43px\" height=\"43px\" src=\""+base+"/"+value.imge+"\" /></div>");
				htmlList.push("<div class=\"reduce-kllj-ybox2ss-ly\"><p>"+value.ruleName+"</p>"+value.energy+"千卡("+value.unit+")</div>");
				htmlList.push("<div class=\"reduce-kllj-ybox2ss-an\"><a href=\"javascript:\" onclick=\"addOut(this,'"+value.id+"','"+type+"')\"><img src=\"../images/front/reduce-icon-6.gif\" /></a></div>");
				htmlList.push("<div id=\"select_"+value.id+"\" class=\"r-kllj-body\" style=\"display:none;\">");
				htmlList.push("<div class=\"r-kllj-bodytj\">自定义添加</div>");
				htmlList.push("<div class=\"r-kllj-bodysl\">名称："+value.ruleName+"<p>体重：<input style=\"width:50px;\" id=\"weight_"+value.id+"\" value=\""+weg+"\" type=\"text\" />&nbsp;KG</p><p>时间：<input style=\"width:50px;\" id=\"num_"+value.id+"\" type=\"text\" /></p><p>单位："+value.unit+"</p></div>");
				htmlList.push("<div class=\"r-kllj-bodyal\"><input type=\"button\" value=\"添加\" onclick=\"add('"+value.id+"','"+type+"','"+open+"')\"/> <input type=\"button\" value=\"取消\" onclick=\"cal('"+value.id+"')\"/>");
				htmlList.push("</div></div></div>");
			});
		}
		htmlList.push("<div class=\"paging\"><div class=\"publicad_fy\"><div class=\"viciao\">");
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList.push("<span class=\"disabled\">< 上一页</span>");
			}else{
				htmlList.push("<a href=\"javascript:getCalorie("+(cpage-1)+","+type+","+open+")\">< 上一页</a>");
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList.push("<span class=\"current\">"+i+"</span>");
				}else{
					htmlList.push("<a href=\"javascript:getCalorie("+i+","+type+","+open+")\">"+i+"</a>");
				}
			}
			if(cpage==tpage){
				htmlList.push("<span class=\"disabled\">下一页 ></span>");
			}else{
				htmlList.push("<a href=\"javascript:getCalorie("+(cpage+1)+","+type+","+open+")\">下一页 ></a>");
			}
		}else{
			if(cpage>6){
				htmlList.push("<a href=\"javascript:getCalorie("+(cpage-1)+","+type+","+open+")\">< 上一页</a>");
				htmlList.push("<a href=\"javascript:getCalorie(1,"+type+","+open+")\">1</a>");
				htmlList.push("...");
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList.push("<span class=\"current\">"+i+"</span>");
						}else{
							htmlList.push("<a href=\"javascript:getCalorie("+i+","+type+","+open+")\">"+i+"</a>");
						}
					}
					if(cpage==tpage){
						htmlList.push("<span class=\"disabled\">下一页 ></span>");
					}else{
						htmlList.push("<a href=\"javascript:getCalorie("+(cpage+1)+","+type+","+open+")\">下一页 ></a>");
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList.push("<span class=\"current\">"+i+"</span>");
						}else{
							htmlList.push("<a href=\"javascript:getCalorie("+i+","+type+","+open+")\">"+i+"</a>");
						}
					}
					htmlList.push("...");
					htmlList.push("<a href=\"javascript:getCalorie("+tpage+","+type+","+open+")\">"+tpage+"</a>");
					htmlList.push("<a href=\"javascript:getCalorie("+(cpage+1)+","+type+","+open+")\">下一页 ></a>");
				}
			}else{
				if(cpage==1){
					htmlList.push("<span class=\"disabled\">< 上一页</span>");
				}else{
					htmlList.push("<a href=\"javascript:getCalorie("+(cpage-1)+","+type+","+open+")\">< 上一页</a>");
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList.push("<span class=\"current\">"+i+"</span>");
					}else{
						htmlList.push("<a href=\"javascript:getCalorie("+i+","+type+","+open+")\">"+i+"</a>");
					}
				}
				htmlList.push("...");
				htmlList.push("<a href=\"javascript:getCalorie("+tpage+","+type+","+open+")\">"+tpage+"</a>");
				htmlList.push("<a href=\"javascript:getCalorie("+(cpage+1)+","+type+","+open+")\">下一页 ></a>");
			}
		}
		htmlList.push("</div></div></div></div>");
	}
	//alert(htmlList);
	$("#content_msg1").html(htmlList1.join(''));
	$("#content_msg").html(htmlList.join(''));
	
}

function cal(id){
	$("#select_"+id).hide();
}

function addOut(obj,id,type){
	if(type!=1){
		var weg = getCookie("weg");
		$("#weight_"+id).val(weg);
	}
	var tarPosition = $(obj).position();
	// var tarX = tarPosition.left + "px";
	var tarY = tarPosition.top + 18 + "px";
	$("#select_"+id).css({top:tarY}).show();
}


function add(id,type,open){
	var input_num = $("#num_"+id).val();
	var w = 0;
	if(type==1){
		if(!reg.test(input_num)){
			Dialog.alert("数量请正确输入");
			return;
		}
	}else{
		w = $("#weight_"+id).val();
		if(!reg.test(w)){
			Dialog.alert("体重请正确输入");
			return;
		}
		addCookie("weg",w,0);// 加入cookie
		if(!reg.test(input_num)){
			Dialog.alert("时间请正确输入");
			return;
		}
	}
	cal(id);
	$("#num_"+id).val("0");
	addDetail(id,open,input_num,w);
}

function addDetail(id,open,num,weg){
	$.ajax( {
		type : 'post',
		url : '../detail_add_ajax.html',
		dataType : 'json',
		data : 'id='+id+'&nums='+num+'&flag='+open+'&weight='+weg,
		success : function(data){
			if (data.detail==null) {
				Dialog.alert("添加失败，请稍后再试");
			}else{
				var tag_id = "tagContent"+open;
				var d = data.detail;
				appendTag(tag_id,d.id,d.proName,d.proUnit,d.proAmount,d.calorie);
				showEnergy(tag_id);
			}
		}
	});
}

function appendTag(tag_id,id,name,unit,num,energy){
	var arr = [];
	arr.push("<div class=\"rduce-k-text1\" id=\"r_"+tag_id+"_"+id+"\"><div class=\"rduce-k-text1-1\">"+name+"<br />");
	arr.push("<div class=\"rduce-k-text1-12\"><span id=\"a_"+tag_id+"_"+id+"\">"+num+"</span>"+unit+"</div>");
	arr.push("<div class=\"rduce-k-text1-13\"><span id=\"m_"+tag_id+"_"+id+"\">"+energy+"</span>千卡</div></div>");
	arr.push("<div class=\"rduce-k-text1-2\"><a href=\"javascript:\" title=\"删除\" onclick=\"del('r_"+tag_id+"_"+id+"')\">");
	arr.push("<img src=\"../images/front/reduce-icon-5.gif\" border=\"0\" /></a></div></div>");
	$("#"+tag_id).append(arr.join(''));
}

//显示
function showEnergy(tag_id){
	var energy = kindEnergy(tag_id);
	if("tagContent4"==tag_id){
		$("#all_sport").html(energy);
	}else{
		$("#calc_"+tag_id).html(energy);
		var all_eng = allEnergy();
		$("#all_energy").html(all_eng);
	}
}

function decimal(num,v){
	var w = Math.pow(10,v);
	return Math.round(num*w)/w;
}

//计算单个能量
function kindEnergy(tid){
	var energy=0;
	var o_eng = $("#"+tid+" > div");
	for(var i=0;i<o_eng.length;i++){
		var ids = $(o_eng[i]).attr("id");
		var id = ids.split("_");
		energy += Number($("#m_"+tid+"_"+id[2]).html())
	}
	energy = decimal(energy,2);
	return energy;
}
//计算总能量
function allEnergy(){
	var energy=0;
	for(var i=0;i<4;i++){
		energy += Number($("#calc_tagContent"+i).html());
	}
	energy = decimal(energy,2);
	return energy;
}

function del(aid){
	var id = aid.split("_");
	$.ajax( {
		type : 'post',
		url : '../detail_del_ajax.html',
		dataType : 'json',
		data : 'id='+id[2],
		success : function(data){
			if (data.flag==0||data.flag==-1) {
				Dialog.alert("删除失败，请稍后再试");
			}else{
				$("#"+aid).remove();
				showEnergy(id[1]);
			}
		}
	});
}

function addAuto(type,open){
	var n = $("#a_name").val();
	var a = $("#a_amount").val();
	var u = $("#a_unit").val();
	var e = $("#a_energy").val();
	if(n==""||n=="名称"){
		Dialog.alert("请输入名称");
		return;
	}
	if(a=="数量"){
		a =0;
	}
	if(!reg.test(a)){
		Dialog.alert("请输入正确数量");
		return;
	}
	if(u=="单位"){
		u='';
	}
	
	if(e=="千卡"){
		e=0;
	}
	if (!reg.test(e)) {
		Dialog.alert("请输入能量");
		return;
	}
	/*
	if(type==1){
		if (a==""||a=="数量"||!reg.test(a)) {
			Dialog.alert("请输入数量");
			return;
		}
	}else{
		if (a==""||a=="时间"||!reg.test(a)) {
			Dialog.alert("请输入时间");
			return;
		}
	}
	if (u==""||u=="单位") {
		Dialog.alert("请输入单位");
		return;
	}
	if (e==""||e=="千卡"||!reg.test(e)) {
		Dialog.alert("请输入能量");
		return;
	}*/
	addDetails(n,a,u,e,open);
}

function addDetails(n,a,u,e,open){
	$.ajax( {
		type : 'post',
		url : '../details_add_ajax.html',
		dataType : 'json',
		data : 'name='+n+'&nums='+a+'&unit='+u+'&energy='+e+'&flag='+open,
		success : function(data){
			if (data.detail==null) {
				Dialog.alert("添加失败，请稍后再试");
			}else{
				$("#a_name").val('名称');
				$("#a_amount").val('数量');
				$("#a_unit").val('单位');
				$("#a_energy").val('千卡');
				var tag_id = "tagContent"+open;
				var d = data.detail;
				appendTag(tag_id,d.id,d.proName,d.proUnit,d.proAmount,d.calorie);
				showEnergy(tag_id);
			}
		}
	});
}

function addCookie(name,value,expiresHours){
	var cookieString=name+"="+escape(value); 
	// 判断是否设置过期时间
	if(expiresHours>0){
		var date=new Date(); 
		date.setTime(date.getTime()+expiresHours*3600*1000); 
		cookieString=cookieString+";expires="+date.toGMTString(); 
	} 
	document.cookie=cookieString; 
} 

function getCookie(name){ 
	var strCookie=document.cookie; 
	var arrCookie=strCookie.split(";"); 
	for(var i=0;i<arrCookie.length;i++){ 
		var arr=arrCookie[i].split("="); 
		if(arr[0]==name)return arr[1]; 
	}
	return "";
}

function showWhat(msg){
	$("#up_res").hide();
	if (msg=="1") {
		Dialog.alert("请正确选择上传的图片");
	}else if (msg=="2") {
		Dialog.alert("图片上传失败");
	}else if (msg=="3") {
		Dialog.alert("每天最多上传3张图片");
	}else if (msg=="4") {
		Dialog.alert("图片最大为1M");
	}
}

function show(msg,path){
	$("#up_res").hide();
	if (msg == "1") {
		$("#p_1").attr("src",path);
	}else if (msg == "2") {
		$("#p_2").attr("src",path);
	}else if (msg == "3") {
		$("#p_3").attr("src",path);
	}
}

function delPic(flag){
	$.ajax( {
		type : 'post',
		url : '../show_del_ajax.html',
		dataType : 'json',
		data : 'num='+flag,
		success : function(data){
			if (data.flag==-1) {
				Dialog.alert("系统忙，请稍后再试");
			}else if(data.flag==0){
				Dialog.alert("删除失败");
			}else if(data.flag==1){
				$("#p_"+flag).attr("src",data.path+"/images/space/icon-no.jpg");
			}
		}
	});
}

function eatUp(obj){
	var tarPosition = $(obj).position();
	// var tarX = tarPosition.left - 150 + "px";
	var tarY = tarPosition.top + 25 + "px";
	$("#up_eat").css({top:tarY}).show();
}

function eatAdd(){
	var pic = $("#eat").val();
	if (pic == "") {
		Dialog.alert("请先选择图片");
		return;
	}
	$("#form2").attr("action","./upload_eat.html");
	$("#form2").submit();
	$("#up_eat").hide();
}

function eatShow(path){
	Dialog.alert("图片上传成功");
	$("#eat_pic").attr("src",path);
}

function getEatPic(flag){
	$.ajax( {
		type : 'post',
		url : '../show_eat_ajax.html',
		dataType : 'json',
		data : 'num='+flag,
		success : function(data){
			if (data.flag ==1) {
				$("#eat_pic").attr("src",data.path);
			}else{
				$("#eat_pic").attr("src",data.path+"/images/space/icon-no.jpg");
			}
		}
	});
}

function changeSel(type){
	$("#dis_tag").val(type);
	if(type=='1'){
		$("#selectIn").hide();
		$("#handIn").show();
		$("#handSpan").addClass("color_red");
		$("#selectSpan").removeClass("color_red");
	}else if(type=='2'){
		$("#selectIn").show();
		$("#handIn").hide();
		$("#selectSpan").addClass("color_red");
		$("#handSpan").removeClass("color_red");
	}
}
