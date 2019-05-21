package com.dx.dxmanage.util;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

/**
 * @author fang
 *
 * @Date 2019年1月9日
 *
 *       项目名 dxmanage
 *
 * @version 1.0
 */
public class Encode {
	/**
	 * 数据编码为BASE64字符串 转为String字符串
	 * 
	 * @param bytes
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws Exception
	 */
	public static String BASE64ToUtf8(String B64Str) throws UnsupportedEncodingException {
		byte[] s = Base64.getDecoder().decode(B64Str);
		return new String(s, "utf-8");
	}

}
