package com.dx.dxmanage.shiro;

import java.util.Date;

import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;

import com.dx.dxmanage.po.User;
import com.dx.dxmanage.service.IPermissionService;
import com.dx.dxmanage.service.IRoleService;
import com.dx.dxmanage.service.IUserService;

/**
 * @author fang
 *
 * @Date 2018年10月19日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
public class UserRealm extends AuthorizingRealm {
	@Resource
	private IUserService userService;
	@Resource
	private IRoleService roleService;
	@Resource
	private IPermissionService permissionService;

	@Override
	public void setName(String name) {
		super.setName("UserRealm");
	}

	public UserRealm() {
		super();
	}

	/**
	 * 认证信息，主要针对用户登录，
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {

		ShiroToken token = (ShiroToken) authcToken;
		User user = userService.login(token.getUsername(), token.getPswd());
		if (null == user) {
			throw new AccountException("帐号或密码不正确！");
			/* 如果用户的status为禁用。那么就抛出<code>DisabledAccountException</code> */
		} else if (User._0.equals(user.getStatus())) {
			throw new DisabledAccountException("帐号已经禁止登录！");
		} else {
			// 更新登录时间 last login time
			user.setLastLoginTime(new Date());
			userService.updateUser(user);
		}
		return new SimpleAuthenticationInfo(user, user.getPassword(), getName());
	}

	// 重写授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		Long userId = TokenManager.getUserId();
		// 查到权限数据，返回授权信息(要包括 上边的permissions)
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		// 根据用户ID查询角色（role），放入到Authorization里。
		Set<String> roles = roleService.selectRoleByUserId(userId);
		simpleAuthorizationInfo.setRoles(roles);
		// 根据用户ID查询权限（permission），放入到Authorization里。
		Set<String> permissions = permissionService.selectPermissionByUserId(userId);
		simpleAuthorizationInfo.setStringPermissions(permissions);
		return simpleAuthorizationInfo;
	}

	/**
	 * 清空当前用户权限信息
	 */
	public void clearCachedAuthorizationInfo() {
		PrincipalCollection principalCollection = SecurityUtils.getSubject().getPrincipals();
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principalCollection, getName());
		super.clearCachedAuthorizationInfo(principals);
	}

	/**
	 * 指定principalCollection 清除
	 */
	public void clearCachedAuthorizationInfo(PrincipalCollection principalCollection) {
		SimplePrincipalCollection principals = new SimplePrincipalCollection(principalCollection, getName());
		super.clearCachedAuthorizationInfo(principals);
	}

	// 清除缓存
	/*
	 * public void clearCached() { PrincipalCollection principals =
	 * SecurityUtils.getSubject().getPrincipals(); super.clearCache(principals); }
	 */

}
