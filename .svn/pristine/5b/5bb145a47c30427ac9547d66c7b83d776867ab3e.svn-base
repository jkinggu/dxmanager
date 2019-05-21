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
<title>新增发票</title>
<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css">
<style>
body {
	margin: 10px;
}

.demo-carousel {
	height: 200px;
	line-height: 200px;
	text-align: center;
}
</style>

</head>
<body>
	<form class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">登记日期</label>
			<div class="layui-input-block">
				<input name="tickettime" class="layui-input" id="tickettime"
					lay-verType='tips' lay-verify='date'>
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">起始票号:</label>
			<input type='hidden' id='ticketid' name='ticketid' >
			<div class="layui-input-block">
				<input name="beginnum" class="layui-input" id='beginnum'
					maxlength="8" lay-verify='number'
					onkeyup="this.value=this.value.replace(/[^\d\.]/g,'');"
					onchange="this.value=this.value.replace(/[^\d\.]/g,'');">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">数量</label>
			<div class="layui-input-block">
				<input type="text" class="layui-input" name='ticketamount'
					id='ticketamount' maxlength="5" lay-verify='number'
					onkeyup="this.value=this.value.replace(/[^\d\.]/g,'');"
					onchange="this.value=this.value.replace(/[^\d\.]/g,'');">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submitTicketForm">提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/ticket.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script>
		layui.use([ 'form', 'laydate', 'upload', 'layer', 'table' ],
				function() {
					var form = layui.form;
					var laydate = layui.laydate;
					var upload = layui.upload;
					var layer = layui.layer;
					var table = layui.table;
					//监听提交
					form.on('submit(submitTicketForm)', function(data) {
						submitTicketForm(data);
						return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
				});
		//自动填写日期
		getNowDate('#tickettime');
	</script>
</body>
</html>
