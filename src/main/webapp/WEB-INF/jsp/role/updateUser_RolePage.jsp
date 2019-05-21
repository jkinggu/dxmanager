<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>角色设置</title>
<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css">
<style>
body {
	margin: 20px;
}

.layui-input-block {
	margin-left: 50px;
}
</style>

</head>
<body>
	<form class="layui-form">
		<input type='hidden' id='userid' value='${userid }'>
		<c:forEach items='${roles }' var='role'>
			<c:set value="0" var="rids" />
			<div class="layui-form-item">
				<div class="layui-input-block">
					<c:forEach items='${userHasRoles }' var='ur'>
						<c:if test="${ur.id==role.id }">
							<input type="checkbox" name="role" lay-skin="primary"
								checked="checked" title="${role.name }" value='${role.id }'>
							<c:set value="1" var="rids" />
						</c:if>
					</c:forEach>
					<c:if test="${rids == '0' }">
						<input type="checkbox" name="role" lay-skin="primary"
							title="${role.name }" value='${role.id }'>
					</c:if>
				</div>
			</div>
		</c:forEach>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit
					lay-filter="updateUser_RoleForm">确定</button>
			</div>
		</div>
	</form>
	<script type="text/javascript"
		src="<%=basePath%>/js/jquery-1.11.0.min.js"></script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/sysuser.js"></script>
	<script>
		layui.use([ 'form' ], function() {
			var form = layui.form;
			//监听提交
			form.on('submit(updateUser_RoleForm)', function(data) {
				sLength = $('input:checkbox:checked').length;
				if (sLength == 0) {
					layer.msg('未选择角色');
					return false;
				}
				selectRoleIds = [];
				$.each($('input:checkbox:checked'), function() {
					selectRoleIds.push($(this).val());
				});
				userid = $('#userid').val();
				updateUser_Role(selectRoleIds, userid);
				return false;//阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		});
		
		
		/*根据用户id更新用户角色*/
		function updateUser_Role(selectRoleIds, userid) {
			$.ajax({
				type : "post",
				url : "user/updateUser_Roles.dx",
				data : {
					"selectRoleIds" : selectRoleIds,
					"userid" : userid
				},
				dataType : 'json',
				async : false,
				success : function(res) {
					if (res.code == 200) {
						parent.table.reload('user_roleTable');
						setTimeout(function() {
							parent.layer.closeAll('iframe');
						}, 1500)
						layer.msg(res.msg);
					} else {
						layer.msg(res.msg, {
							icon : 5
						});
					}
				},
				error : function() {
					layer.msg("网络异常！请稍后重试", {
						icon : 2
					});
				}

			});
		}
	</script>
</body>
</html>
