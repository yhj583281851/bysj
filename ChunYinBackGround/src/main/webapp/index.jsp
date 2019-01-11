<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test</title>
</head>
<body>
	<form id="form1">
		歌名：<input type="text" name="songName"><br> 作曲人：<input
			type="text" name="composerName"><br> 类别：<select
			id="class" name="className">
			<option value="1">安静</option>
			<option value="2">浪漫</option>
			<option value="3">伤感</option>
			<option value="4">治愈</option>
			<option value="5">放松</option>
			<option value="6">孤独</option>
			<option value="7">感动</option>
			<option value="8">兴奋</option>
			<option value="9">快乐</option>
			<option value="10">思念</option>
			<option value="11">清新</option>
		</select><br> 歌曲链接：<input type="text" name="songUrl"><br>
		封面链接：<input type="text" name="songImageUrl"><br>
		<button type="button" id="add-music">添加</button>
	</form>

	<form id="form2">
		账户：<input type="text" name="userAccount" id="account"><br>
		密码：<input type="text" name="userPassword" id="password"><br>
		<button type="button" id="login-button">登录</button>
	</form>

	<iframe frameborder="no" border="0" marginwidth="0" marginheight="0"
		width=330 height=86
		src="//music.163.com/outchain/player?type=2&id=38019965&auto=1&height=66"></iframe>
	<iframe
		src="http://music.163.com/outchain/player?type=0&amp;id=168723000&amp;auto=0&amp;height=430"
		width="100%" height="450" frameborder="no" marginwidth="0"
		marginheight="0"></iframe>

	<script src="js/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$("#login-button").click(function(event) {
			setTimeout('loginUser()', 1000);
		});

		function loginUser() {
			alert("111");
			var account = $("#account").val();
			var password = $("#password").val();
			alert(account + " : " + password);

			$.ajax({
				url : "http://172.27.3.78:8080/ChunYinBackGround/userLogin",
				data : "account=" + account + "&password=" + password,
				type : "post",
				dataType : "jsonp",
				success : function(datas) {
					alert(datas.code);
					window.location.href = "login.jsp";
				},
				error : function() {

				}
			});
			/* $
					.ajax({
						url : "http://172.27.3.78:8080/ChunYinBackGround/selectOnePageUser",
						data : "pn=1",
						type : "post",
						dataType : "jsonp",
						success : function(datas) {
							$.each(datas.data.pageInfo.list, function(index,
									value) {
								alert(index + ":" + value.userId + ":"
										+ value.userAccount + ":"
										+ value.userName + ":"
										+ value.userPassword + ":"
										+ value.userIntroduction);
							});

						},
						error : function() {

						}
					}); */
		}

		$("#add-music").click(function() {

			$.ajax({
				url : "http://172.27.3.78:8080/ChunYinBackGround/insertSong",
				data : $('#form1').serialize(),
				type : 'POST',
				dataType : "jsonp",
				success : function(datas) {

				},
				error : function() {

				}
			});
		});
	</script>
</body>
</html>