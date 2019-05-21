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
<title>销售管理</title>
<link rel="stylesheet" href="plugins/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>
<style>
body {
	margin: 10px;
}

.layui-form-checkbox {
	margin-right: 0px;
}
.layui-table-click{
	    background-color:#ddf2e9 !important;
	}
</style>
</head>
<body>
	<blockquote class="layui-elem-quote news_search layui-form">
		<div class="layui-inline demoTable">

			<div class="layui-input-inline" style='width: 120px'>
				<select name="membership" id='membership' lay-search
					lay-filter="membership">
					<option value="全部">所有县区</option>

				</select>
			</div>

			<div class="layui-inline">
				<div class="layui-input-inline">
					<input placeholder="单位代码 / 名称" class="layui-input" type="text"
						id="codeOrName">
				</div>
			</div>
			<div class="layui-inline">
				<!-- <label class="layui-form-label" style='width:60px;text-align: center;padding-left:0px;padding-right:0px;'>日期范围</label> -->
				<div class="layui-input-inline">
					<input type="text" class="layui-input" id="salesdateRange"
						placeholder="点击选择销售日期范围">
				</div>
			</div>
			<div class="layui-input-inline" style='width: 125px'>
				<select name="payment" id='payment' lay-search lay-filter='payment'>
					<option value="全部">所有付款方式</option>
					<option value="转帐">转帐</option>
					<option value="刷卡">刷卡</option>
					<option value="现金">现金</option>
					<option value="微信">微信</option>
					<option value="公司微信">公司微信</option>
					<option value="支付宝">支付宝</option>
					<option value="其他">其他</option>

				</select>
			</div>
			<input type="checkbox" name="notGetMoney" id='notGetMoney'
				title="未对账"> <input type="checkbox" name="haveTicket"
				id='haveTicket' title="已开票">
			<div class="layui-input-inline" style='width: 100px'>
				<select name="payeebank" id='payeebank' lay-search
					lay-filter='payeebank'>
					<option value="全部">所有账户</option>
					<option value="中国农业银行信阳分行中山北路分理处">信阳农行</option>
					<option value="中国银行郑州新港大道支行">郑州中行</option>
				</select>
			</div>
			<button class="layui-btn" data-type="reload" id="sales_search">搜索</button>
		</div>
		<shiro:hasPermission name="zhangmuJiaodui">
			<div class="layui-inline">
				<a class="layui-btn layui-btn-normal newsAdd_btn" id="spbill"
					onclick="spbill()">账目校对</a>
			</div>
		</shiro:hasPermission>

	</blockquote>
	<div id='st'>
	<table class="layui-hide" id="salesTable" lay-filter="sales"></table>
