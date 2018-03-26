
<#--
用来显示syscode的名称
sysCodeList——某类型的所有syscode
code——具体的类型代码
-->
<#macro syscode syscodes code><#if syscodes??&&syscodes?size gt 0><#list syscodes as sysCode><#if sysCode.code==code>${sysCode.codeName}<#break></#if></#list></#if></#macro>

<#--
用来显示syscode的名称
sysCodeList——所有syscode
code——具体的类型代码
type——具体的某种类型
-->
<#macro syscodeOne syscodes code type>
	<#if syscodes??&&syscodes?size gt 0>
     <#list syscodes as sysCode>
     	<#if code??&&type??>
           <#if sysCode.code==code&&(sysCode.type)?string==type>
           	 ${sysCode.codeName}
           	 <#break>
           </#if>
        </#if>  
     </#list>
     </#if>
</#macro>


<#--
用来获得下拉框显示syscode的名称，且能被默认选中
sysCodeList——所有syscode
pname——名称
param——具体的某种类型
flag——具体的某种类型代码
-->
<#macro sysList syscodes pname param flag>
	<select name="${pname}">
	<option value="">--请选择--</option>
	<#list syscodes as sysCode>
		<#if (sysCode.type)?string==param>
			<option value="${(sysCode.code)!}" 
				<#if flag??&&(sysCode.code)??>
					<#if flag?string==sysCode.code>selected</#if>
				</#if>>
				${(sysCode.codeName)!}
			</option>
		</#if>
	</#list>
	</select>
</#macro>

<#macro sysListTwo syscodes pname pid param flag>
	<select name="${pname}" id="${pid}">
	<option value="">--请选择--</option>
	<#list syscodes as sysCode>
		<#if (sysCode.type)?string==param>
			<option value="${(sysCode.code)!}" 
				<#if flag??&&(sysCode.code)??>
					<#if flag?string==sysCode.code>selected</#if>
				</#if>>
				${(sysCode.codeName)!}
			</option>
		</#if>
	</#list>
	</select>
</#macro>

<#--
用来获得下拉框显示syscode的名称，且能被默认选中
sysCodeList——所有syscode
pname——名称
flag——具体的某种类型代码
-->
<#macro sysListOne syscodes pname flag>
	<select name="${pname}">
	<option value="">--请选择--</option>
	<#list syscodes as sysCode>
			<option value=${(sysCode.code)!} 
				<#if flag??&&(sysCode.code)??>
					<#if flag?string==sysCode.code>selected</#if>
				</#if>>
				${(sysCode.codeName)!}
			</option>
	</#list>
	</select>
</#macro>

<#--
用来获得下拉框显示syscode的名称，且能被默认选中
sysCodeList——所有syscode
pname——名称
param——具体的某种类型
flag——具体的某种类型代码
change——改变时调用函数
-->
<#macro sysLists syscodes pname param flag change>
	<select name="${pname}" onchange="${change}">
	<option value="">--请选择--</option>
	<#list syscodes as sysCode>
		<#if (sysCode.type)?string==param>
			<option value=${(sysCode.code)!} 
				<#if flag??&&(sysCode.code)??>
					<#if flag?string==sysCode.code>selected</#if>
				</#if>>
				${(sysCode.codeName)!}
			</option>
		</#if>
	</#list>
	</select>
</#macro>

<#--
用来获得下拉框显示syscode的名称，且能被默认选中
sysCodeList——所有syscode
name——名称
id——id
param——具体的某种类型
flag——具体的某种类型代码
change——改变时调用函数
-->
<#macro sysSelectList syscodes name id param flag change>
	<select name="${name}" id="${id}" onchange="${change}">
	<option value="">--请选择--</option>
	<#list syscodes as sysCode>
		<#if (sysCode.type)?string==param>
			<option value=${(sysCode.code)!} 
				<#if flag??&&(sysCode.code)??>
					<#if flag?string==sysCode.code>selected</#if>
				</#if>>
				${(sysCode.codeName)!}
			</option>
		</#if>
	</#list>
	</select>
</#macro>

