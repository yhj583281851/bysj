<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆信息列表</title>
<meta name="description" content="车辆信息列表">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link href="static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	

</head>

<body>

<!-- -----------------------   模态框--------------------------------- -->

<!-- UpdateModal -->
	<div class="modal fade" id="update_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改车辆信息</h4>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="exampleInputEmail1">车主号</label> <input type="text"
								class="form-control" id="update_user_id" name="userId"
								placeholder="请输入车主号"> <span class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">品牌</label> <input type="text"
								class="form-control" id="update_car_brand" name="carBrand"
								placeholder="请输入车辆品牌"> <span class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">车牌</label> <input type="text"
								class="form-control" id="update_car_number" name="carNumber"
								placeholder="请输入车牌号"> <span class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">颜色</label> <input type="text"
								class="form-control" id="update_car_color" name="carColor"
								placeholder="请输入车辆颜色"> <span class="help-block"></span>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						id="car_update_btn">添加</button>
				</div>
			</div>
		</div>
</div>

<!-- -----------------------   end模态框--------------------------------- -->


        <div>
            <div class="tpl-content-page-title">
                	所有车辆
            </div>
            <ol class="am-breadcrumb">
                <li><a href="#" class="am-icon-home">首页</a></li>
                <li><a href="#">车辆信息</a></li>
                <li class="am-active">车辆信息列表</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 车辆信息列表
                    </div>
                 
                </div>
                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-6">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button id="car_delete_all_btn" type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
                                </div>
                            </div>
                        </div>
                        
                        	<!-- 查询按钮 -->
                        <div class="am-u-sm-12 am-u-md-3">
                            <div class="am-input-group am-input-group-sm">
                                <input type="text" id="car_select" class="am-form-field">
                                <span class="am-input-group-btn">
            <button id="car_select_btn" class="am-btn  am-btn-default am-btn-success tpl-am-btn-success am-icon-search" type="button"></button>
          </span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table id="car_table" class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            <th class="table-check">
                                            <input id="check_all" type="checkbox" class="tpl-table-fz-check"></th>
                                            <th class="table-id">车辆ID</th>
                                            <th class="table-id">用户ID</th>
                                            <th class="table-title">品牌</th>
                                            <th class="table-title">车牌号</th>
                                            <th class="table-title">颜色</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <!-- 在js中循环显示 -->
                                       
                                    </tbody>
                                </table>
                                
             					      <!-- 分页 -->
                                <div class="am-cf">
                                	<div id="page_nav" class="am-fr"></div>
                                </div>
                                
                                <hr>

                            </form>
                        </div>

                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>










        </div>

    </div>



    
    
    <!-- 加载static/js -->
    <script src="static/js/car_list.js"></script>
</body>
</html>