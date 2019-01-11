<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>注册醇音</title>
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css"
	type="text/css" />
<link rel="stylesheet"
	href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" />
<script src="js/MD5.js"></script>
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-info dker" style="background: url(./images/bg1.jpg); ">
	<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
		<div class="container aside-xl">
			<a class="navbar-brand block" href="index.html"><span
				class="h1 font-bold">欢迎注册醇音</span></a>
			<section class="m-b-lg">
				<header class="wrapper text-center">
					<strong>注册发现有趣的世界</strong>
				</header>
				<form id="form1">
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-user form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text"
								style="border: 0px; outline: none; cursor: pointer;"
								name="userAccount" id="user_account" placeholder="请输入账号"
								onfocus="this.placeholder=''" onblur="this.placeholder='请输入账号'">
							<span class="help-block"
								style="font-size: 14px; margin-top: 18px;">*用户名必须是2-5中文或6-19位英文和数字组合</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-heart-empty form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text"
								style="border: 0px; outline: none; cursor: pointer;"
								id="user_name" name="userName" placeholder="请输入昵称"
								onfocus="this.placeholder=''" onblur="this.placeholder='请输入昵称'">
							<span class="help-block"
								style="font-size: 14px; margin-top: 18px;">*昵称必须是2-5中文或6-19位英文和数字组合</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-lock form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="password" name="userPassword"
								style="border: 0px; outline: none; cursor: pointer;"
								id="user_password" placeholder="请输入密码"
								onfocus="this.placeholder=''" onblur="this.placeholder='请输入密码'">
							<span class="help-block"
								style="font-size: 14px; margin-top: 18px;">*密码必须是6-19位英文和数字的组合</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-envelope form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" name="userEmail"
								style="border: 0px; outline: none; cursor: pointer;"
								id="user_email" placeholder="邮箱(选填)"
								onfocus="this.placeholder=''" onblur="this.placeholder='邮箱'">
							<span class="help-block" style="font-size: 14px; margin-top: 18px;">*请输入正确的邮箱格式</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="text-muted text-center">
							<div class="gender-select">
								<input type="radio" id="userSex" name="userSex" checked="true"
									value="男"> <label for="flat-radio-1" class=""><font
									size=4>男</font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="userSex" name="userSex" value="女">
								<label for="flat-radio-1" class=""><font size=4>女</font></label>
							</div>
						</div>
					</div>
					<div class="checkbox i-checks m-b">
						<label class="m-l"> <input id="checkBox" type="checkbox"
							onchange="check()"><i></i> 同意 <a href="policy.jsp">条款和政策</a>
						</label>
					</div>

					<button type="submit" id="signup_button" disabled="true"
						style="background: #0066ff"
						class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
						<i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">注册</span>
					</button>
					<div class="line line-dashed"></div>
					<p class="text-muted text-center">
						<small>已经有账号?</small>
					</p>
					<a href="signin.jsp" style="background: #0066ff"
						class="btn btn-lg btn-info btn-block btn-rounded">登录</a>
				</form>
			</section>
		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder clearfix">
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
		function check() {

			var check = document.getElementById("checkBox");
			if (check.checked == true) {

				document.getElementById("signup_button").removeAttribute(
						"disabled")
			} else {

				document.getElementById("signup_button").disabled = "disabled"
			}
		}

		$("#user_account")
				.change(
						function() {

							var account = $("#user_account").val();

							//发送ajax请求校验用户名是否已经被占用
							$
									.ajax({
										url : "http://localhost:8080/ChunYinBackGround/checkUserAccount",
										type : "post",
										data : "account=" + account,
										dataType : "jsonp",
										success : function(msg) {

											if (msg.code == 100) {

												show_validate_msg(
														"#user_account",
														"success", msg.data.msg);
												//通过attr赋值属性
												$("#signup_button").attr(
														"ajax-va", "success");
											} else {

												show_validate_msg(
														"#user_account",
														"error", msg.data.msg);
												$("#signup_button").attr(
														"ajax-va", "error");
											}
										},
										error : function() {
											alert("error");
										}
									});
						});

		//正则表达式校验账号密码邮箱
		function validate_add_form() {
			//进行校验

			//校验账号
			var account = $("#user_account").val();
			//用户名可以是2-5位中文或6-19位英文和数字的组合
			var reg = /(^[a-zA-Z0-9_-]{6,19}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!reg.test(account)) {
				show_validate_msg($("#user_account"), "error",
						"用户名必须是2-5中文或6-19位英文和数字组合");
				return false;
			} else {
				show_validate_msg($("#user_account"), "success", "");
			}

			//校验昵称
			var name = $("#user_name").val();
			//用户名可以是2-5位中文或6-19位英文和数字的组合
			var reg = /(^[a-zA-Z0-9_-]{6,19}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!reg.test(name)) {
				show_validate_msg($("#user_name"), "error",
						"昵称必须是2-5中文或6-19位英文和数字组合");
				return false;
			} else {
				show_validate_msg($("#user_name"), "success", "");
			}

			//校验密码
			var password = $("#user_password").val();

			//密码必须是6-19位英文和数字的组合
			var reg = /(^[a-zA-Z0-9_-]{6,19}$)/;
			if (!reg.test(password)) {
				show_validate_msg($("#user_password"), "error",
						"密码必须是6-19位英文和数字的组合");
				return false;
			} else {
				show_validate_msg($("#user_password"), "success", "");
			}

			//校验邮箱
			var email = $("#user_email").val();

			var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (!reg.test(email)) {
				show_validate_msg($("#user_email"), "error", "请输入正确的邮箱格式");
				return false;
			} else {
				show_validate_msg($("#user_email"), "success", "");
			}

			//校验是否被占用
			var account = $("#user_account").val();

			return true;
		}

		//清空表单样式及内容
		function reset_form(ele) {
			//清除input输入内容
			$(ele)[0].reset();
			//清除父div容器样式
			$(ele).find("*").removeClass("has-success has-error");
			//清空span内容 
			$(ele).find(".help-block").text("");
		}

		//显示校验结果提示信息
		function show_validate_msg(ele, status, msg) {
			//清空当前元素的检验状态
			$("#user_name").parent().removeClass("has-success has-error");
			$("#user_password").parent().removeClass("has-success has-error");
			$("#user_email").parent().removeClass("has-success has-error");
			$("#user_account").parent().removeClass("has-success has-error");

			if ("success" == status) {
				//
				$(ele).parent().addClass("has-success");

				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				//让父容器变色 
				$(ele).parent().addClass("has-error");
				//$("#msg").css("color","red");
				//给span赋值错误信息
				$(ele).next("span").text(msg);
			}
		}

		$("#signup_button").click(function() {

			if (!validate_add_form()) {
				return false;
			}

			$.ajax({

				url:"http://localhost:8080/ChunYinBackGround/insertUser",
				data:$("#form1").serialize(),
				type:"post",
				dataType:"jsonp",
				success:function(data){
					alert("恭喜您！注册成功！欢迎登录");
					window.location.href = "signin.jsp";
					return true;
				},
				error : function() {
					alert("注册失败");
				}
			});
			return false;
		});
	</script>
</body>
</html>