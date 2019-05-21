//获得所有商品供商品选择栏选择
function gainGoods() {
	var statem = "<option value=''> 请选择... </option>";
	$.ajax({
		type : "POST",
		url : "goods/gainGoods.dx",
		dataType : "json",
		async : false,
		success : function(msg) {
			$.each(msg, function(i, goods) {
				statem = statem + "<option value='" + goods.goodsid + "'>"
						+ goods.goodsname + "</option>";
			});
		},
		error : function() {
			layer.alert("获取商品列表失败！");
		}
	});
	return statem;
};

// 通过商品id查询商品信息
var selectGoodsByGoodsid = function(goodsid) {
	$.ajax({
		type : "POST",
		url : "goods/selectGoodsByGoodsid.dx",
		data : {
			"goodsid" : goodsid
		},
		dataType : "json",
		async : false,
		success : function(g) {
			goods = g;
		},
		error : function() {
			layer.msg("获取商品失败！", {
				icon : 2
			});
		}
	});
	return goods;
}

// 添加销售信息时改变选择商品时触发此方法
/*
 * $("#goodsid").change(function() { var goodsidAndUnit = $(this).val(); var
 * goodsid = goodsidAndUnit.split("-")[0]; price =
 * selectGoodsByGoodsid(goodsid); $("#price").val(price); gianAmount(); });
 */

/**
 * 删除商品
 * 
 * @param goodsid
 * @returns
 */
function deletegoodsByCid(goodsid) {
	str = '删除此商品会同时删除此商品对应的销售信息<br>确认删除？';
	layer.confirm(str, {
		title : '<h6 style="color:red">警告：</h6>'
	}, function(index) {
		$.ajax({
			type : "POST",
			url : "goods/deleteGoodsByCid.dx",
			data : {
				goodsid : goodsid
			},
			dataType : "json",
			async : false,
			success : function(res) {
				if (res.code == 200) {
					table.reload('goodsTable');
					layer.msg(res.msg);
				} else {
					layer.msg(res.msg, {
						icon : 5
					})
				}

			},
			error : function() {
				layer.msg("网络异常，请稍后重试", {
					icon : 2
				});
			}
		});
	});

}
// 新增商品信息表单
function addGoodsPage() {
	layer.open({
		type : 2,
		title : '新增商品',
		content : 'jsp/goods/addGoodsForm.jsp',
		area : [ '400px', '400px' ]
	});
}

/**
 * 新增商品表单提交
 * 
 * @param data
 *            商品信息
 * @returns
 */
function submitGoodsForm(data) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'goods/addGoods.dx',
		data : data.field,
		success : function(res) {
			if (res.code == 200) {
				parent.table.reload('goodsTable');
				layer.msg(res.msg);
				setTimeout(function() {
					parent.layer.closeAll('iframe');
				}, 1500)
			} else {
				layer.msg(res.msg, {
					icon : 5
				})
			}
		},
		error : function() {
			layer.msg('提交失败,请重新提交', {
				icon : 5
			});
		}
	})
}

// 编辑商品信息页面，并自动填写内容
function editGoods(goodsid) {
	layer.open({
		type : 2,
		title : '编辑商品',
		content : 'goods/editGoods.dx?goodsid=' + goodsid,
		area : [ '400px', '400px' ]
	});
}

// 提交更新商品信息
function updateGoods(goods) {
	$.ajax({
		type : "post",
		dataType : 'json',
		url : 'goods/updateGoods.dx',
		data : goods,
		success : function(res) {
			if (res.code == 200) {
				parent.table.reload('goodsTable');
				layer.msg(res.msg);
				setTimeout(function() {
					parent.layer.closeAll('iframe');
				}, 1500)
			} else {
				layer.msg(res.msg, {
					icon : 5
				})
			}
		},
		error : function() {
			layer.msg('网络异常，请稍后重试', {
				icon : 5
			});
		}
	})
}