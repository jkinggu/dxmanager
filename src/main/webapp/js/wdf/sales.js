/** 展示销售信息编辑页面 */
function editSalesPage(salesid) {
	layer.open({
		type : 2,
		title : "销售信息编辑",
		content : 'sales/editSalesPage.dx?salesid=' + salesid,
		area : [ '500px', '90%' ],
	});
}

/**
 * 展示新增销售页面
 * 
 * @param customerid
 * @returns
 */
function addSalesPage(customerid) {
	layer.open({
		type : 2,
		title : "新增销售",
		content : 'sales/addSalesPage.dx?customerid=' + customerid,
		area : [ '500px', '90%' ],
	});
}

// 查看支付凭证
function checkCredentials(credentialsUrl) {
	window.open(credentialsUrl, '支付凭证');
	/*
	 * layer.open({ title : false, type : 1, content : "<img
	 * src="+credentialsUrl+" />", shadeClose : false });
	 */
}
/**
 * 查看单位购买商品详情
 * 
 * @param customer
 * @returns
 */
function selectSalesInfoByCid(customer) {
	layer.open({
		type : 2,
		title : '[' + customer.customername + ']购买商品详情',
		content : 'jsp/sales/salesManage2.jsp?customerid='+customer.customerid,
		area : [ '90%', '60%' ],
		maxmin : true,
		resize : true,// - 是否允许拉伸
	});

}

// 自动填充开票号码
function gainTicketnum() {
	var ticket = null;
	$.ajax({
		type : "post",
		url : "ticket/selectWillUseTicket.dx",
		dataType : "json",
		async : false,
		success : function(msg) {
			if (msg != "" && msg != null) {
				ticket = msg;
			} else {
				layer.alert('发票已用尽!请谨慎开票');
			}

		},
		error : function() {
			layer.alert('自动获取开票号码失败,可手动填写!');
		}
	});
	return ticket;
}


/**
 * 新增销售信息
 * 
 * @param sales
 *            sales对象
 * @returns
 */
function addSales(sales) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'sales/addSales.dx',
		data : sales,
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
			layer.msg('服务器忙，请刷新尝试', {
				icon : 2
			});
		}
	})
}
/**
 * 更新销售信息
 * 
 * @param sales
 *            sales对象
 * @returns
 */

function updateSales(sales) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'sales/updateSales.dx',
		data : sales,
		async : false,
		success : function(res) {
			if (res.code == 200) {
				parent.table.reload('salesTable');
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
			layer.msg('服务器忙，请刷新尝试', {
				icon : 2
			});
		}
	})
}
/* 删除销售记录 */
function deleteSales(salesIds) {
	layer.confirm('确定删除?', function(index) {
		$.ajax({
			type : "post",
			url : "sales/deleteSales.dx",
			dataType : "json",
			data : {
				'salesIds' : salesIds
			},
			async : false,
			success : function(res) {
				if (res.code == 200) {
					layer.msg(res.msg)
					// 刷新父页面销售数据表格
					table.reload('salesTable');
					table.reload('paymentTable');
				} else {
					layer.msg(res.msg, {
						icon : 2
					})
				}
			},
			error : function() {
				layer.msg('网络异常，请重新操作', {
					icon : 5
				})
			}
		});
	});
}
/**
 *  清空缴费凭证
 * 
 */
function clearCredentials(salesIds) {
	layer.confirm('确定清空缴费凭证?', function(index) {
		var loadIndex = layer.load();
		$.ajax({
			type : "post",
			url : "credentials/clearCredentials.dx",
			dataType : "json",
			data : {
				'salesIds' : salesIds
			},
			async : false,
			success : function(res) {
				if (res.code == 200) {
					layer.msg(res.msg)
					// 刷新父页面销售数据表格
					table.reload('salesTable');
				} else {
					layer.msg(res.msg, {
						icon : 2
					})
				}
			},
			error : function() {
				layer.msg('网络异常，请重新操作', {
					icon : 5
				})
			}
		});
		layer.close(loadIndex);
	});
}

/** 
 * 账目校对的显示及按钮更改功能
 * 
 * @returns
 */
function spbill() {
	var caText = $('#spbill').text();
	var ptArea = document.getElementById("paymentTableArea");
	
	if (caText == '账目校对') {
		$('#spbill').text('取消校对');
		ptArea.style.display = "list-item";
		var dzPage = layer.open({
			  type: 1,
			  title:false,
			  closeBtn: 0,
			  move: '#tuozhuai',
			  shade:0,
			  area: ['420px', '70px'], //宽高
			  content: $('#dzArea')
			});
	} else {
		$('#spbill').text('账目校对');
		ptArea.style.display = "none";
		layer.closeAll("page");
	}
}

// 账单校对
function insertSP(salesids, paymentids) {
	layer.confirm('确认校对?', function() {
		$.ajax({
			type : "post",
			url : "insertSP.dx",
			data : {
				"salesids" : salesids,
				"paymentids" : paymentids
			},
			success : function(msg) {
				layer.msg("核对成功", {
					icon : 1
				});
				return 1;
			},
			error : function() {
				layer.msg('核对失败', {
					icon : 2
				});
				return 0;
			}

		});
	})

}

/**
 * 校对账目
 * 
 * @param salesIds
 * @param paymentIds
 * @returns
 */
function jiaoduizhangmu(salesIds,paymentIds,payMoney,receiveMoney){
	if(salesIds.length==0){
		layer.msg('请选择销售记录')
		return
	}
	if(paymentIds.length==0){
		layer.msg('请选则银行流水记录')
		return
	}
	if(payMoney!=receiveMoney){
		layer.msg('金额数目不匹配',{icon:2})
		return
	}
	// 将id对应关系插入销售-流水记录表
		layer.confirm('确认校对?',function(){
		$.ajax({
			type : "post",
			url : "sp/insertSP.dx",
			data : {
				"salesIds" : salesIds,
				"paymentIds" : paymentIds
			},
			dataType:'json',
			async:false,
			success : function(res) {
				if(res.code==200){
					layer.msg(res.msg);
				table.reload('salesTable');
				table.reload('paymentTable');
				$('#payMoney').val(0);
				$('#receiveMoney').val(0);
				}else{
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
	})
	
}

/**
 * 弹出上传凭证框
 * 
 * @param salesid
 * @returns
 */
function showUpCredentials(salesid){
	$('#uploadSId').val(salesid);
	layer.open({
		type:1,
		title:"凭证上传",
		content: $('#upCredentialsPage'),
		area:['300px','250px'],
		shade:0.2
	})
}