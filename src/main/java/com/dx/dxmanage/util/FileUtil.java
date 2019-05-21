package com.dx.dxmanage.util;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import com.dx.dxmanage.handler.CustomerHandler;

/**
 * @author fang
 *
 * @Date 2018年11月7日
 *
 *       项目名 mecvip
 *
 * @version 1.0
 */

public class FileUtil {
	protected final static Logger logger = Logger.getLogger(FileUtil.class);
	/**
	 * @param file
	 *            需要上传的文件
	 * 
	 * @param url
	 *            目标地址
	 * 
	 * @param fileName
	 *            新文件名
	 * 
	 * @return String “300”代表源文件为空；“200”代表上传成功;“500”代表上传失败
	 * 
	 */
	public static String uploadPic(MultipartFile file, String url, String fileName) {
		File targetFile = null;
		String result = "";
		// 判断接收是否为空
		if (file.isEmpty()) {
			result = "300";
			return result;
		}
		// 创建存储文件路径
		CreateFileUtil.createDir(url);
		// CreateFileUtil.createFile(url + fileName);
		File fileDir = new File(url);
		targetFile = new File(fileDir, fileName);
		try {
			file.transferTo(targetFile);
			result = "200";
		} catch (Exception e) {
			e.printStackTrace();
			result = "400";
		}
		return result;
	}

	/**
	 * 删除文件，可以是文件或文件夹
	 *
	 * @param fileName
	 *            要删除的文件名
	 * @return 删除成功返回true，否则返回false
	 */
	public static boolean delete(String fileName) {
		File file = new File(fileName);
		if (!file.exists()) {
			logger.info("删除文件失败:" + fileName + "不存在！");
			return false;
		} else {
			if (file.isFile())
				return deleteFile(fileName);
			else
				return deleteDirectory(fileName);
		}
	}

	/**
	 * 删除单个文件
	 *
	 * @param fileName
	 *            要删除的文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public static boolean deleteFile(String fileName) {
		File file = new File(fileName);
		// 如果文件路径所对应的文件存在，并且是一个文件，则直接删除
		if (file.exists() && file.isFile()) {
			if (file.delete()) {
				logger.info("删除单个文件" + fileName + "成功！");
				return true;
			} else {
				logger.info("删除单个文件" + fileName + "失败！");
				return false;
			}
		} else {
			logger.info("删除单个文件失败：" + fileName + "不存在！");
			return false;
		}
	}

	/**
	 * 删除目录及目录下的文件
	 *
	 * @param dir
	 *            要删除的目录的文件路径
	 * @return 目录删除成功返回true，否则返回false
	 */
	public static boolean deleteDirectory(String dir) {
		// 如果dir不以文件分隔符结尾，自动添加文件分隔符
		if (!dir.endsWith(File.separator))
			dir = dir + File.separator;
		File dirFile = new File(dir);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if ((!dirFile.exists()) || (!dirFile.isDirectory())) {
			System.out.println("删除目录失败：" + dir + "不存在！");
			return false;
		}
		boolean flag = true;
		// 删除文件夹中的所有文件包括子目录
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				flag = FileUtil.deleteFile(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
			// 删除子目录
			else if (files[i].isDirectory()) {
				flag = FileUtil.deleteDirectory(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
		}
		if (!flag) {
			System.out.println("删除目录失败！");
			return false;
		}
		// 删除当前目录
		if (dirFile.delete()) {
			System.out.println("删除目录" + dir + "成功！");
			return true;
		} else {
			return false;
		}
	}

}
