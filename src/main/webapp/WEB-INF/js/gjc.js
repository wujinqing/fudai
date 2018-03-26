// ԱĶ̬

var rollText_k=5; //˵
				var rollText_i=1; //˵Ĭֵ
				//setFocus1(0);
				rollText_tt=setInterval("rollText(1)",4000);
				function rollText(a){
				clearInterval(rollText_tt);
				rollText_tt=setInterval("rollText(1)",4000);
				rollText_i+=a;
				if (rollText_i>rollText_k){rollText_i=1;}
				if (rollText_i==0){rollText_i=rollText_k;}
				//alert(i)
				 for (var j=1; j<=rollText_k; j++){
				 document.getElementById("rolltextmenu"+j).style.display="none";
				 }
				 document.getElementById("rolltextmenu"+rollText_i).style.display="block";
				 //document.getElementById("pageShow").innerHTML = rollText_i+"/"+rollText_k;
				} 
				
				function toueme(){
		document.getElementById("dongtai").style.display="none";
	}