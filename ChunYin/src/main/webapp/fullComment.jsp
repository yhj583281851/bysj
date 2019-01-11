<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link  rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/sinaFaceAndEffec.css" />

<link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="http://code.changer.hk/jquery/plugins/jquery.cookie.js"></script>
<style type="text/css">
body::-webkit-scrollbar {width:5px; height:10px; background-color:transparent;} /*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
body::-webkit-scrollbar-track {background-color:white; border-radius:0px; } /*定义滚动条轨道 内阴影+圆角*/
body::-webkit-scrollbar-thumb {background-color:#ccc; border-radius:0px; } /*定义滑块 内阴影+圆角*/
</style>
</head>
<body>
<div id="content" style="width: 700px; height: auto;  margin: 0 auto;margin-top:40px">
	<div class="wrap">
		<div class="comment">
			<div class="head-face">
				<img src="images/emptyHead.jpg" />
				<p id="userName"></p>
			</div>
			<div class="content">
				<div class="cont-box">
					<textarea id="textContent" class="text" placeholder="请输入..."></textarea>
				</div>
				<div class="tools-box">
					<div class="submit-btn"><input type="button" onClick="out()"value="提交评论" /></div>
				</div>
			</div>
		</div>
		<div id="info-show">
			<ul></ul>
		</div>
		<div class="row">
			<div class="col-md-6" id="page_info"></div>
			<div class="col-md-6 " id="comments_nav"></div>
		</div>
	</div>
</div>

<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/sinaFaceAndEffec.js"></script>
<script type="text/javascript">

var songId = sessionStorage.getItem('song_id');;
var id = sessionStorage.getItem('userId');
var total;
var pageNum;
var pages;

$(function() {
	initUser();
	to_page(1);
});

//使用用户id通过ajax跨域请求用户昵称
function initUser(){
	
	$.ajax({
		url:"http://localhost:8080/ChunYinBackGround/selectUserById",
		data:"id="+id,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			var user = datas.data.user;
			$("#userName").text(user.userName);
		},
		error:function(){
			
		}
	});
}

function getUserName(id){
	var userName="";
	$.ajax({
		url:"http://localhost:8080/ChunYinBackGround/selectUserById",
		data:"id="+id,
		async: false,
		type:"post",
		dataType:"jsonp",
		success:function(datas){
			var user = datas.data.user;
			userName = user.userName;
		},
		error:function(){
		}
	});
	return userName;
}

function to_page(pn) {
	$.ajax({
		url : "http://localhost:8080/ChunYinBackGround/selectSongCommentsBySongId",
		data : "pn=" + pn + "&songId="+songId,
		type : "post",
		success : function(datas) {
			//解析并显示评论信息
			build_comments_table(datas);
			//解析并显示分页数据
			build_pageInfo(datas);
			//解析并显示导航条
			build_comments_nav(datas);
		},
		error : function() {

		}
	});
}

//jquery动态生成评论信息列表
function build_comments_table(datas) {
	$("#info-show ul").empty();

	var list = datas.data.pageInfo.list;
	$.each(list, function(index, comments) {
		var userName = getUserName(comments.userId);
		var content = textareaTo(comments.commentContent);
		var contentLen = content.length;

		var li = $("<li></li>");
		var headDiv = $("<div></div>").addClass("head-face");
		var img = $("<img/>").attr("src","images/emptyHead.jpg");
		var replyDiv = $("<div></div>").addClass("reply-cont");
		var name = $("<p></p>").addClass("username").append(userName);
		var commentFooter = $("<p></p>").addClass("comment-footer").append(comments.commentTime);
		
		if(contentLen>200){
			var firstPart = subString(content,0,200);
			var secondPart = subString(content,200,contentLen);
			
			var showHide = $("<button></button>").addClass("btn btn-link showHideCode").attr("href","#").attr("commentId",comments.commentId).append("更多");
			var commentDiv = $("<div></div>").append(firstPart).append($("<span></span>").attr("isClose","1").attr("style","display:none;").append(secondPart));
			commentDiv.append(showHide);
		}else{
			var commentDiv = $("<div></div>").append(content);
		}
		commentDiv.addClass("comment-body").attr("style","word-break: break-all;");

		li.append(headDiv.append(img)).append(replyDiv.append(name).append(commentDiv).append(commentFooter)).appendTo("#info-show ul");
	        
	});
}

//当评论内容超过200字符时隐藏或显示更多的
$(document).on("click", ".showHideCode", function() {
	var id = $(this).attr("commentId");
	var secondPart = $(this).parent().find("span:eq(0)");
	var flag = secondPart.attr("isClose");
	if(flag==1){
		$(this).text("隐藏");
		secondPart.attr("isClose","0");
	}else{
		$(this).text("更多");
		secondPart.attr("isClose","1");
	}
	secondPart.toggle(1000);
});

//分页信息
function build_pageInfo(datas) {
	$("#page_info").empty();

	$("#page_info").append(
			"当前第" + datas.data.pageInfo.pageNum + "页,一共"
					+ datas.data.pageInfo.pages + "页,一共有"
					+ datas.data.pageInfo.total + "条评论");

	total = datas.data.pageInfo.total;
	pageNum = datas.data.pageInfo.pageNum;
	pages = datas.data.pageInfo.pages;
}

