<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>修改个人信息</title>
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
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-info dker">
	<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
		<div class="container aside-xl">
			<a class="navbar-brand block" href="index.html"><span
				class="h1 font-bold">修改个人信息</span></a>
			<section class="m-b-lg">
				<header class="wrapper text-center">
					<strong>修改发现有趣的世界</strong>
				</header>
				<form id="form1">
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-user form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text"  onfocus=this.blur();
								style="border: 0px; outline: none; cursor: pointer; disabled:true;"
								name="userAccount" id="user_account" value=""
						> 
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
								class="glyphicon glyphicon-envelope form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" name="userEmail"
								style="border: 0px; outline: none; cursor: pointer;"
								id="user_email" placeholder="请输入邮箱"
								onfocus="this.placeholder=''" onblur="this.placeholder='请输入邮箱'">
							<span class="help-block"
								style="font-size: 14px; margin-top: 18px;">*请输入正确的邮箱格式</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-phone form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" name="userPhone"
								style="border: 0px; outline: none; cursor: pointer;"
								id="user_phone" placeholder="请输入电话号码"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='请输入电话号码'"> <span
								class="help-block"></span>
								<span class="help-block"
								style="font-size: 14px; margin-top: 18px;">*请输入11位手机号码</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="form-control rounded input-lg text-center no-border">
							<i
								class="glyphicon glyphicon-tag form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="" name="userIntroduction"
								style="border: 0px; outline: none; cursor: pointer;"
								id="user_introduction" placeholder="请输入个性签名"
								onfocus="this.placeholder=''"
								onblur="this.placeholder='请输入个性签名'"> <span
								class="help-block"></span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<div class="text-muted text-center">
							<div class="gender-select">
								<input type="radio" id="userSex" name="userSex" 
									value="男"> <label for="flat-radio-1" class=""><font
									size=4>男</font></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="userSex" name="userSex" value="女">
								<label for="flat-radio-1" class=""><font size=4>女</font></label>
							</div>
						</div>
					</div>


					<button type="submit" id="signup_button"
						class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
						<i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">修改</span>
					</button>

				</form>
			</section>
		</div>
	</section>
	<!-- / footer -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>
	<script type="text/javascript">
	show_infomation();

	function show_infomation(){
		var url=location.search;	
		var id = url.substr(1);
		
		$.ajax({
			url : "http://localhost:8080/ChunYinBackGround/selectUserById",
			data : "id="+id,
			type : "post",
			dataType:"jsonp",
			success : function(datas) {
			//	alert(datas.data.user[0].userId);
				var account = datas.data.user[0].userAccount;
				var name= datas.data.user[0].userName;
				var email=datas.data.user[0].userEmail;
				var phone=datas.data.user[0].userPhone;
				var sex=datas.data.user[0].userSex;
				var introduction=datas.data.user[0].userIntroduction;
				

				$("#user_account").attr("value",account);
				$("#user_name").attr("value",name);
				$("#user_email").attr("value",email);
				$("#user_phone").attr("value",phone);
				$("#user_sex").attr("value",sex);
				$("#user_introduction").val(introduction);
				
			
			},
			error : function() {
			}
		});
	}
		
		//正则表达式校验账号密码邮箱
		function validate_add_form() {
			//进行校验
			
			
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


			//校验邮箱
			var email = $("#user_email").val();

			if(email==""){
				return true;
			}else{
				var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if (!reg.test(email)) {
					show_validate_msg($("#user_email"), "error", "请输入正确的邮箱格式");
					return false;
				} else {
					show_validate_msg($("#user_email"), "success", "");
				}
			}
			
			//校验手机号码
			
			var phone = $("#user_phone").val();

			if(phone==""){
				return true;
			}else{
				var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
				if (!reg.test(phone)) {
					show_validate_msg($("#user_phone"), "error", "");
					return false;
				} else {
					show_validate_msg($("#user_phone"), "success", "");
				}
			}
			
			return true;
			
		}
		

		//清空表单样式及内容
		function reset_form(ele){
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
			$("#user_email").parent().removeClass("has-success has-error");
			$("#user_phone").parent().removeClass("has-success has-error");
			
			
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
		
		
	$(document).ready(function(){
		$("#signup_button").click(function(){	
			
			if (!validate_add_form()) {
				return false;
			}
			
			var url=location.search;	
			var id = url.substr(1);
			var data = "userId=" + id + "&" + $("#form1").serialize();
			  $.ajax({
		  			url : "http://localhost:8080/ChunYinBackGround/updateUserInformation",
		  			data :data,
		  			type : "post",
		  			dataType:"jsonp",
		  			success : function(data) {
		  				if(data.msg){
		  					window.location.href="profile.jsp?"+id;
		  				}
		  				return true;
		  				
		  			},
		  			error : function() {
		  				alert(data.code);
		  			}	  			
		  		});
			 return false; 
		});
		 
	});
	    
	</script>
</body>
</html>