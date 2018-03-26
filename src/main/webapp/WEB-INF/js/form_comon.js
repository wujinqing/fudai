var Common = {
	$id : function(id) {
		return document.getElementById(id);
	},
	$val : function(id, val) {
		var obj = $id(id);
		if (val == undefined) {
			return obj.value;
		} else {
			obj.value = val;
			return obj;
		}
	},
	$attr : function(id, attrName,attrVal) {
		var obj = $id(id);
		if (attrVal == undefined) {
			return obj.getAttribute(attrName);
		} else {
			obj.setAttribute(attrName,attrVal);
			return obj;
		}
	},
	$html : function(id, html) {
		var obj = $id(id);
		if (html == undefined) {
			return obj.innerHTML;
		} else {
			obj.innerHTML = html;
			return obj;
		}
	},
	$class : function(searchClass, node, tag) {
		if (document.getElementsByClassName && arguments.length === 1) {
			// 多加了一个条件arguments.length===1,保证IE和FF下的一致。
			return document.getElementsByClassName(searchClass);
		} else {
			node = node || document;
			tag = tag || "*";
			var classes = searchClass.split(" ");
			var elements = (tag === "*" && node.all) ? node.all : node
					.getElementsByTagName(tag);
			var patterns = [];
			var returnElements = [];
			var current, match;
			var i = classes.length;
			while (--i >= 0) {
				patterns.push(new RegExp("(^|\\s)" + classes[i] + "\\s|$"));
			}
			var j = elements.length;
			while (--j >= 0) {
				current = elements[j];
				match = false;
				for (var k = 0, kl = patterns.length; k < kl; k++) {
					match = patterns[k].test(current.className);
					if (!match)
						break;
				}
				if (match)
					returnElements.push(current);
			}
			return returnElements;
		}
	},
	/*
	 * 检测浏览器环境，根据不同浏览器的特有内置对象支持来判断，结果如下：
	 *
	 * 1: ie6 或更早版本
	 * 2: ie7 或更新版本
	 * 3: firefox
	 * 4: safari 或 chrome
	 * 5: opera
	 *
	 * 使用方法：var iNav = Page.navigator;
	 *
	 */
	
	navigator: window.ActiveXObject ? window.XMLHttpRequest ? 2 : 1 : window.opera ? 5 : navigator.userAgent.indexOf("KHTML") == -1 ? 3 : 4,

	/*
	 * 页面载入完成之后要运行的函数队列
	 *
	 * 使用方法：F.onload.push(function(){...});
	 *
	 */
	onload: [],
	/*
	 *
	 *
	 *
	 */
	
	jobList: [],
	
	
	/*
	 *
	 *
	 *
	 */
	 
	_oJobTimeout: null,
	/*
	 * 获取DOM中的HEAD元素
	 * 
	 * 使用方法：var oHead = Page.getHeadElement();
	 * 
	 */
	getHeadElement : function() {
		return document.getElementsByTagName('head')[0];
	},
	loadHeadElement : function(sTagName, oAttrs, fOnload) {
		var newElement = document.createElement(sTagName);

		for (var sEachAttr in oAttrs) {
			newElement.setAttribute(sEachAttr, oAttrs[sEachAttr]);
		}

		if (typeof(fOnload) == "function") {
			if (this.navigator < 3) // ie
			{
				newElement.onreadystatechange = function() {
					if (this.readyState == 'loaded'
							|| this.readyState == 'complete') {
						fOnload();
					}
				};
			} else // mozilla like
			{
				newElement.onload = function() {
					fOnload();
				};
			}
		}

		this.getHeadElement().appendChild(newElement);
	},
	/*
	 * 载入 js 脚本
	 * 
	 * sSrc 脚本路径 fOnload (可选) 回调函数
	 * 
	 */
	loadScript : function(sSrc, fOnload) {
		this.loadHeadElement("script", {
					"type" : "text/javascript",
					"src" : sSrc
				}, fOnload);
	},

	/*
	 * 载入 css 样式表
	 * 
	 * sHref 样式表路径 fOnload (可选) 回调函数
	 * 
	 */
	loadStyle : function(sHref, fOnload) {
		this.loadHeadElement("link", {
					"type" : "text/css",
					"rel" : "stylesheet",
					"href" : sHref
				}, fOnload);
	},
doJob: function()
	{
		if (this.jobList.length ==0) {
			return false;
		}

		var arrCurrJob = this.jobList.shift();
		this._oJobTimeout = window.setTimeout(function(){eval(arrCurrJob[0]); Page.doJob();}, arrCurrJob[1]);
	},
	/*
	 * 设置 Cookie
	 *
	 * oItems = {
	 *	name: "sName",
	 *	value: "sValue",
	 *	expires: nDays,
	 *	path: "sPath"
	 *	domain: "sDomain"
	 * };
	 *
	 */
	
	setCookie: function(oItems)
	{
		var sDate = (new Date()).getTime() + (oItems.expires || 0) * 86400000;
		
		var aCookie = [];
		
			oItems.name && aCookie.push(oItems.name + "=" + escape(oItems.value));
			oItems.expires && aCookie.push("expires=" + (new Date(sDate)).toGMTString());
			oItems.path && aCookie.push("path=" + oItems.path);
			oItems.domain && aCookie.push("domain=" + oItems.domain);
		
		document.cookie = aCookie.join(";");
	},
	
	/*
	 * 获取 Cookie 的值
	 *
	 */
	
	getCookie: function(sName)
	{
		var sValue = document.cookie.match(new RegExp("(^| )" + sName + "=([^;]*)(;|$)"));
		
		return sValue ? unescape(sValue[2]) : null;
	},
	
	/*
	 * 删除 Cookie
	 *
	 */
	
	delCookie: function(sName)
	{
		this.setCookie({name: sName, value: "", expires: -1});
	}
}

