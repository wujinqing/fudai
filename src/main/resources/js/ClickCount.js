var jsFileName = "ClickCount.js";
var rName = new RegExp(jsFileName+"(\\?(.*))?$")
var jss=document.getElementsByTagName('script');
for (var i = 0;i < jss.length; i++){
	
	var id='';
	var type='';
	var pa='';
	var viewCount=''
  var j = jss[i];
  if (j.src&&j.src.match(rName)){
    var oo = j.src.match(rName)[2];
    if (oo&&(t = oo.match(/([^&=]+)=([^=&]+)/g))){
        for (var l = 0; l < t.length; l++){
            r = t[l];
            var tt = r.match(/([^&=]+)=([^=&]+)/);
            if (tt){
            	var key=tt[1];
            	var value=tt[2];
            	if(key=='id'){
            		id=value;
            	}
            	if(key=='type'){
            		type=value;
            	}
            	if(key=='pa'){
            		pa=value;
            	}
            	if(key=='vc'){
            		viewCount=value;
            	}
            //	document.write('参数：' + tt[1] + '，参数值：' + tt[2] + '<br />');
            }
        }
    }
    viewCount='view_count';
    
    document.write('<br />');
  }
  
  send(id,type,viewCount,pa);
}

function send(id,type,fname,pa){
	if(id&&type&&fname){
		var ifa='<iframe id="upc_iframe" src="'+pa+'/upc-'+id+'-'+type+'.html" width="100px" height="100px" style="display:none"></iframe>';
		document.write(ifa);
		
		var f =  window.setInterval(function(){
			try{
				var vc=getIframeContent('upc_iframe');
				if(vc){
					document.getElementById(fname).innerHTML=getIframeContent('upc_iframe');
					window.clearInterval(f); //清楚定时器
				}
			}catch(e){
				
			}
		},1000);
	}
}

function getIframeContent(fname){ //获取iframe中文档内容 
    var doc; 
    
    if (document.all){//IE 
        doc = document.frames[fname].document; 
    }else{//Firefox 
        doc = document.getElementById(fname).contentDocument; 
    } 
    return doc.body.innerHTML; 
} 


