function getScore(page){
	$.ajax({
		type : 'post',
		url : 'score_ajax!scoreDetail.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack
	});
}

function getExchange(page){
	$.ajax({
		type : 'post',
		url : 'score_ajax!exchange.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack2
	});
}

function getPurchase(page){
	$.ajax({
		type : 'post',
		url : 'score_ajax!purchaseHistory.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack3
	});
}


function callBack(data){
	var list = data.page.dataList;
	var htmlList = "<strong>积分详情</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<front>您目前的可用积分为："+data.member.totScore+"积分</front>";
	if (list != null && list.length > 0) {
		htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">";
		htmlList += "<tr><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\">事件</td>";
		htmlList +="<td align=\"center\" bgcolor=\"#E1F0AF\">积分数</td><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\"> 时间</td></tr>";
		$.each(list,function(key,value){
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.scoreRule.ruleName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.scoreRule.score+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.createDate.replace("T"," ")+"</td></tr>";
		});
		htmlList +="<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"3\"><a href=\"score_used.html\">查看更多...</a></td></tr>";
		htmlList += "</table>";
		htmlList += "</div></div></div>";
	}else {
		htmlList += "<div align=\"center\">暂无信息</div>";
	}
	$("#purchase_history").html(htmlList);
}

function callBack2(data){
	var list2 = data.page.dataList;
	var htmlList = "<strong>已兑礼品</strong>";
	if (list2 != null && list2.length > 0) {
		htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">";
		htmlList += "<tr><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\">礼品名称</td>";
		htmlList +="<td align=\"center\" bgcolor=\"#E1F0AF\">使用积分</td><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\"> 时间</td></tr>";
		$.each(list2,function(key,value){
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.scorePrize.prizeName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.scorePrize.needScore+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.createDate.replace("T"," ")+"</td></tr>";
		});
		htmlList +="<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"3\"><a href=\"score_used.html\">查看更多...</a></td></tr>";
		htmlList += "</table>";
		htmlList += "</div></div></div>";
	}else {
		htmlList += "<div align=\"center\">暂无信息</div>";
	}
	$("#purchase_history").html(htmlList);
}

function callBack3(data){
	var list3 = data.page.dataList;
	var htmlList = "<strong>已购产品</strong>";
	if (list3 != null && list3.length > 0) {
		htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">";
		htmlList += "<tr><td width=\"25%\" align=\"center\" bgcolor=\"#E1F0AF\">产品名称</td>";
		htmlList += "<td width=\"25%\" align=\"center\" bgcolor=\"#E1F0AF\">数量</td>";
		htmlList +="<td align=\"center\" bgcolor=\"#E1F0AF\">购买金额</td><td width=\"25%\" align=\"center\" bgcolor=\"#E1F0AF\">使用积分</td></tr>";
		$.each(list3,function(key,value){
			if (value.needScore==null) {
				value.needScore=0;
			}
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.productName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.amount+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.sumMoney+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.needScore+"</td></tr>";
		});
		htmlList +="<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"4\"><a href=\"pay_history.html\">查看更多...</a></td></tr>";
		htmlList += "</table>";
		htmlList += "</div></div></div>";
	}else {
		htmlList += "<div align=\"center\">暂无信息</div>";
	}
	$("#purchase_history").html(htmlList);
}

