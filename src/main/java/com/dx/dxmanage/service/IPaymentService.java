package com.dx.dxmanage.service;

import java.util.List;

import java.util.Map;

import com.dx.dxmanage.po.Payment;

public interface IPaymentService {

	// 通过主键paymentid查询流水信息
	Payment selectByPrimaryKey(Integer paymentid);

	// 查询所有流水信息
	List<Payment> selectAllPayment(Map<String, Object> paymentMap);

	// 添加流水信息
	int insertPayment(Payment record);

	// 根据银行流水详细时间查询流水信息
	Payment selectPaymentByPaynum(String paynum);

	// 根据主键paymentid删除流水信息
	int deleteByPaymentid(Integer paymentid);
}
