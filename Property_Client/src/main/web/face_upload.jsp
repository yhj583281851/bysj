<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传用户的人脸信息</title>





<style>  
        video,canvas{  
            border:1px solid gray;  
            width:400px;  
            height:400px;  
            border-radius:50%;  
        }     
</style> 




 
<meta name="description" content="上传人脸信息">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    
</head>
<body data-type="generalComponents">

        <div>
            <div class="tpl-content-page-title">
                	上传人脸信息
            </div>
            <ol class="am-breadcrumb">
                <li><a href="#" class="am-icon-home">首页</a></li>
                <li><a href="#">人脸</a></li>
                <li class="am-active">上传人脸信息</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 上传人脸信息
                    </div>
                </div>
                <div class="tpl-block ">
                    <div class="am-g tpl-amazeui-form">
                        <div class="am-u-sm-12 am-u-md-9">
                        
                            <form id="song_upload_table" class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-id" class="am-u-sm-3 am-form-label">用户号</label>
                                    <div class="am-u-sm-9">
                                        <input readonly="readonly" type="text" id="userId" placeholder="输入用户号">
                                        <small>用户号</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">用户姓名</label>
                                    <div class="am-u-sm-9">
                                        <input readonly="readonly" type="text" id="userName" placeholder="输入用户姓名">
                                        <small>用户姓名</small>
                                    </div>
                                </div>
                                
                            <!--     拍照与画布 -->
                                <video autoplay style="position: absolute;left: 1%;display: none;"></video>  
								<canvas id="myCanvas" style="position: absolute;left: 50%;"></canvas>
								
								<br>
								<br>
								<br>
								<br>
								<br>
								
								<div class="am-form-group">
						            <div class="am-u-sm-9 am-u-sm-push-3">
						                <button type="button" id="capture" class="am-btn am-btn-primary">拍照上传</button>
						            </div>
						        </div>
                                <br>
                                
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                
                                <div class="am-form-group">
                                    <label for="face-token" class="am-u-sm-3 am-form-label">人脸编码</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="faceToken" readonly="readonly" id="faceToken" placeholder="输入人脸编码">
                                        <small>通过上方拍照获取</small>
                                    </div>
                                </div>
                                
                                
                                
                                
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" id="add_face" class="am-btn am-btn-primary">上传人脸信息</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
            

            
        </div>



		
		<script src="http://code.jquery.com/jquery-latest.js"></script>





   
    <script src="static/js/cookie.js"></script>
    <script src="static/js/face_upload.js"></script>
    
</body>
</html>