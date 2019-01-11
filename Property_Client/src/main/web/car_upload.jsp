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
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                                <i class="am-icon-search"></i>
                                <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">
                    <div class="am-g tpl-amazeui-form">
                        <div class="am-u-sm-12 am-u-md-9">
                        
                            <form id="song_upload_table" class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">用户号</label>
                                    <div class="am-u-sm-9">
                                        <input onblur="checkUserId()" type="text" name="userId" placeholder="输入用户号">
                                        <small>用户号</small>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">车主名称</label>
                                    <div class="am-u-sm-9">
                                        <input onblur="checkUserName()" type="text" name="userName" placeholder="输入车主名称">
                                        <small>车主名称</small>
                                    </div>
                                </div>
                                
                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">车辆品牌</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="carBrand" placeholder="输入车辆品牌">
                                        <small>品牌</small>
                                    </div>
                                </div>
                                
                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">车牌号</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="carBrand" placeholder="输入车牌号">
                                        <small>车牌</small>
                                    </div>
                                </div>
								
								<div class="am-form-group">
                                    <label for="user_issue_date" class="am-u-sm-3 am-form-label">车颜色</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="songIssueDate" placeholder="输入车颜色">
                                        <small>颜色</small>
                                    </div>
                                </div>
								
                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">歌曲链接</label>
                                    <div class="am-u-sm-9">
                                        <input onchange="set_song_time();" id="song_url" type="text" name="songUrl" placeholder="输入歌曲链接">
                                    </div>
                                </div>

                                

   

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" id="add_music" class="am-btn am-btn-primary">上传车辆信息</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>



            </div>
        </div>

   
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/app.js"></script> 
    <script src="static/js/car_upload.js"></script>
</body>
</html>