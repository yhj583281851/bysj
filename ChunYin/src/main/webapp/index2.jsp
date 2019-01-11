<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>醇音</title>

  <link rel="stylesheet" href="css/app.css" type="text/css" />  
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/mplayer.css">

	<style type="text/css">
	.info {
		font-family: "Microsoft Yahei";
		text-align: center;
	}
	.info h1 {
		font-weight: 400;
	}
	</style>
  <script src="js/jquery-1.11.3.min.js"></script>
  <script src="js/jquery.sliderBar.js"></script>
  <script type="text/javascript">
	$(function(){
// 		var url=location.search;	
// 		var id = url.substr(1);
// 		sessionStorage.setItem('userId',id);
		$('.sliderbar-container').sliderBar({
			open : false,           // 默认是否打开，true打开，false关闭
	        top : 0,             // 距离顶部多高
	        width : 560,           // body内容宽度
	        height : 520,          // body内容高度
	        theme : '#4cb6cb',       // 主题颜色
	        position : 'left'      // 显示位置，有left和right两种
		});
		

	});
	
  </script>
  
  <style type="text/css">
	* {  
        margin: 0px;  
        padding: 0px; 
    }  
    html,body,.mainbox{
        position: relative;
        width: 100%;
        height: 100%;
    }
	
  	#head{
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 60px;
        z-index: 10;
        width:100%;
  	}
	#nav{
		position: absolute;
        top: 60px;
        left: 0;
        height: 80%;
        width: 200px;
        z-index: 1;
	}  
	#content{
		position: absolute;
        top: 60px;
        padding-left: 200px;
        width: 100%;
        box-sizing:border-box;
        overflow: hidden;
		height: 100%;
	}
	#playpro{
        height: 100%;
        width: 100%;
        position: absolute;
        bottom: 0;
        z-index: 5;
	}
  </style>
  
</head>
<body>
<div class="mainbox">
	<iframe id="head" name="iframeTop" frameborder="0" src="header.jsp" scrolling="no"></iframe>
	<iframe id="nav" name="iframeLeft" frameborder="0" src="nav.jsp" scrolling="no"></iframe>
	<iframe id="content" name="iframeRight" frameborder="0" src="content.jsp"></iframe>
	<div class="sliderbar-container">
		<div id="cAndo" class="title">
		<i></i>
		</div>
		<div class="body">
			<iframe id="playpro" name="iframeBot" frameborder="0" src="player.jsp" scrolling="no"></iframe>
		</div>
	</div>

</div>
</body>


<script type="text/javascript">
	var viewH = document.documentElement.clientHeight;
	console.log(viewH)
	var right = document.getElementById("content");
	right.style.height = (viewH-95)+"px";
</script>

</html>