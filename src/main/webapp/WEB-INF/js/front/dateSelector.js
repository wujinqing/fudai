function DateSelector(selYear, selMonth, selDay){
	this.selYear = selYear;
	this.selMonth = selMonth;
	this.selDay = selDay;
	this.selYear.Group = this; 
	this.selMonth.Group = this;
	
	// 给年份、月份下拉菜单添加处理onchange事件的函数
	if(window.document.all != null){
		this.selYear.attachEvent("onchange", DateSelector.Onchange);
		this.selMonth.attachEvent("onchange", DateSelector.Onchange);
	}else{
		this.selYear.addEventListener("change", DateSelector.Onchange, false);
		this.selMonth.addEventListener("change", DateSelector.Onchange, false);
	}
	if(arguments.length == 4) // 如果传入参数个数为4，最后一个参数必须为Date对象
		this.InitSelector(arguments[3].getFullYear(), arguments[3].getMonth() + 1, arguments[3].getDate());
	else if(arguments.length == 6) // 如果传入参数个数为6，最后三个参数必须为初始的年月日数值
		this.InitSelector(arguments[3], arguments[4], arguments[5]);
	else {
		var dt = new Date();
		this.InitSelector(dt.getFullYear(), dt.getMonth() + 1, dt.getDate());
	}
}

DateSelector.prototype.MinYear = 1900;

DateSelector.prototype.MaxYear = (new Date()).getFullYear();

// 初始化年份
DateSelector.prototype.InitYearSelect = function(){
	for(var i = this.MaxYear; i >= this.MinYear; i--){
		var op = window.document.createElement("OPTION");
		op.value = i;
		op.innerHTML = i;
		this.selYear.appendChild(op);
	}
}
// 初始化月份
DateSelector.prototype.InitMonthSelect = function(){
	for(var i = 1; i < 13; i++){
		var op = window.document.createElement("OPTION");
		op.value = i;
		op.innerHTML = i;
		this.selMonth.appendChild(op);
	}
}
// 根据年份与月份获取当月的天数
DateSelector.DaysInMonth = function(year, month){
	var date = new Date(year, month, 0);
	return date.getDate();
}
// 初始化天数
DateSelector.prototype.InitDaySelect = function(){
	// 使用parseInt函数获取当前的年份和月份
	var year = parseInt(this.selYear.value);
	var month = parseInt(this.selMonth.value);

	// 获取当月的天数
	var daysInMonth = DateSelector.DaysInMonth(year, month);

	this.selDay.options.length = 0;
	for(var i = 1; i <= daysInMonth ; i++){
		var op = window.document.createElement("OPTION");
		op.value = i;
		op.innerHTML = i;
		this.selDay.appendChild(op);
	}
}

// 处理年份和月份onchange事件的方法，它获取事件来源对象（即selYear或selMonth）
// 并调用它的Group对象（即DateSelector实例，请见构造函数）提供的InitDaySelect方法重新初始化天数
// 参数e为event对象
DateSelector.Onchange = function(e){
	var selector = window.document.all != null ? e.srcElement : e.target;
	selector.Group.InitDaySelect();
}
// 根据参数初始化下拉菜单选项
DateSelector.prototype.InitSelector = function(year, month, day){
	this.selYear.options.length = 0;
	this.selMonth.options.length = 0;

	// 初始化年、月
	this.InitYearSelect();
	this.InitMonthSelect();

	// 设置年、月初始值
	this.selYear.selectedIndex = this.MaxYear - year;
	this.selMonth.selectedIndex = month - 1;

	// 初始化天数
	this.InitDaySelect();

	// 设置天数初始值
	this.selDay.selectedIndex = day - 1;
}