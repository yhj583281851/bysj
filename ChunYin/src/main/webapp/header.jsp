<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="static/js/jquery-1.12.4.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" /> 
<script type="text/javascript">
var userId = sessionStorage.getItem('userId');
$(function(){
    $.ajax({
    	url:"http://localhost:8080/ChunYinBackGround/selectUserById",
    	data:"id="+userId,
    	type:"post",
    	dataType:"jsonp",
    	success:function(data){
    		document.getElementById("userName").innerHTML = data.data.user.userName;
    	},
    	error:function(){}
    });
});

</script>
</head>
<body>
<div class="bg-white-only header header-md navbar navbar-fixed-top-xs">
	<div class="navbar-header aside bg-info">
	  <a href="content.jsp" class="navbar-brand text-lt" target="iframeRight">
	    <i class="icon-earphones"></i>
	    <img src="images/logo.png" alt="." class="hide">
	    <span class="hidden-nav-xs m-l-sm">醇音</span>
	  </a>
	</div>      
<!-- 	<form class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs" role="search"> -->
<!-- 	  <div class="form-group"> -->
<!-- 	    <div class="input-group"> -->
<!-- 	      <span class="input-group-btn"> -->
<!-- 	        <button type="submit" class="btn btn-sm bg-white btn-icon rounded"><i class="fa fa-search"></i></button> -->
<!-- 	      </span> -->
<!-- 	      <input type="text" class="form-control input-sm no-border rounded" placeholder="Search songs, albums..."> -->
<!-- 	    </div> -->
<!-- 	  </div> -->
<!-- 	</form> -->
	<div class="navbar-right ">
	  <ul class="nav navbar-nav m-n hidden-xs nav-user user">
	    <li class="hidden-xs">
	      <section class="dropdown-menu aside-xl animated fadeInUp">
	        <section class="panel bg-white">
	          <div class="panel-heading b-light bg-light">
	            <strong>You have <span class="count">2</span> notifications</strong>
	          </div>
	          <div class="list-group list-group-alt">
	            <a href="#" class="media list-group-item">
	              <span class="pull-left thumb-sm">
	                <img src="images/a0.png" alt="..." class="img-circle">
	              </span>
	              <span class="media-body block m-b-none">
	                Use awesome animate.css<br>
	                <small class="text-muted">10 minutes ago</small>
	              </span>
	            </a>
	            <a href="#" class="media list-group-item">
	              <span class="media-body block m-b-none">
	                1.0 initial released<br>
	                <small class="text-muted">1 hour ago</small>
	              </span>
	            </a>
	          </div>
	          <div class="panel-footer text-sm">
	            <a href="#" class="pull-right"><i class="fa fa-cog"></i></a>
	            <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
	          </div>
	        </section>
	      </section>
	    </li>
	    
	      <div style="margin-top:20px; margin-right:20px">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="images/a0.png" alt="...">
              </span>
              <span id="userName">John.Smith</span> 
          </div>
	    
	  </ul>
	</div>      
</div>
</body>
<script src="js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="js/bootstrap.js"></script>
<!-- App -->
<script src="js/app.js"></script>  
<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/app.plugin.js"></script>
<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
<script type="text/javascript" src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
<script type="text/javascript" src="js/jPlayer/demo.js"></script>

</html>