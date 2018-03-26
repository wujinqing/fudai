// preview image
(function($) {
	$.fn.PreviewImage = function(options, fn) {
		var Default = {
			ImageClientId : "",
			MaxHeight : 150,
			MaxWidth : 190
		};
		$.extend(true, Default, options);
		return this.each(function() {

			if (Default.ImageClientId != "") {

				$(this).unbind("change");
				$(this).change(function() {

					$("#" + Default.ImageClientId).parent("div").hide();
					if ($(this).val() == "") {
						return;
					} else {
						//$("#" + Default.ImageClientId).parent("div").hide();
						$('#loader').show();
						var t_Id = $(this).attr("id");
						var fileName = $("#" + t_Id).val();
						if (fileName != '') {
							var extStart = fileName.lastIndexOf(".");
							var ext = fileName.substring(extStart,
									fileName.length).toUpperCase();
							if (ext != ".BMP" && ext != ".PNG" && ext != ".JPG"
									&& ext != ".JPEG" && ext != ".GIF") {
								$("#" + t_Id).val('');
								if ($.browser.msie) {
									var afile = $("#" + t_Id);
									afile.replaceWith(afile.clone());
								}
								$("#" + Default.ImageClientId).parent("div")
										.hide();
								// alert("图片限于bmp,png,jpeg,jpg格式");
								$('#loader').hide();
								alert('请上传正确的图片!');
								return false;
							}
						}
					}
					if ($.browser.msie) {
						$("#" + Default.ImageClientId).attr("src",
								$(this).val());
					} else {

						if ($.browser.mozilla && $.browser.version >= '7.0.0') {
							var objectURL = window.URL
									.createObjectURL($(this)[0].files[0]);
							$("#" + Default.ImageClientId).attr("src",
									objectURL);
						} else {

							var file = $(this)[0].files[0];

							var fr = new FileReader();
							fr.onloadend = function(data) {

								// console.log(this.readyState); // 这个时候 应该是 2
								// console.log(this.result);
								// //读取完成回调函数，数据保存在result中

								$("#" + Default.ImageClientId).attr("src",
										this.result);
							};
							fr.readAsDataURL(file); // 读取Base64

							// fr.readAsBinaryString(file);// 开始读取2进制数据 异步
							// 参数为file 对象
							// fr.readAsText(file);//读取文本信息

							// objectURL=$(this)[0].files[0].getAsDataURL();
						}

					}
					if ($.browser.msie && $.browser.version > 6) {
						$("#" + Default.ImageClientId).hide();
						$("#" + Default.ImageClientId).parent("div").css({
							'z-index' : '99999',
							'filter' : 'progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=bEnabled,sizingMethod=scale)',
							'max-width' : Default.MaxWidth + 'px',
							'max-height' : Default.MaxHeight + 'px',
							'height' : Default.MaxHeight + 'px',
							'width' : Default.MaxWidth + 'px'
						});
						var div = $("#" + Default.ImageClientId).parent("div")[0];
						var imgSrc = $("#" + Default.ImageClientId).attr("src");
						div.filters
								.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
					}
				});
				$("#" + Default.ImageClientId).load(function() {
							if ($(this).attr("src") != '') {
								var image = new Image();
								image.src = $(this).attr("src");
								$(this).attr("width", Default.MaxWidth);
								$(this).attr("height", Default.MaxHeight);
								// $(this).attr("alt", Default.MaxWidth + "x" +
								// Default.MaxHeight);

								$('#loader').hide();
								$("#" + Default.ImageClientId).parent("div")
										.show();

							}
							fn();
						});
			}

		});
	};


})(jQuery);
