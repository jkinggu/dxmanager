package com.dx.dxmanage.util;

/* 
 * java中字符串位数不够自动补0
 */
public class AutoGenericCode {
	public String autoGenericCode(String code, int num) {
		String result = "";
		// 保留num的位数
		// 0 代表前面补充0
		// d 代表参数为正数型
		result = String.format("%0" + num + "d", Integer.parseInt(code) + 1);
		return result;
	}
}
