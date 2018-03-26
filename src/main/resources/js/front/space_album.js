$(document).ready(function(){
	
	//进入添加相册
	$('#create_album').click(function(){
		$('#album_list').hide();
		$('#create_album_form').show();
	});
	
	
	//返回相册列表
	$('#back_album_list').click(function(){
		$('#album_list').show();
		$('#create_album_form').hide();
		resetAlbumForm();
	});
	
	//提交相册信息
	$('#sub_album_form').click(function(){
		var name=$.trim($('#album_name').val());
		
		var intro=$.trim($('#album_intro').val());
		
		if(name==''){
			alert('名称未填写!');
			return false;
		}
		
		if(name.length>=50){
			alert('名称长度超出! ');
			return false;
		}

		if(intro&&intro.length>=100){
			alert('描述过长! ');
			return false;
		}

		var albumId=$.trim($('#album_id').val());
		
		if(albumId){//修改
			editAlbum({id:albumId,title:name,intro:intro});
		}else{//新增
			addAlbum({title:name,intro:intro});
		}
		
	});
	
	//删除相册
	$('.del_album').click(function(){
		if(confirm('确定要删除该相册,删除后将不可恢复,继续?')){
		
			var pa=$(this).parent().parent()
			var albumId=pa.attr('id').split('_')[1];
			if(albumId){
				AlbumAjaxService.delAlbum(albumId,function(data){
					if(data){
						pa.remove();
					}else{
						alert('服务繁忙,请稍后再试!');
					}
				});
			}
		
		}
		
	});
	
	//修改相册
	$('.edit_album').click(function(){
		$('#album_list').hide();
		$('#create_album_form').show();
		var pa=$(this).parent().parent()
		var albumId=pa.attr('id').split('_')[1];
		$('#album_id').val(albumId);
		
		$('#album_name').val($('#album_name_'+albumId).text())
		
		$('#album_intro').val($('#album_img_'+albumId).attr('title'))
		
	});
	
});

/**
 * 新增相册
 * @param album
 * @return
 */
function addAlbum(album){
	AlbumAjaxService.addAlbum(album,function(data){
		if(data){
			if(confirm('相册'+name+'创建成功,是否马上上传\n照片到这个相册?')){
				//进入 上传页面
				gotoAlbum(data,'1');
			}else{
				//进入相册
				gotoAlbum(data,'0');
			}
		}
	});
}

/**
 * 修改相册信息
 * @param album
 * @return
 */
function editAlbum(album){
	AlbumAjaxService.editAlbum(album,function(data){
		if(data){
			window.location.reload();
		}else{
			alert('服务繁忙,请稍后再试!');
			resetAlbumForm();
			$('#album_list').show();
			$('#create_album_form').hide();
		}
	});
}

function resetAlbumForm(){
	$('#album_id').val('');
	
	$('#album_name').val('')
	
	$('#album_intro').val('')
}