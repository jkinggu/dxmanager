<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>个人资料</title>
<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css">
<style>
body {
	margin: 20px;
}

.demo-carousel {
	height: 200px;
	line-height: 200px;
	text-align: center;
}

form {
	width: 400px;
	margin: 0 auto;
}

.layui-form-label {
	width: 100px
}

.layui-input-block {
	margin-left: 150px;
	width: 200px
}
.layui-input {
    height: 38px;
    border-width: 0px;
    text-align: center;
}
</style>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>plugins/layui/layui.js"></script>
</head>
<body>
	<form class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">用 户 名：</label>
			<div class="layui-input-block">
				<input type="text" name="username" class="layui-input"
					value='${user.username }' readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密 码：</label>
			<div class="layui-input-block">
				<input type="password" name="password" class="layui-input"
					value='${user.password }' readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户创建时间：</label>
			<div class="layui-input-block">
				<input type="text" name="createTime" class="layui-input"
					value='${createTime }' readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">最后登录时间：</label>
			<div class="layui-input-block">
				<input type="text" name="lastLoginTime" class="layui-input"
					value='${lastLoginTime }' readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">状  态：</label>
			<div class="layui-input-block">
				<input type="text" name="status" class="layui-input"
					value='${status }' readonly>
			</div>
		</div>
	</form>

	<script type="text/javascript" src='<%=basePath%>js/wdf/sysuser.js'></script>
	<script>
		layui.use([ 'layer', 'element', 'form' ], function() {
			var layer = layui.layer // 弹层
			, element = layui.element // 元素操作
			, $ = layui.jquery;
			var form = layui.form;
		});
	</script>

</body>
</html>
