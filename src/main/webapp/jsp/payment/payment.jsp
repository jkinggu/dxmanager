<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%--shiro 标签 --%>
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
<title>银行流水管理</title>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css">
<script src="<%=basePath%>js/jquery-1.11.0.min.js"></script>
<style>
body {
	margin: 10px;
}
</style>
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline demoTable">
			<div class="layui-input-inline">
				<input placeholder="请输入交易日期" class="layui-input "
					id="transdateInput" lay-verify="date">
			</div>
			<button class="layui-btn" data-type="reload" id="payment_search">搜索</button>
		</div>
		<!-- <div class="layui-inline">
			<a class="layui-btn layui-btn-normal newsAdd_btn" id="uploadExcel">导入文件</a>
		</div> -->

	</blockquote>
	<table class="layui-hide" id="paymentTable" lay-filter="payment"></table>
	<div style='margin-top:20px'>
	<a style='COLOR: #0066cc;FONT-SIZE: 12px;' href='build/银行流水模板.xls' title='附件：银行流水模板.xls'>附件：银行流水模板.xls</a>
	</div>
	<shiro:hasPermission name='inportPayment'>
		<script type="text/html" id='paymentToolBar'>
	<a class="layui-btn " id="uploadExcel" title='导入银行流水'>导入流水</a>
	</script>
	</shiro:hasPermission>
	<script type="text/html" id="paymentBar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>

	<script src="<%=basePath%>/plugins/layui/layui.js"></script>

	<script>
		var dataTable;
		layui
				.use(
						[ 'form', 'laydate', 'layer', 'table', 'upload',
								'element' ],
						function() {
							var laydate = layui.laydate // 日期
							, layer = layui.layer // 弹层
							, table = layui.table // 表格
							, upload = layui.upload // 上传
							, element = layui.element // 元素操作
							// 执行一个 table 实例
							dataTable = table
									.render({
										elem : '#paymentTable',
										url : 'payment/selectAllPayment.dx',// 数据接口
										title : '银行流水详情表',
										page : true,// 开启分页
										toolbar : '#paymentToolBar',
										defaultToolbar : [ 'filter' ],
										id : 'paymentTable',
										limits : [ 5, 10, 20, 30, 40, 50 ],
										limit : 10, //每页默认显示的数量
										loading : true,
										cols : [ [ // 表头
												{
													align : 'center',
													type : 'checkbox',
													fixed : 'left'
												},
												{
													align : 'center',
													field : 'transdate',
													title : '交易日期',
													sort : true,
													width : 105
												},
												{
													align : 'center',
													templet : "<div>{{d.payeebank=='中国农业银行信阳分行中山北路分理处'?'信阳农行':'郑州中行'}}</div>",
													title : '流水账户'
												}, {
													align : 'center',
													field : 'received',
													title : '收入金额'
												}, {
													align : 'center',
													field : 'paid',
													title : '支出金额',
													hide : true
												}, {
													align : 'center',
													field : 'balance',
													title : '本次余额'
												}, {
													align : 'center',
													field : 'bankname',
													title : '交易行名'
												}, {
													align : 'center',
													field : 'banknum',
													title : '开户行账号'
												}, {
													align : 'center',
													field : 'name',
													title : '开户人户名'
												}, {
													align : 'center',
													field : 'remark',
													title : '交易附言'
												} ] ]
									});
							//实例化日期
							laydate.render({
								elem : '#transdateInput', // 指定元素
								range : '~',
								format : 'yyyyMMdd',
								//value : new Date(),
								max : 'new Date()'
							});
							//指定允许上传的文件类型	
							upload.render({
								elem : '#uploadExcel',
								url : 'excelUpload.dx',
								title : '请选择Excel文件',
								accept : 'file', //允许上传的文件类型   
								acceptMime : 'application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',//规定打开文件选择框时，筛选出的文件类型
								exts : 'xls|xlsx',//允许上传的文件后缀
								//multiple : true,	
								before : function(obj) {
									layer.load();
								},
								done : function(res, index, upload) {
									if (res.code == 200 && res.msg!=0) {
										layer.msg(res.msg)
										table.reload('paymentTable');
									} else {
										layer.msg(res.msg);
									}
									layer.closeAll('loading');
								},
								error : function() {
									//请求异常回调
									layer.msg("网络异常，请刷新重试")
									layer.closeAll('loading');
								}
							});

							active = {
								reload : function() {//执行重载
									table.reload('paymentTable', {
										where : {
											"transdate" : $('#transdateInput')
													.val()
										}
									});
								}
							};
							$('#payment_search').on('click',function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this): '';
							});
							// 监听头工具栏事件
							table
									.on(
											'toolbar(payment)',
											function(obj) {
												var checkStatus = table
														.checkStatus(obj.config.id), data = checkStatus.data; // 获取选中的数据
												switch (obj.event) {
												case 'add':

													break;
												case 'update':
													if (data.length === 0) {
														layer.msg('请选择一行');
													} else if (data.length > 1) {
														layer.msg('只能同时编辑一个');
													} else {

													}
													break;
												case 'delete':

													break;
												}
												;
											});

						});
	</script>

</body>
</html>
