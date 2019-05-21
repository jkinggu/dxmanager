package com.dx.dxmanage.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.Test;

public class FileHandler {
	/* 读取远程服务器上的text文件 */
	@Test
	public void ReadUrl() throws IOException {
		String read;
		String readStr = "";
		try {
			URL url = new URL("http://192.168.1.130:8080/dxmanage/index.jsp");
			// URL url = new URL( "D:\\wdf.txt");
			HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
			urlCon.setConnectTimeout(50000);
			urlCon.setReadTimeout(5000);

			BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
			while ((read = br.readLine()) != null) {
				readStr = readStr + read;
			}
			br.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			readStr = "f";
		}
		//System.out.println(readStr);
	}

	// 测试
	@Test
	public void rr() throws Exception {
		File file = new File("D:\\wdf.txt");
		writeTxtFile("春眠不觉晓，处处问题闹，夜来风雨声，花落知多少",file);
		fileChaseFW("D:\\wdf.txt","床前明月光，疑是地上霜，举头望明月，低头思故乡");
		readTxtFile(file);
	}

	/**
	 * 创建文件
	 * 
	 * @param fileName
	 * @return
	 */
	public static boolean createFile(File fileName) throws Exception {
		try {
			if (!fileName.exists()) {
				fileName.createNewFile();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	/**
	 * 读取TXT内容
	 * 
	 * @param file
	 * @return
	 */

	public static String readTxtFile(File file) {
		String result = "";
		try {
			InputStreamReader reader = new InputStreamReader(new FileInputStream(file), "UTF-8");
			BufferedReader br = new BufferedReader(reader);
			String s = null;
			while ((s = br.readLine()) != null) {
				result = result + s;
				//System.out.println(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 写入TXT，覆盖原内容
	 * 
	 * @param content
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static boolean writeTxtFile(String content, File fileName) throws Exception {
		RandomAccessFile mm = null;
		boolean flag = false;
		FileOutputStream fos = null;
		try {
			fos = new FileOutputStream(fileName);
			fos.write(content.getBytes("UTF-8"));
			fos.close();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 写入TXT，追加写入
	 * 
	 * @param filePath
	 * @param content
	 */
	public static void fileChaseFW(String filePath, String content) {
		try {
			// 构造函数中的第二个参数true表示以追加形式写文件
			FileWriter fw = new FileWriter(filePath, true);
			fw.write(content);;
			fw.close();
		} catch (IOException e) {
			//System.out.println("文件写入失败！" + e);
		}
	}

	public static void main(String[] args) throws Exception {
		File file = new File("D:\\wdf.txt");
		createFile(file);
		readTxtFile(file);
		// writeTxtFile("我是写入的内容11",file);
		fileChaseFW("D:\\wdf.txt", "66666666");
	}
}
