package com.dx.dxmanage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.CredentialsMapper;
import com.dx.dxmanage.po.Credentials;
import com.dx.dxmanage.service.ICredentialsService;

/**
 * @author fang
 *
 * @Date 2019年1月16日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
@Service
public class CredentialsServiceImpl implements ICredentialsService {
	@Resource
	private CredentialsMapper credentialsMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.dxmanage.service.ICredentialsService#insertSelective(com.dx.dxmanage.
	 * po.Credentials)
	 */
	@Override
	public int insertSelective(Credentials record) {
		// TODO Auto-generated method stub
		return credentialsMapper.insertSelective(record);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.dxmanage.service.ICredentialsService#selectCredentialsByCid(java.lang.
	 * Integer)
	 */
	@Override
	public List<Credentials> selectCredentialsByCid(Integer salesid) {
		// TODO Auto-generated method stub
		return credentialsMapper.selectCredentialsByCid(salesid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.ICredentialsService#clearCredentials(java.lang.
	 * Integer[])
	 */
	@Override
	public int clearCredentials(Integer[] salesIds) {
		// TODO Auto-generated method stub
		return credentialsMapper.clearCredentials(salesIds);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.ICredentialsService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return credentialsMapper.deleteByPrimaryKey(id);
	}

}
