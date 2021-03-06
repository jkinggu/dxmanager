package com.dx.dxmanage.service;

import java.util.List;

import com.dx.dxmanage.po.Ticket;

public interface ITicketService {
	// 查询所有增添发票记录
	List<Ticket> selectAllTicket();

	// 新增发票信息
	int insertSelective(Ticket record);

	// 查询将要用的票本
	Ticket selectWillUseTicket();

	// 更改发票信息
	int updateTicket(Ticket record);

	// 根据ticketid查询发票记录
	Ticket selectByPrimaryKey(Integer ticketid);

	// 删除发票号段信息
	int deleteByPrimaryKey(Integer ticketid);

}
