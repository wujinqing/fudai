var reg = /^[0-9]+\.?[0-9]{0,2}$/;
function selectTag(showContent,selfObj){
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
	$("#s_value").val('');//重置搜索
	$("#dalei").val('');//重置大类
	$("#xiaolei").val('');//重置小类
	if("tagContent4"==showContent){
		getCalorie(1,2);
	}else{
		getCalorie(1,1);
	}
}

function GetRequest() {
   var url = location.search; //获取url中"?"符后的字串
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}

$(document).ready(function(){
	urlCalorie();
	getCalorie(1,1);
});

function urlCalorie(){
	var req = new Object();
	req = GetRequest();
	try{
		var show_tag = req["t"];
        var id = req["i"];
		if(show_tag==null||show_tag==""||typeof(show_tag)==undefined){
			return;
		}
		var tag_id = "tagContent"+show_tag;
		var name = req["e"];
		var unit = req["u"];
		var num = req["n"];
		var energy = decimal(num*Number(req["g"]),2);
		var tag = document.getElementById("tags").getElementsByTagName("li");
		var taglength = tag.length;
		for(var i=0; i<taglength; i++){
			tag[i].className = "";
			document.getElementById("tagContent"+i).style.display = "none";
		}
		tag[show_tag].className = "selectTag";
		document.getElementById(tag_id).style.display = "block";
		appendTag(tag_id,id,name,unit,num,energy);
		showEnergy(tag_id)
	}catch (e) {
		
	}
}

function getTypeCalorie(page,type,flag){
	if (flag == 1) {
		$("#xiaolei").val("");
	}
	getCalorie(page,type);
}

function getCalorie(page,type){
	Dialog.load();
	var search = $("#s_value").val();
	if(typeof(search)=="undefined") search='';
	var daType = $("#dalei").val();
	if(typeof(daType)=="undefined") daType='';
	var xiaoType = $("#xiaolei").val();
	if(typeof(xiaoType)=="undefined") xiaoType='';
	$.ajax({
		type : 'post',
		url : './mh/calorie_rule_ajax!calorieCascade.action',
		dataType : 'json',
		data : 'num='+page+'&name='+search+'&type='+type+'&daType='+daType+'&xiaoType='+xiaoType,
		success :callBack
	});
}

