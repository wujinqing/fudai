jQuery().ready(function () {
	getScore(1);
	getExchange(1);
	getWaytoScore(1);
	getPrize(1);
	getBuy(1);
})


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

function getWaytoScore(page){
	$.ajax({
		type : 'post',
		url : 'score_ajax!scoreWay.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack3
	});
}

function getPrize(page){
	$.ajax({
		type : 'post',
		url : 'score_ajax!scorePrize.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack4
	});
}

function getBuy(page){
	$.ajax({
		type : 'post',
		url : 'score_ajax!scoreProduct.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack5
	});
}

function callBack(data){
	var add="";
	var list = data.page.dataList;
	var htmlList = "<strong>积分详细</strong>";
	htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">";
	htmlList += "<tr><td width=\"20%\" align=\"center\" bgcolor=\"#E1F0AF\">事件</td>";
	htmlList += "<td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">积分数</td>";
	htmlList += "<td width=\"20%\" align=\"center\" bgcolor=\"#E1F0AF\">审核状态</td>";
	htmlList += "<td width=\"20%\" align=\"center\" bgcolor=\"#E1F0AF\">原因</td>";
	htmlList += "<td width=\"30%\" align=\"center\" bgcolor=\"#E1F0AF\">时间</td></tr>";
	if (list != null && list.length > 0) {
		$.each(list,function(key,value){
			add="";
			if (value.addCutType==1) {
				add="+";
			}else if(value.addCutType==2){
				add="-";
			}
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.objTypeName+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+add+value.useScore+"</td>";
			if(value.isAudit==0){
				htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">无需审核</td>";
			}else{
				htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.auditStatusName+"</td>";
			}
			
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.reason+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.createDate.replace("T"," ")+"</td></tr>";
		});
		htmlList += "</table>";
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		var rpage = data.page.totalRow;
		
		htmlList+='<div class="page_div">';
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList += "<span class=\"disabled\">< 上一页</span>";
			}else{
				htmlList += "<a href=\"javascript:getScore("+(cpage-1)+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getScore("+i+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>共"+rpage+"条记录";
			}else{
				htmlList +="<a href=\"javascript:getScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getScore("+(cpage-1)+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getScore(1)\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getScore("+i+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 >共"+rpage+"条记录</span>";
					}else{
						htmlList += "<a href=\"javascript:getScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getScore("+i+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getScore("+tpage+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getScore("+(cpage-1)+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getScore("+i+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getScore("+tpage+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}
		htmlList += "</div></div></div></div>";
	}else {
		htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"5\">暂无信息</td></tr></table>";
	}
	$("#score_detail").html(htmlList);
}

function callBack2(data){
	var list2 = data.page.dataList;
	var htmlList = "<strong>已兑礼品</strong>";
	htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\">";
	htmlList += "<tr><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\">礼品名称</td>";
	htmlList +="<td align=\"center\" bgcolor=\"#E1F0AF\">使用积分</td><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\"> 时间</td></tr>";
	if (list2 != null && list2.length > 0) {
		$.each(list2,function(key,value){
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.scorePrize.prizeName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.scorePrize.needScore+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.updateDate.replace("T"," ")+"</td></tr>";
		});
		htmlList += "</table>";
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		var rpage = data.page.totalRow;
		
		htmlList+='<div class="page_div">';
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList += "<span class=\"disabled\">< 上一页</span>";
			}else{
				htmlList += "<a href=\"javascript:getExchange("+(cpage-1)+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getExchange("+i+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>共"+rpage+"条记录";
			}else{
				htmlList +="<a href=\"javascript:getExchange("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getExchange("+(cpage-1)+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getExchange(1)\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getExchange("+i+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 >共"+rpage+"条记录</span>";
					}else{
						htmlList += "<a href=\"javascript:getExchange("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getExchange("+i+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getExchange("+tpage+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getExchange("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getExchange("+(cpage-1)+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getExchange("+i+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getExchange("+tpage+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getExchange("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}
		htmlList += "</div></div></div></div>";
	}else {
		htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"3\">暂无信息</td></tr></table>";
	}
	$("#prize_exchange").html(htmlList);
}

function callBack3(data){
	var list3 = data.page.dataList;
	var htmlList = "<strong>积分获取途径</strong>";
	htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\"><tr><td align=\"center\" bgcolor=\"#E1F0AF\">事件</td><td width=\"50%\" align=\"center\" bgcolor=\"#E1F0AF\">可获取积分</td></tr>";
	if (list3 != null && list3.length > 0) {
		$.each(list3,function(key,value){
			htmlList+="<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.ruleName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.score+"</td></tr>";
		});
		htmlList += "</table>";
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		var rpage = data.page.totalRow;
		
		htmlList+='<div class="page_div">';
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList += "<span class=\"disabled\">< 上一页</span>";
			}else{
				htmlList += "<a href=\"javascript:getWaytoScore("+(cpage-1)+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getWaytoScore("+i+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>共"+rpage+"条记录";
			}else{
				htmlList +="<a href=\"javascript:getWaytoScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getWaytoScore("+(cpage-1)+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getWaytoScore(1)\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getWaytoScore("+i+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 >共"+rpage+"条记录</span>";
					}else{
						htmlList += "<a href=\"javascript:getWaytoScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getWaytoScore("+i+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getWaytoScore("+tpage+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getWaytoScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getWaytoScore("+(cpage-1)+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getWaytoScore("+i+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getWaytoScore("+tpage+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getWaytoScore("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}
		htmlList += "</div></div></div></div>";
	}else {
		htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"2\">暂无信息</td></tr></table>";
	}
	$("#score_way").html(htmlList);
}

function callBack4(data){
	var list4 = data.page.dataList;
	var memberType = data.memberType;
	var htmlList = "<strong>积分兑礼品</strong>&nbsp;（点击礼品进行积分兑换）<a href=\"../space/my_order.html\">  <strong>  我的订单</strong></a>";
	htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\"><tr><td align=\"center\" bgcolor=\"#E1F0AF\"><strong>礼品</strong></td><td width=\"50%\" align=\"center\" bgcolor=\"#E1F0AF\">所需积分</td></tr>";
	if (list4 != null && list4.length > 0) {
		if (memberType==1) {
			$.each(list4,function(key,value){
				htmlList+="<tr><td align=\"center\" bgcolor=\"#FFFFFF\"><a href=\"../space/exchange_prize_"+value.product.id+"_"+value.id+".html\">"+value.product.name+"</a></td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.memberScore+"</td></tr>";
			});
		}else {
			$.each(list4,function(key,value){
				htmlList+="<tr><td align=\"center\" bgcolor=\"#FFFFFF\"><a href=\"../space/exchange_prize_"+value.product.id+"_"+value.id+".html\">"+value.product.name+"</a></td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.needScore+"</td></tr>";
			});
		}
		htmlList += "</table>";
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		var rpage = data.page.totalRow;
		
		htmlList+='<div class="page_div">';
		
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList += "<span class=\"disabled\">< 上一页</span>";
			}else{
				htmlList += "<a href=\"javascript:getPrize("+(cpage-1)+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getPrize("+i+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>共"+rpage+"条记录";
			}else{
				htmlList +="<a href=\"javascript:getPrize("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getPrize("+(cpage-1)+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getPrize(1)\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getPrize("+i+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 >共"+rpage+"条记录</span>";
					}else{
						htmlList += "<a href=\"javascript:getPrize("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getPrize("+i+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getPrize("+tpage+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getPrize("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getPrize("+(cpage-1)+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getPrize("+i+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getPrize("+tpage+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getPrize("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}
		htmlList += "</div></div></div></div>";
	}else {
		htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"2\">暂无信息</td></tr></table>";
	}
	$("#score_prize").html(htmlList);
}

function callBack5(data){
	var list5 = data.page.dataList;
	var htmlList = "<strong>诺特产品购买</strong>&nbsp;（您可使用积分优惠购买诺特产品） &nbsp;<a href=\"../space/my_order.html\"><strong>我的订单</strong></a>";
	htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\"><tr><td align=\"center\" bgcolor=\"#E1F0AF\"><strong>产品名称</strong></td>"; 
	htmlList +="<td width=\"25%\" align=\"center\" bgcolor=\"#E1F0AF\">产品原价</td><td width=\"33%\" align=\"center\" bgcolor=\"#E1F0AF\">积分折现规则</td></tr>";
	if (list5 != null && list5.length > 0) {
		$.each(list5,function(key,value){
			htmlList+="<tr><td align=\"center\" bgcolor=\"#FFFFFF\"><a href=\"../space/buy_product_"+value.product.id+"_"+value.id+".html\">"+value.product.name+"</a></td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.product.price+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.needScore+"积分折现￥"+value.rebatePrice+"金额</td></tr>";
		});
		htmlList += "</table>";
		var tpage = data.page.totalPage;
		var cpage = data.page.currentPage;
		var rpage = data.page.totalRow;
		
		htmlList+='<div class="page_div">';
		if(tpage<=12){
			if(data.page.currentPage==1){
				htmlList += "<span class=\"disabled\">< 上一页</span>";
			}else{
				htmlList += "<a href=\"javascript:getBuy("+(cpage-1)+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getBuy("+i+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>共"+rpage+"条记录";
			}else{
				htmlList +="<a href=\"javascript:getBuy("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getBuy("+(cpage-1)+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getBuy(1)\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getBuy("+i+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 >共"+rpage+"条记录</span>";
					}else{
						htmlList += "<a href=\"javascript:getBuy("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getBuy("+i+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getBuy("+tpage+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getBuy("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getBuy("+(cpage-1)+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getBuy("+i+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getBuy("+tpage+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getBuy("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}
		htmlList += "</div></div></div></div>";
	}else {
		htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\" colspan=\"3\">暂无信息</td></tr></table>";
	}
	$("#buy_product").html(htmlList);
}
