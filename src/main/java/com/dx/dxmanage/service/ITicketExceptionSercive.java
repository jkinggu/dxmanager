package com.dx.dxmanage.service;

import java.util.List;

import com.dx.dxmanage.po.TicketException;

public interface ITicketExceptionSercive {
	// 新增异常发票信息
	int insertTicketException(TicketException ticketException);

	// 更新异常发票信息
	int updateTicketExceptionById(TicketException ticketException);

	// 根据主键id删除异常发票信息
	int deleteByPrimaryKey(Integer id);

	// 查询所有异常发票信息
	List<TicketException> selectAllTicketException();
}
