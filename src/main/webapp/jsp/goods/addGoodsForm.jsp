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
<title>新增商品</title>
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
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-block">
				<input name="goodsname" class="layui-input" id='goodsname'
					lay-verify="required" lay-verType='tips'>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">价格</label>
			<div class="layui-input-inline">
				<input name="price" class="layui-input" id='price'
					lay-verify="number" lay-verType='tips'>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">单位</label>
			<div class="layui-input-block">
				<input type="radio" name="unit" value="元/年" title="元/年" checked="">
				<input type="radio" name="unit" value="元/套" title="元/套">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">商品描述</label>
			<div class="layui-input-block">
				<textarea name="description" class="layui-textarea" id='description'></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="submitGoodsForm">提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/goods.js"></script>
	<script>
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form;
			var layer = layui.layer;
			//监听提交
			form.on('submit(submitGoodsForm)', function(data) {
				submitGoodsForm(data);
				return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
	</script>
</body>
</html>
