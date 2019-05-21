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
<title>商品管理</title>
<link rel="stylesheet" href="<%=basePath%>plugins/layui/css/layui.css">
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
</head>
<body>
	<shiro:hasAnyRoles name="0">
		<blockquote class="layui-elem-quote news_search">
			<div class="layui-inline">
				<a class="layui-btn addGoodsPage" data-type='addGoodsPage'
					style="background-color: #5FB878">新增商品</a>
			</div>
		</blockquote>
	</shiro:hasAnyRoles>
	<table class="layui-hide" id="goodsTable" lay-filter="goods"></table>
	<script type="text/html" id="goodsBar">
  
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
	<script src="plugins/layui/layui.js"></script>
	<script src="js/wdf/goods.js"></script>
	<script>
		layui
				.use(
						[ 'laydate', 'layer', 'table', 'upload', 'element', ],
						function() {
							var laydate = layui.laydate // 日期
							, layer = layui.layer // 弹层
							, upload = layui.upload // 上传
							, element = layui.element // 元素操作
							, $ = layui.jquery;
							table = layui.table; // 表格
							// 执行一个 table 实例
							table.render({
								elem : '#goodsTable',
								url : 'goods/selectAllGoods.dx',// 数据接口
								title : '商品管理',
								page : true,// 开启分页
								totalRow : false, // 开启合计行
								id : 'goodsTable',
								limits : [ 2, 5, 10, 20, 50 ],
								limit : 10, //每页默认显示的数量
								loading : true,
								cols : [ [ // 表头
								{
									field : 'goodsid',
									title : 'ID',
									align : 'center',
									width : 80
								}, {
									field : 'goodsname',
									title : '商品名称',
									align : 'center'
								},
								 {
									field : 'price',
									title : '价格',
									align : 'center'
								}, {
									field : 'unit',
									title : '单位',
									align : 'center'
								},{
									field : 'description',
									title : '描述',
									align : 'center',
								}, {
									title : '操作',
									fixed : 'right',
									align : 'center',
									toolbar : '#goodsBar',
									width : 160
								}  ] ]
							});

							// 监听行工具事件
							table
									.on(
											'tool(goods)',
											function(obj) {
												var data = obj.data // 获得当前行数据
												, layEvent = obj.event; // 获得 lay-event 对应的值
												if (layEvent === 'del') {
													<shiro:lacksPermission name='deleteGoods'>
													layer.msg('对不起，您无此权限')
													return
												</shiro:lacksPermission>
													deletegoodsByCid(data.goodsid);
												} else if (layEvent === 'edit') {
													//请求编辑商品的页面，并自动填写商品信息
													<shiro:lacksPermission name='editGoods'>
														layer.msg('对不起，您无此权限')
														return
													</shiro:lacksPermission>
													editGoods(data.goodsid);
												}
											});
							active={
									addGoodsPage:function(){
										<shiro:lacksPermission name='addGoods'>
											layer.msg('对不起，您无此权限')
											return
										</shiro:lacksPermission>
										addGoodsPage();
									}
							}
							$('.addGoodsPage').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});

						});
	</script>
</body>
</html>
