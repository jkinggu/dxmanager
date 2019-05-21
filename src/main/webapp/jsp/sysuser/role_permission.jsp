<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String roleid = request.getParameter("roleid");
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

h1, h2, h3 {
	padding: 10px 0;
}

#quanxianContent {
	width: 90%;
	border: 1px solid #9C9C9C;
	overflow: auto;
	margin-bottom: 30px;
	background-color: #fff;
	padding: 10px 0 25px 5px;
}

.partPer {
	width: 15%;
	float: left;
}
</style>
</head>
<body>
	<form class="layui-form">
		<div id='quanxianContent'>
			<div class='partPer'>
				<div id="xtree1"></div>
			</div>
			<div class='partPer'>
				<div id="xtree2"></div>
			</div>
			<div class='partPer'>
				<div id="xtree3"></div>
			</div>
			<div class='partPer'>
				<div id="xtree4"></div>
			</div>
			<div class='partPer'>
				<div id="xtree5"></div>
			</div>
			<div class='partPer'>
				<div id="xtree6"></div>
			</div>
			<div class='partPer'>
				<div id="xtree7"></div>
			</div>


			<!-- <div class="div-btns">
			<input type="button" id="btn1"
				value="获取全部[选中的][末级节点]原checkbox DOM对象，返回Array"
				class="layui-btn layui-btn-fluid" />
		</div> -->
			<!--
		<div class="div-btns">
			<input type="button" id="btn3" value="更新数据，重新渲染"
				class="layui-btn layui-btn-fluid" />
		</div>
		<div class="div-btns">
			<div class="layui-form-item">
				<label class="layui-form-label">value值</label>
				<div class="layui-input-block">
					<input type="text" id="txt1" placeholder="如：jd1.1"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<input type="button" id="btn4"
				value="通过value值找父级DOM对象，顶级节点与错误值均返回null"
				class="layui-btn layui-btn-fluid" />
		</div> -->
		</div>
		<div style='text-align: center; margin-top: 10px;'>
			<input type="button" value="确定" class="layui-btn layui-btn-fluid"
				style='width: 100px;' data-type="updateRole_Permission"
				id='updateRole_Permission' />
		</div>
	</form>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script src="plugins/layui/layui.js"></script>
	<!--引用xtree-->
	<script src="plugins/layui-xtree/layui-xtree.js"></script>
	<script type="text/javascript">
		layui.use([ 'form' ], function() {
			var form = layui.form;
			active = {
				updateRole_Permission : function() {
					layer.confirm("确认修改权限？",{title:"提示"},function(){
						var permissionIds = [];
						$('input:checkbox:checked').each(function(i) {
							permissionIds.push(this.value);
						})
						updateRole_Permission(<%=roleid%>, permissionIds);
					})
				}

			}
			$('#updateRole_Permission').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});

			var xtree1 = new layuiXtree({
				elem : 'xtree1',
				form : form,
				data : "permission/selectPermissions.dx?roleid=" +
	<%=roleid%>
		+ "&codeid=01",
				isopen : true //加载完毕后的展开状态，默认值：true
				,
				ckall : false //启用全选功能，默认值：false
				,
				ckallback : function() {
				} //全选框状态改变后执行的回调函数
				,
				icon : { //三种图标样式，更改几个都可以，用的是layui的图标
					open : "" //节点打开的图标
					,
					close : "" //节点关闭的图标
					,
					end : "" //末尾节点的图标
				},
				color : { //三种图标颜色，独立配色，更改几个都可以
					open : "#EE9A00" //节点图标打开的颜色
					,
					close : "#EEC591" //节点图标关闭的颜色
					,
					end : "#828282" //末级节点图标的颜色
				}
			});
			var xtree2 = new layuiXtree({
				elem : 'xtree2',
				form : form,
				data : "permission/selectPermissions.dx?roleid=" +
	<%=roleid%>
		+ "&codeid=02",

				icon : {
					open : "",
					close : "",
					end : ""
				}
			});
			var xtree3 = new layuiXtree({
				elem : 'xtree3',
				form : form,
				data : "permission/selectPermissions.dx?roleid=" +
	<%=roleid%>
		+ "&codeid=03",
				icon : {
					open : "",
					close : "",
					end : ""
				}
			});
			var xtree4 = new layuiXtree({
				elem : 'xtree4',
				form : form,
				data : "permission/selectPermissions.dx?roleid=" +
	<%=roleid%>
		+ "&codeid=04",
				icon : {
					open : "",
					close : "",
					end : ""
				}
			});
			var xtree5 = new layuiXtree({
				elem : 'xtree5',
				form : form,
				data : "permission/selectPermissions.dx?roleid=" +
	<%=roleid%>
		+ "&codeid=05",
				icon : {
					open : "",
					close : "",
					end : ""
				}
			});
			var xtree6 = new layuiXtree({
				elem : 'xtree6',
				form : form,
				data : "permission/selectPermissions.dx?roleid=" +
	<%=roleid%>
		+ "&codeid=06",
				icon : {
					open : "",
					close : "",
					end : ""
				}
			});

		});

		function updateRole_Permission(roleid, permissionIds) {
			var index = layer.load();
			$.ajax({
				type : "post",
				dataType : 'json',
				url : 'role/updateRole_Permission.dx',
				data : {
					permissionIds : permissionIds,
					roleid : roleid
				},
				async : false,
				success : function(res) {
					if (res.code == 200) {
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
					layer.msg('网络异常，请稍后重试', {
						icon : 2
					});
				}
			})
			layer.close(index);
		}
	</script>
</body>
</html>
