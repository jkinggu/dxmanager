package com.dx.dxmanage.service.impl;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.PermissionMapper;
import com.dx.dxmanage.po.Permission;
import com.dx.dxmanage.service.IPermissionService;

@Service
public class PermissionServiceImpl implements IPermissionService {
	@Resource
	private PermissionMapper permissionMapper;

	@Override
	public Set<String> selectPermissionByUserId(Long userId) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionByUserId(userId);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.IPermissionService#selectAllPermission()
	 */
	@Override
	public List<Permission> selectAllPermission() {
		// TODO Auto-generated method stub
		return permissionMapper.selectAllPermission();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.dxmanage.service.IPermissionService#selectPermissionByRoleId(java.lang
	 * .Long)
	 */
	@Override
	public List<Permission> selectPermissionByRoleId(Long roleId) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionByRoleId(roleId);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.IPermissionService#selectPermissionOne()
	 */
	@Override
	public List<Permission> selectPermissionsOne() {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionsOne();
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.IPermissionService#selectPermissionTwo(java.lang.String)
	 */
	@Override
	public List<Permission> selectPermissionsTwo(String codeid) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionsTwo(codeid);
	}

	
	@Override
	public List<Permission> selectPermissionsThree(String codeid) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionsThree(codeid);
	}

	@Override
	public int updatePermission(Permission record) {
		// TODO Auto-generated method stub
		return permissionMapper.updatePermission(record);
	}

	

}
