﻿var Scale = object.extend({
	
	construct: function(oFrameDiv, oButtonDiv, nHeight)
	{
		this.oFrameDiv = oFrameDiv;
		this.oButtonDiv = oButtonDiv;
		this.nHeight = nHeight;
		
		this.currFrame = -1;
		this.nTargetFrame = -1;
		this.arrButtons = [];
		this.oDelay = null;
		
		var _this = this;
		//检查浏览器
		var nFrames = Page.navigator < 3 ? oFrameDiv.childNodes.length : (oFrameDiv.childNodes.length ) / 2;
		
		for (var i=1; i<=nFrames; i++)
		{
			var theButton = document.createElement("A");
				theButton.tabIndex = i;
				theButton.className = "s-normal";
				theButton.href = "javascript:void(0)";
				theButton.innerHTML = i;

				theButton.onmouseover = function()
				{
					var nTabindex = this.tabIndex;
					var nTargetFrame = nTabindex-1;

					_this.nTargetFrame = nTargetFrame;
					_this.oDelay && window.clearTimeout(_this.oDelay);
					_this.oDelay = window.setTimeout(function(){_this.doScale(nTargetFrame);}, 200);
				};

				theButton.onmouseout = function()
				{
					_this.autoScale();
				};

			oButtonDiv.appendChild(theButton) && this.arrButtons.push(theButton);
			
			if (this.currFrame == -1)
			{
				this.currFrame = 0;
				this.highLight(0);
			}
		}
		
		this.autoScale();
	},
	
	scaleTo: function(nFrame)
	{
		var nCurrTop = this.currFrame * this.nHeight;
		var arrStepList = Physical.smooth(nCurrTop, nFrame * this.nHeight, 20, 0);

		for(var i=0; i<arrStepList.length; i++)
		{
			Page.jobList.push(['_("' + this.oFrameDiv.id + '").style.top = "-' + arrStepList[i] + 'px";', 10]);
		}
		
		Page.doJob();
	},
	
	highLight: function(nFrame)
	{
		this.arrButtons[this.currFrame].className = "s-normal";
		this.arrButtons[nFrame].className = "s-current";
	},
	
	doScale: function(nFrame)
	{
		// 核对是否需要滚动以及滚动过快的情况
		if(nFrame == this.currFrame || nFrame != this.nTargetFrame) return false;
		
		this.highLight(nFrame);
		this.scaleTo(nFrame);
		this.currFrame = nFrame;
	},
	
	autoScale: function()
	{
		var _this = this;
		var nNextFrame = this.currFrame + 1 <= this.arrButtons.length - 1 ? this.currFrame + 1 : 0;
		
		_this.nTargetFrame = nNextFrame;
		_this.oDelay = window.setTimeout(function(){_this.doScale(nNextFrame); _this.autoScale();}, 6000);
	}

});