<#--
用来显示syscode的checkbox
name——控件名称
sysCodeList——某类型的所有syscode
codes——选中的具体代码
-->
<#macro syscodeCB name syscodes codes>
	<#assign arr=codes?split(",")>
	<#list syscodes as sysCode>
           <#assign checked=''>
           <#list arr as a>
           		<#if sysCode.code==a>
           			<#assign checked="checked='true'">
           		</#if>
           </#list>
           <input type="checkbox" name="${name}" id="${name}_${sysCode.code}" value="${sysCode.code}}" ${checked}>${sysCode.codeName}
     </#list>
</#macro>
<#--用于页面有很多个checkbox
参数同上
需要自定义个doCheck()函数
-->
<#macro syscodeCheck name syscodes codes>
	<#if codes??>
	<#assign arr=codes?split(",")>
	<#list syscodes as sysCode>
           <#assign checked=''>
           <#list arr as a>
           		<#if sysCode.code==a>
           			<#assign checked="checked='true'">
           		</#if>
           </#list>
           <input type="checkbox" name="${name}_type" id="${name}_${sysCode.code}" value="${sysCode.code}" ${checked}  onchange="doCheck('${name}_type','${name}');">${sysCode.codeName}
     </#list>
     <#else>
     <#list syscodes as sysCode>
           <input type="checkbox" name="${name}_type" id="${name}_${sysCode.code}" value="${sysCode.code}" onchange="doCheck('${name}_type','${name}');">${sysCode.codeName}
     </#list>
     </#if>
</#macro>
<#--
用于页面有很多个checkbox
syscodesList-所有的sysCode
需要自定义个doCheck()函数
-->
<#macro syscodeCheckAll name syscodes codes type>
	<#if codes??>
	<#assign arr=codes?split(",")>
	<#list syscodes as sysCode>
		<#if "${sysCode.type}"="${type}">
           <#assign checked=''>
           <#list arr as a>
           		<#if sysCode.code==a>
           			<#assign checked="checked='true'">
           		</#if>
           </#list>
           <input type="checkbox" name="${name}_type" id="${name}_${sysCode.code}" value="${sysCode.code}" ${checked}  onchange="doCheck('${name}_type','${name}');">${sysCode.codeName}
        </#if>   
     </#list>
     <#else>
     <#list syscodes as sysCode>
     	<#if "${sysCode.type}"="${type}">
           <input type="checkbox" name="${name}_type" id="${name}_${sysCode.code}" value="${sysCode.code}" onchange="doCheck('${name}_type','${name}');">${sysCode.codeName}
        </#if>   
     </#list>
     </#if>
</#macro>


<#--
用于页面有很多个checkbox
参数同上
需要自定义个doCheck()函数
-->
<#macro syscodeCheckSelect name syscodes codes>
	<#assign arr=codes?split(",")>
	<#list syscodes as sysCode>
           <#assign checked=''>
           <#list arr as a>
           		<#if sysCode.codeName==a>
           			<#assign checked="checked='true'">
           		</#if>
           </#list>
           ${sysCode.codeName}<input type="checkbox" name="${name}_type" id="${name}_${sysCode.code}" value="${sysCode.codeName}" ${checked}  onchange="doCheck('${name}_type','${name}');">
     </#list>
</#macro>

<#--
用来显示syscode的checkbox(不能对checkbox操作)
sysCodeList——类型的所有syscode
codes——选中的具体代码
type——具体的某一种內型	
-->
<#macro sysCodeDo syscodes codes type>
	<#if (codes)??>
      	<#assign arr=codes?split(",")>
	      <#list sysCodeList as sysCode>
	      	<#if (sysCode.type)?string==type>
	      		<#assign checked=''>
		      	<#list arr as a>
		      		<#if sysCode.code==a>
		      			<#assign checked="checked='true'">		
		      		</#if>
		      	</#list>
		      	<input type="checkbox" value="${sysCode.code}" ${checked}/>${(sysCode.codeName)!}
	      	</#if>
	      </#list>
      <#else>
      	 <#list sysCodeList as sysCode>
      	 	<#if (sysCode.type)?string==type>
      	 		<input type="checkbox" value="${sysCode.code}"/>${(sysCode.codeName)!}
      	 	</#if>
      	 </#list>	
      </#if>
</#macro>

<#--
用来控制按钮权限
operates——当前用户所有拥有权限的操作集合
code——按钮的操作编码
-->
<#macro permission permissions code>
	<#list permissions as per>
		<#if per.code ??>
		<#if per.code==code>
			<#nested>
			<#break>
		</#if>
		</#if>
	</#list>
</#macro>