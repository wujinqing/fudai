//定义中文消息
var cnmsg = {  
    required: "必选字段",   
    remote: "请修正该字段",   
    email: "请输入正确格式的电子邮件",   
    url: "请输入合法的网址",  
    date: "请输入合法的日期",   
    dateISO: "请输入合法的日期 (ISO).",  
    number: "请输入合法的数字",   
    digits: "只能输入整数",   
    creditcard: "请输入合法的信用卡号",   
    equalTo: "请再次输入相同的值",   
    accept: "请输入拥有合法后缀名的字符串",   
    maxlength: jQuery.format("请输入一个长度最多是 {0} 的字符串"),   
    minlength: jQuery.format("请输入一个长度最少是 {0} 的字符串"),   
    rangelength: jQuery.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),   
    range: jQuery.format("请输入一个介于 {0} 和 {1} 之间的值"),   
    max: jQuery.format("请输入一个最大为 {0} 的值"),  
    min: jQuery.format("请输入一个最小为 {0} 的值")
};
jQuery.extend(jQuery.validator.messages, cnmsg);

//保留小数点后两位
jQuery.validator.addMethod("decimalTwo", function(value, element) {
	return this.optional(element) || /^[0-9]+(.[0-9]{1,2})?$/.test(value); 
},"只能包括小数点后两位"); 

//保留小数点后三位
jQuery.validator.addMethod("decimalThree", function(value, element) {
	return this.optional(element) || /^[0-9]+(.[0-9]{1,3})?$/.test(value); 
},"只能包括小数点后三位");

//整数或小数
jQuery.validator.addMethod("digitsDecimal", function(value, element) {
	return this.optional(element) || /^[0-9]+([.]{1}[0-9]+){0,1}$/.test(value);
},"只能输入整数或小数");