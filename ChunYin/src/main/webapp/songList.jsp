<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css" type="text/css" />
<script src="static/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/jquery-labelauty.css">
<script src="js/jquery-labelauty.js"></script>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/component.css" />
<style>
	ul { list-style-type: none;}
	li { display: inline-block;}
	li { margin: 10px 0;}
	input.labelauty + label { font: 12px "Microsoft Yahei";}
	
	.head{
	 height: 200px;
	 width:100%;
	}
</style>

</head>
<body>

<div class="modal fade" tabindex="-1" role="dialog" id="songSheet">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">选择添加的歌单</h4>
      </div>
      <div class="modal-body">
      
        <ul class="dowebok">
		</ul>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="save">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" tabindex="-1" role="dialog" id="newSongSheet">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">新建歌单</h4>
      </div>
      <div class="modal-body">
      
      
			<section class="content bgcolor-1">
				<span class="input input--haruki">
					<input class="input__field input__field--haruki" type="text" id="buildSheetName" />
					<label class="input__label input__label--haruki" for="input-1">
						<span class="input__label-content input__label-content--haruki">请输入歌单名</span>
					</label>
				</span>
			</section>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="build">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" tabindex="-1" role="dialog" id="updateName">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改歌单名</h4>
      </div>
      <div class="modal-body">
      
      
			<section class="content bgcolor-1">
				<span class="input input--haruki">
					<input class="input__field input__field--haruki" type="text" id="newSheetName" />
					<label class="input__label input__label--haruki" for="input-1">
						<span class="input__label-content input__label-content--haruki">请输入歌单名</span>
					</label>
				</span>
			</section>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" id="update">确定</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="head">
	<img src="./images/m3.jpg" alt="封面" class="img-rounded" height="200" width="200" id="sheetCover">
	<span style='font-size:30px;font-weight:bold; margin-left:30px' id="sheetName"></span>
  	<span id="creator"></span>
	<span style="float:right; margin:10px"><button type="button" class="btn btn-info" onclick="playAll()">播放全部</button></span>
	<span style="float:right; margin:10px"><button type="button" class="btn btn-danger" onclick="deleteSheet()">删除歌单</button></span>
	<span style="float:right; margin:10px"><button type="button" class="btn btn-warning" onclick="updateSheetName()">修改歌单名</button></span>
</div>

<br>
<table class="table table-striped table-hover" id="song_list">
    <thead style="color:#939aa0;">
    <tr>
    	<th></th>
        <th>操作</th>
        <th>音乐标题</th>
        <th>作曲家</th>
        <th>时长</th>
        <th>评论</th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>
</body>
<script type="text/javascript">
var userId = sessionStorage.getItem('userId');
var songId;
var sheetId;
var sheetSong;
$(function(){
	var url=location.search;
	sheetId = url.substr(1);
	
    $.ajax({
    	url:"http://localhost:8080/ChunYinBackGround/selectSheetBySheetId",
    	data:"sheetId="+sheetId,
    	type:"post",
    	dataType:"jsonp",
    	success:function(data){
//     		alert(data.data.sheetList.songList[0].songId);
			
    		build_song_list(data);
    	    $.ajax({
    	    	url:"http://localhost:8080/ChunYinBackGround/selectUserById",
    	    	data:"id="+data.data.sheetList.sheet.userId,
    	    	type:"post",
    	    	dataType:"jsonp",
    	    	success:function(data){
					document.getElementById("creator").innerHTML = "by"+data.data.user.userName;
    				
    	    	},
    	    	error:function(){}
    	    });
    		
    		document.getElementById("sheetName").innerHTML = data.data.sheetList.sheet.sheetName;
    	},
    	error:function(){}
    });
});




