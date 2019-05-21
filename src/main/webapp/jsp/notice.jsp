<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>消息</title>
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

	<script src="<%=basePath%>/plugins/layui/layui.js"></script>

	<script type="text/javascript"
		src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<div class="layui-fluid" id="LAY-app-message">
		<div class="layui-card">
			<div class="layui-tab layui-tab-brief">
				<ul class="layui-tab-title">
					<li class="layui-this">待开票<span class="layui-badge"
						id='dkpAmount'></span></li>
					</li>
					<li class="">通知</li>
					<li class="">私信</li>
				</ul>
				<div class="layui-tab-content">
					<div class="layui-tab-item layui-show">
						<table class="layui-hide" id="salesTable" lay-filter="sales"></table>
					</div>
					<!-- 
					<div class="layui-tab-item " style="">
						<table class="layui-hide" id="salesTable" lay-filter="sales"></table>
					</div>

					<div class="layui-tab-item" style="">
						<table class="layui-hide" id="salesTable" lay-filter="sales"></table>
					</div> -->
				</div>
			</div>
		</div>
	</div>
	<script type="text/html" id="salesBar">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	<script type="text/html" id="credentionalsTemplet">
   {{#  if(d.paycredentials=='有'){ }}
    <a href='javascript:lookCredentials({{d.salesid }});'  class="layui-table-link" style='color:green;' >查看</a>
  {{#  } else { }}
	无
  {{#  } }}
</script>

	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/sales.js"></script>
	<script>
		layui
				.use(
						[ 'layer', 'table', 'element' ],
						function() {
							var layer = layui.layer // 弹层
							, element = layui.element; // 元素操作
							table = layui.table;
							// 执行一个 table 实例
							salesDataTable = table
									.render({
										elem : '#salesTable',
										url : 'sales/selectNotTicketSales.dx',// 数据接口
										title : '销售信息详情表',
										page : true,// 开启分页
										toolbar : '#salesToolbar', // 开启工具栏，此处显示默认图标，可以自定义模板
										defaultToolbar : [ "filter" ],
										id : 'salesTable',
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
													field : 'salesdate',
													title : '销售时间',
													sort : true,
													width : 105
												},
												{
													align : 'center',
													field:'customer',
													templet : "<div>{{d.customer==null?' ':d.customer.customername}}</div>",
													title : '购买客户',
													hide:true
												},
												{
													align : 'center',
													field : 'goods',
													templet : "<div>{{d.goods==null?' ':d.goods.goodsname}}</div>",
													title : '商品名称',
													width : 200
												},
												{
													align : 'center',
													field : 'payeebank',
													templet : "<div>{{d.payeebank=='中国农业银行信阳分行中山北路分理处'?'信阳农行':'郑州中行'}}</div>",
													title : '收款账户',
													minWidth : 150
												},
												{
													align : 'center',
													field : 'amount',
													title : '总金额',
													width : 90
												},
												{
													align : 'center',
													field : 'receipt',
													title : '开票名称',
													width : 280
												},
												{
													align : 'center',
													field : 'customer',
													templet : '<div>{{d.customer.creditcode}}</div>',
													title : '信用代码'
												},
												{
													templet : '<div>{{d.linkman }} {{d.tel }}</div>',
													title : '联系人',
													align : 'center',
													width : 200
												},
												{
													align : 'center',
													field : 'email',
													title : '邮箱'
												},
												{
													align : 'center',
													field : 'payment',
													title : '支付方式',
													width : 90
												},
												{
													align : 'center',
													field : 'paycredentials',
													templet : "#credentionalsTemplet",
													title : '支付凭证',
													width : 100
												}, {
													align : 'center',
													title : '备注',
													field : 'note',
													fixed : 'right',
													hide:true
												} ] ],
										done : function(res, curr, count) {
											$('#dkpAmount').text(count);
										}
									});

						});
	</script>
	<script src="<%=basePath%>/showImg/zx-image-view/polyfill.min.js"></script>
	<script
		src="<%=basePath%>/showImg/zx-image-view/js/zx-image-view.min.js"></script>
	<script>
		function lookCredentials(salesid) {
			var imgs = [];
			$.ajax({
				type : 'post',
				url : 'credentials/selectCredentialsByCid.dx',
				dataType : 'json',
				async : false,
				data : {
					"salesid" : salesid
				},
				success : function(res) {
					$.each(res, function(i, result) {
						imgs.push({
							url : result.url
						})
					})
					if (imgs.length == 0) {
						return layer.msg('暂无支付凭证')
					}
					parent.parent.preViewImg(imgs);
				},
				error : function() {
					layer.msg('网络异常，请稍后重试')
				}
			})
		}
	</script>
</body>
</html>
