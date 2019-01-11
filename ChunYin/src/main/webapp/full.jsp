<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="css/app.css" type="text/css" /> 
<style>
	* {  
        margin: 0px;  
        padding: 0px; 
        background: white;
    }  
    html,body,.mainbox{
        position: relative;
        width: 100%;
        height: 100%;
        
    }
	#head{
		position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 350px;
        width:100%;
  	}
  	#comment{
		position: absolute;
        width: 100%;
        overflow: hidden;
		bottom: 0;
  	}
  	#fullHead{
  		height: 350px;
  		width:100%;
  	}
  	#fullComment{
  		height: 100%;
  		width:100%;
  	}
    </style>
</head>
<body>
<div class="mainbox">
	<div id="head">
		<iframe id="fullHead" name="fullHead" frameborder="0" src="fullHead.jsp" scrolling="no"></iframe>
	</div>
	<div id="comment">
		<iframe id="fullComment" name="fullComment" frameborder="0" src="fullComment.jsp"></iframe>
	</div>
</div>
</body>
<script type="text/javascript">
	var viewH = document.documentElement.clientHeight;
	console.log(viewH)
	var comment = document.getElementById("comment");
	comment.style.height = (viewH - 350)+"px";
</script>
</html>