package com.dx.dxmanage.dao;

import java.util.List;

import java.util.Map;

import com.dx.dxmanage.po.UserRole;


/**
 * @author fang
 *
 * @Date 2019年02月25日
 *
 *       项目名dxmanage
 *
 * @version 1.0
 */
public interface UserRoleMapper {
	// 根据用户id查询用户角色
	List<UserRole> selectUserRolesByUid(Long id);

	// 根据用户ID删除用户角色
	int deleteUserRoleByUserId(Long id);

	// 新增用户_角色记录
	int insertSelective(UserRole userRole);

	// 根据用户id清空角色
	int deleteRoleByUserIds(Map<String, Object> resultMap);
}
