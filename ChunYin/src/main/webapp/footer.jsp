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
</head>
<body>
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=1316375786&auto=1&height=66"></iframe>
<div class="footer bg-dark">
	<div id="jp_container_N">
	  <div class="jp-type-playlist">
	    <div id="jplayer_N" class="jp-jplayer hide"></div>
	    <div class="jp-gui">
	      <div class="jp-video-play hide">
	        <a class="jp-video-play-icon">play</a>
	      </div>
	      <div class="jp-interface">
	        <div class="jp-controls">
	          <div><a class="jp-previous"><i class="icon-control-rewind i-lg"></i></a></div>
	          <div>
	            <a class="jp-play"><i class="icon-control-play i-2x"></i></a>
	            <a class="jp-pause hid"><i class="icon-control-pause i-2x"></i></a>
	          </div>
	          <div><a class="jp-next"><i class="icon-control-forward i-lg"></i></a></div>
	          <div class="hide"><a class="jp-stop"><i class="fa fa-stop"></i></a></div>
	          <div><a class="" data-toggle="dropdown" data-target="#playlist"><i class="icon-list"></i></a></div>
	          <div class="jp-progress hidden-xs">
	            <div class="jp-seek-bar dk">
	              <div class="jp-play-bar bg-info">
	              </div>
	              <div class="jp-title text-lt">
	                <ul>
	                  <li></li>
	                </ul>
	              </div>
	            </div>
	          </div>
	          <div class="hidden-xs hidden-sm jp-current-time text-xs text-muted"></div>
	          <div class="hidden-xs hidden-sm jp-duration text-xs text-muted"></div>
	          <div class="hidden-xs hidden-sm">
	            <a class="jp-mute" title="mute"><i class="icon-volume-2"></i></a>
	            <a class="jp-unmute hid" title="unmute"><i class="icon-volume-off"></i></a>
	          </div>
	          <div class="hidden-xs hidden-sm jp-volume">
	            <div class="jp-volume-bar dk">
	              <div class="jp-volume-bar-value lter"></div>
	            </div>
	          </div>
	          <div>
	            <a class="jp-shuffle" title="shuffle"><i class="icon-shuffle text-muted"></i></a>
	            <a class="jp-shuffle-off hid" title="shuffle off"><i class="icon-shuffle text-lt"></i></a>
	          </div>
	          <div>
	            <a class="jp-repeat" title="repeat"><i class="icon-loop text-muted"></i></a>
	            <a class="jp-repeat-off hid" title="repeat off"><i class="icon-loop text-lt"></i></a>
	          </div>
	          <div class="hide">
	            <a class="jp-full-screen" title="full screen"><i class="fa fa-expand"></i></a>
	            <a class="jp-restore-screen" title="restore screen"><i class="fa fa-compress text-lt"></i></a>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="jp-playlist dropup" id="playlist">
	      <ul class="dropdown-menu aside-xl dker">
	        <!-- The method Playlist.displayPlaylist() uses this unordered list -->
	        <li class="list-group-item"></li>
	      </ul>
	    </div>
	    <div class="jp-no-solution hide">
	      <span>Update Required</span>
	      To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
	    </div>
	  </div>
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