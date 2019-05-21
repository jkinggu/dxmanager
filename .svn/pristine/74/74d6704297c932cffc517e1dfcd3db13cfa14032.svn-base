package com.dx.dxmanage.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * @author fang
 *
 * @Date 2018年10月19日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
// 父类的password是char[]型，而在此项目中用的是string类型，所以需要重写父类
public class ShiroToken extends UsernamePasswordToken implements java.io.Serializable {

	private static final long serialVersionUID = -6451794657814516274L;

	public ShiroToken(String username, String pswd) {
		super(username, pswd);
		this.pswd = pswd;
	}

	/** 登录密码[字符串类型] 因为父类是char[] ] **/
	private String pswd;

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

}