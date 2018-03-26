$(document).ready(function(){
	$('#upload_photo').click(function(){
		$('#photo_upload_div').show();
		$('#photo_list').hide();
		$('#photo_list_page').hide();
		$('#photo_upload_status_div').hide();
	});
	
	$('#quick_upload_photo').click(function(){
		$('#photo_upload_div').show();
		$('#photo_list').hide();
		$('#photo_list_page').hide();
	});
	
	$('#sub_photo').click(function(){
		$('#photo_upload_form').submit();
	});
	
	$('#photo_upload_form').submit(function(){
		var photo=$('#fileField').val();
		if(!photo){
			alert('请选择要上传的图片!');
			return false;
		}
		
		var title=$.trim($('#photo_title').val());
		var intro=$.trim($('#photo_intro').val());
		
		//检查后缀....
		
		if(title&&title.length>=50){
			alert('名称长度超出! ');
			return false;
		}

		if(intro&&intro.length>=100){
			alert('描述过长! ');
			return false;
		}
		
	});
	
	$('#back_photo_list').click(function(){
		$('#photo_list').show();
		$('#photo_list_page').show();
		$('#photo_upload_status_div').hide();
	});
	
	$('#goon_upload').click(function(){
		$('#photo_upload_div').show();
		$('#photo_upload_status_div').hide();
	});
	
	if(goupload()){
		$('#upload_photo').click();
	}
	
	$('.del_photo').click(function(){
		if(confirm('确定要删除该照片,删除后将不可恢复,继续?')){
			var pa=$(this).parent().parent()
			var photoId=pa.attr('id').split('_')[1];
			if(photoId){
				PhotoAjaxService.delPhoto(photoId,function(data){
					if(data){
	
					}
					window.location.reload();
				});
			}
		}
	});
	
	$('.edit_photo').click(function(){
		var pa=$(this).parent().parent()
		var photoId=pa.attr('id').split('_')[1];
		var action=$(this).attr('editurl');
		var form='<form action="'+action+'" method="post" id="edit_photo_info_form"><input type="hidden" name="editPhoto" value="'+photoId+'"></form>'
		$('body').append(form);
		$('#edit_photo_info_form').submit();
	});
	
//	$('#fileField').change(function(){
//		var extStart=fileName.lastIndexOf("."); 
//		var ext=fileName.substring(extStart,fileName.length).toUpperCase(); 
//		if(ext!=".BMP"&&ext!=".PNG"&&ext!=".JPG"&&ext!=".JPEG"&&ext!="GIF"){
//			alert('请上传正确的图片!');
//			
//			$(this).val('');
//			if($.browser.msie){
//				var afile = $(this);
//				afile.replaceWith(afile.clone());
//			}
//			
//			return false;
//		} 
//		
//		;
//	});
	
	$('#fileField').PreviewImage({ImageClientId:"view_image",
        MaxHeight: "150" ,
        MaxWidth: "190"
	},function(){
		$('#textfield').val($('#fileField').val())
	});
});

