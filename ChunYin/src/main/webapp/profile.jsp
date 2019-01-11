<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>Musik | Web Application</title>
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" />
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

</head>
<body >

	<!---------------------------------------------------------- 模态框（Modal）---------------------------------------------- -->
	<div class="modal fade" id="update" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="background: url(./images/bg.jpg);">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
				</div>
				<form id="form2">
					<div class="modal-body">
						<center>
							用户账号：<input type="text" name="account" id="account" disabled="true" /> <br> <br> 
								用户昵称：<input type="text" name="name" id="name" /> 
								<span class="help-block" style="font-size:14px;margin-top:18px;">*昵称必须是2-5中文或6-19位英文和数字组合</span>
								用户邮箱：<input type="text" name="email" id="email" /> 
									<span class="help-block" style="font-size: 14px; margin-top: 18px;">*请输入正确的邮箱格式</span> 
								电话号码：<input type="text" name="phone" id="phone" /> 
									<span class="help-block" style="font-size: 14px; margin-top: 18px;">*请输入11位手机号码</span> 
								用户性别：<input type="radio" name="sex" class="sex" id="man" value="男" />男 
								      <input type="radio" name="sex" class="sex" id="women" value="女" />女 <br><br>      
								      <span>个性签名： </span>
							<textarea type="" name="introduction" id="introduction" rows="5"></textarea>
					</div>
				</form>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="modal_update_btn">提交更改</button>
				</div>
				</center>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!------------------------------------------------- 模态框（Modal）end ----------------------------------------------------------->

	<section class="vbox">
		<section>
			<section class="hbox stretch">
				<section id="content">
					<section class="vbox">
						<section class="scrollable">
							<section class="hbox stretch">
								<aside class="aside-lg bg-light lter b-r">
									<section class="vbox">
										<section class="scrollable">
										</section>
									</section>
								</aside>
								<aside class="bg-white">
									<section class="vbox">
										<header class="header bg-light lt">
											<ul class="nav nav-tabs nav-white">
												<li class="active"><a href="#activity"
													data-toggle="tab">个人信息</a></li>
												<div class="controls" style='float: right; padding-top: 10px; padding-right: 10px;'>
													<button class="btn btn-info" style="display: inline" id="edit_btn">编辑个人信息</button>
												</div>
											</ul>


										</header>
										<div class="form-group">
											<div
												class="form-control1 rounded input-lg text-center no-border">
												<i
													class="glyphicon glyphicon-user form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="text"
													style="border: 0px; outline: none; cursor: pointer;"
													name="userAccount" id="user_account" value="">

											</div>
										</div>
										<hr />

										<div class="form-group">
											<div
												class="form-control1 rounded input-lg text-center no-border">
												<i
													class="glyphicon glyphicon-heart-empty form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="text"
													style="border: 0px; outline: none; cursor: pointer;"
													id="user_name" name="userName" value="">

											</div>
										</div>
										<hr />

										<div class="form-group">
											<div
												class="form-control1 rounded input-lg text-center no-border">
												<i
													class="glyphicon glyphicon-star-empty form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="" name="userSex"
													style="border: 0px; outline: none; cursor: pointer;"
													id="user_sex" value="">
											</div>
										</div>
										<hr />

										<div class="form-group">
											<div
												class="form-control1 rounded input-lg text-center no-border">
												<i
													class="glyphicon glyphicon-envelope form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="text" name="userEmail"
													style="border: 0px; outline: none; cursor: pointer;"
													id="user_email" value="">

											</div>
										</div>
										<hr />

										<div class="form-group">
											<div
												class="form-control1 rounded input-lg text-center no-border">
												<i
													class="glyphicon glyphicon-phone form-control-feedback pull-left"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="text" name="userPhone"
													style="border: 0px; outline: none; cursor: pointer;"
													id="user_phone" value="">

											</div>
										</div>
										<hr />



										<div class="form-group">
											<div class="form-control1 rounded input-lg no-border ">
												<i
													class="glyphicon glyphicon-tag form-control-feedback pull-left"></i><span>个性签名</span>
												<!-- <input type="text" name="userIntroduction"
													style="border: 0px; outline: none; cursor: pointer;"
													id="user_introduction" value=""> -->
												<br>
												<br>
												<textarea name="userIntroduction" id="user_introduction"
													style="width: 100%; border: 0px; outline: none; cursor: pointer;"
													class="form-control" rows="5"></textarea>
											</div>
										</div>



									</section>

								</aside>
								<aside class="col-lg-3 b-l">
									<section class="vbox">
									</section>
								</aside>
							</section>
						</section>
					</section>
					<a href="#" class="hide nav-off-screen-block"
						data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
				</section>
			</section>
		</section>
	</section>
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- App -->
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>

	<script>
		show_infomation();

		function show_infomation() {
			var id = sessionStorage.getItem('userId');
			$.ajax({
				url : "http://localhost:8080/ChunYinBackGround/selectUserById",
				data : "id=" + id,
				type : "post",
				dataType : "jsonp",
				success : function(datas) {
					var user = datas.data.user;
					var id = user.userId;
					var account = user.userAccount;
					var name = user.userName;
					var email = user.userEmail;
					var phone = user.userPhone;
					var sex = user.userSex;
					var introduction = user.userIntroduction;

					$("#user_account").attr("value", account);
					$("#user_name").attr("value", name);
					$("#user_email").attr("value", email);
					$("#user_phone").attr("value", phone);
					$("#user_sex").attr("value", sex);
					$("#user_introduction").val(introduction);
					$("#edit_btn").attr("edit_id", id);

				},
				error : function() {
				}
			});
		}

		$("#profile").click(function() {
			var url = location.search;
			var id = url.substr(1);
			window.location.href = "profile.jsp?" + id;
		});

		$("#ChangePassword").click(function() {
			var url = location.search;
			var id = url.substr(1);
			window.location.href = "changePassword.jsp?" + id;
			return false;

		});

		//正则表达式校验账号密码邮箱
		function validate_add_form() {
			//进行校验
			//校验昵称
			var name = $("#name").val();
			//用户名可以是2-5位中文或6-19位英文和数字的组合
			var reg = /(^[a-zA-Z0-9_-]{6,19}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!reg.test(name)) {
				show_validate_msg($("#name"), "error",
						"昵称必须是2-5中文或6-19位英文和数字组合");
				return false;
			} else {
				show_validate_msg($("#name"), "success", "");
			}

			//校验邮箱
			var email = $("#email").val();
			var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (!reg.test(email)) {
				show_validate_msg($("#email"), "error", "请输入正确的邮箱格式");
				return false;
			} else {
				show_validate_msg($("#email"), "success", "");
			}
			
			
			//校验手机号码
			
			var phone = $("#phone").val();
			if(phone==""){
				return true;
			}else{
				var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
				if (!reg.test(phone)) {
					show_validate_msg($("#phone"), "error", "请输入11位手机号码");
					return false;
				} else {
					show_validate_msg($("#phone"), "success", "");
				}
			}
			
			
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
			$("#name").parent().removeClass("has-success has-error");
			$("#email").parent().removeClass("has-success has-error");
			$("#phone").parent().removeClass("has-success has-error");

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

		//触发模态框的同时调用此方法  
		function editInfo(edit_id) {
			var id = edit_id;
			var account = $("#user_account").val();
			var name = $("#user_name").val();
			var email = $("#user_email").val();
			var phone = $("#user_phone").val();
			var introduction = $("#user_introduction").val();
			var sex = $("#user_sex").val();

			//向模态框中传值  
			$('#account').val(account);
			$('#name').val(name);
			$('#email').val(email);
			$('#phone').val(phone);
			$('#introduction').val(introduction);
			if (sex == '女') {
				document.getElementById('women').checked = true;
			} else {
				document.getElementById('man').checked = true;
			}
			$('#update').modal('show');
		}

		$("#edit_btn").click(function() {
			editInfo($(this).attr("edit_id"));
			$("#modal_update_btn").attr("edit_id", $(this).attr("edit_id"));

			$("#update").modal({
				backdrop : "static"
			});

		});

		//提交更改  
		$("#modal_update_btn").click(
						function() {
							 if (!validate_add_form()) {
						 			return false;
						 		} 
						     
						
							//获取模态框数据  
							var id = $(this).attr("edit_id");
							var account = $('#account').val();
							var name = $('#name').val();
							var email = $('#email').val();
							var phone = $('#phone').val();
							var introduction = $('#introduction').val();
							var sex = $('input:radio[name="sex"]:checked')
									.val();
							 var password = 123456; 
							var data = "userId=" + id + "&userAccount="
									+ account + "&userName=" + name
									+ "&userPassword=" + password
									+ "&userEmail=" + email + "&userPhone="
									+ phone + "&userIntroduction="
									+ introduction + "&userSex=" + sex;
							$.ajax({

										url : "http://localhost:8080/ChunYinBackGround/updateUserInformation",
										data : data,
										type : "post",
										dataType : "jsonp",
										success : function(data) {

											if (data.code == 100) {
												alert("修改成功");
												window.location.reload();

											} else {
												alert("修改失败");
											}
											return true;
										},
										error : function() {
											alert("error");
										}
									});
							return false;
						});
	</script>

</body>
</html>