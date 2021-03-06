<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>找回密码</title>
<link rel="stylesheet" href="forgetPass/css/lrtk.css">
</head>
<body>
<!-- 代码 开始 -->
<div id="login">
    <div class="wrapper">
        <div class="login">
            <form  id="form1" method="post" class="container offset1 loginform">
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <input type="hidden" name="keepCode" id="keepCode" value="gzh" />
                    <div class="control-group" style="" id="emailDiv">
                        <div class="controls">
                            <label for="account" class="glyphicon glyphicon-user control-label"></label>
                            <input id="account" onchange="checkAccount()" type="text" name="account" placeholder="请输入要找回的账号" tabindex="1" autofocus="autofocus" class="form-control input-medium"/>
                        </div>
                    </div>
                    
                    <input type="hidden" name="_csrf" value="9IAtUxV2CatyxHiK2LxzOsT6wtBE6h8BpzOmk=" />
                    <div class="control-group">
                        <div class="controls">
                            <label for="email" class="glyphicon glyphicon-envelope control-label"></label>
                            <input id="email" type="email" name="email" placeholder="请输入注册的密保邮箱" tabindex="1" autofocus="autofocus" class="form-control input-medium"/>                       		
                        </div>
                    </div>
                    <div class="controls">
                     <label for="email" class="glyphicon glyphicon-pencil control-label"></label>
                    <input type="text" onchange="codeValid()" id="code" name="code"  placeholder="请输入获得的验证码" value="" style="width:205px;display:inline;"/>
                     <button  class="btn btn-info" id="sendCodeBtn" style="display:inline">获取邮箱验证码</button>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" class="glyphicon glyphicon-lock control-label"></label>
                            <input id="password" type="password" name="password" placeholder="请输入新密码" tabindex="2" class="form-control input-medium"/>
                        </div>
                    </div>
                </div>
                <div class="form-actions" >
                   <center><button  type="submit" id="changePassword" tabindex="4" class="btn btn-info" disabled="true">修改密码</button></center>
                </div>
            </form>
        </div>
    </div>
    </div>
    
    <script src="js/jquery.min.js"></script>
    <script>
    
    var id;
    $(function() {

        $('#login #password').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
    
    $("#sendCodeBtn").click(function(){
		var email = $("#email").val();
		var account = $("#account").val();
		var string = "account="+account+"&email="+email;
		$.ajax({
			url:"http://localhost:8080/ChunYinBackGround/checkUserAccountAndEmail",
			data:string,
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				var code = datas.data.code;
				if (code != null && typeof (code) != "undefined") {
                    var mailCode = code;
                    $("#keepCode").attr("value", code);
				}
			},
			error:function(){
				
			}
		});
		return false;
	});

function codeValid(){
		var keepCode = $("#keepCode").val();
		var code = $("#code").val();
		if(code == keepCode){
			alert("验证码正确");
			$("#changePassword").attr('disabled',false);
			
		}
	}
	
  function checkAccount(){
	var account = $("#account").val();
		
		//发送ajax请求校验用户名是否存在
		$.ajax({
			url:"http://localhost:8080/ChunYinBackGround/selectUserByAccount",
			type:"post",
			data:"account="+account,
			dataType:"jsonp",
			success:function(msg){				
				if(msg.code==100){
					id=msg.data.user.userId;
				}else{
					alert("用户名不存在");
					$("#changePassword").attr('disabled',true);
					
				}
			},
			error:function(){
				alert("error");
			}
		});
  }
	
	
    
    $("#changePassword").click(function(){
    	var password=$("#password").val();
    	var str = "userId="+id+"&userPassword="+password;
    	$.ajax({
			url:"http://localhost:8080/ChunYinBackGround/updateUserPassword",
			data:str,
			type:"post",
			dataType:"jsonp",
			success:function(datas){
				if(datas.msg){
					alert("密码找回成功。请登录");
					window.location.href="signin.jsp";
				}
				else{
					alert("密码找回失败，请返回");
					window.location.href="findPassword.jsp";
				}
			},
			error:function(){
				
			}
		});
		return false;
	});
    
    </script>


</body>
</html>