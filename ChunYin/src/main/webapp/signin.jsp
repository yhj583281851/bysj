<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>登陆醇音</title>
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet"
	href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-info dker" style="background:url(./images/bg1.jpg); ">
	<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
		<div class="container aside-xl">
			<a class="navbar-brand block" href="index.html"><span
				class="h1 font-bold">欢迎登录醇音</span></a>
			<section class="m-b-lg">
				<header class="wrapper text-center">
					<strong>登录发现有趣的世界</strong>
				</header>
				<form id="form2">

					<div class="form-group" >
						<div class="form-control rounded input-lg text-center no-border" >
							<i
								class="glyphicon glyphicon-user form-control-feedback pull-left"></i>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="user_account" style="border: 0px; outline: none; cursor: pointer;"
								type="text" placeholder="请输入账号"  onfocus="this.placeholder=''" onblur="this.placeholder='请输入账号'">
						</div>
					</div>
					<div class="form-group" >
						<div class="form-control rounded input-lg text-center no-border" >
							<i
								class="glyphicon glyphicon-lock form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input id="user_password" style="border: 0px; outline: none; cursor: pointer;" 
								type="password" placeholder="请输入密码"  onfocus="this.placeholder=''" onblur="this.placeholder='请输入密码'">
						</div>
					</div>

					<button type="submit" id="signin_button" style="background:#0066ff"
						class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
						<i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span>
					</button>
					<div class="text-center m-t m-b">
						<a href="findPassword.jsp"><small>忘记密码?</small></a>
					</div>
					<div class="line line-dashed"></div>
					<p class="text-muted text-center">
						<small>还没有账号？</small>
					</p>
					<a href="signup.jsp" style="background:#0066ff" class="btn btn-lg btn-info btn-block rounded">注册</a>
				</form>
			</section>
		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder">
			<p>
				<small>醇音在线播放平台版权所有<br>&copy; 2018
				</small>
			</p>
		</div>
	</footer>
	<!-- / footer -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- App -->
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>
	<script type="text/javascript">
	$("#signin_button").click(function(){
	
		var account=$("#user_account").val();
		var password=$("#user_password").val();
		
		if(account==""||password==""){
			alert("账号或密码不能为空！");
			return false;
		}
		
		$.ajax({
			url:"http://localhost:8080/ChunYinBackGround/userLogin",
			data:"account="+account+"&password="+password,
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				 
					if(datas.code=="100"){
						alert("恭喜您！登录成功！");
						var id=datas.data.id;
						//设置session
						sessionStorage.setItem('userId',id);
						window.location.href="index2.jsp";
					}else{
						alert("账号或密码错误，请重新输入!");
					}		
			},
			error:function(){
				alert("账号或密码错误，请重新输入!");			
			}
		});
		return false;
	});
	</script>
</body>
</html>