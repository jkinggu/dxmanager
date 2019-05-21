package com.dx.dxmanage.service;

import java.util.List;
import java.util.Set;

import com.dx.dxmanage.po.Permission;

public interface IPermissionService {
	// 根据用户id查询权限
	Set<String> selectPermissionByUserId(Long userId);

	// 查询所有权限
	List<Permission> selectAllPermission();

	// 根据角色id查询权限
	List<Permission> selectPermissionByRoleId(Long roleId);

	// 查询一级权限
	List<Permission> selectPermissionsOne();

	// 查询二级权限
	List<Permission> selectPermissionsTwo(String codeid);

	// 查询三级权限
	List<Permission> selectPermissionsThree(String codeid);

	// 更新权限信息
	int updatePermission(Permission record);
}
