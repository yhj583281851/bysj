var all_userId;		//外链进来的需要录入车辆信息的业主号


$(function(){
	
	checkInsertUserId();
	delCookie("insert_userId");
});


//检查获取cookie中insert_userId的值
function checkInsertUserId(){
	all_userId = getCookie("insert_userId");
	if(typeof(all_userId) != "undefined"){
		//有userId外传进来，直接为userId和userName赋值
		document.getElementById("userId").value = all_userId;
		checkUserId(all_userId);
	}else{
		all_userId = -1;
	}
}

//输入车主号时判断车主是否存在，如果存在则为车主名称赋值；
function checkUserId(all_userId){
	if(all_userId == -1){
		userId = document.getElementById("userId").value;
	}else{
		userId = all_userId;
	}
	
	$.ajax({
		url:"http://localhost:8080/Property/verifyUserById",
		data:"userId="+userId,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			if(typeof(datas.data.userName) != "undefined")
				{
				document.getElementById("userName").value = datas.data.userName;
				}else{
					document.getElementById("userName").value = "";
				}
				
		},
		error:function(){
			
		}
	});
}

//输入车主姓名时判断车主是否存在，若存在则为车主号赋值；
function checkUserName(){
	var userName = document.getElementById("userName").value;
	$.ajax({
		url:"http://localhost:8080/Property/verifyUserByName",
		data:"userName="+userName,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			if(typeof(datas.data.userId) != "undefined")
				{
				document.getElementById("userId").value = datas.data.userId;
				}else{
					document.getElementById("userId").value = "";
				}
				
		},
		error:function(){
			
		}
	});
}

//提交按钮
$("#add_car").click(function(){
	var userId = document.getElementById("userId").value;
	var userName = document.getElementById("userName").value;
	var carBrand = document.getElementById("carBrand").value;
	var carColor = document.getElementById("carColor").value;
	var carNumber = document.getElementById("carNumber").value;
	var string = "userId="+userId+"&carBrand="+carBrand+"&carColor="+carColor+"&carNumber="+carNumber;	
	if(userName == "" || userId == ""){
		alert("请输入正确的用户号和用户姓名");
		return false;
	}
	$.ajax({
		url:"http://localhost:8080/Property/uploadCarInformation",
		data:string,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			if(datas.code == 100){
				alert("上传成功");
			}else if(datas.code==200){
				alert("上传失败");
			}

		},
		error:function(){
			alert("提交失败！["+string+"]");
		}
	});
	
	delCookie("insert_userId")

});

