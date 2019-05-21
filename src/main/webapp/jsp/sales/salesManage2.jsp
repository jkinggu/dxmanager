<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String customerid = request.getParameter("customerid");
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

</style>
</head>
<body>
	<table class="layui-hide" id="salesTable" lay-filter="salesC"></table>

	<script type="text/html" id="credentionalsTemplet2">
 {{#  if(d.paycredentials=='有'){ }}
    <a href='javascript:lookCredentials({{d.salesid }});'  class="layui-table-link" style='color:green;' >查看</a>
  {{#  } else { }}
	无
  {{#  } }}
 
</script>
	<script src="<%=basePath%>/plugins/layui/layui.js"></script>
	<script src="<%=basePath%>/js/wdf/sales.js"></script>

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
										elem : '#salesTable',
										url : 'sales/selectSalesByCid.dx',// 数据接口
										title : '销售信息详情表',
										id : 'idwdf03',
										loading : true,
										cols : [ [ // 表头
												{
													field : 'salesdate',
													title : '销售时间',
													sort : true,
													width : 105,
													align : 'center',
												},
												{
													templet : "<div>{{d.goods==null?' ':d.goods.goodsname}}</div>",
													title : '商品名称',
													align : 'center',
												},
												{
													field : 'amount',
													title : '总金额',
													width : 90,
													align : 'center',
												},
												{
													templet : '<div>{{d.linkman }} {{d.tel }}</div>',
													title : '联系人',
													align : 'center',
													width:200
												},
												{
													field : 'email',
													title : '邮箱',
													align : 'center',
													width:200
												},
												{
													field : 'ticketnum',
													title : '发票号码',
													width : 100,
													align : 'center',
												},
												{
													field : 'payment',
													title : '支付方式',
													width : 90,
													align : 'center',
												},
												{
													templet : "#credentionalsTemplet2",
													title : '支付凭证',
													width : 90,
													align : 'center',
												},{
													field : 'note',
													title : '备注',
													align : 'center',
												}
												] ],
										where : {
											customerid : <%=customerid %>
										},
										done:function(res){
											$.each(res.data,function(i,sales){
												if(sales.timelimit=="未对账"){
													$("tbody").find('tr').eq(i).css("background-color","#99ecab");
												}
											})
										}
									});

						});
	</script>
	<script src="<%=basePath%>/showImg/zx-image-view/polyfill.min.js"></script>
	<script src="<%=basePath%>/showImg/zx-image-view/js/zx-image-view.min.js"></script>
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
					parent.parent.preViewImg(imgs);
				},
				error:function(){
					layer.msg('网络异常，请稍后重试')
				}
			}) 
		}
	</script>
</body>
</html>
