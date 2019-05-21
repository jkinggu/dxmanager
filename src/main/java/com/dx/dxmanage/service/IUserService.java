package com.dx.dxmanage.service;

import java.util.List;
import java.util.Map;

import com.dx.dxmanage.po.User;

public interface IUserService {
	// 查询所有用户
	List<User> selectAllUser();

	// 根据条件查询特定用户
	List<User> selectAllUser(Map<String, Object> map);

	User login(String username, String password);

	// 根据用户名查询用户信息
	User selectUserByUsername(String username);

	// 删除用户
	int deleteByPrimaryKey(Long id);

	// 更新用户
	int updateUser(User user);

	// 添加用户
	int insertSelective(User record);
}
