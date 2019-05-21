package com.dx.dxmanage.shiro;

import com.dx.dxmanage.po.User;

import com.dx.dxmanage.shiro.UserRealm;

import org.apache.shiro.SecurityUtils;

/**
 * @author fang
 *
 * @Date 2018年10月19日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */

public class TokenManager {

	// 用户登录管理
	public final UserRealm realm = SpringContextUtil.getBean("UserRealm", UserRealm.class);

	/**
	 * 获取当前登录的用户User对象
	 * 
	 * @return
	 */
	public static User getToken() {
		/*设置的最大时间，正负都可以，为负数时表示永不超时
		 * 注意：这里设置的时间单位是:ms，但是Shiro会把这个时间转成:s，而且是会舍掉小数部分，这样我设置的是-1ms，转成s后就是0s，马上就过期了。
		 * 所有要是除以1000以后还是负数，必须设置小于-1000
		 */
		SecurityUtils.getSubject().getSession().setTimeout(-1000l);
		User token = (User) SecurityUtils.getSubject().getPrincipal();
		return token;
	}

	/**
	 * 获取当前用户名称（登录账号）
	 * 
	 * @return
	 */
	public static String getUsername() {
		return getToken().getUsername();
	}

	/**
	 * 获取当前用户ID
	 * 
	 * @return
	 */
	public static Long getUserId() {
		return getToken() == null ? null : getToken().getId();
	}

	// 新添加的，作为测试
	/**
	 * 获取当前用户密码
	 * 
	 * @return
	 */
	public static String getPassword() {
		return getToken().getPassword();
	}

	/**
	 * 登录
	 * 
	 * @param user
	 * @param rememberMe
	 * @return
	 */
	public static User login(User user, Boolean rememberMe) {
		ShiroToken token = new ShiroToken(user.getUsername(), user.getPassword());
		token.setRememberMe(rememberMe);
		SecurityUtils.getSubject().login(token);
		return getToken();
	}

	/**
	 * 判断是否登录
	 * 
	 * @return
	 */
	public static boolean isLogin() {
		return null != SecurityUtils.getSubject().getPrincipal();
	}

	/**
	 * 退出登录
	 */
	public static void logout() {
		SecurityUtils.getSubject().logout();
	}

}
