<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>权限列表</title>
<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css">
<style>
body {
	margin: 50px;
}
</style>

</head>
<body>
	<div class='layui-main' style='width: 1000px'>
		<table class="layui-hide" id="permissionTable" lay-filter="permission"></table>
	</div>
	<script type="text/html" id="permissionBar">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑 </a>
	</script>

	<script type="text/javascript"
		src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>

	<script>
		layui.use([ 'layer', 'table', 'element' ], function() {
			var layer = layui.layer // 弹层
			, element = layui.element; // 元素操作
			table = layui.table;
			table.render({
				elem : '#permissionTable',
				url : 'permission/selectAllPermission.dx',// 数据接口
				title : '权限列表',
				page : true,// 开启分页
				id : 'permissionTable',
				limits : [ 5, 10, 20, 50 ],
				limit : 10, //每页默认显示的数量
				loading : true,
				cols : [ [ // 表头
				{
					align : 'center',
					field : 'name',
					title : '权限名称',
				}, {
					title : '操作',
					fixed : 'right',
					align : 'center',
					toolbar : '#permissionBar',
					width : 100
				} ] ]

			});
			
			// 监听行工具事件
			table.on('tool(permission)', function(obj) {
				var data = obj.data // 获得当前行数据
				, layEvent = obj.event; // 获得 lay-event 对应的值
				if (layEvent === 'edit') {
					<shiro:lacksPermission name='editPermission'>
						layer.msg('对不起，您无此权限');
						return
					</shiro:lacksPermission>
					permission = data;
					layer.open({
						type : 2,
						title : '编辑权限名称',
						content : 'jsp/sysuser/editPermission.jsp',
						area : [ '300px', '200px' ],
					});
				}
			});


		});

	</script>

</body>
</html>
