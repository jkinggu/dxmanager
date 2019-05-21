package com.dx.dxmanage.po;

import java.io.Serializable;

public class Customer implements Serializable {

	private static final long serialVersionUID = 1L;

	private Integer customerid;

	private String customercode;

	private String customername;

	private String customername1;

	private String membership;

	private String agent;

	private String mobile;

	private String email;

	private String qq;

	private String creditcode;
	
	private String timelimit;
	
	private String nbtimelimit;
	
	public String getTimelimit() {
		return timelimit;
	}

	public void setTimelimit(String timelimit) {
		this.timelimit = timelimit;
	}

	public String getNbtimelimit() {
		return nbtimelimit;
	}

	public void setNbtimelimit(String nbtimelimit) {
		this.nbtimelimit = nbtimelimit;
	}

	public Integer getCustomerid() {
		return customerid;
	}

	public void setCustomerid(Integer customerid) {
		this.customerid = customerid;
	}

	public String getCustomercode() {
		return customercode;
	}

	public void setCustomercode(String customercode) {
		this.customercode = customercode == null ? null : customercode.trim();
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername == null ? null : customername.trim();
	}

	public String getCustomername1() {
		return customername1;
	}

	public void setCustomername1(String customername1) {
		this.customername1 = customername1 == null ? null : customername1.trim();
	}

	public String getMembership() {
		return membership;
	}

	public void setMembership(String membership) {
		this.membership = membership == null ? null : membership.trim();
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent == null ? null : agent.trim();
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile == null ? null : mobile.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq == null ? null : qq.trim();
	}

	public String getCreditcode() {
		return creditcode;
	}

	public void setCreditcode(String creditcode) {
		this.creditcode = creditcode == null ? null : creditcode.trim();
	}


	public Customer() {
		super();
	}

	public Customer(Integer customerid, String customercode, String customername, String customername1,
			String membership, String agent, String mobile, String email, String qq, String creditcode,
			String timelimit, String nbtimelimit) {
		super();
		this.customerid = customerid;
		this.customercode = customercode;
		this.customername = customername;
		this.customername1 = customername1;
		this.membership = membership;
		this.agent = agent;
		this.mobile = mobile;
		this.email = email;
		this.qq = qq;
		this.creditcode = creditcode;
		this.timelimit = timelimit;
		this.nbtimelimit = nbtimelimit;
	}

	@Override
	public String toString() {
		return "Customer [customerid=" + customerid + ", customercode=" + customercode + ", customername="
				+ customername + ", customername1=" + customername1 + ", membership=" + membership + ", agent=" + agent
				+ ", mobile=" + mobile + ", email=" + email + ", qq=" + qq + ", creditcode=" + creditcode
				+ ", timelimit=" + timelimit + ", nbtimelimit=" + nbtimelimit + "]";
	}

	

	

}