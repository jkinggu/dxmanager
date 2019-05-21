//新增发票页面
function aadTicketForm() {

	layer.open({
		type : 2,
		title : '新增发票信息',
		content : 'jsp/ticket/addTicketForm.jsp',
		area : [ '300px', '400px' ]
	});
}
// 给特定元素设置当前日期
function getNowDate(ele) {
	layui.define([ 'laydate' ], function() {
		var laydate = layui.laydate;
		laydate.render({
			elem : ele, // 指定元素
			farmat : 'yyyy-MM-dd',
			value : new Date(),
			max : 'new Date()'
		});
	})
}

// 新增发票表单提交
function submitTicketForm(data) {
	tickettime = data.field.tickettime;
	beginnum = data.field.beginnum;
	ticketamount = data.field.ticketamount;

	endnum = parseInt(beginnum) + parseInt(ticketamount) - 1;
	beginnum = pad(beginnum, 8);
	endnum = pad(endnum, 8);
	$.ajax({
		type : "post",
		dataType : 'json',
		async : false,
		url : 'ticket/addTicket.dx',
		data : {
			"tickettime" : tickettime,
			"beginnum" : beginnum,
			"ticketamount" : ticketamount,
			"endnum" : endnum,
			"usenum" : beginnum
		},
		success : function(msg) {
			if (msg == 1) {
				layer.msg('成功', {
					icon : 1
				});
				parent.table.reload('ticketTableId')
			} else {
				layer.msg('失败', {
					icon : 2
				});
			}
		},
		error : function() {
			layer.msg('网络异常,请稍后重试', {
				icon : 5
			});
		}
	})
}

// 数字字符串不够位补0
function pad(num, n) {
	var len = num.toString().length;
	while (len < n) {
		num = "0" + num;
		len++;
	}
	return num;
}

// 删除发票号码段信息
function deleteTicket(obj) {
	data = obj.data;
	ticketid = data.ticketid;
	layer.confirm('确认删除？', function(index) {
		// 向服务端发送删除指令
		$.ajax({
			type : "get",
			dataType : 'json',
			async : false,
			url : 'ticket/deleteTicket.dx?ticketid=' + ticketid,
			success : function(msg) {
				if (msg == 1) {
					layer.msg('已删除', {
						icon : 1
					});
					obj.del();// 删除对应行（tr）的DOM结构
				} else {
					layer.msg('删除失败', {
						icon : 2
					});
				}
			},
			error : function() {
				layer.msg('网络异常,请稍后重试', {
					icon : 5
				});
			}
		})
		layer.close(index);
	});

}
// 编辑发票信息页面，并自动填写内容
function editTicketPage(ticket) {
	layer.open({
		type : 2,
		title : '编辑发票信息',
		shadeClose : true, // 点击遮罩关闭层
		content : 'ticket/editTicketPage.dx?ticketid=' + ticket.ticketid,
		area : [ '300px', '400px' ]
	})
}

function updateTicket(ticket) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'ticket/updateTicket.dx',
		data : ticket,
		success : function(msg) {
			if (msg == 1) {
				// 刷新父页面客户信息数据表格
				parent.table.reload('ticketTableId');
				layer.msg('更新成功', {
					icon : 1
				});
			} else {
				layer.msg('更新失败', {
					icon : 2
				});
			}
		},
		error : function() {
			layer.msg('网络异常，请稍后重试', {
				icon : 5
			});
		}
	})
}

function addTicketExceptionForm(ticketid) {

	layer.open({
		type : 2,
		title : '异常发票登记',
		content : 'ticketException/addTicketExceptionForm.dx?ticketid='
				+ ticketid,
		area : [ '300px', '400px' ]
	})
}

// 提交发票异常信息表单（新增异常发票信息）
function submitTicketExceptionForm(data) {
	$.ajax({
		type : "post",
		dataType : 'json',
		async : false,
		url : 'ticketException/addTicketException.dx',
		data : data.field,
		success : function(msg) {
			if (msg == 1) {
				layer.msg('作废处理成功', {
					icon : 1
				});
				parent.table.reload('ticketExceptionTableId')
			} else {
				layer.msg('作废处理失败', {
					icon : 2
				});
			}
		},
		error : function() {
			layer.msg('网络异常,请稍后重试', {
				icon : 5
			});
		}
	})
}