<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--shiro 标签 --%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>信阳鼎星科技有限公司</title>

<link rel="stylesheet" href="<%=basePath%>/plugins/layui/css/layui.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link rel="stylesheet" href="<%=basePath%>/build/css/app.css"
	media="all">
<style type="text/css">
#helpStyle {
	margin-top: 200px;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
</head>

<body>
	<div class="layui-layout layui-layout-admin kit-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">鼎星科技</div>
			<div class="layui-logo kit-logo-mobile">DX</div>
			<ul class="layui-nav layui-layout-right kit-nav" kit-navbar>
				<shiro:hasPermission name="kaipiao">
					<li class="layui-nav-item lockcms"><span
						style='cursor: pointer; color: green;'>锁屏</span></li>
					<li class="layui-nav-item"><a href="javascript:;" kit-target
						data-url='jsp/notice.jsp' data-icon='&#xe63a;' data-title='全部消息'
						data-id='7' title='通知'> <i
							class="layui-icon layui-icon-notice" style="font-size: 18px;"></i>
							<span class="layui-badge-dot" style='margin-left: 10px'></span>

					</a></li>
				</shiro:hasPermission>
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="./build/images/dx_logo.png" class="layui-nav-img"> <shiro:principal
							property="username" />
				</a>
					<dl class="layui-nav-child ">
						<dd>
							<a href="javascript:;" kit-target
								data-options="{url:'user/personalMessagePage.dx',icon:'&#xe63c;',title:'个人资料',id:'personalMessage'}">
								个人资料</a>
						</dd>
						<dd>
							<a href="javascript:;" kit-target
								data-options="{url:'jsp/sysuser/updatePassword.jsp',icon:'&#xe673;',title:'修改密码',id:'updatePassword'}">
								修改密码</a>
						</dd>
						<dd>
							<a href="logout.dx"> 注销</a>
						</dd>
					</dl></li>

				<li class="layui-nav-item" lay-unselect=""><a
					href="javascript:help();" layadmin-event="about" title="帮助"><i
						class="layui-icon layui-icon-more-vertical"
						style="font-size: 18px;"></i></a></li>
			</ul>
		</div>
		<div class="layui-side layui-bg-black kit-side">
			<div class="layui-side-scroll">
				<div class="kit-side-fold">
					<i class="layui-icon">&#xe668;</i>
				</div>
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar"
					kit-navbar>
					<shiro:hasPermission name="salesManage">
						<li class="layui-nav-item"><a href="javascript:;" kit-target
							data-options="{url:'jsp/sales/salesManage.jsp',icon:'&#xe658;',title:'销售管理' ,id:'1'}"><i
								class="layui-icon">&#xe658;</i><span> 销售管理</span></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="ticketManage">
						<li class="layui-nav-item"><a href="javascript:;" kit-target
							data-options="{url:'jsp/ticket/ticketManage.jsp',icon:'&#xe658;',title:'发票管理',id:'ticket'}"><i
								class="layui-icon">&#xe658;</i><span> 发票管理</span></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="paymentManage">
						<li class="layui-nav-item"><a href="javascript:;" kit-target
							data-options="{url:'jsp/payment/payment.jsp',icon:'&#xe658;',title:'银行流水管理',id:'payment'}"><i
								class="layui-icon">&#xe658;</i><span> 银行流水</span></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="customerManage">
						<li class="layui-nav-item"><a href="javascript:;" kit-target
							data-options="{url:'jsp/customer/customerManage.jsp',icon:'&#xe658;',title:'单位管理',id:'customer'}"><i
								class="layui-icon">&#xe658;</i><span> 单位管理</span></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="goodsManage">
						<li class="layui-nav-item"><a href="javascript:;" kit-target
							data-options="{url:'jsp/goods/goodsManage.jsp',icon:'&#xe658;',title:'商品管理',id:'goods'}"><i
								class="layui-icon">&#xe658;</i><span> 商品管理</span></a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="systemManage">
						<li class="layui-nav-item"><a href="javascript:;"><i
								class="layui-icon" aria-hidden="true">&#xe658;</i><span>
									系统管理</span></a>
							<dl class="layui-nav-child">
								<shiro:hasPermission name="userManage">
									<dd>
										<a href="javascript:;" kit-target
											data-options="{url:'jsp/sysuser/userManage.jsp',icon:'&#xe614;',title:'用户管理',id:'userManage'}">
											&nbsp; &nbsp;<i class="layui-icon">&#xe614;</i><span>
												用户管理</span>
										</a>
									</dd>
								</shiro:hasPermission>
								<shiro:hasPermission name="roleManage">
									<dd>
										<a href="javascript:;" data-url="jsp/sysuser/roleManage.jsp"
											data-icon="&#xe614;" data-title="角色管理" kit-target
											data-id='roleManage'> &nbsp; &nbsp;<i class="layui-icon">&#xe614;</i><span>
												角色管理</span>
										</a>
									</dd>
								</shiro:hasPermission>
								<shiro:hasPermission name="userRoleManage">
									<dd>
										<a href="javascript:;"
											data-url="jsp/sysuser/user_roleManage.jsp"
											data-icon="&#xe614;" data-title="用户_角色" kit-target
											data-id='user_role'> &nbsp; &nbsp;<i class="layui-icon">&#xe614;</i><span>
												用户_角色</span>
										</a>
									</dd>
								</shiro:hasPermission>
								<shiro:hasPermission name="permissionList">
									<dd>
										<a href="javascript:;" kit-target
											data-url='jsp/sysuser/permissionManage.jsp'
											data-icon='&#xe614;' data-title='权限列表'
											data-id='permissionManage'> &nbsp; &nbsp;<i
											class="layui-icon">&#xe614;</i><span> 权限列表</span>
										</a>
									</dd>
								</shiro:hasPermission>
							</dl></li>
					</shiro:hasPermission>
				</ul>
			</div>

		</div>
		<div class="layui-body" id="container">
			<!-- 内容主体区域 -->
			<div style="text-align: center; margin-top: 400px; font-size: 30px">内容加载中,请稍等...</div>

		</div>
		<!-- 底部 -->
		<div class="layui-footer footer" style="text-align: center;">
			<p>
				copyright @2018 <a href="http://www.dxsoft.com.cn/" target="_blank"
					style='color: blue;'>信阳鼎星科技有限公司</a>
			</p>
		</div>
	</div>

	<!-- 锁屏 -->
	<div id="lock-box" style="display: none;">
		<div style='width: 300px; height: 200px; text-align: center;'>
			<input type='password' name="lockPwd" placeholder="请输入密码解锁.."
				id="lockPwd"
				style='width: 150px; height: 38px; display: inline-block; margin-top: 50px'
				class='admin-header-lock-input layui-input'>
			<button class="layui-btn" id="unlock">解锁</button>
			<p style='margin-top: 20px; color: red'>请输入登录密码，否则不会解锁成功哦！！！</p>
		</div>
	</div>
	<!-- 帮助信息页面 -->
	<div id='helpInfo' style='display: none; margin: 20px'>


		<p>信阳公司信息：</p>
		<p>公司名称：信阳鼎星科技有限公司</p>
		<p>地址：信阳市东方红大道银珠广场1号楼2802室</p>
		<p>电话：6262105</p>
		<p>信阳对公账户：</p>
		<p>账户：16 796 1010 4000 7134</p>
		<p>开户行：中国农业银行股份有限公司信阳中山北路分理处</p>
		<br>

		<p>郑州公司信息：</p>
		<p>公司名称：河南鼎星软件科技有限公司</p>
		<p>地址：河南省郑州市航空港区兴瑞汇金国际4号楼1601室</p>
		<p>电话：6262105</p>
		<p>纳税人识别号：91410100MA44JJBL5X</p>
		<p>郑州对公账户：</p>
		<p>账户：262457167030</p>
		<p>开户行：中国银行郑州新港大道支行</p>
		<br>
		
		<p>支付宝账户：13837695029</p>
		<p>微信账户：13837695029</p>
		<br>

		<p>转账备注：</p>
		<p>转账时请一定要注明单位名称</p>
		<p>转账时请一定要注明单位名称</p>
		<p>转账时请一定要注明单位名称</p>
		<p>公司规定先转账后开票，转账后请提供回执单或者转账凭证截图</p>
		<p>开票信息发过来（开票抬头，纳税人识别号，联系人姓名，手机，邮箱）</p>
		<p>发票是电子发票，直接推送到您提供的手机和邮箱，请于三个工作日内查收，下载打印即可</p>
		<br>
	</div>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script>
		var message;
		var table;
		layui
				.config({
					base : 'build/js/',
				})
				.use(
						[ 'app', 'message', 'tree', 'layer', 'element', 'table' ],
						function() {
							var app = layui.app, layer = layui.layer, $ = layui.jquery, tree = layui.tree, element = layui.element, message = layui.message, table = layui.table;
							//主入口
							tab.config.mainUrl = "jsp/main.jsp";
							app.set({
								type : 'iframe',
							}).init();

							/* 锁屏开始 */
							function lockPage() {
								layer.open({
									type : 1,
									title : false,
									anim : 0, // 0-6的动画形式，-1不开启
									content : $("#lock-box"),
									closeBtn : 0,
									shade : 0.9
								})
							}
							$(".lockcms").on("click", function() {
								window.sessionStorage.setItem("lockcms", true);
								lockPage();
							})
							// 判断是否显示锁屏
							if (window.sessionStorage.getItem("lockcms") == "true") {
								lockPage();
							}
							// 解锁
							$("#unlock")
									.on(
											"click",
											function() {
												if ($(this)
														.siblings(
																".admin-header-lock-input")
														.val() == '') {
													layer.msg("请输入解锁密码！");
												} else {
													if ($(this)
															.siblings(
																	".admin-header-lock-input")
															.val() == '<shiro:principal property='password' />') {
														window.sessionStorage
																.setItem(
																		"lockcms",
																		false);
														$(this)
																.siblings(
																		".admin-header-lock-input")
																.val('');
														layer.closeAll("page");
													} else {
														layer
																.msg("密码错误，请重新输入！");
													}
												}
											});
							/* 锁屏结束 */
						});

		function help() {
			layer.open({
				type : 1,
				title : '帮助',
				shade : false,
				area : [ '300px', '90%' ],
				offset : 'r',
				skin : '#helpStyle',
				btn : [ '关闭' ],
				anim : 2,//弹出动画
				content : $('#helpInfo')
			});
		}
	</script>
	<script src="showImg/zx-image-view/polyfill.min.js"></script>
	<script src="showImg/zx-image-view/js/zx-image-view.min.js"></script>
	<script>
		// 初始化参数
		var _config = {
			// 分页mouseover切换图片
			paginationable : true,
			// 显示关闭按钮
			showClose : false,
			// 显示上一张/下一张箭头
			showSwitchArrow : true,
			// 显示分页导航栏
			showPagination : true,
			// 显示工具栏
			showToolbar : true,
			// 缩放
			scalable : true,
			// 旋转
			rotatable : true,
			// 移动
			movable : true,
			//背影遮罩
			backgroundOpacity : 0.2,
			//显示关闭预览窗口按钮，默认值true
			showClose : false,
		// 键盘配置
		/* keyboard: {
		 scale: ['equal', 'minus']
		} */
		}
		function preViewImg(imgs) {
			var ziv = new ZxImageView(_config, imgs);
			ziv.view();
		}
	</script>
</body>

</html>