<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/vpplayer.css">
<link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">
<style>
#player2{
	width: 100%;
}
</style>
</head>
<body>
    <!--vpplayer音乐播放器-->
    <div id="player2"></div>
	
    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
	 
	<script src="static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/vpplayer.js"></script>
	<script>
		$(document).ready(function(){

			$("#player2").vpplayer({
				src: "http://music.163.com/song/media/outer/url?id=281951.mp3",
				trackName: "告白气球",
				view:'basic'			
			});
		});
	</script>

</body>
</html>