<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="src/css/smusic.css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	color: #6A6B6F;
	text-align: center;
	padding-top: 17px;
	margin: 0 auto;
	width: 470px;
}

h1 {
	font-size: 36px;
}

h2 {
	font-size: 24px;
}

p {
	font-size: 18px;
}

#skPlayer {
	
}

.doc {
	text-align: left;
}

pre {
	padding-left: 2em;
	font-size: 16px;
	line-height: 24px;
	color: #fff;
	background-color: #272822;
	border-radius: 3px;
}

@media screen and (max-width:768px) {
	body {
		width: 100%;
	}
	.doc {
		display: none;
	}
}
</style>
<script type="text/javascript">

	function skip() {
		player.pause();
		window.parent.document.getElementById("cAndo").click();
	}
	
</script>
</head>
<body>
<button type="button" class="btn btn-default" aria-label="Left Align">
  <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>
</button>
	<button type="button" class="btn btn-danger" id="btn1"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>销毁</button>

	<div class="grid-music-container">
		<div class="m-play-controls">
			<a class="u-play-btn prev" title="上一曲" onclick="player.prev()"></a> 
			<a class="u-play-btn ctrl-play play" title="暂停/播放" onclick="player.toggle()"></a> 
			<a class="u-play-btn next" title="下一曲" onclick="player.next()"></a> 
			<a id="skip" class="icon-action-redo" onclick="skip()" href="full.jsp" target="iframeRight"></a>
		</div>
	</div>
	<div id="skPlayer"></div>
	
	<script src="./dist/skPlayer.min.js"></script>
	
	var data1 = {};
	data1["name"] = '海鳴り';
	data1["author"] = 'riya';
	data1["src"] = 'http://pan.dgut.edu.cn/openapi/stream/preview?access_token=7b37139d-a246-47b6-99d9-13aa40c35949&checkPermission=true&support=wopi&fileId=6b48f5c9-4593-4b2d-abf1-31106da8994e&shareId=d6e8d8d3-7024-4b25-8ca1-4481461a6043%3Abingosoft&password=';
	data1["cover"] = 'http://o9vplcp9o.bkt.clouddn.com/cover.jpg';
	datas.push(data1);


	<script type="text/javascript">
		var datas = [];
		var data = {};
		data["name"] = '醇音';
		data["author"] = '作曲家';
		data["src"] = '';
		data["cover"] = '';
		datas.push(data);

		var player = new skPlayer({
			autoplay : true,
			listshow : true,
			music : {
				type : 'cloud',
				source : 571470953
			}

		});
// 		setTimeout('music()', 100);
// 		function music() {
// 			var myVid = document.getElementsByClassName("skPlayer-source")[0];
// 				myVid.load();
// 				myVid.oncanplay = function(){
// 					alert(myVid.duration);
// 				}
			
// 		}
		$("#btn1").click(function() {
			var ul = $(".skPlayer-source");
			var fa = ul.parent();
			alert(player.music[2].name);
			var li = $(".skPlayer-list").find("li:eq(5)");
			var title = li.find("span.skPlayer-list-name").text();
			alert(title);
			li.remove();
			//ul.empty();
			
			var example = '<li data-index="0" class=""><i class="skPlayer-list-sign"></i><span class="skPlayer-list-index">1</span><span class="skPlayer-list-name" title="成长之重量">成长之重量</span><button class="skPlayer-list-author btn btn-link"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button><span class="skPlayer-list-author" title="李荣浩">李荣浩</span></li>';
			var e1 = example;
			//ul.append(example).append(e1).append(e1);
			/* <li data-index="0" class="skPlayer-curMusic">
            <i class="skPlayer-list-sign"></i>
            <span class="skPlayer-list-index">1</span>
            <span class="skPlayer-list-name" title="成长之重量">成长之重量</span>
            <button class="skPlayer-list-author btn btn-link"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>
            <span class="skPlayer-list-author" title="李荣浩">李荣浩
      </span></li> */
		});

	</script>

</body>

</html>