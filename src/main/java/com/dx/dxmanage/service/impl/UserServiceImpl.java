package com.dx.dxmanage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.UserMapper;
import com.dx.dxmanage.po.User;
import com.dx.dxmanage.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Resource
	private UserMapper userMapper;

	@Override
	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser();
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		User user = userMapper.login(username, password);
		return user;
	}

	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

	@Override
	public List<User> selectAllUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser(map);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.IUserService#selectUserByUsername(java.lang.String)
	 */
	@Override
	public User selectUserByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.selectUserByUsername(username);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.IUserService#deleteByPrimaryKey(java.lang.Long)
	 */
	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
	}

	

}
