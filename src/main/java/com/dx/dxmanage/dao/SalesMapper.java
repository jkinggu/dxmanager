package com.dx.dxmanage.dao;

import java.util.List;
import java.util.Map;

import com.dx.dxmanage.po.Sales;

public interface SalesMapper {
	// 删除销售信息
	int deleteByPrimaryKey(Integer salesid);

	int insert(Sales record);

	// 增添销售信息
	int addSales(Sales sales);

	Sales selectByPrimaryKey(Integer salesid);

	// 修改销售信息
	int updateSales(Sales sales);

	// 查询所有交易记录
	List<Sales> selectAllSales(Map<String, Object> salesMap);

	// 查询未开票的销售记录
	List<Sales> selectNotTicketSales();
}