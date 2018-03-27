<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户阶段调整</title>
        
        <script type="text/javascript">
        	function $(id){
        		return document.getElementById(id);
        	}
        	
        	function changeStage(phase){
        		$('phase').value=phase;
        		$('form').submit();
        	}
        </script>
   </head>
   
   
<body>
	<#if "${msg!}"!="">

		<#if "${osType!'0'}"=="0">
			<#if "${msg!}"=="1">
				<div style="color:red">已成功调整!</div>
			<#else>
				<div style="color:red">调整失败!</div>
			</#if>
		</#if>
		
		<#if "${osType!'0'}"=="1">
			<script type="text/javascript">
				window.open('!ss_changeState?result=${msg!}');
			</script>
		</#if>
		
		<#if "${osType!'0'}"=="2">
			<script type="text/javascript">
				ss_service.changeStateResult('${msg!}');
			</script>
		</#if>
		
	</#if>
		
	<form action="${base}/api/service_stage!changeState.action" method="post" id="form">
		<input type="hidden" value="${mid!}" name="mid"/>
		<input type="hidden" value="${osType!}" name="osType"/>
		<input type="hidden" value="${phase!}" name="phase" id="phase"/>
	</form>
	<table width="100%" border="1" cellspacing="0">
	    <tr>
	    	  <th width="30%">服务阶段名称</th>
	    	  <th width="30%">说明</th>
	          <th width="30%">操作</th>
	    </tr>
	
		<#if (stageList??&&stageList?size>0)>
			<#list stageList as stage>
				<tr>
					<td>
						${(stage.stageName)!}
					</td>
					<td>
						<#if "${(stage.stageCode)!}"=="${(member.phase)!}">当前阶段</#if>&nbsp;
					</td>
					<td>
					<#if "${(stage.stageCode)!}"=="${(member.phase)!}">&nbsp;<#else>
						<input type="button" value="调整" onclick="changeStage('${(stage.stageCode)!}')" />
					</#if>
					</td>
				</tr>
			</#list>
		</#if>
	</table>

</body>
</html>