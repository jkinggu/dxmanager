package com.dx.dxmanage.dao;

import java.util.List;

import com.dx.dxmanage.po.Ticket;

public interface TicketMapper {
	// 删除发票号段信息
	int deleteByPrimaryKey(Integer ticketid);

	int insert(Ticket record);

	// 新增发票信息
	int insertSelective(Ticket record);

	// 根据ticketid查询发票记录
	Ticket selectByPrimaryKey(Integer ticketid);

	// 查询下一个要用的票本
	Ticket selectWillUseTicket();

	// 更新发票信息
	int updateTicket(Ticket record);

	// 查询所有增添发票记录
	List<Ticket> selectAllTicket();
}