</div>
	<blockquote class="layui-elem-quote " id='dzArea'
		style='margin-bottom: 0px; border-left: 0px; background-color:orange;display: none'>
		<span id='tuozhuai'> 
		<div class="layui-input-inline" style="margin-left: 15px;">
			<label>应付金额</label> <input type="text" id="payMoney"
				style='width: 60px; height: 25px;' readonly>
		</div>
		<div class="layui-input-inline" style="margin-left: 15px;">
			<label>到账金额</label> <input type="text" id="receiveMoney"
				style='width: 60px; height: 25px;' readonly>
		</div>
		</span>
		<div class="layui-input-inline" style="margin-left: 15px;">
			<a class="layui-btn " lay-event="" id='checkAccounts'>对账</a>
		</div>
	</blockquote>
	<div id='paymentTableArea' style='display: none'>
		<table class="layui-hide" id="paymentTable" lay-filter="payment"></table>
	</div>

	<div style='display: none; margin: 10px' id='upCredentialsPage'>
		<input type='hidden' id='uploadSId'>
		<div class="layui-upload-drag" id="pzSelect"
			style='width: 220px; height: 100px; margin: 5px auto'>
			<i class="layui-icon"></i>
			<p>点击上传，或将图片拖拽到此处</p>
		</div>
	</div>
	<script type="text/html" id="credentionalsTemplet">
 {{#  if(d.paycredentials=='有'){ }}
    <a href='javascript:lookCredentials({{d.salesid }});'  class="layui-table-link" style='color:green;' >查看</a> | 
    <a href='javascript:showUpCredentials({{d.salesid }});'  class="layui-table-link">上传</a>
  {{#  } else { }}
	 <a href='javascript:showUpCredentials({{d.salesid }});'  class="layui-table-link">上传</a>
  {{#  } }}
	</script>
	<script type="text/html" id='salesToolbar'>
 <a class="layui-btn" lay-event="update">编辑</a>
  <a class="layui-btn layui-btn-danger" lay-event="delete">批量删除</a>
  <a class="layui-btn layui-btn-warm" lay-event="export">导出Excel</a>
  <a class="layui-btn layui-btn-danger" lay-event="clearCredentials">清空凭证</a>
	</script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/sales.js"></script>
	<script src="<%=basePath%>/js/wdf/customer.js"></script>
	<script>
		var payMoney
		var receiveMoney;
		var salesIds = [];
		var paymentIds = [];
		var membership = '';
		var salesdateRange = '';
		var payment = '';
		// 自定义模块
	    layui.config({
	        base: 'build/js/'
	    }).use(
						[ 'form', 'laydate', 'layer', 'upload',
								'element','table' ,'tableMerge','excel'],
						function() {
							var laydate = layui.laydate // 日期
							, form = layui.form
							, layer = layui.layer // 弹层
							, upload = layui.upload // 上传
							, element = layui.element // 元素操作
							,tableMerge = layui.tableMerge
							, $ = layui.$
							,excel = layui.excel;
							laydate.render({
							    elem: '#salesdateRange'
							    ,range: '~'
							    ,max: 'new Date()'
							    ,format: 'yyyyMMdd'
							    ,done: function(value, date){
							    	salesdateRange = value;
							    	   }
							  });
							/************凭证上传开始**************/
							var uploadTool = upload
									.render({
										elem : '#pzSelect',
										url : 'sales/uploadCredentials.dx',
										accept : 'images', 
										acceptMime : 'image/*',
										//multiple : true,
										before:function(){
											//自定义上传参数
											uploadData = {
												"salesid" : $('#uploadSId').val()
											};
											//上传时额外数据参数（uploadTool.config.data）
											uploadTool.config.data = uploadData;
										},
										done : function(res, index, upload) {
											 if(res.code == 200){
												 layer.msg(res.msg);
												 layer.closeAll('page');
												 table.reload('salesTable');
											 }else{
												 layer.msg(res.msg,{icon:5});
											 }
										},
										allDone: function(obj){ //当文件全部被提交后，才触发
											
										  },
										error : function(index, upload) {
											layer.msg("网络异常，请稍后重试！",{icon:2})
										}
									});
							/************凭证上传结束**************/
							table = layui.table;
							// 执行一个 table 实例
									table.render({
										elem : '#salesTable',
										//height : 530,
										url : 'sales/selectAllSales.dx',// 数据接口
										title : '销售信息详情表',
										//cellMinWidth : 70, //全局定义常规单元格的最小宽度
										page : true,// 开启分页
										toolbar : '#salesToolbar', // 开启工具栏
										defaultToolbar: ['filter'],
										id : 'salesTable',
										limits : [5, 10, 20, 30, 40, 50 ,100],
										limit : 10, //每页默认显示的数量
										loading : true,
										totalRow:true,
										//height:560,
										cols : [ [ // 表头
												{align : 'center',type : 'checkbox',fixed : 'left',totalRowText:"合计："}
												,{align : 'center',merge: true,field : 'salesdate',title : '销售时间',sort : true,width : 105}
												,{align : 'center',field:'customer',templet : '<div>{{d.customer.customername}}</div>',title : '购买客户',minWidth : 250}
												,{align : 'center',field:'goods',templet : '<div>{{d.goods==null?"":d.goods.goodsname}}</div>',title : '商品名称',minWidth : 250}
												,{align : 'center',field : 'amount',title : '总金额',width : 100,totalRow:true}
												,{align : 'center',field : 'receipt',title : '开票名称',minWidth : 100,hide:true}
												,{align : 'center',field:'ticketnum',templet : "<div>{{d.ticketnum==''?'<a href='javascript:;'style='color:red'>待开票</a>':d.ticketnum}}</div>",title : '发票号码',width : 100}
												,{align : 'center',field : 'payment',title : '支付方式',width : 90}
												,{align : 'center',field : 'paycredentials',templet : "#credentionalsTemplet",title : '支付凭证',width : 100}
												,{align : 'center',field : 'payeebank',templet : "<div>{{d.payeebank=='中国农业银行信阳分行中山北路分理处'?'信阳农行':'郑州中行'}}</div>",title : '收款账户',minWidth : 150}
												,{align : 'center',field : 'customer',templet : '<div>{{d.customer.creditcode}}</div>',title : '信用代码',hide:true}
												,{align : 'center',field:'linkman',templet : "<div>{{d.linkman }} {{d.tel }}</div>",title : '联系人',hide:true}
												,{align : 'center',field : 'email',	title : '邮箱',hide:true}
												,{align : 'center',field : 'note',	title : '备注',hide:true}
												] ]
												,done: function(res, page, count){
													 tableMerge.render(this);
											    }
									});

							// 执行一个 流水table 实例
							table.render({
								elem : '#paymentTable',
								url : 'payment/selectAllPayment.dx',// 数据接口
								title : '流水详情表',
								page : true,// 开启分页
								id : 'paymentTable',
								limits : [ 5, 10, 20, 30, 40, 50 ],
								limit : 10, //每页默认显示的数量
								loading : true,
								cols : [ [ // 表头
								{align : 'center',type : 'checkbox',fixed : 'left'}
								,{align : 'center',field : 'transdate',	title : '交易日期',sort : true,width : 105}
								,{align : 'center',templet : "<div>{{d.payeebank=='中国农业银行信阳分行中山北路分理处'?'信阳农行':'郑州中行'}}</div>",title : '流水账户'}
								,{align : 'center',field : 'received',title : '收入金额'}
								,{align : 'center',field : 'bankname',title : '交易行名'}
								,{align : 'center',field : 'banknum',title : '开户行账号'}
								,{align : 'center',field : 'name',title : '开户人户名'}
								,{align : 'center',field : 'remark',title : '交易附言'} 
								] ]
							});
							active = {
								reload : function() {
									//执行重载
									table.reload('salesTable', {
										where : {
											"notGetMoney" : $('#notGetMoney').prop('checked'),
											"haveTicket":$('#haveTicket').prop('checked'),
											"codeOrName" : $('#codeOrName').val().replace(/[ ]/g, ""),
											"membership" : membership,
											"salesdateRange":salesdateRange,
											"payment":payment,
											payeebank:$('#payeebank').val()
										}
									});
								}
								
							};
							$('#sales_search').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});
							//监听选择框事件
							form.on('select(membership)', function(data){
								  membership = data.value=="全部"?null:data.value; //得到被选中的值
								});
							form.on('select(payment)', function(data){
								  payment = data.value=="全部"?null:data.value; //得到被选中的值
								});
						
							// 监听头工具栏事件
							table
									.on(
											'toolbar(sales)',
											function(obj) {
												var checkStatus = table.checkStatus(obj.config.id);
												data = checkStatus.data; // 获取选中的数据
												switch (obj.event) {
												case 'add':
													<shiro:lacksPermission name='addSales'>
													layer.msg("对不起，您无此权限")
													return
												</shiro:lacksPermission>
													aadSalesForm('新增销售记录');
													break;
												case 'update'	:
													<shiro:lacksPermission name='editSales'>
													layer.msg("对不起，您无此权限")
													return
												</shiro:lacksPermission>
													if (data.length === 0) {
														layer.msg('请选择一行');
													} else if (data.length > 1) {
														layer.msg('只能同时编辑一个');
													} else {
														editSalesPage(data[0].salesid)
													}
													break;
												case 'delete':
													<shiro:lacksPermission name='deleteSales'>
													layer.msg("对不起，您无此权限")
													return
												</shiro:lacksPermission>
													if (data.length === 0) {
														layer.msg('请选择销售记录');
														return
													} 
													deleteSales(salesIds);
													break;
												case 'export':
													<shiro:lacksPermission name='exportSales'>
													layer.msg("对不起，您无此权限")
													return
												</shiro:lacksPermission>
													notGetMoney =  $('#notGetMoney').prop('checked');
													haveTicket = $('#haveTicket').prop('checked');
													codeOrName =  $('#codeOrName').val().replace(/[ ]/g, "");
													strParam = "notGetMoney="+notGetMoney+"&haveTicket="+haveTicket+"&codeOrName="+codeOrName+"&membership="+membership+"&salesdateRange="+salesdateRange+"&payment="+payment;
													//window.location.href="<%=basePath%>sales/exportSalesInfo.dx?"+strParam;
													layer.confirm("确定导出数据到excel表",function(index){
														layer.close(index);
														layer.load(2);
														setTimeout(function() {
															$.ajax({
																type : "POST",
																url : "sales/exportSales.dx",
																//contentType:"application/x-www-form-urlencoded",
																data:{
																	notGetMoney :  notGetMoney,
																	haveTicket : haveTicket,
																	codeOrName :  codeOrName,
																	membership : membership,
																	salesdateRange : salesdateRange,
																	payment : payment
																},
																dataType : "json",
																async : false,
																success : function(res) {
																	if(res.code==200){
																		var pathFile = res.msg;
																		window.location.href='build/'+pathFile;
																	}else{
																		layer.msg(res.msg);
																	}
																},
																error : function() {
																	layer.msg("网络异常，请稍后重试！",{icon:5});
																},
																complete:function(){
																	layer.closeAll("loading");
																}
															})
														}, 3000)
														
													})
													break;
												case 'clearCredentials':
													<shiro:lacksPermission name='clearCredentials'>
													layer.msg("对不起，您无此权限")
													return
												</shiro:lacksPermission>
													if (data.length === 0) {
														layer.msg('请选择销售记录');
														return
													} 
													clearCredentials(salesIds);
													break;
												}
											});
							
							// 对账之获取客户应付金额
							table.on('checkbox(sales)',function(obj){
								var checkStatus = table.checkStatus('salesTable');
								data = checkStatus.data;
								
							//监听复选框事件，选中行高亮显示
							  if(obj.checked == true && obj.type == 'all'){
						        //点击全选
						        $('#st .layui-table-body table.layui-table tbody tr').addClass('layui-table-click');
						      }else if(obj.checked == false && obj.type == 'all'){
						        //点击全不选
						        $('#st .layui-table-body table.layui-table tbody tr').removeClass('layui-table-click');
						      }else if(obj.checked == true && obj.type == 'one'){
						        //点击单行
						        if(obj.checked == true){
						          obj.tr.addClass('layui-table-click');
						        }else{
						          obj.tr.removeClass('layui-table-click');
						        }
						      }else if(obj.checked == false && obj.type == 'one'){
						        //点击全选之后点击单行
						        if(obj.tr.hasClass('layui-table-click')){
						          obj.tr.removeClass('layui-table-click');
						        }
						      }
								payMoney = 0;
								salesIds = [];
								for(i=0;i<data.length;i++){
									var v1 = parseFloat(data[i].amount);
									salesIds.push(data[i].salesid);
									payMoney = payMoney + v1;
								}
								if(checkStatus.length==0){
									$('#payMoney').val(0);
								}else{
									$("#payMoney").val(payMoney);
								}
								
							})
							// 对账之获取银行账户到账金额
							table.on('checkbox(payment)',function(obj){
								var checkStatus = table.checkStatus('paymentTable');
								data = checkStatus.data;
								
								//监听复选框事件，选中行高亮显示
								  if(obj.checked == true && obj.type == 'all'){
							        //点击全选
							        $('#paymentTableArea .layui-table-body table.layui-table tbody tr').addClass('layui-table-click');
							      }else if(obj.checked == false && obj.type == 'all'){
							        //点击全不选
							        $('#paymentTableArea .layui-table-body table.layui-table tbody tr').removeClass('layui-table-click');
							      }else if(obj.checked == true && obj.type == 'one'){
							        //点击单行
							        if(obj.checked == true){
							          obj.tr.addClass('layui-table-click');
							        }else{
							          obj.tr.removeClass('layui-table-click');
							        }
							      }else if(obj.checked == false && obj.type == 'one'){
							        //点击全选之后点击单行
							        if(obj.tr.hasClass('layui-table-click')){
							          obj.tr.removeClass('layui-table-click');
							        }
							      }
								receiveMoney = 0;
								paymentIds = [];
								for(var p in data){
									var v2 = parseFloat(data[p].received);
									paymentIds.push(data[p].paymentid);// 获取所有被选中的银行张混流水记录的流水编号paymentid
									receiveMoney = receiveMoney + v2;
								}
								if(checkStatus.length==0){
									$('#receiveMoney').val(0);
								}else{
									$("#receiveMoney").val(receiveMoney);
								}
								
							})
							$('#checkAccounts').on('click', function() {
								jiaoduizhangmu(salesIds,paymentIds,payMoney,receiveMoney)
							});
							

						});
	</script>
	<script src="<%=basePath%>/showImg/zx-image-view/polyfill.min.js"></script>
	<script
		src="<%=basePath%>/showImg/zx-image-view/js/zx-image-view.min.js"></script>
	<script>
	  function lookCredentials(salesid){
	  var imgs = [];
		  $.ajax({
				type:'post',
				url:'credentials/selectCredentialsByCid.dx',
				dataType:'json',
				async:false,
				data:{
					"salesid" : salesid
				},
				success:function(res){
					$.each(res,function(i,result){
						imgs.push({
						      url:result.url
						    })
					})
					if(imgs.length==0){
						  return layer.msg('暂无支付凭证')
					  }
					parent.preViewImg(imgs);
				},
				error:function(){
					layer.msg('网络异常，请稍后重试')
				}
			}) 
		}
	</script>
	<script type="text/javascript">
	$('#membership').append(gainMembership());
	</script>
</body>
</html>
