package com.dx.dxmanage.service.impl;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.TicketMapper;
import com.dx.dxmanage.po.Ticket;
import com.dx.dxmanage.service.ITicketService;

@Service
public class TicketServiceImpl implements ITicketService {
@Resource
private TicketMapper ticketMapper;
	public List<Ticket> selectAllTicket() {
		// TODO Auto-generated method stub
		return ticketMapper.selectAllTicket();
	}
	
	public int insertSelective(Ticket record) {
		// TODO Auto-generated method stub
		return ticketMapper.insertSelective(record);
	}

	public Ticket selectWillUseTicket() {
		// TODO Auto-generated method stub
		return ticketMapper.selectWillUseTicket();
	}

	public int updateTicket(Ticket record) {
		// TODO Auto-generated method stub
		return ticketMapper.updateTicket(record);
	}

	public Ticket selectByPrimaryKey(Integer ticketid) {
		// TODO Auto-generated method stub
		return ticketMapper.selectByPrimaryKey(ticketid);
	}

	@Override
	public int deleteByPrimaryKey(Integer ticketid) {
		// TODO Auto-generated method stub
		return ticketMapper.deleteByPrimaryKey(ticketid);
	}

}
