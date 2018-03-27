<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>营养师主管日记留言确认</title>
<@u.css src="style.css"/>
<@u.rootjs src="jquery-1.4.2.min.js"/>
<@u.rootjs src="My97DatePicker/WdatePicker.js"/>
<@u.js src="dialog.js"/>
<script type="text/javascript">
	$(document).ready(function(){
		$("#ck_1").click(function(){
			if($(this).attr("checked")){
				$("[name='box']").attr("checked","true");
			}else{
				$("[name='box']").removeAttr("checked");
			}
		});
		$("#ck_2").click(function(){
			if($(this).attr("checked")){
				$("[name='boxs']").attr("checked","true");
			}else{
				$("[name='boxs']").removeAttr("checked");
			}
		});
		
	});
	
	function show(id,type){
		var url = "member!newCustomerEdit.action?id="+id+"&type="+type;
		beginOpen(url);
	}
	function intervence(id){
		var url = "member!getIntervence.action?header=true&id="+id;
		beginOpen(url);
	}
	
	function beginOpen(url){
		var sh = window.screen.height;
		var sw = window.screen.width;
		var top = Math.round(sh/4);
		var left = Math.round(sw/4);
		window.open(url,'','toolbar=no,resizable=yes,location=no,scrollbars=yes,width=800,height=500,top='+top+',left='+left);
	}
	
	function saveDiary(id){
		Dialog.confirm("确认操作？",function(){
			window.location="diary!checkSave.action?type=vip&id="+id;
		});
	}
	
	function saveMsg(id){
		Dialog.confirm("确认操作？",function(){
			window.location="message!checkSave.action?flag=vip&id="+id;
		});
	}
	
	function gotoPage1(page){
		document.getElementById('curPage1').value = page;
  		document.getElementById('search_form').submit();
	}
	
	function diaryConfirm(){
		var pass=false;
		$("input:checkbox[name='box']").each(function(){
			if($(this).attr("checked")){
				pass = true;
			};
		})
		if(pass){
			Dialog.confirm("确认操作？",function(){
				$("#d_form").submit();
			});
		}else{
			Dialog.alert("请选择待确认日记！");
		}
	}
	
	function msgConfirm(){
		var pass=false;
		$("input:checkbox[name='boxs']").each(function(){
			if($(this).attr("checked")){
				pass = true;
			};
		})
		if(pass){
			Dialog.confirm("确认操作？",function(){
				$("#m_form").submit();
			});
		}else{
			Dialog.alert("请选择待确认留言！");
		}
	}
	
	function comDiary(id,old){
		var diag = new Dialog("Diag_1");
		diag.Width = 800;
		diag.Height = 400;
		diag.Title = "日记点评";
		if(old==1){
			diag.URL = "diary!managerReply.action?id="+id;
		}else{
			diag.URL = "diary!comment.action?id="+id;
		}
		diag.ShowMessageRow = true;
		diag.OKEvent = function(){
		  	Dialog.confirm("确认点评？",
		  		function(){
					var did = diag.ID;
					document.getElementById("_DialogFrame_"+did).contentWindow.doSubmit();
		  		}
		  	);
		};
		diag.show();
	}	
	
	function comMsg(id){
		var diag = new Dialog("Diag_1");
		diag.Width = 700;
		diag.Height = 330;
		diag.Title = "留言点评";
		diag.URL = "message!input.action?reviews=true&id="+id;
		diag.ShowMessageRow = true;
		diag.OKEvent = function(){
		  	Dialog.confirm("确认点评？",
		  		function(){
					var did = diag.ID;
					document.getElementById("_DialogFrame_"+did).contentWindow.doSubmit();
		  		}
		  	);
		};
		diag.show();
	}
	
	function backList(){
		$("#search_form").submit();
  	}
</script>
</head>

<body class="mainbody">
<div class="fastNav">营养师部 > 营养师主管日记留言 > 营养师主管日记留言确认</div>
<@u.search_bar action="diary!checkList.action">
<input type="hidden" id="curPage" name="diary.curPage" value="${diary.curPage}" />
<input type="hidden" id="curPage1" name="message1.curPage" value="${message1.curPage}" />
  <table>
    <tr>
      <td width="25%">日记留言日期： </td>
      <td width="25%">
      <input type="text" name="diary.createDate" onclick="WdatePicker({readOnly:true})" value="${(diary.createDate?string("yyyy-MM-dd"))?default("")}"/>
	  </td>
	  <td width="25%">点评状态： </td>
      <td width="25%">
		<select id="status" name="status" >
			<option value="0" <#if "${status!}"="0">selected</#if>>未确认未点评</option>
			<option value="1" <#if "${status!}"="1">selected</#if>>未确认已点评</option>
			<option value="2" <#if "${status!}"="2">selected</#if>>已确认未点评</option>
			<option value="3" <#if "${status!}"="3">selected</#if>>已确认已点评</option>
		</select>
	  </td>
    </tr>
    <tr>
    	<td>会员姓名：</td>
    	<td><input type="text" id="member_name" name="diary.member.name" value="${(diary.member.name)!}"/></td>
    	<td colspan="2">&nbsp;</td>
    </tr>
  </table> 
</@u.search_bar>

<div class="listTitle">
	<span>日记列表</span>
	<ul><li><input type="button" onclick="diaryConfirm()" value="将选中的日记设置为确认" class="btn_bg" /></li></ul>
