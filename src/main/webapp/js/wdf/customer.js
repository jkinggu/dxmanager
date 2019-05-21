//获得所有单位的县区供select选择
function gainMembership() {
	var statem;
	$.ajax({
		type : "POST",
		url : "customer/selectAllMembership.dx",
		dataType : "json",
		async : false,
		success : function(msg) {
			$.each(msg, function(i, customer) {
				statem = statem + "<option value='" + customer.membership
						+ "'>" + customer.membership + "</option>";
			});
		},
		error : function() {
			layer.alert("获取县区失败！");
		}
	});
	return statem;
};

// 删除客户
function deleteCustomerByCid(customerid) {
	$.ajax({
		type : 'post',
		data : {
			'customerid' : customerid
		},
		dataType : 'json',
		async : false,
		url : 'customer/deleteByPrimaryKey.dx',
		success : function(msg) {
			if (msg == 1) {
				layer.msg('删除成功', {
					icon : 1
				})
			} else {
				layer.msg('删除失败', {
					icon : 2
				})
			}
		},
		error : function() {
			layer.msg('网络异常，请重新操作', {
				icon : 5
			})
		}

	})
}

// 编辑单位信息
function editCustomer(customerid) {
	layer.open({
		type : 2,
		title : '编辑单位',
		content : 'customer/editCustomer.dx?customerid=' + customerid,
		area : [ '500px', '80%' ]
	});
}

/**
 * 更新单位信息
 * 
 * @param customer
 * @returns
 */
function updateCustomer(customer) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'customer/updateCustomer.dx',
		data : customer,
		success : function(res) {
			if (res.code == 200) {
				// 刷新父页面客户信息数据表格
				parent.table.reload('customerTable');
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
// 新增单位信息时，输入单位名称时自动填充开票名称
function inputCustomername1() {
	$("#customername1").val($("#customername").val());
}

// js中数值位数不够自动补0
function PrefixInteger(num, length) {
	return (Array(length).join('0') + num).slice(-length);
}
// 获取子单位的最大单位编码
function selectSubCMaxCode(membership, customercode) {
	var ccode;
	$.ajax({
		type : 'post',
		data : {
			'membership' : membership,
			'customercode' : customercode
		},
		async : false,
		url : 'customer/selectSubCMaxCode.dx',
		success : function(result) {
			if (result == '') {//当返回结果为空
				if (customercode == '' || customercode == null) {//当传入customercode为空（此时是在所有一级单位中，没有获取到最大编码）
					ccode = '001';
				} else {
					ccode = customercode + '01';
				}
			} else {
				str = result.substr(1, result.length - 2);// stringObject.substr(start,length)
				// 截取的是开始与字符串长度。
				ccode = PrefixInteger(Number(str) + 1, str.length);
			}
		},
		error : function(data, type, err) {
			layer.msg('网络异常，请重新操作', {
				icon : 5
			})
		}

	})
	return ccode;
}

/**
 * 根据县区和编码查询单位及它的的子单位，并弹出子页面 
 * @param c 单位对象
 * @returns
 */  
 
function selectCusChildren(c) {
	paramStr = "customerid=" + c.customerid + "&membership=" + c.membership
			+ "&customercode=" + c.customercode;
	layer.open({
		type : 2,
		title : '授权设置',
		content : 'customer/getShouquanPage.dx?' + paramStr,
		area : [ '80%', '60%' ],
		maxmin : true,
		resize : false,// - 是否允许拉伸
		shade : 0.1
	});

}

function cusShouquan(cusIds, limit, shouquanType) {
	tsContent = "确认将已选单位授权到 <span style='color:red'>" + limit + "</span> 年";
	var titleStr = shouquanType == 0 ? "工资服务授权" : "年报服务授权";
	index = parent.layer.confirm(tsContent, {
		btn : [ '确定', '取消' ],
		title : titleStr
	}, function() {
		$.ajax({
			type : "POST",
			url : "customer/updateCTimelimit.dx",
			dataType : "json",
			data : {
				"cusIds" : cusIds,
				"limit" : limit,
				"shouquanType" : shouquanType
			},
			async : false,
			success : function(res) {
				parent.layer.msg(res.msg);
				parent.layer.close(index);
				table.reload('cusTable', {
					where : {
						codeOrName : customercode,
						membership : membership
					}
				});
				parent.table.reload('customerTable',
						{
							where : {
								codeOrName : $("#codeOrName", parent.document)
										.val().replace(/[ ]/g, ""),
								membership : $('#membership', parent.document)
										.val() == "全部" ? null
										: $('#membership').val()
							}
						});
			},
			error : function() {
				layer.msg("网络异常，请稍后重试");
			}
		});
	})

}

/**
 * 展示新增单位信息弹窗
 * 
 * @returns
 */
function addCustomerPage() {
	layer.open({
		type : 1,
		title : '新增单位',
		content : $('#addCustomerForm'),
		area : [ '500px', '80%' ]
	});
}

/**
 * 新增单位信息
 * 
 * @param customer
 * @returns
 */
function submitCustomerForm(customer) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'customer/addCustomerinfo.dx',
		data : customer,
		async : false,
		success : function(res) {
			if (res.code == 200) {
				table.reload("customerTable");
				layer.closeAll('page');
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
}