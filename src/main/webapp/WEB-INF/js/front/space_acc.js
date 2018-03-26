var url = window.location.href;
var mid=url.substring(url.lastIndexOf('_')+1,url.indexOf('.'))
//var mid = 59520;
jQuery().ready(function(){
	getDiary(1);
	getPhoto();
});

function getPhoto(){
	jQuery(".heng2_mid_table .heng2_mid_table_b").jCarouselLite({
	    btnNext: "#next",
    	btnPrev: "#prev",
    	auto:800,
    	visible:4
	});
	
	jQuery("#next").css("cursor","pointer");
	jQuery("#prev").css("cursor","pointer");
	
	jQuery(".heng2_mid_table_b_img img").css("cursor","pointer");
	jQuery(".heng2_mid_table_b_img img").click(function(){
		var id=jQuery(this).attr("id");
		if(id!=''){
			window.open('/city-note-'+id+'.html','_parent');
		}
	});
	
	jQuery("#qq_list li").css({
	"line-height":"2em","text-align":"center"
	})
	jQuery("#qq_list").hide();
	jQuery(".qq_group").toggle(
	function(){
		jQuery("#qq_list").show();
	},
	function(){
		jQuery("#qq_list").hide();
	});
	
	
	if(jQuery.browser.msie&&jQuery.browser.version<='6.0'){
		//jQuery("#Ad").css({"margin-top":"-86px"});	
	}else{
		
	}
}


function getDiary(page){
	jQuery.ajax({
		type : 'post',
		async: false,
		url : 'diary_ajax!diaryList.action',
		dataType : 'json',
		data : 'mid='+mid+'&num='+page,
		success :callBack
	});
	new Accordian('basic-accordian',5,'header_highlight');
}

