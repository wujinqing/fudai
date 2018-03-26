$(document).ready(function(){
	$("#wt_btn").click(function(){
		getWeightPic();
	});
	$("#th_btn").click(function(){
		getThreePic();
	});
	$("#nt_btn").click(function(){
		getNtPic();
	});
	$("#nf_btn").click(function(){
		getVFatPic();
	});
	$("#wa_btn").click(function(){
		getWaterPic();
	});
	$("#eg_btn").click(function(){
		getEnergyPic();
	});
});

function getWeightPic(){
	var begin = $("#wt_begin").val();
	var end = $("#wt_end").val();
	var src = "../mh/weight_info!wtPic.action?b="+begin+"&e="+end+"&r="+Math.random();
	$("#wt_img").attr("src",src);
	$.ajax({
		type : 'post',
		url : '../mh/draw_pic_ajax!wtList.action',
		dataType : 'json',
		data : 'begin='+begin+'&end='+end,
		success :function(data){
					var list = data.list;
					var htmlList = [];
					htmlList.push("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">");
					htmlList.push("<tr align=\"center\" bgcolor=\"#E1F0AF\"><td>时间</td><td>体重</td></tr>");
					if(list!=null && list.length>0){
						$.each(list,function(key,value){
							htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td>"+(value.createDate).substring(0,(value.createDate).indexOf("T"))+"</td><td>"+value.weight+"</td></tr>");
						});
					}else{
						htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td colspan=\"2\" align=\"center\">暂无信息</td></tr>");
					}
					htmlList.push("</table>");
					$("#wt_content").html(htmlList.join(''));
			     }
	});
}

function getThreePic(){
	var begin = $("#th_begin").val();
	var end = $("#th_end").val();
	var src = "../mh/weight_info!threePic.action?b="+begin+"&e="+end+"&r="+Math.random();
	$("#th_img").attr("src",src);
	$.ajax({
		type : 'post',
		url : '../mh/draw_pic_ajax!threeList.action',
		dataType : 'json',
		data : 'begin='+begin+'&end='+end,
		success :function(data){
					var list = data.list;
					var htmlList = [];
					htmlList.push("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">");
					htmlList.push("<tr align=\"center\" bgcolor=\"#E1F0AF\"><td>时间</td><td>体重</td><td>体脂肪</td><td>肌肉</td></tr>");
					if(list!=null && list.length>0){
						$.each(list,function(key,value){
							htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td>"+(value.createDate).substring(0,(value.createDate).indexOf("T"))+"</td><td>"+value.weight+"</td>");
							if (value.fat==null) value.fat="";
							if (value.muscle==null) value.muscle=""; 
							htmlList.push("<td>"+value.fat+"</td><td>"+value.muscle+"</td></tr>");
						});
					}else{
						htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td colspan=\"4\" align=\"center\">暂无信息</td></tr>");
					}
					htmlList.push("</table>");
					$("#th_content").html(htmlList.join(''));
			     }
	});
}

function getNtPic(){
	var begin = $("#nt_begin").val();
	var end = $("#nt_end").val();
	var src = "../mh/nt_info!ntPic.action?b="+begin+"&e="+end+"&r="+Math.random();
	$("#nt_img").attr("src",src);
	$.ajax({
		type : 'post',
		url : '../mh/draw_pic_ajax!ntList.action',
		dataType : 'json',
		data : 'begin='+begin+'&end='+end,
		success :function(data){
					var list = data.ntList;
					var htmlList = [];
					htmlList.push("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">");
					htmlList.push("<tr align=\"center\" bgcolor=\"#E1F0AF\"><td>时间</td><td>尿酮</td></tr>");
					if(list!=null && list.length>0){
						$.each(list,function(key,value){
							htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td>"+(value.createDate).substring(0,(value.createDate).indexOf("T"))+"</td><td>"+value.nt+"</td></tr>");
						});
					}else{
						htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td colspan=\"2\" align=\"center\">暂无信息</td></tr>");
					}
					htmlList.push("</table>");
					$("#nt_content").html(htmlList.join(''));
			     }
	});
}

function getVFatPic(){
	var begin = $("#nf_begin").val();
	var end = $("#nf_end").val();
	var src = "../mh/weight_info!otherPic.action?flag=v&b="+begin+"&e="+end+"&r="+Math.random();
	$("#nf_img").attr("src",src);
	$.ajax({
		type : 'post',
		url : '../mh/draw_pic_ajax!otherList.action',
		dataType : 'json',
		data : 'begin='+begin+'&end='+end,
		success :function(data){
					var list = data.list;
					var htmlList = [];
					htmlList.push("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">");
					htmlList.push("<tr align=\"center\" bgcolor=\"#E1F0AF\"><td>时间</td><td>内脏脂肪</td></tr>");
					if(list!=null && list.length>0){
						$.each(list,function(key,value){
							if (value.vlFat==null) value.vlFat="";
							htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td>"+(value.createDate).substring(0,(value.createDate).indexOf("T"))+"</td><td>"+value.vlFat+"</td></tr>");
						});
					}else{
						htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td colspan=\"2\" align=\"center\">暂无信息</td></tr>");
					}
					htmlList.push("</table>");
					$("#nf_content").html(htmlList.join(''));
			     }
	});
}

function getWaterPic(){
	var begin = $("#wa_begin").val();
	var end = $("#wa_end").val();
	var src = "../mh/weight_info!otherPic.action?flag=w&b="+begin+"&e="+end+"&r="+Math.random();
	$("#wa_img").attr("src",src);
	$.ajax({
		type : 'post',
		url : '../mh/draw_pic_ajax!otherList.action',
		dataType : 'json',
		data : 'begin='+begin+'&end='+end,
		success :function(data){
					var list = data.list;
					var htmlList = [];
					htmlList.push("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">");
					htmlList.push("<tr align=\"center\" bgcolor=\"#E1F0AF\"><td>时间</td><td>水分</td></tr>");
					if(list!=null && list.length>0){
						$.each(list,function(key,value){
							if (value.water==null) value.water="";
							htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td>"+(value.createDate).substring(0,(value.createDate).indexOf("T"))+"</td><td>"+value.water+"</td></tr>");
						});
					}else{
						htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td colspan=\"2\" align=\"center\">暂无信息</td></tr>");
					}
					htmlList.push("</table>");
					$("#wa_content").html(htmlList.join(''));
			     }
	});
}

function getEnergyPic(){
	var begin = $("#eg_begin").val();
	var end = $("#eg_end").val();
	var src = "../mh/weight_info!otherPic.action?flag=e&b="+begin+"&e="+end+"&r="+Math.random();
	$("#eg_img").attr("src",src);
	$.ajax({
		type : 'post',
		url : '../mh/draw_pic_ajax!otherList.action',
		dataType : 'json',
		data : 'begin='+begin+'&end='+end,
		success :function(data){
					var list = data.list;
					var htmlList = [];
					htmlList.push("<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">");
					htmlList.push("<tr align=\"center\" bgcolor=\"#E1F0AF\"><td>时间</td><td>基础代谢</td></tr>");
					if(list!=null && list.length>0){
						$.each(list,function(key,value){
							if (value.energy==null) value.energy="";
							htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td>"+(value.createDate).substring(0,(value.createDate).indexOf("T"))+"</td><td>"+value.energy+"</td></tr>");
						});
					}else{
						htmlList.push("<tr align=\"center\" bgcolor=\"#FFFFFF\"><td colspan=\"2\" align=\"center\">暂无信息</td></tr>");
					}
					htmlList.push("</table>");
					$("#eg_content").html(htmlList.join(''));
			     }
	});
}
