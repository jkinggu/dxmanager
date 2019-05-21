<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<title>新增销售</title>
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
	<form class="layui-form" id='addSalesForm'>
		<input type='hidden' id='customerid' name='customerid'
			value='${customer.customerid }'>
		<div class="layui-form-item">
			<label class="layui-form-label">登记日期</label>
			<div class="layui-input-inline">
				<input name="salesdate" class="layui-input" id="salesdate"
					lay-verType='tips' lay-verify="required">
			</div>

		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">商品类别</label>
			<div class="layui-input-block">
				<select name="goodsid" id='goodsid' lay-search lay-verType='tips'
					lay-verify='goodsid'>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">付款单位</label>
			<div class="layui-input-block">
				<input type="text" disabled autocomplete="off" class="layui-input"
					id='customername' value='${customer.customername }'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">开票名称</label>
			<div class="layui-input-block">
				<input class="layui-input" id='receipt' name='receipt'
					value='${customer.customername1 }'>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发票号码</label>
			<div class="layui-input-inline">
				<input class="layui-input" id='ticketnum' name='ticketnum' value=''
					maxlength='8'>
			</div>
		</div>
		<%-- <div class="layui-form-item">
			<label class="layui-form-label">信用代码</label>
			<div class="layui-input-inline">
				<input type="text" class="layui-input" name="creditcode"
					id='creditcode' value='${customer.creditcode}'>
			</div>
		</div> --%>
		<div style="width: 70%">
			<div class="layui-form-item ">
				<label class="layui-form-label">总金额</label>
				<div class="layui-input-inline">
					<input name="amount" class="layui-input" lay-verType='tips'
						lay-verify="number" id='amount'>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">支付方式</label>
				<div class="layui-input-inline">
					<select name="payment" lay-verify="required" id='payment'>
						<option value="转帐">转帐</option>
						<option value="刷卡">刷卡</option>
						<option value="现金">现金</option>
						<option value="微信">微信</option>
						<option value="公司微信">公司微信</option>
						<option value="支付宝">支付宝</option>
						<option value="其他">其他</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">收款账户</label>
				<div class="layui-input-inline">
					<select name="payeebank" id='payeebank' lay-search
						lay-filter='payeebank'>
						<option value="中国农业银行信阳分行中山北路分理处">信阳农行</option>
						<option value="中国银行郑州新港大道支行">郑州中行</option>
					</select>
				</div>
			</div>

			<div class='' style="width: 320px">
				<div class="layui-form-item">
					<label class="layui-form-label">联系人</label>
					<div class="layui-input-inline">
						<input type="text" name="linkman" autocomplete="off"
							class="layui-input" id='linkman' value='${customer.agent }'>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">联系方式</label>
					<div class="layui-input-inline">
						<input type="text" name="tel" class="layui-input"
							lay-verType='tips' id='tel' value='${customer.mobile }'>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input type="email" name="email" autocomplete="off"
							class="layui-input" lay-verType='tips' id='email'
							value='${customer.email }'>
					</div>
				</div>
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
				<button class="layui-btn" lay-submit lay-filter="submitSalesForm">提交</button>
			</div>
		</div>
	</form>

	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/sales.js"></script>
	<script src="<%=basePath%>/js/wdf/goods.js"></script>
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
					laydate.render({
						elem : '#salesdate', // 指定元素
						format : 'yyyyMMdd',
						value : new Date(),
						max : 'new Date()',
					});
					form.verify({
						goodsid : function(value, item) {
							if (value == '' || value == null) {
								return '请选择购买商品'
							}
						}
					});
					//监听提交
					form.on('submit(submitSalesForm)', function(data) {
						addSales(data.field)
						return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
					});
				});
	</script>
	<script type="text/javascript">
		$('#goodsid').html(gainGoods());//获取所有商品信息，并添加到商品选择栏
	</script>
</body>
</html>
