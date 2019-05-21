package com.dx.dxmanage.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.SPMapper;
import com.dx.dxmanage.po.SP;
import com.dx.dxmanage.service.ISPService;

@Service
public class SPServiceImpl implements ISPService {
	@Resource
	private SPMapper spMapper;

	// 新增销售与银行流水的对应记录
	public int insertSelective(SP sp) {
		Map<String, Object> paramMap = new HashMap<>();
		int a = 0;
		paramMap.put("salesid", sp.getSalesid());
		paramMap.put("paymentid", sp.getPaymentid());
		List<SP> sps = this.selectSps(paramMap);
		if (sps.isEmpty()) {
			a = spMapper.insertSelective(sp);
		}
		return a;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.dx.dxmanage.service.ISPService#selectSps(java.util.Map)
	 */
	@Override
	public List<SP> selectSps(Map paramMap) {
		// TODO Auto-generated method stub
		return spMapper.selectSps(paramMap);
	}

}
