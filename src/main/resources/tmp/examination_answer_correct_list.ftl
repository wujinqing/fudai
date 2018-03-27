<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <@u.rootjs src="My97DatePicker/WdatePicker.js"/>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('examinee.id').value = id;
                var form = document.getElementById('examinationAnswer_form');
                form.action = "examination_answer!input.action";
                form.submit();
            }
            function correct(examineeid,id) {
                document.getElementById('examinee.id').value = examineeid;
                document.getElementById('id').value = id;
                var form = document.getElementById('examinationAnswer_form');
                form.action = "examination_answer!correct.action";
                form.submit();
            }
            
            function correctEnd(examineeid,id) {
                document.getElementById('examinee.id').value = examineeid;
                document.getElementById('id').value = id;
                var form = document.getElementById('examinationAnswer_form');
                form.action = "examination_answer!correctEnd.action";
                form.submit();
            }
            
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('examinationAnswer_form');
                    form.action = "examination_answer!delete.action";
                    form.submit();
                }
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="post" id="examinationAnswer_form" name="examinationAnswer_form">
            <input id="id" name="id" type="hidden">  
            <input id="examinee.id" name="examinee.id" type="hidden">    
        </form>
        
     	<@u.search_bar action="examination_answer!correctList.action">
        <input type="hidden" id="curPage" name="examinationPaper.curPage" value="${examinationPaper.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%">试卷名称：</td>
        		  <td width="35%">
        		  <select name="examinationPaper.id">
		             <option value="">--请选择--</option>
		     	<#if examinationPaperList??>
			     <#list examinationPaperList as examinationPapers>
			        <option value="${examinationPapers.id!}" <#if examinationPaper.id??&&examinationPapers.id==examinationPaper.id>selected</#if>>${examinationPapers.testName!}</option>
			        </#list>
		             </#if>
		      </select>
        		  </td>
        	      <td width="15%">考试日期：</td>
        		  <td width="35%">
					从<input size="6" id="examinationPaper.testDateStart" name="examinationPaper.testDateStart" onclick="WdatePicker({isShowClear:false,readOnly:true})" value="${(examinationPaper.testDateStart?string('yyyy-MM-dd'))!}"/>
				到<input size="6" id="examinationPaper.testDateEnd" name="examinationPaper.testDateEnd" onclick="WdatePicker({isShowClear:false,readOnly:true})" value="${(examinationPaper.testDateEnd?string('yyyy-MM-dd'))!}"/>
					</td>
        	  </tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="试卷列表">
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th >考试日期</th>
	        	  <th >考卷名称</th>
	        	  <th >考卷状态</th>
	        	  <th >未考试名单</th>
	              <th >已考试名单</th>
	              <th >已批注名单</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as examinationPaper>
            	<tr>
	        	    <td>${((examinationPaper.testDate)?string("yyyy-MM-dd"))!}</td>
	        	    <td>${examinationPaper.testName!}</td>
	        	    <td><@c.syscode syscodeList '${examinationPaper.testState!}' /></td>
	        	    <td><#if (examinationPaper.unjoinList)??>
            	<#list examinationPaper.unjoinList as unjoin>${unjoin.staff.name!}
            	</#list>
            </#if>
            	</td>
                    <td>
                    <#if (examinationPaper.joinList)??>
            	<#list examinationPaper.joinList as join><a href="javascript:correct(${join.id!},${examinationPaper.id!})" >${join.staff.name!}</a>
            	</#list>
            </#if>
                     </td>
                     <td>
                     <#if (examinationPaper.correctList)??>
            	<#list examinationPaper.correctList as correct><a href="javascript:correctEnd(${correct.id!},${examinationPaper.id!})" >${correct.staff.name!}</a>
            	</#list>
            </#if>
                     </td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
</html>