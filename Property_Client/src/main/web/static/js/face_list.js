var pageNum;//当前页数
var total;//总页数
var updateName;//点击编辑模态框时保存歌手名字

//启动加载函数
$(function(){
	
	//to_page(1);
	//to_page(1);
	checkHaveCondiction();

});

//检查是否有外链userId进行条件查询
function checkHaveCondiction(){
	var num = getCookie("select_faceId");
	delCookie("select_faceId");
	if(num != ""){
		checkFaceByUserId(num);
	}else{
		to_page(1);
		to_page(1);;
	}
}

//根据userId查询
function checkFaceByUserId(num){
	$.ajax({
		url:"http://localhost:8080/Property/selectFaceByUserId",
		data:"userId="+num,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			build_face_table(datas);
			build_face_info(datas);
			build_face_nav(datas);
		},
		error:function(){
			alert("查询失败");
		}
	});
}

//跳转至第几页
function to_page(pn){
	$.ajax({
		url:"http://localhost:8080/Property/selectOnePageFace",
		data:"pn="+pn,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			build_face_table(datas);
			build_face_info(datas);
			build_face_nav(datas);
		},
		error:function(){
			
		}
	});
}

//动态创建展示列表
function build_face_table(datas){
	$("#face_table tbody").empty();
	var list = datas.data.pageInfo.list;
	$.each(list,function(index,face){
		var checkbox = $("<td><input type='checkbox' class='check_item'/></td>");
		var faceId = $("<td></td>").append(face.faceId);
		var userId = $("<td></td>").append(face.userId);
		var userName = $("<td></td>").append(face.userName);
		var faceToken = $("<td></td>").append(face.faceToken);
		
		var editBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-secondary edit_btn'><span class='am-icon-pencil-square-o'></span> 编辑</button>");
		var deleteBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delete_btn'><span class='am-icon-trash-o'></span> 删除</button>");
		//为编辑和删除按钮设置id	
		
		editBtn.attr("edit_id",face.faceId);
		deleteBtn.attr("delete_id",face.faceId);
		
		var Btn = $("<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'></div></div></td>").append(editBtn).append(deleteBtn);
		$("<tr></tr>").append(checkbox).append(faceId).append(userId).append(userName).append(faceToken).append(Btn).appendTo("#face_table");
	});
}

//解析展示分页信息
function build_face_info(datas){
	pageNum = datas.data.pageInfo.pageNum;
	pages = datas.data.pageInfo.pages;
	
}

//上下页码
function build_face_nav(datas){
	$("#page_nav").empty();
	
	var ul = $("<ul></ul>").addClass("am-pagination tpl-pagination");
	//首页
	var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
	//上一页
	var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href", "#"));
	ul.append(firstPageLi);
	ul.append(prePageLi);
	//判断首页和上一页是否可用
	if(datas.data.pageInfo.hasPreviousPage == false){
		firstPageLi.addClass("am-disabled");
		prePageLi.addClass("am-disabled");
	}else{
		firstPageLi.click(function(){
			to_page(1);
		});
		prePageLi.click(function(){
			to_page(datas.data.pageInfo.pageNum-1);
		});
	}
	
	//循环输出1、2、3、4、5、6页
	$.each(datas.data.pageInfo.navigatepageNums,function(index,item){
		var numLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));
		ul.append(numLi);
		if(datas.data.pageInfo.pageNum == item){
			numLi.addClass("am-active");
		}
		numLi.click(function(){
			to_page(item);
		});
	});
	
	//尾页
	var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
	//下一页
	var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href", "#"));
	ul.append(nextPageLi);
	ul.append(lastPageLi);
	//判断尾页和下一页是否可用
	if(datas.data.pageInfo.hasNextPage == false){
		lastPageLi.addClass("am-disabled");
		nextPageLi.addClass("am-disabled");
	}else{
		lastPageLi.click(function(){
			to_page(datas.data.pageInfo.pages);
		});
		nextPageLi.click(function(){
			to_page(datas.data.pageInfo.pageNum+1);
		});
	}
	
	ul.appendTo("#page_nav");
	
}

//根据id查询人脸信息并再update_modal模态框赋值
function select_face_by_id(id){
	$.ajax({
		url:"http://localhost:8080/Property/selectFaceByFaceId",
		type:"post",
		data:"id="+id,
		dataType:"jsonp",
		success:function(datas){
			var face = datas.data.face;
			$("#update_user_id").val(face.userId);
			$("#update_user_name").val(face.userName);
			$("#update_face_token").val(face.faceToken);
		},
		error:function(){
			
		}
	});
}

//人脸编辑按钮
$(document).on("click",".edit_btn",function(){
	select_face_by_id($(this).attr("edit_id"));
	$("#face_update_btn").attr("edit_id",$(this).attr("edit_id"));
	$("#update_modal").modal({
		backdrop : "static"
	});
	
});

//编辑提交按钮
$("#face_update_btn").click(function(){
	var id = $(this).attr("edit_id");
	//跳转到上传人脸界面
	setCookie("face_upload_userId",id);
	window.location.href="face_upload.jsp?#";
});

//人脸删除按钮
$(document).on("click",".delete_btn",function(){
	var id = $(this).attr("delete_id");
	var name = $(this).parents("tr").find("td:eq(3)").text();
	if(confirm("确定要删除  [ "+id+" ] 号    "+name+"   吗？")){
		$.ajax({
			url:"http://localhost:8080/Property/deleteFaceById",
			data:"id="+id,
			type:"post",
			dataType:"jsonp",
			success:function(){
				to_page(pageNum);
			},
			error:function(){
				
			}
		});
	}
});

//批量删除
$("#face_delete_all_btn").click(function(){
	var ids = "";
	var names = "";
	
	//循环取出checkbox名字
	$.each($(".check_item:checked"),function(index,item){
		ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
		names += $(this).parents("tr").find("td:eq(3)").text() + ",";
	});
	ids = ids.substring(0,ids.length-1);
	names = names.substring(0,names.length-1);
	
	if(confirm("你确定要删除"+names+"吗？")){
		$.ajax({
			url:"http://localhost:8080/Property/deleteFaceByCheckBox",
			type:"post",
			data:"ids="+ids,
			success:function(){
				to_page(pageNum);
			},
			error:function(){
				//alert("批量删除失败，["+ids+"],["+names+"]");
				to_page(pageNum);
			}
		});
	}

});





//查询按钮
$("#face_select_btn").click(function(){
	var string = $("#face_select").val();
	if(string==""){
		to_page(1);
	}else{
		$.ajax({
			url:"http://localhost:8080/Property/selectFaceBlurry",
			data:"string="+string,
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				build_face_table(datas);
				build_face_info(datas);
				build_face_nav(datas);
			},
			error:function(){
				alert("查询失败");
			}
		});
	}
});




//全选按钮
$("#check_all").click(function(){
    $(".check_item").prop("checked",$(this).prop("checked"));
});

//全选状态的判断
$(document).on("click",".check_item",function(){
	var flag = $(".check_item:checked").length == $(".check_item").length;
	$("#check_all").prop("checked",flag);
});