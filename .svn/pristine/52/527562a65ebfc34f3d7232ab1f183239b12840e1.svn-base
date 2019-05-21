package com.dx.dxmanage.dao;

import java.util.List;
import java.util.Set;

import com.dx.dxmanage.po.Role;

public interface RoleMapper {
	int deleteByPrimaryKey(Long id);

	// 批量删除角色
	int deleteRoles(Integer[] roleIds);

	int insert(Role record);

	// 新增角色
	int addRole(Role role);

	Role selectByPrimaryKey(Long id);

	// 更新角色
	int updateRole(Role record);

	int updateByPrimaryKey(Role record);

	// 根据用户id查询用户角色类型
	Set<String> selectRoleByUserId(Long id);

	// 根据用户id查询用户角色信息
	List<Role> selectRoleByUid(Long userid);

	// 查询系统用户所有角色
	List<Role> selectAllRole();
}