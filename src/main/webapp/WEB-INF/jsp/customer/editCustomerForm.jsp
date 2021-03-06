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
<title>新增单位</title>
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
		<input type='hidden' id='customerid' name='customerid'
			value="${customer.customerid}">
		<div class="layui-form-item">
			<label class="layui-form-label">单位编码</label>
			<div class="layui-input-inline">
				<input name="customercode" class="layui-input" id="customercode"
					lay-verType='tips' lay-verify='customercode'
					value='${customer.customercode}'>
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">单位名称</label>
			<div class="layui-input-block">
				<input name="customername" class="layui-input" id='customername'
					lay-verType='tips' lay-verify='customername'
					value='${customer.customername}'>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">开票名称</label>
			<div class="layui-input-block">
				<input class="layui-input" id='customername1' name='customername1'
					value='${customer.customername1}'>
			</div>
		</div>

		<div class="layui-form-item ">
			<label class="layui-form-label">所属县区</label>
			<div class="layui-input-inline">
				<select name="membership" id='membership'>

				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">联系人</label>
			<div class="layui-input-inline">
				<input type="text" name="agent" autocomplete="off"
					class="layui-input" id='agent' value='${customer.agent}'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">联系方式</label>
			<div class="layui-input-inline">
				<input type="text" name="mobile" class="layui-input"
					lay-verType='tips' id='mobile' value='${customer.mobile}'
					maxlength='11'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-inline">
				<input type="email" name="email" autocomplete="off"
					class="layui-input" lay-verType='tips' id='email'
					value='${customer.email}'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">QQ</label>
			<div class="layui-input-inline">
				<input type="text" name="qq" class="layui-input" lay-verType='tips'
					id='qq' value='${customer.qq}'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">信用代码</label>
			<div class="layui-input-inline">
				<input type="text" name="creditcode" class="layui-input"
					lay-verType='tips' id='creditcode' value='${customer.creditcode}'
					maxlength='18'>
			</div>
		</div>


		<div class="layui-form-item">

			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submitCustomerForm">提交</button>
			</div>
		</div>
	</form>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/js/wdf/customer.js"></script>
	<script>
		layui.use([ 'form', 'laydate', 'upload', 'layer', 'table' ],
				function() {
					var form = layui.form;
					var laydate = layui.laydate;
					var upload = layui.upload;
					var layer = layui.layer;
					var table = layui.table;
					//自定义表单验证
					form.verify({
						customercode : function(value, item) { //value：表单的值、item：表单的DOM对象
							if (value == '' || value == null) {
								return '单位编码不能为空';
							} else if (!/^[0-9]*$/.test(value)) {
								return '单位编码格式有误';
							}
						},
						customername : function(value, item) {
							if (value == '' || value == null) {
								return '单位名称不能为空';
							}
						}
					})
					//监听提交
					form.on('submit(submitCustomerForm)', function(data) {
						updateCustomer(data.field);
						return false;
					});
				});
	</script>
	<script type="text/javascript">
		//自动填充单位县区
		$('#membership').append(gainMembership());
		$('#membership').val('${customer.membership}');
	</script>
</body>
</html>