</div>
<div class="listLine">
<form id="d_form" name="d_form" method="post" action="diary!checkAllSave.action">
<input type="hidden" name="type" value="vip" />
<table>
  <tr>
    <th><input type="checkbox" id="ck_1" /></th>
    <th>回复日期</th>
    <th>会员姓名</th>
    <th>营养师</th>
    <th>所属机构</th>
	<th>所处阶段(天数/总天数)</th>
	<th width="30%">回复内容</th>
    <th>主管确认</th>
    <th>点评</th>
  </tr>
<#if page.dataList ??>
  <#list page.dataList as diary>
  <tr>
	<td><input type="checkbox" name="box" value="${diary.id!}" /></td>
	<td>${(diary.replyDate?string("yyyy-MM-dd"))!}</td>
    <td><a href="javascript:show('${diary.member.id!}','${type!}')">${(diary.member.name)!}</a></td>
    <td>${(diary.member.staff.name)!}</td>
    <td>${(diary.member.staff.org.name)!}</td>
    <td>
    	<a href="javascript:intervence('${diary.member.id!}')">
    	<#if diary.member??&& diary.member.phase??>
    		<@c.syscode syscodes=sysCodeList code="${(diary.member.phase)!}"/>
    	</#if>
    	<#if diary.member.phaseStartDate??>${diary.member.getDay(diary.member.phaseStartDate)}</#if>/<#if diary.member.createDate??>${diary.member.getDay(diary.member.createDate)}</#if>
    	</a>
    </td>
    <td width="30%">${diary.expertComment!}</td>
    <td>
	    <#if diary.isChecked??&&diary.isChecked=0>
	    	<input class="btn_bg" type="button" onclick="saveDiary(${diary.id!})" value="确认"/>
	    <#else>已确认
	    </#if>
    </td>
    <td>
	    <#if diary.isComment??&&diary.isComment=0>
	    	<input class="btn_bg" type="button" onclick="comDiary('${diary.id!}','${diary.isOld}')" value="点评"/>
	    <#else>已点评
	    </#if>
    </td>
  </tr>
  </#list>
  <#else>
  <tr><td colspan="9">查无信息</td></tr>
  </#if>
 </table>
</form>
</div> 
<@u.paginate page=page/>

<div class="listTitle">
	<span>留言列表</span>
	<ul><li><input type="button" onclick="msgConfirm()" value="将选中的留言设置为确认" class="btn_bg" /></li></ul>
</div>
<div class="listLine">
<form id="m_form" name="m_form" method="post" action="message!checkAllSave.action">
<input type="hidden" name="flag" value="vip" />
<table>
<tr>
    <th><input type="checkbox" id="ck_2" /></th>
    <th>回复日期</th>
    <th>会员姓名</th>
    <th>营养师</th>
    <th>所属机构</th>
	<th>所处阶段(天数/总天数)</th>
	<th width="30%">回复内容</th>
    <th>主管确认</th>
    <th>点评</th>
  </tr>
<#if pageMessage.dataList??>
  <#list pageMessage.dataList as message>
  <tr>
	<td><input type="checkbox" name="boxs" value="${(message.id)!}"/></td>
    <td>${(message.replyDate?string("yyyy-MM-dd"))?default("")}</td>
    <td><a href="javascript:show('${message.member.id!}','${type!}')">${(message.member.name)!}</a></td>
    <td>${(message.member.staff.name)!}</td>
    <td>${(message.member.staff.org.name)!}</td>
	<td>
		<a href="javascript:intervence('${message.member.id!}')">
		<#if message.member.phase??>
		<@c.syscode syscodes=sysCodeList code="${(message.member.phase)!}"/>
		</#if>
		<#if message.member.phaseStartDate??>${message.member.getDay(message.member.phaseStartDate)}</#if>/<#if message.member.createDate??>${message.member.getDay(message.member.createDate)}</#if>
		</a>
	</td>
	<td width="30%">${message.reply!}</td>
    <td>
    	<#if message.isChecked??&&message.isChecked=0>
    		<input class="btn_bg" type="button" onclick="saveMsg(${message.id!})" value="确认"/>
    	<#else>已确认
    	</#if>
    </td>
    <td>
    	<#if message.isComment??&&message.isComment=0>
    		<input class="btn_bg" type="button" onclick="comMsg('${message.id!}')" value="点评"/>
    	<#else>已点评
    	</#if>
    </td>
  </tr>
 </#list>
 <#else>
  <tr><td colspan="9">查无信息</td></tr> 
 </#if>
</table>
</form>
</div>
<div class="pageNum">
	<a href='javascript:gotoPage1(1)'> 首页</a>
	<#if (pageMessage.previousPage >= 1) >
		<a href='javascript:gotoPage1(${pageMessage.previousPage!})'>上一页</a>
	</#if>
	<#if (pageMessage.nextPage <= pageMessage.totalPage)>
		<a href='javascript:gotoPage1(${pageMessage.nextPage!})'> 下一页</a>
	</#if>
	<a href='javascript:gotoPage1(${pageMessage.totalPage!})'> 尾页</a>
	当前第${pageMessage.currentPage!}/${pageMessage.totalPage!}页转到第
	<select id="currentPage" name="currentPage" onchange="gotoPage1(this.value)">
		<#list 1..pageMessage.totalPage as i>
			<option value="${i!}" <#if pageMessage.currentPage=i>selected</#if> >${i!}</option>
		</#list>
	</select>页 共${pageMessage.totalRow!}条记录
</div>
</body>
</html>