package com.dx.dxmanage.po;

import java.io.Serializable;

import java.util.Date;
import java.util.List;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	// 0:禁止登录
	public static final Long _0 = new Long(0);
	// 1:有效
	public static final Long _1 = new Long(1);
	private Long id;

	private String username;

	private String password;

	private Date createTime;

	private Date lastLoginTime;

	private Long status;

	private List<Role> roles;

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Long getStatus() {
		return status;
	}

	public void setStatus(Long status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", createTime=" + createTime
				+ ", lastLoginTime=" + lastLoginTime + ", status=" + status + "]";
	}

}