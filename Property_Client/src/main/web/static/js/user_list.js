var pageNum;//当前页数
var pages;//总页数
var type;


//启动加载函数
$(function(){
	
	type=0;
	to_page(1,type);

});

//跳转至第几页
function to_page(pn,type){
	//0代表查询所有，1代表按分类查询
	if(type==0){
		$.ajax({
			url:"http://169.254.151.231:8080/Property/selectOnePageUser",
			data:"pn="+pn,
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				build_user_table(datas);
				build_user_info(datas);
				build_user_nav(datas);
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert("to_page函数出错");
				alert(XMLHttpRequest.status);//200
	            alert(XMLHttpRequest.readyState);//4
	            alert(textStatus);//parsererror
			}
		});
	}else{
		$.ajax({
			url:"http://localhost:8080/Property/selectUserByClass",
			data:"id="+type,
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				build_user_table(datas);
				build_user_info(datas);
				build_user_nav_class(datas);
			},
			error:function(){
				
			}
		});
	}
	
	
}

//动态创建展示列表
function build_user_table(datas){
	$("#user_table tbody").empty();
	
	var list = datas.data.pageInfo.list;
	
	$.each(list,function(index,user){
		var checkbox = $("<td><input type='checkbox' class='check_item'/></td>");
		var userId = $("<td></td>").append(user.userId);
		var userName = $("<td></td>").append(user.userName);
		var userAccount = $("<td></td>").append(user.userAccount);
		var userPassword = $("<td></td>").append(user.userPassword);
		var userSex = $("<td></td>").append(user.userSex);
		var userAge = $("<td></td>").append(user.userAge);
		var userAddress = $("<td></td>").append(user.userAddress);
		var userPhone = $("<td></td>").append(user.userPhone);
		var userType = $("<td></td>").append(user.userType);
		//var editBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-secondary' data-toggle='modal' data-target='#update_modal'><span class='am-icon-pencil-square-o'></span> 编辑</button>");
		
		var faceBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-secondary face_btn'><span class='am-icon-frown-o'></span> 人脸</button>");
		var carBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only car_btn'><span class='am-icon-car'></span> 车辆</button>");
		var editBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-secondary edit_btn'><span class='am-icon-pencil-square-o'></span> 编辑</button>");
		var deleteBtn = $("<button class='am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only delete_btn'><span class='am-icon-trash-o'></span> 删除</button>");

		//为编辑和删除按钮设置id
		faceBtn.attr("face_id",user.userId);
		carBtn.attr("car_id",user.userId);
		editBtn.attr("edit_id",user.userId);
		deleteBtn.attr("delete_id",user.userId);
		
		var Btn_1 = $("<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'></div></div></td>").append(faceBtn).append(carBtn);
		var Btn_2 = $("<td><div class='am-btn-toolbar'><div class='am-btn-group am-btn-group-xs'></div></div></td>").append(editBtn).append(deleteBtn);
		$("<tr></tr>").append(checkbox).append(userId).append(userAccount).append(userPassword).append(userName).append(userSex).append(userAge).append(userAddress).append(userPhone).append(userType).append(Btn_1).append(Btn_2).appendTo("#user_table");
	});
}

//解析展示分页信息
function build_user_info(datas){
	pageNum = datas.data.pageInfo.pageNum;
	pages = datas.data.pageInfo.pages;
	
}

//上下页码
function build_user_nav(datas){
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
			to_page(1,type);
		});
		prePageLi.click(function(){
			to_page(datas.data.pageInfo.pageNum-1,type);
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
			to_page(item,type);
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
			to_page(datas.data.pageInfo.pages,type);
		});
		nextPageLi.click(function(){
			to_page(datas.data.pageInfo.pageNum+1,type);
		});
	}
	
	ul.appendTo("#page_nav");
	
}

//根据id查询用户信息并再update_modal模态框赋值
function select_user_by_id(id){
	$.ajax({
		url:"http://localhost:8080/Property/selectUserById",
		type:"post",
		data:"id="+id,
		dataType:"jsonp",
		success:function(datas){
			var user = datas.data.user;
			$("#update_user_account").val(user.userAccount);
			$("#update_user_password").val(user.userPassword);
			$("#update_user_name").val(user.userName);
			$("#update_user_sex").val(user.userSex);
			$("#update_user_age").val(user.userAge);
			$("#update_user_address").val(user.userAddress);
			$("#update_user_phone").val(user.userPhone);
			$("#update_user_type").val(user.userType);
		},
		error:function(){
			
		}
	});
}

//用户编辑按钮
$(document).on("click",".edit_btn",function(){
	select_user_by_id($(this).attr("edit_id"));
	$("#user_update_btn").attr("edit_id",$(this).attr("edit_id"));
	$("#update_modal").modal({
		backdrop : "static"
	});
	
});

//用户人脸按钮
$(document).on("click",".face_btn",function(){
	var id = $(this).attr("face_id");
	alert(id);
	
});

