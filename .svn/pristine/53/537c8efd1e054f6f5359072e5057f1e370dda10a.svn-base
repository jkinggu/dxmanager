package com.dx.dxmanage.service;

import java.util.List;
import java.util.Set;

import com.dx.dxmanage.po.Role;

public interface IRoleService {
	// 根据用户id查询用户角色类型
	Set<String> selectRoleByUserId(Long uid);

	// 根据用户id查询用户角色信息
	List<Role> selectRoleByUid(Long userid);

	// 查询系统用户所有角色
	List<Role> selectAllRole();

	// 新增角色
	int addRole(Role role);

	// 更新角色
	int updateRole(Role record);

	// 批量删除角色
	int deleteRoles(Integer[] roleIds);
}