function callBack(data){
	var list = data.page.dataList;
	var htmlList = [];
	htmlList.push("<div id='basic-accordian'>");
	jQuery.each(list,function(key,value){
		if (key==0) {
			htmlList.push("<div id='test"+key+"-header' class='accordion_headings header_highlight'>"+value.strDate+"&nbsp;瘦身第<span>"+value.day+"</span>天</div>");
		}else{
			htmlList.push("<div id='test"+key+"-header' class='accordion_headings'>"+value.strDate+"&nbsp;瘦身第<span>"+value.day+"</span>天</div>");
		}
		htmlList.push("<div id='test"+key+"-content'><div class='accordion_child'>");
		//htmlList.push("<li><p>早餐(699千卡)</p>");
		var bList = value.map.breakfast;
		var bhtml = [];
		var bcal = 0;
		if (bList.length > 0) {
			jQuery.each(bList,function(key,value){
				if(value.calorie!=null&&value.calorie!=""){
					bcal += parseFloat(value.calorie);
				}
				//htmlList.push("<div>"+value.proName+"&nbsp;"+value.proAmount+value.proUnit+"&nbsp;"+value.calorie+"千卡</div>");
				bhtml.push("<div>"+value.proName+"&nbsp;"+value.proAmount+value.proUnit+"&nbsp;"+value.calorie+"千卡</div>"); 
			});
		}
		htmlList.push("<li><p>早餐("+bcal.toFixed(2)+"千卡)</p>");
		htmlList.push(bhtml.join(''));
		htmlList.push("</li>");
		//htmlList.push("<li><p>午餐(699千卡)</p>");
		var lList = value.map.lunch;
		var lhtml = [];
		var lcal = 0;
		if (lList.length > 0) {
			jQuery.each(lList,function(key,value){
				if(value.calorie!=null&&value.calorie!=""){
					lcal += parseFloat(value.calorie);
				}
				lhtml.push("<div>"+value.proName+"&nbsp;"+value.proAmount+value.proUnit+"&nbsp;"+value.calorie+"千卡</div>");
			});
		}
		htmlList.push("<li><p>午餐("+lcal.toFixed(2)+"千卡)</p>");
		htmlList.push(lhtml.join(''));
		htmlList.push("</li>");
		//htmlList.push("<li><p>晚餐(699千卡)</p>");
		var dList = value.map.dinner;
		var dhtml = [];
		var dcal = 0;
		if (dList.length > 0) {
			jQuery.each(dList,function(key,value){
				if(value.calorie!=null&&value.calorie!=""){
					dcal += parseFloat(value.calorie);
				}
				dhtml.push("<div>"+value.proName+"&nbsp;"+value.proAmount+value.proUnit+"&nbsp;"+value.calorie+"千卡</div>");
			});
		}
		htmlList.push("<li><p>晚餐("+dcal.toFixed(2)+"千卡)</p>");
		htmlList.push(dhtml.join(''));
		htmlList.push("</li>");
		//htmlList.push("<li><p>日常饮食(699千卡)</p>");
		var aList = value.map.daily;
		var ahtml = [];
		var acal = 0;
		if (aList.length > 0) {
			jQuery.each(aList,function(key,value){
				if(value.calorie!=null&&value.calorie!=""){
					acal += parseFloat(value.calorie);
				}
				ahtml.push("<div>"+value.proName+"&nbsp;"+value.proAmount+value.proUnit+"&nbsp;"+value.calorie+"千卡</div>");
			});
		}
		htmlList.push("<li><p>日常饮食("+acal.toFixed(2)+"千卡)</p>");
		htmlList.push(ahtml.join(''));
		htmlList.push("</li>");
		//htmlList.push("<li><p>运动(699千卡)</p>");
		var sList = value.map.sport;
		var shtml = [];
		var scal = 0;
		if (sList.length > 0) {
			jQuery.each(sList,function(key,value){
				if(value.calorie!=null&&value.calorie!=""){
					scal += parseFloat(value.calorie);
				}
				shtml.push("<div>"+value.proName+"&nbsp;"+value.proAmount+value.proUnit+"&nbsp;"+value.calorie+"千卡</div>");
			});
		}
		htmlList.push("<li><p>运动("+scal.toFixed(2)+"千卡)</p>");
		htmlList.push(shtml.join(''));
		htmlList.push("</li>");
		htmlList.push("</div></div>");
	})
	htmlList.push("<div class=\"paging\"><div class=\"publicad_fy\"><div class=\"viciao\">");
	var tpage = data.page.totalPage;
	var cpage = data.page.currentPage;
	if(tpage<=12){
		if(cpage==1){
			htmlList.push("<span class=\"disabled\">< 上一页</span>");
		}else{
			htmlList.push("<a href=\"javascript:getDiary("+(cpage-1)+")\">< 上一页</a>");
		}
		for(var i=1;i<=tpage;i++){
			if(cpage==i){
				htmlList.push("<span class=\"current\">"+i+"</span>");
			}else{
				htmlList.push("<a href=\"javascript:getDiary("+i+")\">"+i+"</a>");
			}
		}
		if(cpage==tpage){
			htmlList.push("<span class=\"disabled\">下一页 ></span>");
		}else{
			htmlList.push("<a href=\"javascript:getDiary("+(cpage+1)+")\">下一页 ></a>");
		}
	}else{
		if(cpage>6){
			htmlList.push("<a href=\"javascript:getDiary("+(cpage-1)+")\">< 上一页</a>");
			htmlList.push("<a href=\"javascript:getDiary(1)\">1</a>");
			htmlList.push("...");
			if((tpage-cpage)<=5){
				for(var i=(tpage-10);i<=tpage;i++){
					if(cpage==i){
						htmlList.push("<span class=\"current\">"+i+"</span>");
					}else{
						htmlList.push("<a href=\"javascript:getDiary("+i+")\">"+i+"</a>");
					}
				}
				if(cpage==tpage){
					htmlList.push("<span class=\"disabled\">下一页 ></span>");
				}else{
					htmlList.push("<a href=\"javascript:getDiary("+(cpage+1)+")\">下一页 ></a>");
				}
			}else{
				for(var i=(cpage-4);i<=(cpage+4);i++){
					if(cpage==i){
						htmlList.push("<span class=\"current\">"+i+"</span>");
					}else{
						htmlList.push("<a href=\"javascript:getDiary("+i+")\">"+i+"</a>");
					}
				}
				htmlList.push("...");
				htmlList.push("<a href=\"javascript:getDiary("+tpage+")\">"+tpage+"</a>");
				htmlList.push("<a href=\"javascript:getDiary("+(cpage+1)+")\">下一页 ></a>");
			}
		}else{
			if(cpage==1){
				htmlList.push("<span class=\"disabled\">< 上一页</span>");
			}else{
				htmlList.push("<a href=\"javascript:getDiary("+(cpage-1)+")\">< 上一页</a>");
			}
			for(var i=1;i<=10;i++){
				if(cpage==i){
					htmlList.push("<span class=\"current\">"+i+"</span>");
				}else{
					htmlList.push("<a href=\"javascript:getDiary("+i+")\">"+i+"</a>");
				}
			}
			htmlList.push("...");
			htmlList.push("<a href=\"javascript:getDiary("+tpage+")\">"+tpage+"</a>");
			htmlList.push("<a href=\"javascript:getDiary("+(cpage+1)+")\">下一页 ></a>");
		}
	}
	htmlList.push("</div></div></div>");
	jQuery("#diary_content").html(htmlList.join(''));
}