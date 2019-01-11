<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>修改密码</title>
<link rel="stylesheet" href="forgetPass/css/lrtk.css">
</head>
<body>
<!-- 代码 开始 -->
<div id="login">
    <div class="wrapper">
        <div class="login">
            <form method="post" class="container offset1 loginform">
                <div id="owl-login">
                    <div class="hand"></div>
                    <div class="hand hand-r"></div>
                    <div class="arms">
                        <div class="arm"></div>
                        <div class="arm arm-r"></div>
                    </div>
                </div>
                <div class="pad">
                    <input type="hidden" name="_csrf" value="9IAtUxV2CatyxHiK2LxzOsT6wtBE6h8BpzOmk=">
                    <div class="control-group">
                        <div class="controls">
                            <label for="oldPassword" class="glyphicon glyphicon-lock control-label"></label>
                            <input id="oldPassword" type="password" name="oldPassword" onchange="check()" placeholder="请输入旧密码" tabindex="1" autofocus="autofocus" class="form-control input-medium">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <label for="password" class="glyphicon glyphicon-lock control-label"></label>
                            <input id="password" type="password" name="password" onchange="checkNew()" placeholder="请输入新密码" tabindex="2" class="form-control input-medium">
                            <span class="help-block" style="font-size:14px;margin-top:18px;">*密码必须是6-19位英文和数字的组合</span>
                        </div>
                    </div>
                    
                     <div class="control-group">
                        <div class="controls">
                            <label for="newPassword" class="glyphicon glyphicon-lock control-label"></label>
                            <input id="newPassword" type="password" name="newPassword" onchange="compare()" placeholder="再次输入新密码" tabindex="2" class="form-control input-medium">
                        </div>
                    </div>
                </div>
                <div class="form-actions" >
                   <center><button id="changePassword" type="submit" tabindex="4" class="btn btn-info" disabled="true">修改密码</button></center>
                </div>
            </form>
        </div>
    </div>
    <script src="js/jquery.min.js"></script>
    <script>
    var flag;
    $(function() {
        $('#login #password').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
        
        $('#login #oldPassword').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
        
        $('#login #newPassword').focus(function() {
            $('#owl-login').addClass('password');
        }).blur(function() {
            $('#owl-login').removeClass('password');
        });
    });
    
	function validate_add_form() {
		//进行校验
		//校验密码
		var password = $("#password").val();
		
		//密码必须是6-19位英文和数字的组合
		var reg = /(^[a-zA-Z0-9_-]{6,19}$)/;
		if (!reg.test(password)) {
			show_validate_msg($("#password"), "error",
					"密码必须是6-19位英文和数字的组合");
			return false;
		} else {
			show_validate_msg($("#password"), "success", "");
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
		$("#password").parent().removeClass("has-success has-error");
		
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
    
     function check(){
    	var id = sessionStorage.getItem('userId');
  	    var oldPassword=$("#oldPassword").val();
  	    $.ajax({
  			url : "http://localhost:8080/ChunYinBackGround/selectUserById",
  			data : "id="+id,
  			type : "post",
  			dataType:"jsonp",
  			success : function(datas) {
  				var user = datas.data.user;
  				var p = user.userPassword;
  			    if(p==oldPassword){
  			    	flag=1;
  			    }
  			    else{
  			   		alert("旧密码输入错误");
  			    }
  			},
  			error : function() {
  				alert("error");
  			}
  		}); 	    
     }
     
     function checkNew(){
    	 if (!validate_add_form()) {
 			return false;
 		} 
     }
     
    function  compare(){
    	 var password=$("#password").val();
   	     var newPassword=$("#newPassword").val();
   	     
   	     if(password==newPassword){
   	    	document.getElementById("changePassword").removeAttribute("disabled");
   	     }else{
   	    	alert("两次输入密码不一致");
   	     }
     }
    
    $("#changePassword").click(function(){
    	
    	
    	
    	var id = sessionStorage.getItem('userId');
    	 var password=$("#password").val();
    	 var data="userId="+id+"&userPassword="+password;
    	if(flag==1){
    		 $.ajax({
    	  			url : "http://localhost:8080/ChunYinBackGround/updateUserPassword",
    	  			data : data,
    	  			type : "post",
    	  			dataType:"jsonp",
    	  			success : function(data) {
    	  				if(data.code==100){
    		        		alert("修改成功");
    	  					parent.window.location.href="signin.jsp";
    	  				}else{
    	  					
    	  					alert("修改失败");
    	  				}
    	  				return true;
    	  			},
    	  			error : function() {
    	  				alert("error");
    	  			}
    	  		}); 
    		 return false;
    	}
    	
    });
   
    
    
    </script>
</div>

</body>
</html>