//动态生成导航条
function build_comments_nav(datas) {
	$("#comments_nav").empty();

	//nav
	var nav = $("<nav></nav>").attr("aria-label", "Page navigation");
	//ul
	var ul = $("<ul></ul>").addClass("pagination");

	//首页
	var firstPageLi = $("<li></li>").append(
			$("<a></a>").append("首页").attr("href", "#"));
	//上一页
	var prePageLi = $("<li></li>").append(
			$("<a></a>").append("&laquo;").attr("href", "#"));

	//禁用首页，上一页
	if (datas.data.pageInfo.hasPreviousPage == false) {
		firstPageLi.addClass("disabled");
		prePageLi.addClass("disabled");
	} else {
		//设置首页，上一页点击事件
		firstPageLi.click(function() {
			to_page(1);
		});
		prePageLi.click(function() {
			to_page(datas.data.pageInfo.pageNum - 1);
		});
	}
	ul.append(firstPageLi).append(prePageLi);
	//-----------------------------------

	//数字页
	$.each(datas.data.pageInfo.navigatepageNums, function(index, item) {
		var numLi = $("<li></li>").append(
				$("<a></a>").append(item).attr("href", "#"));
		if (datas.data.pageInfo.pageNum == item) {
			numLi.addClass("active");
		}

		numLi.click(function() {
			to_page(item);
		});
		ul.append(numLi);
	});

	//-----------------------------------
	//下一页
	var nextPageLi = $("<li></li>").append(
			$("<a></a>").append("&raquo;").attr("href", "#"));
	//末页
	var lastPageLi = $("<li></li>").append(
			$("<a></a>").append("末页").attr("href", "#"));
	//禁用下一页,末页
	if (datas.data.pageInfo.hasNextPage == false) {
		nextPageLi.addClass("disabled");
		lastPageLi.addClass("disabled");
	} else {
		nextPageLi.click(function() {
			to_page(datas.data.pageInfo.pageNum + 1);
		});
		lastPageLi.click(function() {
			to_page(datas.data.pageInfo.pages);
		});
	}
	//添加元素
	ul.append(nextPageLi).append(lastPageLi);
	nav.append(ul).appendTo("#comments_nav");
}



	// 评论提交按钮
	function out() {
		var commentContent = toTextarea($('.text').val());
		var userId = id;
		var commentTime = getnowtime();
		
		var dataString = "commentContent="+commentContent+"&userId="+userId+"&commentTime="+commentTime+"&songId="+songId;
		$.ajax({
			url : "http://localhost:8080/ChunYinBackGround/insertSongComments",
			type : "post",
			data : dataString,
			dataType : "jsonp",
			success : function(datas) {
				$("#keleyi_com").val('');
				to_page(1);
			},
			error : function() {

			}
		});


	}

	function getnowtime() {
		var nowtime = new Date();
        var year = nowtime.getFullYear();
        var month = padleft0(nowtime.getMonth() + 1);
        var day = padleft0(nowtime.getDate());
        var hour = padleft0(nowtime.getHours());
        var minute = padleft0(nowtime.getMinutes());
        return year + "-" + month + "-" + day + " " + hour + ":" + minute;
	}
	function padleft0(obj) {
        return obj.toString().replace(/^[0-9]{1}$/, "0" + obj);
    }
	
	//保持格式存进和取出数据库中的评论内容
	/**
	* @funciton  数据库 ---  编辑页面  .val(str)
	*/
	function textareaTo(str){
	    var reg=new RegExp("\n","g");
	    var regSpace=new RegExp(" ","g");
	    
	    str = str.replace(reg,"<br>");
	    str = str.replace(regSpace,"&nbsp;");
	    
	    return str;
	}
	
	/**
	* @funciton 转换textarea存入数据库的回车换行和空格  textarea ---  数据库,用val取数据，置换'\n'
	*/
	function toTextarea(str){
	    var reg=new RegExp("<br>","g");
	    var regSpace=new RegExp("&nbsp;","g");
	    
	    str = str.replace(reg,"\n");
	    str = str.replace(regSpace," ");
	    
	    return str;
	}
	
	//截取字符串 包含中文处理 
	//(串,开始,长度...) 
	function subString(str, start, len) 
	{ 
	    var newLength = 0; 
	    var newStr = ""; 
	    var chineseRegex = /[^\x00-\xff]/g; 
	    var singleChar = ""; 
	    var strLength = str.replace(chineseRegex,"**").length; 
	    for(var i = start;i < strLength;i++) 
	    { 
	        singleChar = str.charAt(i).toString(); 
	        if(singleChar.match(chineseRegex) != null) 
	        { 
	            newLength += 2; 
	        }     
	        else 
	        { 
	            newLength++; 
	        } 
	        if(newLength > len) 
	        { 
	            break; 
	        } 
	        newStr += singleChar; 
	    } 
	    return newStr; 
	} 
</script>
<script type="text/javascript">

</script>
</body>
</html>