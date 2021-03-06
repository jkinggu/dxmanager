package com.dx.dxmanage.service;

import java.util.List;

import com.dx.dxmanage.po.Credentials;

/**
 * @author fang
 *
 * @Date 2019年1月16日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
public interface ICredentialsService {
	// 新增凭证记录
	int insertSelective(Credentials record);

	// 根据销售id查询凭证
	List<Credentials> selectCredentialsByCid(Integer salesid);

	// 清空缴费凭证
	int clearCredentials(Integer[] salesIds);

	// 根据id删除凭证
	int deleteByPrimaryKey(Integer id);
}
