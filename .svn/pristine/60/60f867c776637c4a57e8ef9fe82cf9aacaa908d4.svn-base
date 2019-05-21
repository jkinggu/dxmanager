package com.dx.dxmanage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.CustomerMapper;
import com.dx.dxmanage.dao.SalesMapper;
import com.dx.dxmanage.po.Customer;
import com.dx.dxmanage.po.Sales;
import com.dx.dxmanage.service.ISalesService;

@Service
public class SalesServiceImpl implements ISalesService {
	@Resource
	private SalesMapper salesMapper;
	@Resource
	private CustomerMapper customerMapper;

	public int addSales(Sales sales) {
		int integer = 0;
		try {
			// 如果开票名称有变动，则同时更新单位信息中开票名称
			if (!"".equals(sales.getReceipt()) && sales.getReceipt() != null) {
				Customer customer = customerMapper.selectByCustomerid(sales.getCustomerid());
				if (!customer.getCustomername1().equals(sales.getReceipt())) {
					customer.setCustomername1(sales.getReceipt());
					customerMapper.updateCustomer(customer);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			integer = salesMapper.addSales(sales);
		}

		return integer;
	}

	public int updateSales(Sales sales) {
		int integer = 0;
		try {
			// 如果开票名称有变动，则同时更新单位信息中开票名称
			if (!"".equals(sales.getReceipt()) && sales.getReceipt() != null) {
				Customer customer = customerMapper.selectByCustomerid(sales.getCustomerid());
				if (!customer.getCustomername1().equals(sales.getReceipt())) {
					customer.setCustomername1(sales.getReceipt());
					customerMapper.updateCustomer(customer);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			integer = salesMapper.updateSales(sales);
		}

		return integer;
	}

	@Override
	public List<Sales> selectAllSales(Map<String, Object> salesMap) {
		// TODO Auto-generated method stub
		return salesMapper.selectAllSales(salesMap);
	}

	@Override
	public List<Sales> selectNotTicketSales() {
		// TODO Auto-generated method stub
		return salesMapper.selectNotTicketSales();
	}

	@Override
	public int deleteByPrimaryKey(Integer salesid) {
		// TODO Auto-generated method stub
		return salesMapper.deleteByPrimaryKey(salesid);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.dx.dxmanage.service.ISalesService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public Sales selectByPrimaryKey(Integer salesid) {
		// TODO Auto-generated method stub
		return salesMapper.selectByPrimaryKey(salesid);
	}

}
