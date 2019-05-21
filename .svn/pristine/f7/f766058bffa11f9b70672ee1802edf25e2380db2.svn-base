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
<title>用户管理</title>
<link rel="stylesheet" href="plugins/layui/css/layui.css">
<script src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
<script src="<%=basePath%>/plugins/layui/layui.js"></script>
<script src="<%=basePath%>/js/wdf/sysuser.js"></script>
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
	<blockquote class="layui-elem-quote">
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal addUser" data-type='addUser'>添加用户</a>
		</div>
	</blockquote>
	<table class="layui-hide" id="userTable" lay-filter="user"></table>
	<script type="text/html" id="userBar">
{{#  if(d.username!='admin'){ }}
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
 {{#  } }}
</script>

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
							table
									.render({
										elem : '#userTable',
										url : 'user/selectAllUser.dx',// 数据接口
										id : 'userTable',
										loading : true,
										cols : [ [ // 表头
												{
													align : 'center',
													field : 'username',
													title : '用户名',
													sort : true
												},
												{
													align : 'center',
													field : 'password',
													title : '密码'
												},
												{
													align : 'center',
													templet : "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>",
													title : '创建时间'
												},
												{
													align : 'center',
													templet : "<div>{{d.lastLoginTime==null?'':layui.util.toDateString(d.lastLoginTime, 'yyyy-MM-dd HH:mm:ss')}}</div>",
													title : '最后登录时间'
												}, {
													title : '操作',
													fixed : 'right',
													align : 'center',
													toolbar : '#userBar'
												} ] ]
									});

							// 监听行工具事件
							table.on('tool(user)', function(obj) {
								var data = obj.data // 获得当前行数据
								, layEvent = obj.event; // 获得 lay-event 对应的值
								if (layEvent === 'del') {
									<shiro:lacksPermission name='deleteUser'>
										layer.msg('对不起，您无此权限');
										return
									</shiro:lacksPermission>
									deleteUser(data.id);
								} else if (layEvent === 'edit') {
									<shiro:lacksPermission name='editUser'>
										layer.msg('对不起，您无此权限');
										return
									</shiro:lacksPermission>
									user = data;
									layer.open({
										type : 2,
										title : '编辑用户',
										content : 'jsp/sysuser/editUser.jsp',
										area : [ '300px', '200px' ],
									});
								}
							});
							active = {
									addUser:function(){
										<shiro:lacksPermission name='addUser'>
											layer.msg('对不起，您无此权限');
											return
										</shiro:lacksPermission>
										addUserForm();
									}
							}
							$('.addUser').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});
						});
	</script>

</body>
</html>
