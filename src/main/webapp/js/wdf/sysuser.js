/**
 * 展示新增用户弹窗，并新增用户
 * 
 * @returns
 */
function addUserForm() {
	layer
			.open({
				type : 0,
				title : '添加用户',
				shade : 0.2, // 遮罩透明度
				anim : 0, // 0-6的动画形式，-1不开启
				content : "<lable>用户名：</lable><input type='text' name='username'  value=''style='width:120px;height:30px;display:inline-block' class='admin-header-lock-input layui-input'>",
				yes : function() {
					$.ajax({
						type : "post",
						url : "user/addUser.dx",
						dataType : "json",
						async : false,
						data : {
							"username" : $("input[name='username']").val()
						},
						success : function(res) {
							if (res.code == 200) {
								layer.msg(res.msg);
								layui.table.reload('userTable');
							} else {
								layer.msg(res.msg, {
									icon : 2
								});
							}
						},
						error : function() {
							layer.msg('网络异常，请稍后重试', {
								icon : 5
							});
						}
					});
				}
			})

}

/**
 * 根据用户id删除用户
 * 
 * @param userid
 * @returns
 */
function deleteUser(userid){
	layer.confirm('确认删除？', {title:'提示'},function(index) {
		$.ajax({
			type : "post",
			url : "user/deleteUser.dx",
			dataType : "json",
			async : false,
			data : {
				"userid" : userid,
			},
			success : function(res) {
				if(res.code==200){
					layer.msg(res.msg);
					table.reload('userTable');
				}else{
					layer.msg(res.msg,{icon:2});
				}
			},
			error : function() {
				layer.msg('网络异常，请稍后重试', {
					icon : 5
				});
			}
		});
		layer.close(index);
	});
}




/**
 * 修改密码
 * 
 * @param pswd
 * @param newPswd1
 * @param newPswd2
 * @returns
 */
 
function updatePassword(pswd,newPswd1,newPswd2){
	if (newPswd1 != newPswd2) {
		layer.msg('两次输入密码不一致')
		return
	}
	if(pswd==newPswd2){
		layer.msg('新旧密码相同')
		return
	}
	 $.ajax({
		type : "post",
		dataType : 'json',
		url : 'user/updatePswd.dx',
		data : {
			'pswd' : pswd,
			'newPswd' : newPswd2
		},
		async : false,
		success : function(res) {
			if(res.code==200){
				layer.msg(res.msg, {
					icon : 1,
					time : false, 
					btn : [ '确定' ],
					btnAlign: 'c',
					shade: 0.3,
					yes : function() {
						parent.window.location.href ='logout.dx';
					}
				});
			}else{
				layer.msg(res.msg,{icon:2})
			}
		},
		error : function() {
			layer.msg('网络异常，请刷新重试', {
				icon : 5
			});
		}
	}) 
}

/**
 * 展示更新用户角色页面
 * 
 * @param salesid
 * @returns
 */
function updateRolePage(userid) {
	layer.open({
		type : 2,
		title : "角色设置",
		content : 'role/updateRolePage.dx?userid=' + userid,
		area : [ '300px', '300px' ],
	});
}

/**
 * 批量删除角色
 * 
 * @param roleids
 * @returns
 */
 
function deleteRoles(roleIds) {
	var index = layer.confirm("确定删除？", {
		btn : [ '确定', '取消' ],
		title : "提示"
	}, function() {
		var load = layer.load();
		$.ajax({
			type : "post",
			dataType : 'json',
			url : 'role/deleteRoles.dx',
			data : {
				'roleIds' : roleIds
			},
			async : false,
			success : function(res) {
				layer.close(load);
				layer.msg(res.msg);
				// 刷新用户分配角色列表
				table.reload('roleTable');
			},
			error : function() {
				layer.msg('网络异常，请刷新重试', {
					icon : 5
				});
			}
		})
		layer.close(index);
	});
}