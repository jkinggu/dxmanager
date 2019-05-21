<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>主页</title>
<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<style>
.info-box {
	height: 85px;
	background-color: white;
	background-color: #ecf0f5;
}

.info-box .info-box-icon {
	border-top-left-radius: 2px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 2px;
	display: block;
	float: left;
	height: 85px;
	width: 85px;
	text-align: center;
	font-size: 45px;
	line-height: 85px;
	background: rgba(0, 0, 0, 0.2);
}

.info-box .info-box-content {
	padding: 5px 10px;
	margin-left: 85px;
}

.info-box .info-box-content .info-box-text {
	display: block;
	font-size: 14px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	text-transform: uppercase;
}

.info-box .info-box-content .info-box-number {
	display: block;
	font-weight: bold;
	font-size: 18px;
}

.major {
	font-weight: 10px;
	color: #01AAED;
}

.main {
	margin-top: 25px;
}

.main .layui-row {
	margin: 10px 0;
}
</style>
</head>

<body>
	<div class="layui-fluid main">
		<div class="layui-row layui-col-space15">
			<div class="layui-col-md3">
				<div class="info-box">
					<a href='javascript:;' class='site-demo-active' data-type="tabAdd">
						<span class="info-box-icon"
						style="background-color: #00c0ef !important; color: white;"><i
							class="fa fa-ambulance" aria-hidden="true"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">新增销售</span> <span
								class="info-box-number">50</span>
						</div>
					</a>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="info-box">
					<a href='javascript:;' class='site-demo-active'
						data-type="tabDelete"> <span class="info-box-icon"
						style="background-color: #dd4b39 !important; color: white;"><i
							class="fa fa-google-plus" aria-hidden="true"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">待开票</span> <span
								class="info-box-number">22</span>
						</div>
					</a>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #00a65a !important; color: white;"><i
						class="fa fa-shopping-bag" aria-hidden="true"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">已开票</span> <span
							class="info-box-number">28</span>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="info-box">
					<span class="info-box-icon"
						style="background-color: #f39c12 !important; color: white;"><i
						class="fa fa-users" aria-hidden="true"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">未知</span> <span
							class="info-box-number">85</span>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row">
			<a href="jsp/customer/customerManage.jsp"
				class="layui-btn layui-btn-lg layui-btn-normal">新增销售</a>
		</div>
	</div>
	<div
		style="left: 200px; right: 0; position: absolute; overflow-y: auto;">
		<div class="layui-tab" lay-filter="demo" lay-allowClose="true">
			<ul id="tabTitle" class="layui-tab-title">
			</ul>
			<div id="tabContainers" class="layui-tab-content"></div>
		</div>
	</div>
	<div
		style="text-align: center; margin-top: 200px; font-size: 40px; font-family: cursive;">欢迎使用鼎星科技公司管理系统</div>

	<script src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script>
		layui.use([ 'layer', 'element' ], function() {
			var layer = layui.layer;
			var element = parent.layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

		})
	</script>

</body>

</html>