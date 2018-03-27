<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<#import "/WEB-INF/macros/ui.ftl" as u>
<#import "/WEB-INF/macros/common.ftl" as c>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <@u.css src="style.css"/>
        <script type='text/javascript'>        
           function edit(id) {
                document.getElementById('id').value = id;
                var form = document.getElementById('cusVisitRecord_form');
                form.action = "cus_visit_record!input.action";
                form.submit();
            }
            function del(id) {
                if(confirm("确认删除？")) {
                    document.getElementById('id').value = id;
                    var form = document.getElementById('cusVisitRecord_form');
                    form.action = "cus_visit_record!delete.action";
                    form.submit();
                }
            }
        </script>
    </head>
    <body class="mainbody">
        <form method="get" id="cusVisitRecord_form" name="cusVisitRecord_form">
            <input id="id" name="id" type="hidden">     
        </form>
        
     	<@u.search_bar action="cus_visit_record.action">
        <input type="hidden" id="curPage" name="cusVisitRecord.curPage" value="${cusVisitRecord.curPage}" />
        <table width="100%" border="0" cellspacing="0">
        	<tr>
        	      <td width="15%">customer_id：</td>
        		  <td width="35%"><input type="text" name="cusVisitRecord.customerId" value="${cusVisitRecord.customerId!}"></td>
        	      <td width="15%">visit_record：</td>
        		  <td width="35%"><input type="text" name="cusVisitRecord.visitRecord" value="${cusVisitRecord.visitRecord!}"></td>
        	      <td width="15%">invite_detect_date：</td>
        		  <td width="35%"><input type="text" name="cusVisitRecord.inviteDetectDate" value="${cusVisitRecord.inviteDetectDate?string("yyyy-MM-dd")!}"></td>
        	      <td width="15%">will：</td>
        		  <td width="35%"><input type="text" name="cusVisitRecord.will" value="${cusVisitRecord.will!}"></td>
        	</tr>
        </table>
        </@u.search_bar>
        
        <@u.title_bar title="cusVisitRecord列表">
        	<@u.title_bar_btn type="new" onclick="edit();"/>
        </@u.title_bar>
        
        <div class="listLine">
        <table width="100%" border="0" cellspacing="0">
            <tr>
	        	  <th width="30%">customer_id</th>
	        	  <th width="30%">visit_record</th>
	        	  <th width="30%">invite_detect_date</th>
	        	  <th width="30%">will</th>
	              <th width="40%">操作</th>
            </tr>
            <#if (page.dataList)??>
            	<#list page.dataList as cusVisitRecord>
            	<tr>
	        	    <td>${cusVisitRecord.customerId!}</td>
	        	    <td>${cusVisitRecord.visitRecord!}</td>
	        	    <td>${cusVisitRecord.inviteDetectDate?string("yyyy-MM-dd")!}</td>
	        	    <td>${cusVisitRecord.will!}</td>
                    <td>
                       <input class="btn_bg" type="button" value="修改" onclick="edit('${cusVisitRecord.id}')">
                       <input class="btn_bg" type="button" value="删除" onclick="del('${cusVisitRecord.id}')">
                    </td>
                </tr>
            	</#list>
            </#if>
        </table>
        </div>        
        <@u.paginate page=page/>
</html>