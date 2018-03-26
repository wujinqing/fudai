$(document).ready(function(){
	getSport();
	$("#yd_btn").click(function(){
		var w = $("#weight").val();
		if(!reg2.test(w)){
			Dialog.alert("请正确输入体重");
			return;
		}
		if(arrId==null||arrId.length==0){
			Dialog.alert("请输入运动时间");
		}else{
			var all_egy=0;
			for(var i=0;i<arrId.length;i++){
				var v = $("#st_"+arrId[i]).val();
				if(v.replace(/(^\s*)|(\s*$)/g, "")!=""){
					if(!reg1.test(v)){
						Dialog.alert("时间请输入整数");
						return;
					}
					if(arrEgy[i]==null||arrEgy[i]==""){
						arrEgy[i]=0;
					}
					all_egy += decimal(w*v*arrEgy[i],2);
				}
			}
			$("#res_msg").html(decimal(all_egy,2));
		}
	});
});
var arrId = new Array();
var arrEgy = new Array();
function getSport(){
	$("#sport").html("数据加载中，请稍后...");
	$.ajax( {
		type : 'post',
		url : '../mh/type_rule_ajax!typeRuleSport.action',
		dataType : 'json',
		data : null,
		success : function(data){
			var list = data.trList;
			var buffer = "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#B2D933\">";
			if(list!=null&&list!=""){
				$.each(list,function(key,value){
					buffer += "<tr><td colspan=\"2\" align=\"center\" bgcolor=\"#E0F0AD\"><strong>"+value.name+"</strong></td></tr>";
					var crList = value.crList;
					if(crList!=null&&crList.length>0){
						crLen = crList.length;
						$.each(crList,function(key,cr){
							arrId.push(cr.id);
							arrEgy.push(cr.energy);
							if(key%2==0){
								buffer += "<tr>";
							}
							buffer += "<td width=\"50%\" bgcolor=\"#FFFFFF\"><span><input style=\"width:40px;\" type=\"text\" id=\"st_"+cr.id+"\" name=\"st_"+cr.id+"\" /> "+cr.unit+"</span> ・"+cr.ruleName+"</td>";
							if((key+1)<crList.length&&(key+1)%2==0){
								buffer += "</tr>";
							}
							if((key+1)==crList.length&&(key+1)%2!=0){
								buffer +="<td bgcolor=\"#FFFFFF\"><span></span></td>"
							}
						});
					}
					buffer += "</tr>";
				});
			}else{
				buffer +="<tr><td colspan=\"2\">暂无数据</td></tr>";
			}
			$("#sport").html(buffer);
		}
	});
}