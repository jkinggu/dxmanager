package com.dx.dxmanage.dao;

import java.util.List;

import com.dx.dxmanage.po.Credentials;

public interface CredentialsMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Credentials record);

	// 清空缴费凭证
	int clearCredentials(Integer[] salesIds);

	// 新增凭证记录
	int insertSelective(Credentials record);

	Credentials selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Credentials record);

	int updateByPrimaryKey(Credentials record);

	// 根据销售id查询凭证
	List<Credentials> selectCredentialsByCid(Integer salesid);
}