//用户车辆按钮
$(document).on("click",".car_btn",function(){
	var id = $(this).attr("car_id");
	alert(id);
	
});

//编辑提交按钮
$("#user_update_btn").click(function(){
	var id = $(this).attr("edit_id");
	var serialize = $("#update_modal form").serialize()
	//解决序列化中文乱码问题
	serialize = decodeURIComponent(serialize,true);
	var string = "userId="+id+"&"+serialize;
	$.ajax({
		url:"http://localhost:8080/Property/updateUserInformation",
		data:string,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			if(datas.code == 100){
				$("#update_modal").modal("hide");
				to_page(pageNum,type);
			}else if(datas.code==200){
				if(undefined!=datas.data.msg.userAccount){
					alert(datas.data.msg.userAccount);
				}
				if(undefined!=datas.data.msg.userPassword){
					alert(datas.data.msg.userPassword);
				}
				if(undefined!=datas.data.msg.userEmail){
					alert(datas.data.msg.userEmail);
				}
			}

		},
		error:function(){
			alert("提交失败！["+string+"]");
		}
	});
});

//用户删除按钮
$(document).on("click",".delete_btn",function(){
	var id = $(this).attr("delete_id");
	var name = $(this).parents("tr").find("td:eq(4)").text();
	if(confirm("确定要删除("+id+")"+name+"吗？")){
		$.ajax({
			url:"http://localhost:8080/Property/deleteUserById",
			data:"id="+id,
			type:"post",
			dataType:"jsonp",
			success:function(){
				to_page(pageNum,type);
			},
			error:function(){
				
			}
		});
	}
});

//批量删除
$("#user_delete_all_btn").click(function(){
	var ids = "";
	var names = "";
	
	//循环取出checkbox名字
	$.each($(".check_item:checked"),function(index,item){
		ids += $(this).parents("tr").find("td:eq(1)").text() + "-";
		names += $(this).parents("tr").find("td:eq(4)").text() + ",";
	});
	ids = ids.substring(0,ids.length-1);
	names = names.substring(0,names.length-1);
	
	if(confirm("你确定要删除"+names+"吗？")){
		$.ajax({
			url:"http://localhost:8080/Property/deleteUserByCheckBox",
			type:"post",
			data:"ids="+ids,
			success:function(){
				to_page(pageNum,type);
			},
			error:function(){
				
			}
		});
	}

});

//外部增加按钮
$("#user_insert_btn").click(function(){
	var account = $("#insert_user_account").val();
	var flag = checkUserAccount(account);
	if(flag == 0){
		//已经存在
		alert("该用户名 "+account+" 已经存在！");
	}
	else{
		$.ajax({
			url:"http://localhost:8080/Property/insertUser",
			type:"post",
			data:$("#insert_modal form").serialize(),
			dataType:"jsonp",
			success:function(datas){
				if(datas.code==100){
					$("#insert_modal").modal("hide");
					//页面跳转存在问题
					if(pages % 5 == 0){
						to_page(pages + 1,type);
					}else{
						to_page(pages,type);
					}
				}else if(datas.code==200){
					if(undefined!=datas.data.msg.userAccount){
						alert(datas.data.msg.userAccount);
					}
					if(undefined!=datas.data.msg.userPassword){
						alert(datas.data.msg.userPassword);
					}
					if(undefined!=datas.data.msg.userEmail){
						alert(datas.data.msg.userEmail);
					}
				}
					
			},
			error:function(){
				alert("用户添加失败");
			}
		});
	}
	
	
});

//添加账号，检查账号是否重复
function checkUserAccount(account){
	var flag = 1;
	$.ajax({
		url:"http://localhost:8080/Property/checkUserAccount",
		type:"post",
		data:"account="+account,
		dataType:"jsonp",
		async: false,
		success:function(datas){
				if(datas.code == 100){
					//可以使用，返回1
					flag = 1;
				}
				else if(datas.code == 200){
					flag = 0;
				}
		},
		error:function(){
			alert("检验用户名出错");
		}
	});
	return flag;
};

//查询按钮
$("#user_select_btn").click(function(){
	var string = $("#user_select").val();
	
	$.ajax({
		url:"http://localhost:8080/Property/selectUserByAccountLike",
		data:"account="+string,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			build_user_table(datas);
			build_user_info(datas);
			build_user_nav(datas);
		},
		error:function(){
			alert("查询失败");
		}
	});
	
});

//类型选择
function classchange(){
	var classId = $("#select_box").val();
	type=classId;
	to_page(1,type);
}






//全选按钮
$("#check_all").click(function(){
    $(".check_item").prop("checked",$(this).prop("checked"));
});

//全选状态的判断
$(document).on("click",".check_item",function(){
	var flag = $(".check_item:checked").length == $(".check_item").length;
	$("#check_all").prop("checked",flag);
});