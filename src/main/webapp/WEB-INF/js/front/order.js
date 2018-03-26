jQuery().ready(function () {
	getScore(1);
	getProduct(1);
})


function getScore(page){
	$.ajax({
		type : 'post',
		url : 'order_ajax!exchange.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack
	});
}

function getProduct(page){
	$.ajax({
		type : 'post',
		url : 'order_ajax!buySales.action',
		dataType : 'json',
		data : 'num='+page,
		success :callBack2
	});
}

function callBack(data){
	var list = data.page.dataList;
	var htmlList = "<strong>积分兑礼品</strong>";
		if (list != null && list.length > 0) {
			htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\"><tr><td align=\"center\" bgcolor=\"#E1F0AF\">礼品</td>";
			htmlList += "<td width=\"18%\" align=\"center\" bgcolor=\"#E1F0AF\">单位</td><td width=\"15%\" align=\"center\" bgcolor=\"#E1F0AF\">所需积分/单位</td>";
			htmlList += "<td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">申请数量</td><td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">使用积分</td>";
			htmlList += "<td width=\"12%\" align=\"center\" bgcolor=\"#E1F0AF\">状态</td><td width=\"15%\" align=\"center\" bgcolor=\"#E1F0AF\">备注</td></tr>";
		$.each(list,function(key,value){
			if (value.remark==null) {
				value.remark=" ";
			}
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.product.name+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.packName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.useScore/value.objCount+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.objCount+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.useScore+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.stateName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.remark+"</td></tr>";
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
		htmlList += "<div align=\"center\">暂无信息</div>";
	}
	$("#score_prize").html(htmlList);
}


function callBack2(data){
	var list2 = data.page.dataList;
	var htmlList = "<strong>诺特产品购买</strong>";
		if (list2 != null && list2.length > 0) {
			htmlList += "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#CFD8C5\"><tr>";                                   
			htmlList += "<td align=\"center\" bgcolor=\"#E1F0AF\">产品</td><td width=\"12%\" align=\"center\" bgcolor=\"#E1F0AF\">单位</td>";
			htmlList +="<td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">申请购买数</td><td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">购买金额</td>";
			htmlList +="<td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">优惠金额</td><td width=\"10%\" align=\"center\" bgcolor=\"#E1F0AF\">使用积分</td>";
			htmlList +="<td width=\"15%\" align=\"center\" bgcolor=\"#E1F0AF\">状态</td><td width=\"15%\" align=\"center\" bgcolor=\"#E1F0AF\">备注</td></tr>";
		$.each(list2,function(key,value){
			if (value.remark==null) {
				value.remark=" ";
			}
			var money =parseInt((value.objCount*value.product.price)-value.discountCost);
			htmlList += "<tr><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.product.name+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.packName+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.objCount+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+money+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.discountCost+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.useScore+"</td>";
			htmlList += "<td align=\"center\" bgcolor=\"#FFFFFF\">"+value.stateName+"</td><td align=\"center\" bgcolor=\"#FFFFFF\">"+value.remark+"</td></tr>";
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
				htmlList += "<a href=\"javascript:getProduct("+(cpage-1)+")\">< 上一页</a>";
			}
			for(var i=1;i<=tpage;i++){
				if(cpage==i){
					htmlList += "<span class=\"current\">"+i+"</span>";
				}else{
					htmlList += "<a href=\"javascript:getProduct("+i+")\">"+i+"</a>";
				}
			}
			if(cpage==tpage){
				htmlList += "<span class=\"disabled\">下一页 ></span>共"+rpage+"条记录";
			}else{
				htmlList +="<a href=\"javascript:getProduct("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}else{
			if(cpage>6){
				htmlList += "<a href=\"javascript:getProduct("+(cpage-1)+")\">< 上一页</a>";
				htmlList += "<a href=\"javascript:getProduct(1)\">1</a>";
				htmlList += "...";
				if((tpage-cpage)<=5){
					for(var i=(tpage-10);i<=tpage;i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getProduct("+i+")\">"+i+"</a>";
						}
					}
					if(cpage==tpage){
						htmlList += "<span class=\"disabled\">下一页 >共"+rpage+"条记录</span>";
					}else{
						htmlList += "<a href=\"javascript:getProduct("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
					}
				}else{
					for(var i=(cpage-4);i<=(cpage+4);i++){
						if(cpage==i){
							htmlList += "<span class=\"current\">"+i+"</span>";
						}else{
							htmlList += "<a href=\"javascript:getProduct("+i+")\">"+i+"</a>";
						}
					}
					htmlList += "...";
					htmlList += "<a href=\"javascript:getProduct("+tpage+")\">"+tpage+"</a>";
					htmlList += "<a href=\"javascript:getProduct("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
				}
			}else{
				if(cpage==1){
					htmlList += "<span class=\"disabled\">< 上一页</span>";
				}else{
					htmlList += "<a href=\"javascript:getProduct("+(cpage-1)+")\">< 上一页</a>";
				}
				for(var i=1;i<=10;i++){
					if(cpage==i){
						htmlList += "<span class=\"current\">"+i+"</span>";
					}else{
						htmlList += "<a href=\"javascript:getProduct("+i+")\">"+i+"</a>";
					}
				}
				htmlList += "...";
				htmlList += "<a href=\"javascript:getProduct("+tpage+")\">"+tpage+"</a>";
				htmlList += "<a href=\"javascript:getProduct("+(cpage+1)+")\">下一页 ></a>共"+rpage+"条记录";
			}
		}
		htmlList += "</div></div></div></div>";
	}else {
		htmlList += "<div align=\"center\">暂无信息</div>";
	}
	$("#buy_product").html(htmlList);
}

