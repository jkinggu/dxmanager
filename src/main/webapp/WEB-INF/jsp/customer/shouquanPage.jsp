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
<title>授权设置</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">
<style>
body {
	margin: 10px 20px;
}

.demo-carousel {
	height: 200px;
	line-height: 200px;
	text-align: center;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<div class="layui-form layui-inline layui-form-pane">
		<label class="layui-form-label shouquan" data-type="shouquan"
			style='background-color: #FFB800; padding: 0 12px; line-height: 38px; color: #fff; width: 140px;'>工资服务批量授权</label>
		<div class="layui-input-inline" style='width: 80px'>
			<select id="timelimit">
				<option value="${yearNowP2 }">${yearNowP2 }</option>
				<option value="${yearNowP1 }">${yearNowP1 }</option>
				<option value="${yearNow }">${yearNow }</option>
				<option value="${yearNowN1 }">${yearNowN1 }</option>
				<option value="${yearNowN2 }">${yearNowN2 }</option>
				<option value="${yearNowN3 }">${yearNowN3 }</option>
				<option value="${yearNowN4 }">${yearNowN4 }</option>
			</select>
		</div>
	</div>
	<div class="layui-form layui-inline layui-form-pane"
		style='float: right'>
		<label class="layui-form-label nbshouquan" data-type="nbshouquan"
			style='background-color: #FFB800; padding: 0 12px; line-height: 38px; color: #fff; width: 140px;'>年报服务批量授权</label>
		<div class="layui-input-inline" style='width: 80px'>
			<select id="nbtimelimit">
				<option value="${yearNowP2 }">${yearNowP2 }</option>
				<option value="${yearNowP1 }">${yearNowP1 }</option>
				<option value="${yearNow }">${yearNow }</option>
				<option value="${yearNowN1 }">${yearNowN1 }</option>
				<option value="${yearNowN2 }">${yearNowN2 }</option>
				<option value="${yearNowN3 }">${yearNowN3 }</option>
				<option value="${yearNowN4 }">${yearNowN4 }</option>
			</select>
		</div>
	</div>
	<table class="layui-hide" id="cusTable" lay-filter="customer"></table>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/customer.js"></script>
	<script>
	var customercode = '${customer.customercode}';
	var membership = '${customer.membership}';
		layui
				.use(
						[ 'layer', 'table' ],
						function() {
							var layer = layui.layer ;// 弹层
							table = layui.table; // 表格
							// 执行一个 table 实例
					table.render({
								elem : '#cusTable',
								url : 'customer/selectAllCustomer.dx',// 数据接口
								page : false,// 开启分页
								id : 'cusTable',
								limit : 1000, //每页默认显示的数量
								loading : true,
								cols : [ [ // 表头
								{
									type : 'checkbox',
									fixed : 'left'
								}, {
									field : 'customercode',
									title : '单位编码',
									sort : true,
									width:100,
								}, {
									field : 'customername',
									title : '单位名称',
									align : 'center',
								}, {
									field : 'membership',
									title : '县区',
									width : 100,
									align : 'center',
								}, {
									title : '联系人',
									templet : '<div>{{d.agent }} {{d.mobile }}</div>',
									align : 'center',
									width:250
								}, {
									field : 'timelimit',
									title : '工资期限',
									align : 'center',
									width:90
								}, {
									field : 'nbtimelimit',
									title : '年报期限',
									align : 'center',
									width:90
								}] ],
								where : {
									codeOrName : customercode,
									membership : membership
								}
							});
							 active = {
									shouquan:function(){
										var checkStatus = table.checkStatus('cusTable'),
										 data = checkStatus.data;
										if (data.length == 0) {
											layer.msg('请选择单位')
											return
										}
										var cusIds = [];
										for(i=0;i<data.length;i++){
											cusIds.push(data[i].customerid)
										}
										var limit = $('#timelimit').val();
										cusShouquan(cusIds,limit,0);
									},
									nbshouquan:function(){
										var checkStatus = table.checkStatus('cusTable'),
										 data = checkStatus.data;
										if (data.length == 0) {
											layer.msg('请选择单位')
											return
										}
										var cusIds = [];
										for(i=0;i<data.length;i++){
											cusIds.push(data[i].customerid)
										}
										var limit = $('#nbtimelimit').val();
										cusShouquan(cusIds,limit,1);
									}
								

							      };    

							$('.shouquan,.nbshouquan').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});
						});
	</script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#timelimit').val('${yearNow }');
		$('#nbtimelimit').val('${yearNow }');
	});
	</script>

</body>
</html>
