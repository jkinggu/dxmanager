package com.dx.dxmanage.service;

import java.util.List;
import java.util.Map;

import com.dx.dxmanage.po.SP;

public interface ISPService {

	// 新增销售与银行流水的对应记录
	int insertSelective(SP record);

	// 根据条件查询销售流水关联记录
	List<SP> selectSps(Map paramMap);
}
