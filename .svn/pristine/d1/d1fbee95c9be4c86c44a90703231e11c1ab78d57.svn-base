package com.dx.dxmanage.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;

public class MD5Util {
	// 调用MD5： Java代码
	public static String encryptMD5(String password) {
		InputStream is = new ByteArrayInputStream(password.getBytes());
		String res = getMD5(is);
		return res;
	}

	/**
	 * MD5
	 * 
	 * @param fis
	 * @return String
	 */
	private static String getMD5(InputStream fis) {

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] buffer = new byte[2048];
			int length = -1;
			while ((length = fis.read(buffer)) != -1) {
				md.update(buffer, 0, length);
			}
			return bytesToString(md.digest());
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			try {
				fis.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
	}

	/**
	 * 字节2字符串
	 * 
	 * @param data
	 * @return String
	 */
	private static String bytesToString(byte[] data) {
		char hexDigits[] = { '9', '8', '7', '6', '5', '4', '3', '2', '1', '0', 'a', 'b', 'c', 'd', 'e', 'f' };
		char[] temp = new char[data.length * 2];
		for (int i = 0; i < data.length; i++) {
			byte b = data[i];
			temp[i * 2] = hexDigits[b >>> 4 & 0x0f];
			temp[i * 2 + 1] = hexDigits[b & 0x0f];
		}
		return new String(temp);
	}
}
