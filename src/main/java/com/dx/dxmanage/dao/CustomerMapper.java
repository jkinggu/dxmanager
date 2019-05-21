package com.dx.dxmanage.dao;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.dx.dxmanage.po.Customer;

import ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy;

public interface CustomerMapper {
	// 根据主键（客户id）删除客户信息
	int deleteByPrimaryKey(Integer customerid);

	// 添加单位信息
	int insertSelective(Customer record);

	// 更新客户信息
	int updateCustomer(Customer record);

	// 根据客户id查询客户信息
	Customer selectByCustomerid(Integer customerid);

	// 根据客户所属县区、代码查询单个客户
	List<Customer> selectCusByMemberAndCode(@Param("membership") String membership, @Param("customercode") String customercode);

	// 查询所有县区
	List<String> selectMembership();

	// 查询所有客户
	List<Customer> selectAllCustomer(Map<String, Object> customerMap);

	// 查询部分客户列表
	List<Customer> selectPartCustomerList(Map<String, Object> customerMap);

	// 根据一个客户的membership和代码查询本单位及所有子单位
	List<Customer> selectCusChildren(Map<String, Object> paramMap);

	// 根据单位id获取子单位的最大单位编码
	String selectSubCMaxCode(@Param("membership") String membership, @Param("customercode") String customercode);

	// 远程接口:查询所有单位
	List<Customer> allCustomer();

}