//动态生成歌曲表单
function build_song_list(data){
	//清空
	$("#song_list tbody").empty();
	var list = data.data.sheetList.songList;
	sheetSong = list;
	$.each(list, function(index, song){
		var num = $("<td style='color:#939aa0;' align='center'></td>").append(index+1);
		
		var listen = $("<span style='color:#939aa0;cursor:pointer;'></span>").addClass("glyphicon glyphicon-headphones");
		var space = $("<span>&nbsp;&nbsp;</span>");
		var add = $("<span style='color:#939aa0;cursor:pointer'></span>").addClass("glyphicon glyphicon-plus-sign");
		var drop = $("<span style='color:#939aa0;cursor:pointer'></span>").addClass("glyphicon glyphicon-trash");
		var space2 = $("<span>&nbsp;&nbsp;</span>");
		
		var operate = $("<td></td>").append(listen).append(space).append(add).append(space2).append(drop);
		
		var song_name = $("<td></td>").append(song.songName);
		var compose_name = $("<td></td>").append(song.composerName);
		var song_time = $("<td></td>").append(song.songTime);
		var comment = $("<td></td>").append($("<span style='color:#939aa0;cursor:pointer;'></span>").addClass("glyphicon glyphicon-bullhorn"));
		$("<tr></tr>").append(num).append(operate).append(song_name).append(compose_name).append(song_time).append(comment).appendTo("#song_list tbody");
		
		
		//自定义属性，来存入当前数据的id
		listen.attr("song_id", song.songId);
		add.attr("song_id", song.songId);
		drop.attr("song_id", song.songId);
		comment.attr("song_id", song.songId);
		
		//听点击事件
		listen.click(function(){
			id = $(this).attr("song_id");
			
		    $.ajax({
	    	url:"http://localhost:8080/ChunYinBackGround/selectSongById",
	    	data:"id="+id,
	    	type:"post",
	    	dataType:"jsonp",
	    	success:function(data){
	    		
	    		parent.document.getElementById("playpro").contentWindow.play(data);
	    	},
	    	error:function(){}
		    });

		});
		
		//添加点击事件
		add.click(function(){
			
			id = $(this).attr("song_id");
			songId = id;
			querySheet(userId);
		});
		
		drop.click(function(){
			id = $(this).attr("song_id");
			 $.ajax({
			    	url:"http://localhost:8080/ChunYinBackGround/selectSongById",
			    	data:"id="+id,
			    	type:"post",
			    	dataType:"jsonp",
			    	success:function(data){
			    		var songName = data.data.song.songName;
			    		var flag = confirm("确定从歌单删除   "+songName);
			    		if(flag == true){
			    			deleteSongFromSheet(id,sheetId);
			    		}
						
			    	},
			    	error:function(){}
				    });
			
		});
		//评论
		comment.click(function(){
			id = $(this).attr("song_id");
			sessionStorage.setItem('song_id',id);
			window.location.href="fullComment.jsp";
		});
		
	});
}
//从歌单删除歌曲
function deleteSongFromSheet(id,sheetId){
	$.ajax({
    	url:"http://localhost:8080/ChunYinBackGround/deleteSongFromSheet",
    	data:"songId="+id+"&sheetId="+sheetId,
    	type:"post",
    	dataType:"jsonp",
    	success:function(data){
    		//待测试
    		window.location.reload();
    	},
    	error:function(){
    		
    	}
	});
}


//查询用户歌单
function querySheet(userId){
	$.ajax({
    	url:"http://localhost:8080/ChunYinBackGround/selectSheetsByUserId",
    	data:"userId="+userId,
    	type:"post",
    	dataType:"jsonp",
    	success:function(data){
//     		alert(data.data.SheetList[0].sheet.sheetName);
// 			alert(data.data.SheetList[1].sheet.sheetName);
			var songData = data.data.SheetList;

			
			
			$("#songSheet").modal({
				backdrop:"static"
			});
			
			$.each(songData, function(index, sheet){
				var sheetLi = "<li><input type='radio' name='radio' data-labelauty="+sheet.sheet.sheetName+" id="+ sheet.sheet.sheetId+"></li>&nbsp";
				document.getElementsByClassName("dowebok")[0].innerHTML += sheetLi;
			});
			document.getElementsByClassName("dowebok")[0].innerHTML += "<li><input type='radio' name='radio' data-labelauty='新建歌单' id='-1'></input></li>";
			$(':input').labelauty();
			

    	},
    	error:function(){}
	});
}