window.onload = function()
{
	for(var eachFunction in Common.onload)
	{
		Common.onload[eachFunction]();
	}
};

var Form = function() {
	var ct = this;

	ct.init = function(ost,memberId,path) {
		if (ost == '1') {// android
			ct.redirct = function(form_id) {
				
				window.location='../bs_'+ost+'_services_'+form_id+'_'+memberId+'.html';
			//	ss_service.ss_redirct(form_id);
				
				
			};
			ct.close = function() {
				ss_service.ss_close();
			};
			ct.submit = function() {
				//===
				ss_service.ss_submit();
			};
			ct.call = function(phoneNo) {
				ss_service.ss_call(phoneNo);
			};
			ct.setStage = function(stageCode) {
				ss_service.ss_setStage(memberId,stageCode);
//				setMemberState(memberId,stageCode);
			};
			ct.redirctApp = function(code, param) {
				ss_service.ss_redirctApp(code, param);
			};

//			Common.onload.push(function(){
			
				var ds = Common.$class('ss_datepick');
				if (ds != undefined && ds.length > 0) {
					for (i = 0; i < ds.length; i++) {
						var id = ds[i].getAttribute('id');
						var val = ds[i].value;
						var fmt= ds[i].getAttribute('dfmt');
						(function(nodeId, value,fmt) {
							if(!fmt)fmt= 'yyyy-MM-dd HH:mm:ss';
							ds[i].onclick = function() {
								ss_service.ss_pickDate(nodeId, value,fmt);
							}
						})(id, val,fmt);
					}
				}
//			});
		} else if (ost == '2') {// ios
			ct.redirct = function(form_id) {
					window.location='../bs_'+ost+'_services_'+form_id+'_'+memberId+'.html';
//				window.open('!ss_redirct?form_id=' + form_id);
			};
			ct.close = function() {
				window.open('!ss_close');
			};
			ct.submit = function() {
				window.open('!ss_submit');
			};
			ct.call = function(phoneNo) {
				window.open('!ss_call?phoneNo=' + phoneNo );
			};
			ct.setStage = function(stageCode) {
				window.open('!ss_setStage?stageCode=' + stageCode+'&memberId='+memberId);
			//	setMemberState(memberId,stageCode);
				
			};
			ct.redirctApp = function(code, param) {
				window.open('!ss_redirctApp?code=' + code + '&param=' + param);
			};

//			Common.onload.push(function(){
			
				var ds = Common.$class('ss_datepick');
				if (ds != undefined && ds.length > 0) {
					for (i = 0; i < ds.length; i++) {
						var id = ds[i].getAttribute('id');
						var val = ds[i].value;
						var fmt= ds[i].getAttribute('dfmt');
						(function(nodeId, value,fmt) {
							if(!fmt)fmt= 'yyyy-MM-dd HH:mm:ss';
							ds[i].onclick = function() {
								window.open('!ss_pickDate?nodeId=' + nodeId
										+ '&value=' + value+'&fmt='+fmt);
							}
						})(id, val,fmt);
					}
				}
			
//			});
			
			

		} else if (ost == '0') {
			ct.redirct = function(form_id) {
				window.location='../bs_'+ost+'_services_'+form_id+'_'+memberId+'.html';
			};
			ct.close = function() {

			};
			ct.submit = function() {
				var first_form=document.getElementsByTagName('form')[0];
				var action=	first_form.getAttribute('action');
				if(action){
					first_form.submit();
				}else{
					window.console.log('表单未指定action');
				}
			};
			ct.call = function(phoneNo) {

			};
			ct.setStage = function(stageCode) {
			//	setMemberState(memberId,stageCode);
			};
			ct.redirctApp = function(code, param) {

			};
			
//			Common.onload.push(function(){
				
				var ds = Common.$class('ss_datepick');
				
				if (ds != undefined && ds.length > 0) {
					var src = path+'js/My97DatePicker/WdatePicker.js';
					
					Common.loadScript(src, function() {
								for (i = 0; i < ds.length; i++) {
									var id = ds[i].getAttribute('id');
									var fmt= ds[i].getAttribute('dfmt');
									
									var val = ds[i].value;
									(function(obj,dfmt) {
										if(!dfmt)dfmt= 'yyyy-MM-dd HH:mm:ss';
										obj.onclick =function(){
											WdatePicker({dateFmt :dfmt,isShowClear : true,readOnly : true});
										};
									})(ds[i],fmt);
								}
							});
				}
			
//			});
		}
	}
	return ct;
}

window.Form = new Form();// 注册到window对象中

function setMemberState(memberId,code){
	 Common.$attr('subForm','action',path+'api/member!changeState.action?mid='+memberId+'&phase='+code).submit();
}

//(function(){
//	var ss=	location.href.split('?');
//	if(ss.length>1){
//		var pms=ss[1].split('=');
//		if(pms[0]=='p'&&pms[1]){
//			Form.init(pms[1]);
//		}
//	}
//})();