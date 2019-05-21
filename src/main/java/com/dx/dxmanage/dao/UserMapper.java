package com.dx.dxmanage.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dx.dxmanage.po.User;

public interface UserMapper {
	// 删除用户
	int deleteByPrimaryKey(Long id);

	// 添加用户
	int insertSelective(User record);

	User selectByPrimaryKey(Long id);

	// 根据用户名查询用户信息
	User selectUserByUsername(String username);

	// 更新用户
	int updateUser(User user);

	// 查询所有用户
	List<User> selectAllUser();

	// 根据条件查询特定用户
	List<User> selectAllUser(Map<String, Object> map);

	User login(@Param("username") String username, @Param("password") String password);

}