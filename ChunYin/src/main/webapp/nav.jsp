<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" />  
<link rel="stylesheet" href="css/app2.css" type="text/css" />  
<script type="text/javascript">
	window.onload=function(){
		var id = sessionStorage.getItem('userId');
		$.ajax({
	    	url:"http://localhost:8080/ChunYinBackGround/selectSheetsByUserId",
	    	data:"userId="+id,
	    	type:"post",
	    	dataType:"jsonp",
	    	success:function(data){
	    		var songData = data.data.SheetList;			
				$.each(songData, function(index, sheet){
					var sheetLi = "<li><a href='songList.jsp?"+sheet.sheet.sheetId+"' target='iframeRight' class='auto'><i class='fa fa-angle-right text-xs'></i><span>"+sheet.sheet.sheetName+"</span></a></li>";
					document.getElementById("mySheet").innerHTML += sheetLi;
				});
	    	},
	    	error:function(){}
		    });
	}
	
	
</script>
</head>
<body>
    <!-- nav -->                 
    <nav class="navss">
      <ul class="nav bg clearfix">
        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            发现音乐
        </li>
        <li>
          <a href="newSong.jsp" target="iframeRight">
            <i class="icon-disc icon text-success"></i>
            <span class="font-bold">新歌传递</span>
          </a>
        </li>
      </ul>
      <ul class="nav" data-ride="collapse">
        <li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
                            我的音乐
        </li>
        
        <li >
          <a href="#" class="auto">
            <span class="pull-right text-muted">
              <i class="fa fa-angle-left text"></i>
              <i class="fa fa-angle-down text-active"></i>
            </span>
            <i class=" icon-playlist icon">
            </i>
            <span>我的歌单</span>
          </a>
          
          <ul class="nav dk text-sm" id="mySheet">

          </ul>
          
        </li>
        
        
                    <li >
                      <a href="#" class="auto">
                        <span class="pull-right text-muted">
                          <i class="fa fa-angle-left text"></i>
                          <i class="fa fa-angle-down text-active"></i>
                        </span>
                        <i class="icon-screen-desktop icon">
                        </i>
                        <span>个人中心</span>
                      </a>
                      <ul class="nav dk text-sm">
                        <li>
                          <a href="changePassword.jsp" target="iframeRight">                                                        
                            <i class="fa fa-angle-right text-xs" ></i>

                            <span>修改密码</span>
                          </a>
                        </li>
                        <li >
                          <a href="profile.jsp" target="iframeRight">                                                        
                            <i class="fa fa-angle-right text-xs"></i>

                            <span>修改个人信息</span>
                          </a>
                        </li>
                      </ul>
                    </li>
    </nav>
    <!-- / nav -->
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