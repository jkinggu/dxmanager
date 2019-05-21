package com.dx.dxmanage.po;

import java.io.Serializable;

public class SP implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer salesid;

	private Integer paymentid;

	private Sales sales;

	private Payment payment;

	public Sales getSales() {
		return sales;
	}

	public void setSales(Sales sales) {
		this.sales = sales;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public Integer getSalesid() {
		return salesid;
	}

	public void setSalesid(Integer salesid) {
		this.salesid = salesid;
	}

	public Integer getPaymentid() {
		return paymentid;
	}

	public void setPaymentid(Integer paymentid) {
		this.paymentid = paymentid;
	}

	@Override
	public String toString() {
		return "SP [salesid=" + salesid + ", paymentid=" + paymentid + ", sales=" + sales
				+ ", payment=" + payment + "]";
	}

	public SP( Integer salesid, Integer paymentid) {
		super();
		this.salesid = salesid;
		this.paymentid = paymentid;
	}

	public SP() {
		super();
	}

}