$("#save").click(function(){
	var songSheet = document.getElementsByName("radio");
	for(var i=0; i<songSheet.length;i++){
		if(songSheet[i].checked){
			if(songSheet[i].id != -1){
		    $.ajax({
		    	url:"http://localhost:8080/ChunYinBackGround/insertSongToSheet",
		    	data:"songId="+songId+"&sheetId="+songSheet[i].id,
		    	type:"post",
		    	dataType:"jsonp",
		    	success:function(data){
		    		if(data.code == 100)
		    			{
			    			alert("添加成功");
				    		$("#songSheet").modal("hide");
		    			}
		    		else{
		    			alert("添加失败");
		    		}

		    	},
		    	error:function(){}
			    });
			}
			else{
				$("#songSheet").modal("hide");
				
				$("#newSongSheet").modal({
					backdrop:"static"
				});
// 				document.getElementById("buildSheetName").value="";
			}
		}
	}
	
	
});

$("#build").click(function(){
	var sheetName = document.getElementById("buildSheetName").value;
	
	 $.ajax({
	    	url:"http://localhost:8080/ChunYinBackGround/insertNewSheet",
	    	data:"name="+sheetName+"&userId="+userId,
	    	type:"post",
	    	dataType:"jsonp",
	    	success:function(data){
	    		if(data.code == 100)
	    			{
		    			$("#newSongSheet").modal("hide");
		    			
		    			alert(data.data.sheetId);
		    			$.ajax({
		    		    	url:"http://localhost:8080/ChunYinBackGround/insertSongToSheet",
		    		    	data:"songId="+songId+"&sheetId="+songSheet[i].id,
		    		    	type:"post",
		    		    	dataType:"jsonp",
		    		    	success:function(data){
		    		    		parent.document.getElementById("nav").contentWindow.location.reload();
		    		    	},
		    		    	error:function(){}
		    			    });
		    			}else{
	    			alert("添加失败");
	    		}

	    	},
	    	error:function(){}
		    });
	
	
});

function deleteSheet(){
	var flag = confirm("确定该歌单？ ");
	if(flag){
		 $.ajax({
		    	url:"http://localhost:8080/ChunYinBackGround/deleteSheetBysheetId",
		    	data:"sheetId="+sheetId,
		    	type:"post",
		    	dataType:"jsonp",
		    	success:function(data){
		    		window.location.reload();
		    		parent.document.getElementById("nav").contentWindow.location.reload();
		    	},
		    	error:function(){}
		});
	}

}

function playAll(){
	var songs = [];
	$.each(sheetSong, function(index, song){
		
		var song = {
				"name":song.songName,
				"src":song.songUrl,
				"singer":song.composerName,
				"time":song.songTime,
				"img":song.songImageUrl
				};
		songs.push(song);
	});
	
	parent.document.getElementById("playpro").contentWindow.play2(songs);
}

function updateSheetName(){
	$("#updateName").modal({
		backdrop:"static"
	});
}

$("#update").click(function(){
	var sheetName = document.getElementById("newSheetName").value;
	if(sheetName != ""){
		 $.ajax({
		    	url:"http://localhost:8080/ChunYinBackGround/updateSheetNameById",
		    	data:"name="+sheetName+"&id="+sheetId,
		    	type:"post",
		    	dataType:"jsonp",
		    	success:function(data){
		    		alert(data.msg);
		    		parent.document.getElementById("nav").contentWindow.location.reload();
					window.location.reload();

		    	},
		    	error:function(){}
			    });
	}

	
	
});
</script>



</html>