function callBack(data){
	Dialog.cload();
	var list = data.page.dataList;
	var typeList = data.typeList;
	var typeXList = data.typeXList;
	var type = data.type;
	var htmlList = "<div class=\"food-right-search\">";
	htmlList += "<div class=\"food-right-search-select\"><select id=\"dalei\" onchange=\"getTypeCalorie(1,1,1)\"><option value=\"\">选择大类</option>";
	if(typeList!=null&&typeList.length>0){
		for ( var i = 0; i < typeList.length; i++) {
			if (data.daType==typeList[i].id) {
				htmlList += "<option value=\""+typeList[i].id+"\" selected>"+typeList[i].name+"</option>";
			}else{
				htmlList += "<option value=\""+typeList[i].id+"\">"+typeList[i].name+"</option>";
			}
		}
	}
	htmlList += "</select></div>";
	htmlList += "<div class=\"food-right-search-select\"><select id=\"xiaolei\" onchange=\"getTypeCalorie(1,1,2)\"><option value=\"\">选择小类</option>";
	if(typeXList!=null&&typeXList.length>0){
		for ( var i = 0; i < typeXList.length; i++) {
			if (data.xiaoType==typeXList[i].id) {
				htmlList += "<option value=\""+typeXList[i].id+"\" selected>"+typeXList[i].name+"</option>";
			}else{
				htmlList += "<option value=\""+typeXList[i].id+"\">"+typeXList[i].name+"</option>";
			}
		}
	}
	htmlList += "</select></div>";
	htmlList += "<div class=\"food-right-search-wb\"><input id=\"s_value\" name=\"sValue\" type=\"text\" value=\""+data.name+"\"/></div>";
	htmlList += "<div class=\"food-right-search-an color_fff hao14\"><a href=\"javascript:\" onclick=\"getCalorie(1,"+type+")\">搜索</a></div></div>";
	if(list==null||list.length==0){
		htmlList += "<div align=\"center\">暂无信息</div>";
	}else{
		if(type==1){
			$.each(list,function(key,value){
				htmlList += "<div class=\"reduce-kllj-ybox2ss\">";
				htmlList += "<div class=\"reduce-kllj-ybox2ss-img\"><img width=\"43px\" height=\"43px\" src=\""+base+"/"+value.imge+"\" /></div>";
				htmlList += "<div class=\"reduce-kllj-ybox2ss-ly\"><p>"+value.ruleName+"</p>"+value.energy+"千卡("+value.unit+")</div>";
				htmlList += "<div class=\"reduce-kllj-ybox2ss-an\"><a href=\"javascript:\" onclick=\"addOut(this,'"+value.id+"','"+type+"')\"><img src=\"../images/front/reduce-icon-6.gif\" /></a></div>";
				htmlList += "<div id=\"select_"+value.id+"\" class=\"r-kllj-body\" style=\"display:none;\">";
				htmlList += "<div class=\"r-kllj-bodytj\">自定义添加</div>";
				htmlList += "<div class=\"r-kllj-bodysl\">名称："+value.ruleName+"<p>数量：<input style=\"width:50px;\" id=\"num_"+value.id+"\" type=\"text\" /></p><p>单位："+value.unit+"</p></div>";
				htmlList += "<div class=\"r-kllj-bodyal\"><input type=\"button\" value=\"添加\" onclick=\"add('"+value.id+"','"+value.ruleName+"','"+value.unit+"','"+value.energy+"','"+type+"')\"/> <input type=\"button\" value=\"取消\" onclick=\"cancel('"+value.id+"')\"/>";
				htmlList += "</div></div></div>";
			});
		}else{
			var weg = getCookie("weg");
			$.each(list,function(key,value){
				htmlList += "<div class=\"reduce-kllj-ybox2ss\">";
				htmlList += "<div class=\"reduce-kllj-ybox2ss-img\"><img width=\"43px\" height=\"43px\" src=\""+base+"/"+value.imge+"\" /></div>";
				htmlList += "<div class=\"reduce-kllj-ybox2ss-ly\"><p>"+value.ruleName+"</p>"+value.energy+"千卡("+value.unit+")</div>";
				htmlList += "<div class=\"reduce-kllj-ybox2ss-an\"><a href=\"javascript:\" onclick=\"addOut(this,'"+value.id+"','"+type+"')\"><img src=\"../images/front/reduce-icon-6.gif\" /></a></div>";
				htmlList += "<div id=\"select_"+value.id+"\" class=\"r-kllj-body\" style=\"display:none;\">";
				htmlList += "<div class=\"r-kllj-bodytj\">自定义添加</div>";
				htmlList += "<div class=\"r-kllj-bodysl\">名称："+value.ruleName+"<p>体重：<input style=\"width:50px;\" id=\"weight_"+value.id+"\" value=\""+weg+"\" type=\"text\" />&nbsp;KG</p><p>时间：<input style=\"width:50px;\" id=\"num_"+value.id+"\" type=\"text\" /></p><p>单位："+value.unit+"</p></div>";
				htmlList += "<div class=\"r-kllj-bodyal\"><input type=\"button\" value=\"添加\" onclick=\"add('"+value.id+"','"+value.ruleName+"','"+value.unit+"','"+value.energy+"','"+type+"')\"/> <input type=\"button\" value=\"取消\" onclick=\"cancel('"+value.id+"')\"/>";
				htmlList += "</div></div></div>";
			});
		}
		htmlList += "<div class=\"paging\"><div class=\"publicad_fy\"><div class=\"viciao\">";
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList += "<span class=\"disabled\">< 上一页</span>";
			}else{
				htmlList += "<a href=\"javascript:getCalorie("+(cpage-1)+","+type+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getCalorie("+i+","+type+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>";
			}else{
				htmlList +="<a href=\"javascript:getCalorie("+(cpage+1)+","+type+")\">下一页 ></a>";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getCalorie("+(cpage-1)+","+type+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getCalorie(1,"+type+")\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getCalorie("+i+","+type+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 ></span>";
					}else{
						htmlList += "<a href=\"javascript:getCalorie("+(cpage+1)+","+type+")\">下一页 ></a>";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getCalorie("+i+","+type+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getCalorie("+tpage+","+type+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getCalorie("+(cpage+1)+","+type+")\">下一页 ></a>";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getCalorie("+(cpage-1)+","+type+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getCalorie("+i+","+type+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getCalorie("+tpage+","+type+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getCalorie("+(cpage+1)+","+type+")\">下一页 ></a>";
			}
		}
		htmlList += "</div></div></div>";
	}
	$("#content_msg").html(htmlList);
}

function cancel(id){
	$("#select_"+id).hide();
}

function whitchShow(){
	var o_li = $("#tags> ul > li");
	for(var i=0;i<o_li.length;i++){
		if($("#tagContent"+i).css("display")=="block"){
			return "tagContent"+i;
		}
	}
}

function decimal(num,v){
	var w = Math.pow(10,v);
	return Math.round(num*w)/w;
}

function appendTag(tag_id,id,name,unit,num,energy){
	var arr=[];
	arr.push("<div class=\"rduce-k-text1\" id=\"r_"+tag_id+"_"+id+"\"><div class=\"rduce-k-text1-1\">"+name+"<br />");
	arr.push("<div class=\"rduce-k-text1-12\"><span id=\"a_"+tag_id+"_"+id+"\">"+num+"</span>"+unit+"</div>");
	arr.push("<div class=\"rduce-k-text1-13\"><span id=\"m_"+tag_id+"_"+id+"\">"+energy+"</span>千卡</div></div>");
	arr.push("<div class=\"rduce-k-text1-2\"><a href=\"javascript:\" onclick=\"del('r_"+tag_id+"_"+id+"')\"><img src=\"../images/front/reduce-icon-5.gif\" border=\"0\" /></a></div></div>");
	$("#"+tag_id).append(arr.join(''));
}

function addOut(obj,id,type){
	if(type!=1){
		var weg = getCookie("weg");
		$("#weight_"+id).val(weg);
	}
	var tarPosition = $(obj).position();
	var tarX = tarPosition.left + "px";
	var tarY = tarPosition.top + 18 + "px";
	$("#select_"+id).css({top:tarY,lef:tarX}).show();
}

function add(id,name,unit,eng,type){
	var input_num = $("#num_"+id).val();
	var all = 0;
	if(type==1){
		if(!reg.test(input_num)){
			Dialog.alert("数量请正确输入");
			return;
		}
		if(input_num=="") input_num=0;
		all = decimal(input_num*Number(eng),2);
	}else{
		var w = $("#weight_"+id).val();
		if(!reg.test(w)){
			Dialog.alert("体重请正确输入");
			return;
		}
		addCookie("weg",w,0);//加入cookie
		if(!reg.test(input_num)){
			Dialog.alert("时间请正确输入");
			return;
		}
		if(input_num=="") input_num=0;
		all = decimal(input_num*Number(eng)*w,2);
	}
	var tag_id = whitchShow();
	if($("#r_"+tag_id+"_"+id).length>0){
		var o_a = $("#a_"+tag_id+"_"+id);
		var o_m = $("#m_"+tag_id+"_"+id);
		o_a.html(decimal(Number(o_a.html())+Number(input_num),2));
		o_m.html(decimal(Number(o_m.html())+Number(all),2));
	}else{
		appendTag(tag_id,id,name,unit,input_num,all)
	}
	cancel(id);
	$("#num_"+id).val("0");
	showEnergy(tag_id);
}

function del(aid){
	$("#"+aid).remove();
	var tag_id = aid.split("_")[1];
	showEnergy(tag_id);
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

function addCookie(name,value,expiresHours){ 
	var cookieString=name+"="+escape(value); 
	//判断是否设置过期时间 
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