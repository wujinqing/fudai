var Physical = object.extend({

	/*
	 * 平滑滚动，生成坐标数组
	 *
	 * nFrom 滚动起点
	 * nTo 滚动终点
	 * nSteps 平滑度，越大越平滑
	 * nType 滚动类型 0 = 先快后慢, 1 = 先慢后快再慢
	 *
	 */

	smooth: function(nFrom, nTo, nSteps, nType)
	{
		var arrList = [];
		
		switch (nType) {
			
			case 1: {
				
				var nPt = 0, nData = 0;
			
				for (var i=1; i<=nSteps; i++) {

					nPt = i/nSteps;
					nPt != 0.5 && arrList.push(nFrom + (nTo - nFrom) * ((Math.sqrt(Math.abs(2 * nPt - 1)) * (2 * nPt - 1) / Math.abs(2 * nPt - 1) + 1) / 2));
					
				}
				
				break;
			}
			
			default: {
				
				for (var i=1; i<=nSteps; i++) {
					
					arrList.push(nFrom + (nTo - nFrom) * Math.sqrt(i / nSteps));	
								
				}
				
			}
			
		}
		
		return arrList;
	}

});