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
<title>新增异常发票信息</title>
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
		<input type='hidden' name='ticketid' value='${ticket.ticketid }'>
		<div class="layui-form-item">
			<label class="layui-form-label">登记日期</label>
			<div class="layui-input-inline">
				<input name="time" class="layui-input" id="exceptiondate"
					lay-verType='tips' lay-verify="date">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发票号码</label>
			<div class="layui-input-block">
				<input name="ticketnum" class="layui-input" id="ticketnum"
					lay-verify="require|exTicketnum" lay-verType='tips' maxLength='8'>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">异常类型</label>
			<div class="layui-input-inline">
				<input name="type" class="layui-input" id='type' lay-verType='tips'
					readonly value='作废'>
			</div>
		</div>


		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<textarea name="note" class="layui-textarea" id='note'></textarea>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="submitTicketExceptionForm">提交</button>
			</div>
		</div>
	</form>
	<script src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/ticket.js"></script>
	<script>
	
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form;
			var layer = layui.layer;
			//自定义表单验证
			form.verify({
                exTicketnum : function(value) {
                    if (value.length != 8) {
                        return '发票号码长度不足8位';
                    }else if(value < '${ticket.beginnum }' || value > '${ticket.endnum }'){
                    	return '此票号段无此号码';
                    }
                }
            });

			//监听提交
			form.on('submit(submitTicketExceptionForm)', function(data) {
				submitTicketExceptionForm(data);
				return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
		
	//自动填充当前日期
	getNowDate('#exceptiondate');
	</script>
</body>
</html>
