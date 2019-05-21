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
<title>修改密码</title>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css">
<style>
body {
	margin: 20px;
}

form {
	width: 800px;
	margin: 0 auto;
}

.layui-btn {
	background-color: #4cae4c;
}

</style>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>plugins/layui/layui.js"></script>
</head>
<body>
	<form class="layui-form layui-form-pane" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">原密码</label>
			<div class="layui-input-block">
				<input type="password" name="pswd" placeholder="请输入原密码"
					class="layui-input" lay-verify='required'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">新密码</label>
			<div class="layui-input-block">
				<input type="password" name="newPswd1" placeholder="请输入新密码"
					class="layui-input" lay-verify='required'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">确认密码</label>
			<div class="layui-input-block">
				<input type="password" name="newPswd2" placeholder="请再次输入新密码"
					class="layui-input" lay-verify='required'>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter='updatePW'>确认修改</button>
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
			form.on('submit(updatePW)', function(data) {
				pswd = data.field.pswd;
				newPswd1 = data.field.newPswd1;
				newPswd2 = data.field.newPswd2;
				updatePassword(pswd, newPswd1, newPswd2);
				return false;
			})

		});
	</script>

</body>
</html>
