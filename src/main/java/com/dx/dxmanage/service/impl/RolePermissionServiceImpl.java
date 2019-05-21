package com.dx.dxmanage.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.RolePermissionMapper;
import com.dx.dxmanage.po.RolePermission;
import com.dx.dxmanage.service.IRolePermissionService;

/**
 * @author fang
 *
 * @Date 2019年3月14日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
@Service
public class RolePermissionServiceImpl implements IRolePermissionService {
	@Resource
	private RolePermissionMapper rolePermissionMapper;

	@Override
	public int deleteRolePermissionByRid(Long roleid) {
		// TODO Auto-generated method stub
		return rolePermissionMapper.deleteRolePermissionByRid(roleid);
	}

	@Override
	public int insertSelective(RolePermission record) {
		// TODO Auto-generated method stub
		return rolePermissionMapper.insertSelective(record);
	}

}
