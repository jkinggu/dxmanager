<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>登录</title>
<%
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
%>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css"
	href="template/loginpage/css/bootstrap.min.css">
<!-- 框架 -->
<link href="template/loginpage/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="template/loginpage/css/Main.min.css" rel="stylesheet" />

</head>
<body class="loginPage">
	<div class="loginbox">
		<header>
		<h2>登录</h2>
		</header>
		<form method="post" class="loginForm">
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-user fa-fw"></i>
					</div>
					<input class="form-control" type="text" placeholder="用户名"
						id="username" name="username">
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-desktop fa-fw"></i>
					</div>
					<input class="form-control" type="password" placeholder="密码"
						id="password" name="password">
				</div>
			</div>
			<!-- <div class="checkbox">
				<label> <input type="checkbox" id="rememberMe"> 记住我
				</label>
			</div> -->
			<button type="submit" class="btn btn-primary">登录系统</button>
		</form>
	</div>

	<!-- jquery.js -->
	<script type="text/javascript"
		src="template/loginpage/js/jquery-1.11.0.min.js"></script>
	<!-- bootstrap.js -->
	<script type="text/javascript"
		src="template/loginpage/js/bootstrap.min.js"></script>
	<script src="template/layui/layer/layer.js"></script>

	<script>
		var loginbox = {
			initialize : function() {
				var winheight = $(window).height(), lbheight = $('.loginbox')
						.height();
				var paddingTop = (winheight - lbheight) / 2 - 50;
				$('.loginPage').css('padding-top', paddingTop + 'px');
			}

		}
		$(function() {

			loginbox.initialize();

			$(window).resize(function() {
				loginbox.initialize();
			});

			$('button').click(function(e) {
				e.preventDefault();
				username = $("#username").val();
				password = $("#password").val();
				if (username == "" || username == null) {
					layer.msg('请输入用户名');
					return false;
				}
				if (password == "" || password == null) {
					layer.msg('请输入密码');
					return false;
				}
				var loginMsg = layer.msg('登录中...', {
					icon: 16,
					 shade: 0.1,
					 time:0
				});
				$.ajax({
					type : "post",
					url : "user/userLogin.dx",
					data : {
						"username" : username,
						"password" : password,
						//"rememberMe" : $("#rememberMe").prop('checked')
						"rememberMe" : false

					},
					dataType : "json",
					sync : true,
					beforeSend : function() {
						
					},
					success : function(result) {
						if (result && result.status != 200) {
							layer.msg(result.message);
							$('#password').val('');
							return;
						} else {
							window.location.href = result.back_url;
						}
					},
					error : function() {
						layer.msg('网络异常！请稍后重试');
					},
					complete:function(){
						layer.close(loginMsg);
					}
				})

			});

		})
	</script>




</body>
</html>