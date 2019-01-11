var classId = 1;//默认类型

function checkUserId(){
	console.log(1);
}

function checkUserName(){
	console.log(2);
}






//添加歌曲点击事件
$("#add_music").click(function(){
	var string = $("#song_upload_table").serialize() + "&songTime="+$("#music").attr("songTime") + "&classId="+classId + "&songHits=0";
	$.ajax({
		url:"http://localhost:8080/Property/updateUserInformation",
		data:string,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			alert("添加成功");
			window.location.href="song_list.jsp?#";
		},
		error:function(){
			alert("添加失败,请重新检查歌曲链接！");
		}
	});
});

//类型选择赋值
$("#class_box").change(function(){
	classId = $("#class_box").val();
});

