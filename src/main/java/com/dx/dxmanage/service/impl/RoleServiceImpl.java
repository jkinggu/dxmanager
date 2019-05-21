package com.dx.dxmanage.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.RoleMapper;
import com.dx.dxmanage.po.Role;
import com.dx.dxmanage.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService {
	@Resource
	private RoleMapper roleMapper;

	@Override
	public Set<String> selectRoleByUserId(Long id) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByUserId(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.IRoleService#selectAllRole()
	 */
	@Override
	public List<Role> selectAllRole() {
		// TODO Auto-generated method stub
		return roleMapper.selectAllRole();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.IRoleService#selectRoleByUid(java.lang.Long)
	 */
	@Override
	public List<Role> selectRoleByUid(Long id) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleByUid(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.IRoleService#addRole(com.dx.dxmanage.po.Role)
	 */
	@Override
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.addRole(role);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.IRoleService#updateRole(com.dx.dxmanage.po.Role)
	 */
	@Override
	public int updateRole(Role record) {
		// TODO Auto-generated method stub
		return roleMapper.updateRole(record);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.IRoleService#deleteRoles(java.lang.Integer[])
	 */
	@Override
	public int deleteRoles(Integer[] roleIds) {
		// TODO Auto-generated method stub
		return roleMapper.deleteRoles(roleIds);
	}

}
