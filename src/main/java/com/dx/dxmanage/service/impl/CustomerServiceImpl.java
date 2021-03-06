package com.dx.dxmanage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dx.dxmanage.dao.CustomerMapper;
import com.dx.dxmanage.po.Customer;
import com.dx.dxmanage.service.ICustomerService;

@Service
public class CustomerServiceImpl implements ICustomerService {
	private CustomerMapper customerMapper;

	@Resource
	public void setCustomerMapper(CustomerMapper customerMapper) {
		this.customerMapper = customerMapper;
	}

	public Customer selectByCustomerid(Integer customerid) {
		// TODO Auto-generated method stub
		return customerMapper.selectByCustomerid(customerid);
	}

	// 查询所有用户
	public List<Customer> selectAllCustomer(Map<String, Object> salesMap) {

		return customerMapper.selectAllCustomer(salesMap);
	}

	public int insertSelective(Customer record) {
		// TODO Auto-generated method stub
		return customerMapper.insertSelective(record);
	}

	@Override
	public int updateCustomer(Customer record) {
		// TODO Auto-generated method stub
		return customerMapper.updateCustomer(record);
	}

	@Override
	public int deleteByPrimaryKey(Integer customerid) {
		// TODO Auto-generated method stub
		return customerMapper.deleteByPrimaryKey(customerid);
	}

	@Override
	public List<String> selectMembership() {
		// TODO Auto-generated method stub
		return customerMapper.selectMembership();
	}

	@Override
	public List<Customer> selectPartCustomerList(Map<String, Object> customerMap) {
		// TODO Auto-generated method stub
		return customerMapper.selectPartCustomerList(customerMap);
	}

	@Override
	public String selectSubCMaxCode(String membership,String customercode) {
		// TODO Auto-generated method stub
		return customerMapper.selectSubCMaxCode(membership,customercode);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.ICustomerService#selectCusByMemberAndCode(java.lang.String, java.lang.String)
	 */
	@Override
	public List<Customer> selectCusByMemberAndCode(String membership, String customercode) {
		// TODO Auto-generated method stub
		return customerMapper.selectCusByMemberAndCode(membership, customercode);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.ICustomerService#selectCusChildren(java.util.Map)
	 */
	@Override
	public List<Customer> selectCusChildren(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return customerMapper.selectCusChildren(paramMap);
	}

	/* (non-Javadoc)
	 * @see com.dx.dxmanage.service.ICustomerService#allCustomer()
	 */
	@Override
	public List<Customer> allCustomer() {
		// TODO Auto-generated method stub
		return customerMapper.allCustomer();
	}

}
