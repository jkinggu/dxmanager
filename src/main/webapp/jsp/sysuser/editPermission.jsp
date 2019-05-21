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
<title>编辑权限</title>
<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css">
<style>
body {
	margin: 10px;
}
</style>

</head>
<body>
	<form class="layui-form">
		<input type='hidden' name='id'>
		<div class="layui-form-item">
			<div class="layui-input-block" style='margin-left: 0px;'>
				<input name="name" class="layui-input" lay-verify="name"
					lay-verType='tips' placeholder='请输入权限名称'>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="updatePermission">确定</button>
			</div>
		</div>
	</form>
	<script src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script>
		layui.use([ 'form', 'layer', ], function() {
			var form = layui.form;
			var layer = layui.layer;

			form.verify({
				name : function(value, item) {
					if (value == '' || value == null) {
						return '该项不能为空'
					}
				}
			});
			//监听提交
			form.on('submit(updatePermission)', function(data) {
				$.ajax({
					type : "post",
					dataType : 'json',
					url : 'permission/updatePermission.dx',
					data : data.field,
					async : false,
					success : function(res) {
						if (res.code == 200) {
							parent.table.reload("permissionTable");
							setTimeout(function() {
								parent.layer.closeAll('iframe');
							}, 1500)
							layer.msg(res.msg);
						} else {
							layer.msg(res.msg, {
								icon : 5
							});
						}
					},
					error : function() {
						layer.msg('网络异常，请稍后重试', {
							icon : 2
						});
					}
				})
				return false;
			});
		});
		$('input[name=name]').val(parent.permission.name);
		$('input[name=id]').val(parent.permission.id);
	</script>
</body>
</html>
