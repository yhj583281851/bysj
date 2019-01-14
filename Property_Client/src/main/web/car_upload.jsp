<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传用户的车辆信息</title>
<meta name="description" content="上传车辆信息">
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
                	上传车辆信息
            </div>
            <ol class="am-breadcrumb">
                <li><a href="#" class="am-icon-home">首页</a></li>
                <li><a href="#">车辆</a></li>
                <li class="am-active">上传车辆信息</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 上传车辆信息
                    </div>
                </div>
                <div class="tpl-block ">
                    <div class="am-g tpl-amazeui-form">
                        <div class="am-u-sm-12 am-u-md-9">
                        
                            <form id="song_upload_table" class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-id" class="am-u-sm-3 am-form-label">用户号</label>
                                    <div class="am-u-sm-9">
                                        <input onblur="checkUserId()" type="text" id="userId" placeholder="输入用户号">
                                        <small>用户号</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">车主名称</label>
                                    <div class="am-u-sm-9">
                                        <input onblur="checkUserName()" type="text" id="userName" placeholder="输入车主名称">
                                        <small>车主名称</small>
                                    </div>
                                </div>
                                
                                <div class="am-form-group">
                                    <label for="car-brand" class="am-u-sm-3 am-form-label">车辆品牌</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="carBrand" id="carBrand" placeholder="输入车辆品牌">
                                        <small>品牌</small>
                                    </div>
                                </div>
                                
                                <div class="am-form-group">
                                    <label for="car-number" class="am-u-sm-3 am-form-label">车牌号</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="carNumber" id="carNumber" placeholder="输入车牌号">
                                        <small>车牌</small>
                                    </div>
                                </div>
								
								<div class="am-form-group">
                                    <label for="car-color" class="am-u-sm-3 am-form-label">车颜色</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="carColor" id="carColor" placeholder="输入车颜色">
                                        <small>颜色</small>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" id="add_car" class="am-btn am-btn-primary">上传车辆信息</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



            </div>
        </div>

   
    <script src="static/js/cookie.js"></script>
    <script src="static/js/car_upload.js"></script>
    
</body>
</html>