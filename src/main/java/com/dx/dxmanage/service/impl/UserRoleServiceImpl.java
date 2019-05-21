package com.dx.dxmanage.service.impl;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.UserRoleMapper;
import com.dx.dxmanage.po.UserRole;
import com.dx.dxmanage.service.IUserRoleService;

/**
 * @author fang
 *
 * @Date 2018年02月25日
 *
 *       项目名dxmanage
 *
 * @version 1.0
 */
@Service
public class UserRoleServiceImpl implements IUserRoleService {
	@Resource
	private UserRoleMapper userRoleMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.mecvip.service.IUserRoleService#selectUserRolesByUid(java.lang.Long)
	 */
	@Override
	public List<UserRole> selectUserRolesByUid(Long id) {
		// TODO Auto-generated method stub
		return userRoleMapper.selectUserRolesByUid(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.mecvip.service.IUserRoleService#deleteUserRoleByUserId(java.lang.Long)
	 */
	@Override
	public int deleteUserRoleByUserId(Long id) {
		// TODO Auto-generated method stub
		return userRoleMapper.deleteUserRoleByUserId(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.mecvip.service.IUserRoleService#insertSelective(com.dx.mecvip.pojo.
	 * UserRole)
	 */
	@Override
	public int insertSelective(UserRole userRole) {
		// TODO Auto-generated method stub
		return userRoleMapper.insertSelective(userRole);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.mecvip.service.IUserRoleService#deleteRoleByUserIds(java.util.Map)
	 */
	@Override
	public Map<String, Object> deleteRoleByUserIds(String userIds) {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			String IDS[] = userIds.split(",");
			List<String> idStrings = new ArrayList<>();
			for (String i : IDS) {
				idStrings.add(i);
			}
			resultMap.put("userIds", idStrings);
			userRoleMapper.deleteRoleByUserIds(resultMap);
			resultMap.put("code", 200);
			resultMap.put("msg", "操作成功");
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("code", 300);
			resultMap.put("msg", "操作失败，请重试！");
		}
		return resultMap;

	}

}
