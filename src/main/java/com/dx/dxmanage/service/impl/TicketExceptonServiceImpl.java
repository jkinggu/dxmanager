package com.dx.dxmanage.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.TicketExceptionMapper;
import com.dx.dxmanage.po.TicketException;
import com.dx.dxmanage.service.ITicketExceptionSercive;

@Service
public class TicketExceptonServiceImpl implements ITicketExceptionSercive {

	private TicketExceptionMapper TicketExceptionMapper;

	@Resource
	public void setTicketExceptionMapper(TicketExceptionMapper ticketExceptionMapper) {
		TicketExceptionMapper = ticketExceptionMapper;
	}

	@Override
	public int insertTicketException(TicketException ticketException) {
		// TODO Auto-generated method stub
		return TicketExceptionMapper.insertTicketException(ticketException);
	}

	@Override
	public int updateTicketExceptionById(TicketException ticketException) {
		// TODO Auto-generated method stub
		return TicketExceptionMapper.updateTicketExceptionById(ticketException);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return TicketExceptionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<TicketException> selectAllTicketException() {
		// TODO Auto-generated method stub
		return TicketExceptionMapper.selectAllTicketException();
	}

}
