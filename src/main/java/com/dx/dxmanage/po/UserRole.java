package com.dx.dxmanage.po;

import java.io.Serializable;

/**
 * @author fang
 *
 * @Date 2019年02月25日
 *
 *       项目名dxmanage
 *
 * @version 1.0
 */
public class UserRole implements Serializable {
	private static final long serialVersionUID = 1L;
	/** {@link UUser.id} */
	private Long uid;
	/** {@link URole.id} */
	private Long rid;

	public User user;

	public Role role;

	public UserRole(Long uid, Long rid) {
		this.uid = uid;
		this.rid = rid;
	}

	public UserRole() {
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public Long getRid() {
		return rid;
	}

	public void setRid(Long rid) {
		this.rid = rid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "UserRole [uid=" + uid + ", rid=" + rid + "]";
	}

}